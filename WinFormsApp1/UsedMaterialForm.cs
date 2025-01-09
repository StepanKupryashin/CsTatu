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
    public partial class UsedMaterialForm : Form
    {

        private CsTatuContext db = new CsTatuContext();

        public UsedMaterialForm()
        {
            InitializeComponent();


            db.Materials.Load();
            db.Tattoos.Load();
            comboBox1.DataSource = db.Materials.Local.ToList();
            comboBox2.DataSource = db.Tattoos.Local.ToList();

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Util.CreateUsedMaterial((int)comboBox2.SelectedValue, (int)comboBox1.SelectedValue);

            this.Close();
        }
    }
}
