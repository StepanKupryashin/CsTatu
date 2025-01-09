namespace WinFormsApp1
{
    partial class UsedMaterialForm
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
            components = new System.ComponentModel.Container();
            label1 = new Label();
            comboBox1 = new ComboBox();
            materialBindingSource = new BindingSource(components);
            comboBox2 = new ComboBox();
            tattooBindingSource = new BindingSource(components);
            label2 = new Label();
            label3 = new Label();
            button1 = new Button();
            ((System.ComponentModel.ISupportInitialize)materialBindingSource).BeginInit();
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 20F);
            label1.Location = new Point(303, 9);
            label1.Name = "label1";
            label1.Size = new Size(227, 37);
            label1.TabIndex = 0;
            label1.Text = "Учет материалов";
            label1.Click += label1_Click;
            // 
            // comboBox1
            // 
            comboBox1.DataSource = materialBindingSource;
            comboBox1.DisplayMember = "Name";
            comboBox1.FormattingEnabled = true;
            comboBox1.Location = new Point(316, 92);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(161, 23);
            comboBox1.TabIndex = 1;
            comboBox1.ValueMember = "Id";
            // 
            // materialBindingSource
            // 
            materialBindingSource.DataSource = typeof(Material);
            // 
            // comboBox2
            // 
            comboBox2.DataSource = tattooBindingSource;
            comboBox2.DisplayMember = "Title";
            comboBox2.FormattingEnabled = true;
            comboBox2.Location = new Point(316, 173);
            comboBox2.Name = "comboBox2";
            comboBox2.Size = new Size(161, 23);
            comboBox2.TabIndex = 2;
            comboBox2.ValueMember = "Id";
            // 
            // tattooBindingSource
            // 
            tattooBindingSource.DataSource = typeof(Tattoo);
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(316, 74);
            label2.Name = "label2";
            label2.Size = new Size(120, 15);
            label2.TabIndex = 3;
            label2.Text = "Выберите материал:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(316, 155);
            label3.Name = "label3";
            label3.Size = new Size(89, 15);
            label3.TabIndex = 4;
            label3.Text = "Выберите тату:";
            // 
            // button1
            // 
            button1.Location = new Point(316, 237);
            button1.Name = "button1";
            button1.Size = new Size(161, 42);
            button1.TabIndex = 5;
            button1.Text = "Сохранить";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // UsedMaterialForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(button1);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(comboBox2);
            Controls.Add(comboBox1);
            Controls.Add(label1);
            Name = "UsedMaterialForm";
            Text = "UsedMaterialForm";
            ((System.ComponentModel.ISupportInitialize)materialBindingSource).EndInit();
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private ComboBox comboBox1;
        private ComboBox comboBox2;
        private Label label2;
        private Label label3;
        private Button button1;
        private BindingSource materialBindingSource;
        private BindingSource tattooBindingSource;
    }
}