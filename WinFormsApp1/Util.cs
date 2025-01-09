using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Data.Entity;
using Microsoft.EntityFrameworkCore;

namespace WinFormsApp1
{
    /*
    * Классс реализующий функции утилиты для взаимодействия с моделями, почему так?
    * да потому что при обновлении модели код модели регениться, а нам нужно что-то постабильнее
    */
    public static class Util
    {

        private static CsTatuContext db = new CsTatuContext();


        public static string HashPassword(string password)
        {
            using (var md5 = new MD5CryptoServiceProvider())
            {
                var hashedBytes = md5.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        public static bool VerifyPassword(string enteredPassword, string hashedPassword)
        {
            var enteredPasswordHash = HashPassword(enteredPassword);
            return string.Equals(enteredPasswordHash, hashedPassword, StringComparison.OrdinalIgnoreCase);
        }


        public static User? GetUserByEmail(string email)
        {
            return db.Users.FirstOrDefault(x => x.Email == email);
        }


        public static void CreateUser(string naame, string email, string password)
        {
            db.Users.Add(new User() { FullName = naame, Email = email, Password = password });
            db.SaveChanges();
        }

        public static string ConvertRole(int role)
        {
            switch (role)
            {
                case ((int)Erole.User):
                    return "Пользователь";
                case (int)Erole.Master:
                    return "Мастер";
                default:
                    return "Неизвестно";
            }

        }


        public static List<WorkShedule> GetAvailableSlots(User currentUser, int masterId)
        {


            db.WorkShedules.Load();

            db.Appointments.Load();

            User master = db.Users.FirstOrDefault(i => i.Id == masterId);

            if (master != null)
            {
                List<WorkShedule> slots = new List<WorkShedule>();

                // Получаем слоты пользователей
                HashSet<int> userSlotIds = new HashSet<int>(db.Appointments.Select(x => x.WorkSheduleId));


                // Добавляем слоты мастера
                slots.AddRange(master.WorkShedules);

                // Фильтруем слоты, которые заняты пользователем
                slots = slots.Where(i => !userSlotIds.Contains(i.Id)).ToList();

                return slots;
            }

            return new List<WorkShedule>();
        }

        public static List<User> GetMastersWithSlots()
        {
            return db.Users.Where(x => x.WorkShedules.Count() > 0).ToList();
        }

        public static Tattoo GetTattoo(int id)
        {
            return db.Tattoos.FirstOrDefault(i => id == i.Id);
        }


        public static void CreateAppointment(int tattooId, int workSheduleId, int UserId)
        {
            Appointment appointment = new Appointment() { TattooId = tattooId, WorkSheduleId = workSheduleId, UserId = UserId };

            db.Appointments.Add(appointment);

            db.SaveChanges();
        }

        public static List<Appointment> GetUserAppointments(int userId)
        {

            db.Appointments.Load();

            return db.Appointments.Where(x => x.UserId == userId).ToList();
        }


        public static string GetServiceName(int appointmentId)
        {
            db.Tattoos.Load();

            Appointment appointment = db.Appointments.FirstOrDefault(x => x.Id == appointmentId);

            return $"{appointment.Tattoo.Title} {appointment.Tattoo.AreaSize}";
        }

        public static string GetWorkTimeAppointment(int appointmentId)
        {
            db.WorkShedules.Load();

            Appointment appointment = db.Appointments.FirstOrDefault(x => x.Id == appointmentId);

            return $"{appointment.WorkShedule.WorkingTime.ToString()}";

        }

        public static List<Appointment>  GetMasterClients(int masterId)
        {
            db.WorkShedules.Load();
            db.Appointments.Load();

           List<int> masterSlotsIds = db.WorkShedules.Local.Select(x => x.Id).ToList();

            List<Appointment> appointments = db.Appointments.Local.Where(x => masterSlotsIds.Contains(x.WorkSheduleId)).ToList();

            return appointments;
        }

        public static string GetAppointmentClientName(int userId)
        {
            return db.Users.FirstOrDefault(x => x.Id == userId).FullName;
        }

        public static string GetApppointmentMasterName(int slotId)
        {
            db.Users.Load();
            db.WorkShedules.Load();
            return db.WorkShedules.FirstOrDefault(x => x.Id == slotId).User.FullName;
        }

        public static string GetMaterialName(int materialId)
        {
            return db.Materials.FirstOrDefault(x => x.Id == materialId).Name;
        }

        public static void CreateUsedMaterial(int tattooId, int materialId)
        {
            db.UsedMaterials.Local.Add(new UsedMaterial() { MaterialId = materialId, TattooId = tattooId });

            db.SaveChanges();
        }
    }
}
