namespace WinFormsApp1
{
    partial class HomePage
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
            dataGridView1 = new DataGridView();
            idDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            titleDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            styleDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            priceDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            areaSizeDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            imageDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            appointmentsDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            usedMaterialsDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            AddBasketColumn = new DataGridViewButtonColumn();
            tattooBindingSource = new BindingSource(components);
            NameLabel = new Label();
            RoleLabel = new Label();
            panel1 = new Panel();
            ChoseenTattooLabel = new Label();
            RegisterSlotSubmit = new Button();
            label3 = new Label();
            label2 = new Label();
            RegisterSlotLabel = new Label();
            slotsSelect = new ComboBox();
            workSheduleBindingSource = new BindingSource(components);
            masterSelect = new ComboBox();
            userBindingSource = new BindingSource(components);
            LinkMyAppointments = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).BeginInit();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)workSheduleBindingSource).BeginInit();
            ((System.ComponentModel.ISupportInitialize)userBindingSource).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 20F);
            label1.Location = new Point(654, 29);
            label1.Name = "label1";
            label1.Size = new Size(273, 37);
            label1.TabIndex = 0;
            label1.Text = "Домашняя страница";
            // 
            // dataGridView1
            // 
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn, titleDataGridViewTextBoxColumn, styleDataGridViewTextBoxColumn, priceDataGridViewTextBoxColumn, areaSizeDataGridViewTextBoxColumn, imageDataGridViewTextBoxColumn, appointmentsDataGridViewTextBoxColumn, usedMaterialsDataGridViewTextBoxColumn, AddBasketColumn });
            dataGridView1.DataSource = tattooBindingSource;
            dataGridView1.Location = new Point(55, 81);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.Size = new Size(680, 547);
            dataGridView1.TabIndex = 2;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            // 
            // idDataGridViewTextBoxColumn
            // 
            idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn.HeaderText = "Id";
            idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            // 
            // titleDataGridViewTextBoxColumn
            // 
            titleDataGridViewTextBoxColumn.DataPropertyName = "Title";
            titleDataGridViewTextBoxColumn.HeaderText = "Наименование";
            titleDataGridViewTextBoxColumn.Name = "titleDataGridViewTextBoxColumn";
            // 
            // styleDataGridViewTextBoxColumn
            // 
            styleDataGridViewTextBoxColumn.DataPropertyName = "Style";
            styleDataGridViewTextBoxColumn.HeaderText = "Стиль";
            styleDataGridViewTextBoxColumn.Name = "styleDataGridViewTextBoxColumn";
            // 
            // priceDataGridViewTextBoxColumn
            // 
            priceDataGridViewTextBoxColumn.DataPropertyName = "Price";
            priceDataGridViewTextBoxColumn.HeaderText = "Цена";
            priceDataGridViewTextBoxColumn.Name = "priceDataGridViewTextBoxColumn";
            // 
            // areaSizeDataGridViewTextBoxColumn
            // 
            areaSizeDataGridViewTextBoxColumn.DataPropertyName = "AreaSize";
            areaSizeDataGridViewTextBoxColumn.HeaderText = "Размер";
            areaSizeDataGridViewTextBoxColumn.Name = "areaSizeDataGridViewTextBoxColumn";
            // 
            // imageDataGridViewTextBoxColumn
            // 
            imageDataGridViewTextBoxColumn.DataPropertyName = "Image";
            imageDataGridViewTextBoxColumn.HeaderText = "Image";
            imageDataGridViewTextBoxColumn.Name = "imageDataGridViewTextBoxColumn";
            imageDataGridViewTextBoxColumn.Visible = false;
            // 
            // appointmentsDataGridViewTextBoxColumn
            // 
            appointmentsDataGridViewTextBoxColumn.DataPropertyName = "Appointments";
            appointmentsDataGridViewTextBoxColumn.HeaderText = "Appointments";
            appointmentsDataGridViewTextBoxColumn.Name = "appointmentsDataGridViewTextBoxColumn";
            appointmentsDataGridViewTextBoxColumn.Visible = false;
            // 
            // usedMaterialsDataGridViewTextBoxColumn
            // 
            usedMaterialsDataGridViewTextBoxColumn.DataPropertyName = "UsedMaterials";
            usedMaterialsDataGridViewTextBoxColumn.HeaderText = "UsedMaterials";
            usedMaterialsDataGridViewTextBoxColumn.Name = "usedMaterialsDataGridViewTextBoxColumn";
            usedMaterialsDataGridViewTextBoxColumn.Visible = false;
            // 
            // AddBasketColumn
            // 
            AddBasketColumn.HeaderText = "Записаться";
            AddBasketColumn.Name = "AddBasketColumn";
            AddBasketColumn.Text = "Записаться";
            AddBasketColumn.UseColumnTextForButtonValue = true;
            // 
            // tattooBindingSource
            // 
            tattooBindingSource.DataSource = typeof(Tattoo);
            // 
            // NameLabel
            // 
            NameLabel.AutoSize = true;
            NameLabel.Location = new Point(55, 29);
            NameLabel.Name = "NameLabel";
            NameLabel.Size = new Size(118, 15);
            NameLabel.TabIndex = 3;
            NameLabel.Text = "Добро пожаловать, ";
            // 
            // RoleLabel
            // 
            RoleLabel.AutoSize = true;
            RoleLabel.Location = new Point(55, 51);
            RoleLabel.Name = "RoleLabel";
            RoleLabel.Size = new Size(73, 15);
            RoleLabel.TabIndex = 4;
            RoleLabel.Text = "Ваша роль: ";
            // 
            // panel1
            // 
            panel1.Controls.Add(ChoseenTattooLabel);
            panel1.Controls.Add(RegisterSlotSubmit);
            panel1.Controls.Add(label3);
            panel1.Controls.Add(label2);
            panel1.Controls.Add(RegisterSlotLabel);
            panel1.Controls.Add(slotsSelect);
            panel1.Controls.Add(masterSelect);
            panel1.Location = new Point(917, 81);
            panel1.Name = "panel1";
            panel1.Size = new Size(643, 539);
            panel1.TabIndex = 5;
            // 
            // ChoseenTattooLabel
            // 
            ChoseenTattooLabel.AutoSize = true;
            ChoseenTattooLabel.Location = new Point(230, 68);
            ChoseenTattooLabel.Name = "ChoseenTattooLabel";
            ChoseenTattooLabel.Size = new Size(111, 15);
            ChoseenTattooLabel.TabIndex = 6;
            ChoseenTattooLabel.Text = "Выбранная услуга:";
            // 
            // RegisterSlotSubmit
            // 
            RegisterSlotSubmit.Location = new Point(247, 299);
            RegisterSlotSubmit.Name = "RegisterSlotSubmit";
            RegisterSlotSubmit.Size = new Size(146, 23);
            RegisterSlotSubmit.TabIndex = 5;
            RegisterSlotSubmit.Text = "Записаться";
            RegisterSlotSubmit.UseVisualStyleBackColor = true;
            RegisterSlotSubmit.Click += RegisterSlotSubmit_Click;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(230, 198);
            label3.Name = "label3";
            label3.Size = new Size(163, 15);
            label3.TabIndex = 4;
            label3.Text = "Выберите свободное время:";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(230, 103);
            label2.Name = "label2";
            label2.Size = new Size(105, 15);
            label2.TabIndex = 3;
            label2.Text = "Выбрать мастера:";
            // 
            // RegisterSlotLabel
            // 
            RegisterSlotLabel.AutoSize = true;
            RegisterSlotLabel.Font = new Font("Segoe UI", 15F);
            RegisterSlotLabel.Location = new Point(230, 15);
            RegisterSlotLabel.Name = "RegisterSlotLabel";
            RegisterSlotLabel.Size = new Size(206, 28);
            RegisterSlotLabel.TabIndex = 2;
            RegisterSlotLabel.Text = "Записаться к мастеру";
            // 
            // slotsSelect
            // 
            slotsSelect.DataSource = workSheduleBindingSource;
            slotsSelect.DisplayMember = "WorkingTime";
            slotsSelect.FormattingEnabled = true;
            slotsSelect.Location = new Point(230, 216);
            slotsSelect.Name = "slotsSelect";
            slotsSelect.Size = new Size(193, 23);
            slotsSelect.TabIndex = 1;
            slotsSelect.ValueMember = "Id";
            // 
            // workSheduleBindingSource
            // 
            workSheduleBindingSource.DataSource = typeof(WorkShedule);
            // 
            // masterSelect
            // 
            masterSelect.DataSource = userBindingSource;
            masterSelect.DisplayMember = "FullName";
            masterSelect.FormattingEnabled = true;
            masterSelect.Location = new Point(230, 121);
            masterSelect.Name = "masterSelect";
            masterSelect.Size = new Size(193, 23);
            masterSelect.TabIndex = 0;
            masterSelect.ValueMember = "Id";
            masterSelect.SelectedIndexChanged += masterSelect_SelectedIndexChanged;
            // 
            // userBindingSource
            // 
            userBindingSource.DataSource = typeof(User);
            // 
            // LinkMyAppointments
            // 
            LinkMyAppointments.Location = new Point(1531, 29);
            LinkMyAppointments.Name = "LinkMyAppointments";
            LinkMyAppointments.Size = new Size(125, 23);
            LinkMyAppointments.TabIndex = 7;
            LinkMyAppointments.Text = "Мои записи";
            LinkMyAppointments.UseVisualStyleBackColor = true;
            LinkMyAppointments.Click += LinkMyAppointments_Click;
            // 
            // HomePage
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1668, 685);
            Controls.Add(LinkMyAppointments);
            Controls.Add(panel1);
            Controls.Add(RoleLabel);
            Controls.Add(NameLabel);
            Controls.Add(dataGridView1);
            Controls.Add(label1);
            Name = "HomePage";
            Text = "HomePage";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)tattooBindingSource).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)workSheduleBindingSource).EndInit();
            ((System.ComponentModel.ISupportInitialize)userBindingSource).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private DataGridView dataGridView1;
        private BindingSource tattooBindingSource;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn titleDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn styleDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn priceDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn areaSizeDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn imageDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn appointmentsDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn usedMaterialsDataGridViewTextBoxColumn;
        private DataGridViewButtonColumn AddBasketColumn;
        private Label NameLabel;
        private Label RoleLabel;
        private Panel panel1;
        private ComboBox masterSelect;
        private ComboBox slotsSelect;
        private BindingSource userBindingSource;
        private BindingSource workSheduleBindingSource;
        private Label label3;
        private Label label2;
        private Label RegisterSlotLabel;
        private Button RegisterSlotSubmit;
        private Label ChoseenTattooLabel;
        private Button LinkMyAppointments;
    }
}