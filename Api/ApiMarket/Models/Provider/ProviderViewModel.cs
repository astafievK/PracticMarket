using Api.Common.Interfaces;
using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class ProviderViewModel : IMapWith<Provider>
{
    public int ProviderId { get; set; }

    public string ProviderName { get; set; } = null!;
}
