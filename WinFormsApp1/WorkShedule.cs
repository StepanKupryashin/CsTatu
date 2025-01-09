using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class WorkShedule
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public DateTime? WorkingTime { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual User User { get; set; } = null!;
}
