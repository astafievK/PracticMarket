using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public DateOnly OrderCreateDate { get; set; }

    public DateOnly OrderDeliveryDate { get; set; }

    public string OrderReceiveCode { get; set; } = null!;

    public int PickupPointId { get; set; }

    public int? UserId { get; set; }

    public int OrderStatusId { get; set; }

    public virtual Orderstatus OrderStatus { get; set; } = null!;

    public virtual ICollection<Ordercomposion> Ordercomposions { get; } = new List<Ordercomposion>();

    public virtual Pickuppoint PickupPoint { get; set; } = null!;

    public virtual User? User { get; set; }
}
