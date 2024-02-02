using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class Provider
{
    public int ProviderId { get; set; }

    public string ProviderName { get; set; } = null!;

    public virtual ICollection<Product.Product> ProductManufacturers { get; } = new List<Product.Product>();

    public virtual ICollection<Product.Product> ProductProviders { get; } = new List<Product.Product>();
}
