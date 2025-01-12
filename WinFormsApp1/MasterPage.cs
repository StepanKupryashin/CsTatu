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
    public partial class MasterPage : Form
    {

        private CsTatuContext db = new CsTatuContext();
        public MasterPage()
        {
            InitializeComponent();
            db.WorkShedules.Load();
            MasterSlotsGrid.DataSource = db.WorkShedules.Local.Where(x => x.UserId == AppState.Get<User>("user").Id).ToList();
            db.Appointments.Load();
            db.Users.Load();
            MasterClientsGrid.DataSource = db.Appointments.Local.ToList();
            db.Materials.Load();
            db.UsedMaterials.Load();

            MaterialsGrid.DataSource = db.Materials.Local.ToList();
            usedMaterialGrid.DataSource = db.UsedMaterials.Local.ToList();
        }

        private void MasterSlotsGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            MessageBox.Show(MasterSlotsGrid.CurrentCellAddress.ToString());

            if (MasterSlotsGrid.CurrentCellAddress.X == 3)
            {

                WorkShedule currentRow = (WorkShedule)MasterSlotsGrid.CurrentRow.DataBoundItem;

                this.DeleteRow(currentRow.Id);
            }
        }

        private void addSlotBtn_Click(object sender, EventArgs e)
        {

            int newId = db.WorkShedules.Max(x => x.Id) + 1;

            db.WorkShedules.Local.Add(new WorkShedule() { Id = newId, UserId = AppState.Get<User>("user").Id });

            MasterSlotsGrid.DataSource = db.WorkShedules.Local.Where(x => x.UserId == AppState.Get<User>("user").Id).ToList();

        }

        private void DeleteRow(int slotId)
        {
            db.WorkShedules.Local.Remove(db.WorkShedules.Local.FirstOrDefault(x => x.Id == slotId));

            MasterSlotsGrid.DataSource = db.WorkShedules.Local.ToList();
        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            db.SaveChanges();
        }

        private void MasterClientsGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //MessageBox.Show(MasterClientsGrid.CurrentCellAddress.ToString());

            if (MasterClientsGrid.CurrentCellAddress.X == 6)
            {

                Appointment currentRow = (Appointment)MasterClientsGrid.CurrentRow.DataBoundItem;

                this.DeleteRowAppointment(currentRow.Id);
            }

        }

        private void DeleteRowAppointment(int appointmnentId)
        {
            db.Appointments.Local.Remove(db.Appointments.Local.FirstOrDefault(x => x.Id == appointmnentId));

            MasterClientsGrid.DataSource = db.Appointments.Local.ToList();
        }

        private void saveButton1_Click(object sender, EventArgs e)
        {
            db.SaveChanges();
        }

        private void saceButton2_Click(object sender, EventArgs e)
        {
            db.SaveChanges();
        }

        private void ыфмуИгеещт3_Click(object sender, EventArgs e)
        {
            db.SaveChanges();
        }

        private void MaterialsGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            if (MaterialsGrid.CurrentCellAddress.X == 4)
            {

                Material currentRow = (Material)MaterialsGrid.CurrentRow.DataBoundItem;

                this.DeleteRowMaterial(currentRow.Id);
            }

        }

        private void usedMaterialGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            if (usedMaterialGrid.CurrentCellAddress.X == 3)
            {

                UsedMaterial currentRow = (UsedMaterial)usedMaterialGrid.CurrentRow.DataBoundItem;

                this.DeleteRowUsedMaterial(currentRow.Id);
            }
        }

        private void DeleteRowMaterial(int materialId)
        {
            db.Materials.Local.Remove(db.Materials.Local.FirstOrDefault(x => x.Id == materialId));

            MaterialsGrid.DataSource = db.Materials.Local.ToList();
        }

        private void DeleteRowUsedMaterial(int usedMaterialId)
        {
            db.UsedMaterials.Local.Remove(db.UsedMaterials.Local.FirstOrDefault(x => x.Id == usedMaterialId));

            usedMaterialGrid.DataSource = db.UsedMaterials.Local.ToList();
        }

        private void addUsedMaterialBtn_Click(object sender, EventArgs e)
        {
            UsedMaterialForm usedMaterialForm = new UsedMaterialForm();

            usedMaterialForm.ShowDialog();
        }

        private void refreshUsedMaterialsBtn_Click(object sender, EventArgs e)
        {
            db.UsedMaterials.Load();

            usedMaterialGrid.DataSource = db.UsedMaterials.Local.ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            db.Materials.Load();

            List<Material> materials = db.Materials.Local.ToList();

            if (filterCount.Text != "")
            {
                materials = materials.Where(x => x.Count == int.Parse(filterCount.Text)).ToList();
            }

            if (filterId.Text != "")
            {
                materials = materials.Where(x => x.Id == int.Parse(filterId.Text)).ToList();
            }

            if (filterName.Text != "")
            {
                materials = materials.Where(x => x.Name.ToLower().Contains(filterName.Text)).ToList();
            }

            MaterialsGrid.DataSource = materials;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            db.Materials.Load();

            List<Material> materials = db.Materials.Local.ToList();

            MaterialsGrid.DataSource = materials;

            filterId.Text = "";

            filterName.Text = "";

            filterCount.Text = "";
        }
    }
}
