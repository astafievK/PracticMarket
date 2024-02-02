using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class Orderstatus
{
    public int OrderStatusId { get; set; }

    public string OrderStatusName { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
