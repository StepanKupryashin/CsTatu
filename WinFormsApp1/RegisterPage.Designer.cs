namespace WinFormsApp1
{
    partial class RegisterPage
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            RegisterTitle = new Label();
            NameInput = new TextBox();
            EmailInput = new TextBox();
            PasswordInput = new TextBox();
            PasswordRepeatInput = new TextBox();
            RegisterSubmit = new Button();
            LinkLogin = new LinkLabel();
            SuspendLayout();
            // 
            // RegisterTitle
            // 
            RegisterTitle.AutoSize = true;
            RegisterTitle.Font = new Font("Segoe UI", 20F);
            RegisterTitle.Location = new Point(622, 71);
            RegisterTitle.Name = "RegisterTitle";
            RegisterTitle.Size = new Size(171, 37);
            RegisterTitle.TabIndex = 0;
            RegisterTitle.Text = "Регистрация";
            // 
            // NameInput
            // 
            NameInput.Location = new Point(603, 145);
            NameInput.Name = "NameInput";
            NameInput.PlaceholderText = "Введите имя";
            NameInput.Size = new Size(203, 23);
            NameInput.TabIndex = 1;
            // 
            // EmailInput
            // 
            EmailInput.Location = new Point(603, 200);
            EmailInput.Name = "EmailInput";
            EmailInput.PlaceholderText = "Введите E-mail";
            EmailInput.Size = new Size(203, 23);
            EmailInput.TabIndex = 2;
            // 
            // PasswordInput
            // 
            PasswordInput.Location = new Point(603, 259);
            PasswordInput.Name = "PasswordInput";
            PasswordInput.PlaceholderText = "Введите пароль";
            PasswordInput.Size = new Size(203, 23);
            PasswordInput.TabIndex = 3;
            // 
            // PasswordRepeatInput
            // 
            PasswordRepeatInput.Location = new Point(603, 316);
            PasswordRepeatInput.Name = "PasswordRepeatInput";
            PasswordRepeatInput.PasswordChar = '*';
            PasswordRepeatInput.PlaceholderText = "Введите пароль";
            PasswordRepeatInput.Size = new Size(203, 23);
            PasswordRepeatInput.TabIndex = 4;
            // 
            // RegisterSubmit
            // 
            RegisterSubmit.Location = new Point(639, 377);
            RegisterSubmit.Name = "RegisterSubmit";
            RegisterSubmit.Size = new Size(143, 34);
            RegisterSubmit.TabIndex = 5;
            RegisterSubmit.Text = "Зарегистрироваться";
            RegisterSubmit.UseVisualStyleBackColor = true;
            RegisterSubmit.Click += RegisterSubmit_Click;
            // 
            // LinkLogin
            // 
            LinkLogin.AutoSize = true;
            LinkLogin.Location = new Point(726, 342);
            LinkLogin.Name = "LinkLogin";
            LinkLogin.Size = new Size(80, 15);
            LinkLogin.TabIndex = 6;
            LinkLogin.TabStop = true;
            LinkLogin.Text = "Есть аккаунт?";
            LinkLogin.LinkClicked += linkLabel1_LinkClicked;
            // 
            // RegisterPage
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1509, 732);
            Controls.Add(LinkLogin);
            Controls.Add(RegisterSubmit);
            Controls.Add(PasswordRepeatInput);
            Controls.Add(PasswordInput);
            Controls.Add(EmailInput);
            Controls.Add(NameInput);
            Controls.Add(RegisterTitle);
            Name = "RegisterPage";
            Text = "RegisterPage";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label RegisterTitle;
        private TextBox NameInput;
        private TextBox EmailInput;
        private TextBox PasswordInput;
        private TextBox PasswordRepeatInput;
        private Button RegisterSubmit;
        private LinkLabel LinkLogin;
    }
}