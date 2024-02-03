using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class MaterialType
{
    public int MaterialTypeId { get; set; }

    public string MaterialTypeName { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Material> Materials { get; } = new List<Material>();
}
