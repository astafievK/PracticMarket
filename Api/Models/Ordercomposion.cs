using System;
using System.Collections.Generic;

namespace ApiMarket.Models;

public partial class Ordercomposion
{
    public string ProductArticleNumber { get; set; } = null!;

    public int OrderId { get; set; }

    public int ProductCount { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product.Product ProductArticleNumberNavigation { get; set; } = null!;
}
