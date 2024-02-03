using Api.Common;
using Api.Common.Mappings;
using ApiMarket.Context;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
RegisterServices(builder.Services, builder.Configuration);

var application = builder.Build();

ConfigureApp(application);

await application.RunAsync();

builder.Services.AddControllers().AddJsonOptions(x =>
    x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);


void RegisterServices(IServiceCollection services, IConfiguration configuration)
{
    services.AddEndpointsApiExplorer();
    services.AddSwaggerGen();
    services.AddControllers();

    services.AddDbContext<Ispp01up02Context>(options =>
        options.UseMySql("Name=Database",
        new MySqlServerVersion(new Version(8, 0, 11))));
    services.AddAutoMapper(expression =>
        expression.AddProfile(new AssemblyMappingProfile(typeof(Program).Assembly)));
    services
        .AddCors(options => options.AddPolicy(Constants.CorsName, policy =>
        {
            policy
                .WithMethods(
                    HttpMethods.Get,
                    HttpMethods.Post,
                    HttpMethods.Put,
                    HttpMethods.Delete)
                .AllowAnyHeader()
                .AllowCredentials()
                .SetIsOriginAllowed(_ => true)
                .WithExposedHeaders("content-disposition");
        }))
        .ConfigureApplicationCookie(options => { options.Cookie.SameSite = SameSiteMode.None; });
}

void ConfigureApp(WebApplication app)
{
    app.UseSwagger();
    app.UseSwaggerUI();

    app.UseRouting();
    app.UseCors(Constants.CorsName);
    app.MapControllers();
}