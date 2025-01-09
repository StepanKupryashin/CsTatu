using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class RegisterPage : Form
    {
        public RegisterPage()
        {
            InitializeComponent();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();

            LoginPage loginPage = new LoginPage();

            loginPage.Show();
        }

        private void RegisterSubmit_Click(object sender, EventArgs e)
        {
            if (NameInput.Text == "" || PasswordInput.Text == "" || PasswordRepeatInput.Text == "" || EmailInput.Text == "")
            {
                MessageBox.Show("Убедитесь, что все поля введены");
            }
            else
            {
                if (PasswordInput.Text != PasswordRepeatInput.Text)
                {
                    MessageBox.Show("Пароли не совпадают!");
                    return;
                }
                Util.CreateUser(NameInput.Text, EmailInput.Text, Util.HashPassword(PasswordInput.Text));
                MessageBox.Show("Вы успешно зарегестрированы!");
                LoginPage authView = new LoginPage();
                authView.Show();
                Close();
            }
        }
    }
}
