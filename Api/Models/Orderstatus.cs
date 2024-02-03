using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ApiMarket.Models;

public partial class Orderstatus
{
    public int OrderStatusId { get; set; }

    public string OrderStatusName { get; set; } = null!;

    [JsonIgnore] public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
