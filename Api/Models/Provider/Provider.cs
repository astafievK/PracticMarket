using Api.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class Provider { 
    public int ProviderId { get; set; }

    public string ProviderName { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Product.Product> ProductManufacturers { get; } = new List<Product.Product>();

    [JsonIgnore] public virtual ICollection<Product.Product> ProductProviders { get; } = new List<Product.Product>();
}
