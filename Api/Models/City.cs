using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class City
{
    public int CityId { get; set; }

    public string CityName { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Pickuppoint> Pickuppoints { get; } = new List<Pickuppoint>();
}
