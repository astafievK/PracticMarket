using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class MaterialType
{
    public int MaterialTypeId { get; set; }

    public string MaterialTypeName { get; set; } = null!;

    public virtual ICollection<Material> Materials { get; } = new List<Material>();
}
