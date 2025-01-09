using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class HomePage : Form
    {


        private CsTatuContext db = new CsTatuContext();

        private int? selectedTattoId;

        private int? prevSelctedTattooId;

        public HomePage()
        {
            InitializeComponent();

            db.Tattoos.Load();

            masterSelect.DataSource = Util.GetMastersWithSlots();

            dataGridView1.DataSource = db.Tattoos.ToList();

            NameLabel.Text = $"{NameLabel.Text}{AppState.Get<User>("user").FullName}";

            RoleLabel.Text = $"{RoleLabel.Text}{Util.ConvertRole((int)AppState.Get<User>("user").RoleId)}";

            panel1.Visible = false;

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            Tattoo currentRow = (Tattoo)dataGridView1.CurrentRow.DataBoundItem;


            selectedTattoId = currentRow.Id;

            ChoseenTattooLabel.Text = "Выбранная услуга: ";

            ChoseenTattooLabel.Text = $"{ChoseenTattooLabel.Text} {currentRow.Title} {currentRow.Price}Р {currentRow.AreaSize}";

            panel1.Visible = true;

        }

        private void masterSelect_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (selectedTattoId != null)
            {

                List<WorkShedule> slots = Util.GetAvailableSlots(AppState.Get<User>("user"), (int)masterSelect.SelectedValue);



                slotsSelect.DataSource = slots;
                

                if(slots.Count() <= 0)
                {
                    MessageBox.Show("У выбранного мастера нет свободных слотов");
                }

                prevSelctedTattooId = selectedTattoId;

            }
        }

        private void RegisterSlotSubmit_Click(object sender, EventArgs e)
        {
            //MessageBox.Show(slotsSelect.SelectedValue.ToString(), masterSelect.SelectedValue.ToString());

            Util.CreateAppointment((int)selectedTattoId, (int)slotsSelect.SelectedValue, AppState.Get<User>("user").Id);

            MessageBox.Show("Запись успешно создана!");

            panel1.Visible = false;



        }

        private void LinkMyAppointments_Click(object sender, EventArgs e)
        {
            MyAppointmentsPage myAppointmentsPage = new MyAppointmentsPage();

            myAppointmentsPage.Show();
        }
    }
}
