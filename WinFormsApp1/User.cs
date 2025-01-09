using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class User
{
    public int Id { get; set; }

    public string FullName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int? RoleId { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual Role? Role { get; set; }

    public virtual ICollection<WorkShedule> WorkShedules { get; set; } = new List<WorkShedule>();
}
