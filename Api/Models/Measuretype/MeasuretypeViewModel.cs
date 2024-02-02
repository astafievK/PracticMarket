using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class MeasureTypeViewModel : IMapWith<MeasureType>
{
    public int MeasureTypeId { get; set; }

    public string MeasureTypeName { get; set; } = null!;
}
