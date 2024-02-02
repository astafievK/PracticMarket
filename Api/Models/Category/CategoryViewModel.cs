using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class CategoryViewModel : IMapWith<Category>
{
    public int CategoryId { get; set; }

    public string CategoryName { get; set; } = null!;
}
