using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class Category
{
    public int CategoryId { get; set; }

    public string CategoryName { get; set; } = null!;

    public virtual ICollection<Product.Product> Products { get; } = new List<Product.Product>();
}
