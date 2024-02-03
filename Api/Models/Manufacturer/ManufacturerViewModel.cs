
using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models.Manufacturer;

public partial class ManufacturerViewModel : IMapWith<Manufacturer>
{
    public int ManufacturerId { get; set; }

    public string ManufacturerName { get; set; } = null!;

    public string ManufacturerInn { get; set; } = null!;

    public sbyte ManufacturerRating { get; set; }

    public DateOnly ManufacturerDealStartDate { get; set; }

    public Manufacturertype ManufacturerType { get; set; } = null!;

    public ICollection<Material> Materials { get; } = new List<Material>();
}
