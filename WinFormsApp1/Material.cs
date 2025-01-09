using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class Material
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public decimal? Price { get; set; }

    public int? Count { get; set; }

    public virtual ICollection<UsedMaterial> UsedMaterials { get; set; } = new List<UsedMaterial>();
}
