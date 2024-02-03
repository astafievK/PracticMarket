using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class Material
{
    public int MaterialId { get; set; }

    public string MaterialName { get; set; } = null!;

    public string? MaterialImagePath { get; set; }

    public int MaterialPrice { get; set; }

    public int MaterialQuantityInStock { get; set; }

    public int MaterialMinCount { get; set; }

    public int MaterialCountInPack { get; set; }

    public int MaterialTypeId { get; set; }

    public int MeasureTypeId { get; set; }

    public virtual MaterialType MaterialType { get; set; } = null!;

    public virtual MeasureType MeasureType { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Manufacturer.Manufacturer> Manufacturers { get; } = new List<Manufacturer.Manufacturer>();
}
