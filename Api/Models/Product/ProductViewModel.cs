
using Api.Common.Interfaces;
using ApiMarket.Models.Manufacturer;

namespace ApiMarket.Models.Product
{
    public sealed class ProductViewModel : IMapWith<Product>
    {
        public string ProductArticleNumber { get; set; } = null!;

        public string ProductName { get; set; } = null!;

        public string ProductDescription { get; set; } = null!;

        public string? ProductPhoto { get; set; }

        public int ProductPrice { get; set; }

        public sbyte ProductMaxDiscount { get; set; }

        public sbyte? ProductDiscount { get; set; }

        public int ProductQuantityInStock { get; set; }

        public ProviderViewModel Provider { get; set; } = null!;
        public ManufacturerViewModel Manufacturer { get; set; } = null!;
        public CategoryViewModel Category { get; set; } = null!;
        public MeasureTypeViewModel MeasureType { get; set; } = null!;
    }
}   
