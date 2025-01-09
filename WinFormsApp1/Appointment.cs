using System;
using System.Collections.Generic;

namespace WinFormsApp1;

public partial class Appointment
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int TattooId { get; set; }

    public int WorkSheduleId { get; set; }

    public string? Status { get; set; }

    public virtual Tattoo Tattoo { get; set; } = null!;

    public virtual User User { get; set; } = null!;

    public virtual WorkShedule WorkShedule { get; set; } = null!;

    public virtual string ServiceName
    {
        get
        {
            return $"{Util.GetServiceName(this.Id)}";
        }
    }

    public virtual string DateSlot
    {
        get
        {
            return $"{Util.GetWorkTimeAppointment(this.Id)}";
        }
    }

    public virtual string ClientName
    {
        get
        {
            return $"{Util.GetAppointmentClientName(this.UserId)}";
        }
    }

    public virtual string MasterName
    {
        get
        {
            return $"{Util.GetApppointmentMasterName(this.WorkSheduleId)}";
        }
    }
}
