using System;
using System.Collections.Generic;

namespace ApiMarket.Models.Manufacturer;

public partial class Manufacturer
{
    public int ManufacturerId { get; set; }

    public string ManufacturerName { get; set; } = null!;

    public string ManufacturerInn { get; set; } = null!;

    public sbyte ManufacturerRating { get; set; }

    public DateOnly ManufacturerDealStartDate { get; set; }

    public int ManufacturerTypeId { get; set; }

    public virtual Manufacturertype ManufacturerType { get; set; } = null!;

    public virtual ICollection<Material> Materials { get; } = new List<Material>();
}
