using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class Pickuppoint
{
    public int PickupPointId { get; set; }

    public string PuckupPointIndex { get; set; } = null!;

    public string PickupPointStreet { get; set; } = null!;

    public string? PickupPointBuilding { get; set; }

    public int CityId { get; set; }

    public virtual City City { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
