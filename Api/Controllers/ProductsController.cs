using ApiMarket.Context;
using ApiMarket.Models.Manufacturer;
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
                .Include(e => e.Manufacturer)
                .ProjectTo<ProductViewModel>(mapper.ConfigurationProvider)
                .ToListAsync());
        }

        [HttpGet("/api/Manufacturer")]
        public async Task<ActionResult<ProductViewModel[]>> Get(
            int idManufacturer,
            [FromServices] Ispp01up02Context context)
        {
            return Ok(await context.Products
                .AsNoTracking()
                .Include(e => e.Manufacturer)
                .Include(e => e.Category)
                .Include(e => e.MeasureType)
                .Include(e => e.Provider)
                .Where(e => e.ManufacturerId == idManufacturer)
                .ToListAsync());
        }
    }
}
