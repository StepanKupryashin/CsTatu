using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class Tattoo
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public string? Style { get; set; }

    public decimal? Price { get; set; }

    public string? AreaSize { get; set; }

    public string? Image { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual ICollection<UsedMaterial> UsedMaterials { get; set; } = new List<UsedMaterial>();
}
