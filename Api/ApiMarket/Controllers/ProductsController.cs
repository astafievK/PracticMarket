using ApiMarket.Context;
using ApiMarket.Models.Product;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ApiMarket.Controllers
{
    public sealed class ProductsController(IMapper mapper) : BaseController
    {
        [HttpGet]
        public async Task<ActionResult<ProductViewModel[]>> Get(
            [FromServices] Ispp01up02Context context)   
        {
            return Ok(await context.Products
                .AsNoTracking()
                .ProjectTo<ProductViewModel>(mapper.ConfigurationProvider)
                .ToListAsync());
        }
    }
}
