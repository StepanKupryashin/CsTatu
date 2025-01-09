namespace WinFormsApp1
{
    partial class LoginPage
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            tattooBindingSource = new BindingSource(components);
            userBindingSource = new BindingSource(components);
            label1 = new Label();
            LoginInput = new TextBox();
            PasswordInput = new TextBox();
            RegisterLink = new LinkLabel();
            LoginSubmit = new Button();
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).BeginInit();
            ((System.ComponentModel.ISupportInitialize)userBindingSource).BeginInit();
            SuspendLayout();
            // 
            // tattooBindingSource
            // 
            tattooBindingSource.DataSource = typeof(Tattoo);
            // 
            // userBindingSource
            // 
            userBindingSource.DataSource = typeof(User);
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 20F);
            label1.Location = new Point(851, 76);
            label1.Name = "label1";
            label1.Size = new Size(179, 37);
            label1.TabIndex = 0;
            label1.Text = "Авторизация";
            label1.Click += label1_Click;
            // 
            // LoginInput
            // 
            LoginInput.Location = new Point(811, 186);
            LoginInput.Name = "LoginInput";
            LoginInput.PlaceholderText = "Введите E-mail";
            LoginInput.Size = new Size(254, 23);
            LoginInput.TabIndex = 1;
            // 
            // PasswordInput
            // 
            PasswordInput.Location = new Point(811, 252);
            PasswordInput.Name = "PasswordInput";
            PasswordInput.PasswordChar = '*';
            PasswordInput.PlaceholderText = "Введите пароль";
            PasswordInput.Size = new Size(254, 23);
            PasswordInput.TabIndex = 2;
            // 
            // RegisterLink
            // 
            RegisterLink.AutoSize = true;
            RegisterLink.Location = new Point(982, 294);
            RegisterLink.Name = "RegisterLink";
            RegisterLink.Size = new Size(83, 15);
            RegisterLink.TabIndex = 4;
            RegisterLink.TabStop = true;
            RegisterLink.Text = "Нет аккаунта?";
            RegisterLink.LinkClicked += RegisterLink_LinkClicked;
            // 
            // LoginSubmit
            // 
            LoginSubmit.Location = new Point(879, 312);
            LoginSubmit.Name = "LoginSubmit";
            LoginSubmit.Size = new Size(123, 23);
            LoginSubmit.TabIndex = 5;
            LoginSubmit.Text = "Войти";
            LoginSubmit.UseVisualStyleBackColor = true;
            LoginSubmit.Click += LoginSubmit_Click;
            // 
            // LoginPage
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1987, 797);
            Controls.Add(LoginSubmit);
            Controls.Add(RegisterLink);
            Controls.Add(PasswordInput);
            Controls.Add(LoginInput);
            Controls.Add(label1);
            Name = "LoginPage";
            Text = "LoginPage";
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).EndInit();
            ((System.ComponentModel.ISupportInitialize)userBindingSource).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private BindingSource tattooBindingSource;
        private BindingSource userBindingSource;
        private Label label1;
        private TextBox LoginInput;
        private TextBox PasswordInput;
        private LinkLabel RegisterLink;
        private Button LoginSubmit;
    }
}
