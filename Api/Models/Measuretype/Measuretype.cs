using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class MeasureType
{
    public int MeasureTypeId { get; set; }

    public string MeasureTypeName { get; set; } = null!;

    public virtual ICollection<Material> Materials { get; } = new List<Material>();

    public virtual ICollection<Product.Product> Products { get; } = new List<Product.Product>();
}
