using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class City
{
    public int CityId { get; set; }

    public string CityName { get; set; } = null!;

    public virtual ICollection<Pickuppoint> Pickuppoints { get; } = new List<Pickuppoint>();
}
