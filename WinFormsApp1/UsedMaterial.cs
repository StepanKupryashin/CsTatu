using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class UsedMaterial
{
    public int Id { get; set; }

    public int TattooId { get; set; }

    public int MaterialId { get; set; }

    public virtual Material Material { get; set; } = null!;

    public virtual Tattoo Tattoo { get; set; } = null!;

    public virtual string MaterialName
    {
        get
        {
            return $"{Util.GetMaterialName(this.MaterialId)}";
        }
    }

    public virtual string TattooName
    {
        get
        {
            return $"{Util.GetTattoo(this.TattooId).Title}";
        }
    }
}
