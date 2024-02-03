using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class Manufacturertype
{
    public int ManufacturerTypeId { get; set; }

    public string ManufacturerTypeName { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Manufacturer.Manufacturer> Manufacturers { get; } = new List<Manufacturer.Manufacturer>();
}
