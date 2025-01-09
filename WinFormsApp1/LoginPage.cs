using System.Data.Entity;

namespace WinFormsApp1
{
    public partial class LoginPage : Form
    {
        private CsTatuContext? db;

        public LoginPage()
        {
            InitializeComponent();

            this.db = new CsTatuContext();

            this.db.Users.Load();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void RegisterLink_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {

            RegisterPage registerPage = new RegisterPage();

            registerPage.Show();

            this.Hide();
        }

        private void LoginSubmit_Click(object sender, EventArgs e)
        {
            if (LoginInput.Text == "" || PasswordInput.Text == "")
            {
                MessageBox.Show("Убедитесь что все поля введены");
                return;
            }
            else
            {
                User user = Util.GetUserByEmail(LoginInput.Text);
                if (user != null && Util.VerifyPassword(PasswordInput.Text, user.Password))
                {
                    AppState.Add("isLogin", true);

                    AppState.Add("user", user);

                    //if (user.permission == 2)
                    //{
                    //    AdminPanel adminPanel = new AdminPanel();
                    //    adminPanel.Show();
                    //    Close();
                    //    return;
                    //}
                    MessageBox.Show(user.RoleId.ToString());
                    if (user.RoleId == 1)
                    {
                        HomePage mainWindow = new HomePage();
                        mainWindow.Show();

                    }
                    else if (user.RoleId == 2) 
                    {
                        MasterPage mainWindow = new MasterPage();
                        mainWindow.Show();

                    }
                    Hide();
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль");
                }
            }
        }
    }
}
