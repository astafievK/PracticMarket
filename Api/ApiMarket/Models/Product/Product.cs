using System;
using System.Collections.Generic;

namespace ApiMarket.Models.Product;

public partial class Product
{
    public string ProductArticleNumber { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public string ProductDescription { get; set; } = null!;

    public string? ProductPhoto { get; set; }

    public int ProductPrice { get; set; }

    public sbyte ProductMaxDiscount { get; set; }

    public sbyte? ProductDiscount { get; set; }

    public int ProductQuantityInStock { get; set; }

    public int ProviderId { get; set; }

    public int ManufacturerId { get; set; }

    public int CategoryId { get; set; }

    public int MeasureTypeId { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Provider Manufacturer { get; set; } = null!;

    public virtual MeasureType MeasureType { get; set; } = null!;

    public virtual ICollection<Ordercomposion> Ordercomposions { get; } = new List<Ordercomposion>();

    public virtual Provider Provider { get; set; } = null!;
}
