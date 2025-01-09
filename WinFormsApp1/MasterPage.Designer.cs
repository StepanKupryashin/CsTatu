namespace WinFormsApp1
{
    partial class MasterPage
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
            tabControl1 = new TabControl();
            tabPage1 = new TabPage();
            saveButton = new Button();
            addSlotBtn = new Button();
            MasterSlotsGrid = new DataGridView();
            idDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            userIdDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            workingTimeDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            Action = new DataGridViewButtonColumn();
            workSheduleBindingSource = new BindingSource(components);
            tabPage2 = new TabPage();
            saveButton1 = new Button();
            MasterClientsGrid = new DataGridView();
            idDataGridViewTextBoxColumn1 = new DataGridViewTextBoxColumn();
            User = new DataGridViewTextBoxColumn();
            clientNameDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            statusDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            serviceNameDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            dateSlotDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            Action1 = new DataGridViewButtonColumn();
            appointmentBindingSource1 = new BindingSource(components);
            tabPage3 = new TabPage();
            saceButton2 = new Button();
            MaterialsGrid = new DataGridView();
            idDataGridViewTextBoxColumn2 = new DataGridViewTextBoxColumn();
            nameDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            priceDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            countDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            Action2 = new DataGridViewButtonColumn();
            materialBindingSource = new BindingSource(components);
            tabPage4 = new TabPage();
            addUsedMaterialBtn = new Button();
            ыфмуИгеещт3 = new Button();
            usedMaterialGrid = new DataGridView();
            idDataGridViewTextBoxColumn3 = new DataGridViewTextBoxColumn();
            materialDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            tattooDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            Action3 = new DataGridViewButtonColumn();
            usedMaterialBindingSource = new BindingSource(components);
            appointmentBindingSource = new BindingSource(components);
            label1 = new Label();
            refreshUsedMaterialsBtn = new Button();
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)MasterSlotsGrid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)workSheduleBindingSource).BeginInit();
            tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)MasterClientsGrid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource1).BeginInit();
            tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)MaterialsGrid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)materialBindingSource).BeginInit();
            tabPage4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)usedMaterialGrid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)usedMaterialBindingSource).BeginInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource).BeginInit();
            SuspendLayout();
            // 
            // tabControl1
            // 
            tabControl1.Controls.Add(tabPage1);
            tabControl1.Controls.Add(tabPage2);
            tabControl1.Controls.Add(tabPage3);
            tabControl1.Controls.Add(tabPage4);
            tabControl1.Location = new Point(12, 100);
            tabControl1.Name = "tabControl1";
            tabControl1.SelectedIndex = 0;
            tabControl1.Size = new Size(972, 470);
            tabControl1.TabIndex = 0;
            tabControl1.Tag = "";
            // 
            // tabPage1
            // 
            tabPage1.Controls.Add(saveButton);
            tabPage1.Controls.Add(addSlotBtn);
            tabPage1.Controls.Add(MasterSlotsGrid);
            tabPage1.Location = new Point(4, 24);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(3);
            tabPage1.Size = new Size(964, 442);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Мои слоты";
            tabPage1.UseVisualStyleBackColor = true;
            // 
            // saveButton
            // 
            saveButton.Location = new Point(688, 13);
            saveButton.Name = "saveButton";
            saveButton.Size = new Size(114, 23);
            saveButton.TabIndex = 2;
            saveButton.Text = "Сохранить";
            saveButton.UseVisualStyleBackColor = true;
            saveButton.Click += saveButton_Click;
            // 
            // addSlotBtn
            // 
            addSlotBtn.Location = new Point(811, 14);
            addSlotBtn.Name = "addSlotBtn";
            addSlotBtn.Size = new Size(111, 23);
            addSlotBtn.TabIndex = 1;
            addSlotBtn.Text = "Добавить слот";
            addSlotBtn.UseVisualStyleBackColor = true;
            addSlotBtn.Click += addSlotBtn_Click;
            // 
            // MasterSlotsGrid
            // 
            MasterSlotsGrid.AllowUserToOrderColumns = true;
            MasterSlotsGrid.AutoGenerateColumns = false;
            MasterSlotsGrid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            MasterSlotsGrid.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn, userIdDataGridViewTextBoxColumn, workingTimeDataGridViewTextBoxColumn, Action });
            MasterSlotsGrid.DataSource = workSheduleBindingSource;
            MasterSlotsGrid.Location = new Point(1, 43);
            MasterSlotsGrid.Name = "MasterSlotsGrid";
            MasterSlotsGrid.Size = new Size(921, 400);
            MasterSlotsGrid.TabIndex = 0;
            MasterSlotsGrid.CellContentClick += MasterSlotsGrid_CellContentClick;
            // 
            // idDataGridViewTextBoxColumn
            // 
            idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn.HeaderText = "Id";
            idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            // 
            // userIdDataGridViewTextBoxColumn
            // 
            userIdDataGridViewTextBoxColumn.DataPropertyName = "UserId";
            userIdDataGridViewTextBoxColumn.HeaderText = "UserId";
            userIdDataGridViewTextBoxColumn.Name = "userIdDataGridViewTextBoxColumn";
            userIdDataGridViewTextBoxColumn.Visible = false;
            // 
            // workingTimeDataGridViewTextBoxColumn
            // 
            workingTimeDataGridViewTextBoxColumn.DataPropertyName = "WorkingTime";
            workingTimeDataGridViewTextBoxColumn.HeaderText = "Время слота";
            workingTimeDataGridViewTextBoxColumn.Name = "workingTimeDataGridViewTextBoxColumn";
            // 
            // Action
            // 
            Action.HeaderText = "Действие";
            Action.Name = "Action";
            Action.Text = "Удалить";
            Action.UseColumnTextForButtonValue = true;
            // 
            // workSheduleBindingSource
            // 
            workSheduleBindingSource.DataSource = typeof(WorkShedule);
            // 
            // tabPage2
            // 
            tabPage2.Controls.Add(saveButton1);
            tabPage2.Controls.Add(MasterClientsGrid);
            tabPage2.Location = new Point(4, 24);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3);
            tabPage2.Size = new Size(964, 442);
            tabPage2.TabIndex = 1;
            tabPage2.Text = "Клиенты";
            tabPage2.UseVisualStyleBackColor = true;
            // 
            // saveButton1
            // 
            saveButton1.Location = new Point(866, 21);
            saveButton1.Name = "saveButton1";
            saveButton1.Size = new Size(75, 23);
            saveButton1.TabIndex = 1;
            saveButton1.Text = "Сохранить";
            saveButton1.UseVisualStyleBackColor = true;
            saveButton1.Click += saveButton1_Click;
            // 
            // MasterClientsGrid
            // 
            MasterClientsGrid.AutoGenerateColumns = false;
            MasterClientsGrid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            MasterClientsGrid.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn1, User, clientNameDataGridViewTextBoxColumn, statusDataGridViewTextBoxColumn, serviceNameDataGridViewTextBoxColumn, dateSlotDataGridViewTextBoxColumn, Action1 });
            MasterClientsGrid.DataSource = appointmentBindingSource1;
            MasterClientsGrid.Location = new Point(2, 50);
            MasterClientsGrid.Name = "MasterClientsGrid";
            MasterClientsGrid.Size = new Size(951, 385);
            MasterClientsGrid.TabIndex = 0;
            MasterClientsGrid.CellContentClick += MasterClientsGrid_CellContentClick;
            // 
            // idDataGridViewTextBoxColumn1
            // 
            idDataGridViewTextBoxColumn1.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn1.HeaderText = "Id";
            idDataGridViewTextBoxColumn1.Name = "idDataGridViewTextBoxColumn1";
            // 
            // User
            // 
            User.DataPropertyName = "MasterName";
            User.HeaderText = "Мастер";
            User.Name = "User";
            User.ReadOnly = true;
            // 
            // clientNameDataGridViewTextBoxColumn
            // 
            clientNameDataGridViewTextBoxColumn.DataPropertyName = "ClientName";
            clientNameDataGridViewTextBoxColumn.HeaderText = "Клиент";
            clientNameDataGridViewTextBoxColumn.Name = "clientNameDataGridViewTextBoxColumn";
            clientNameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // statusDataGridViewTextBoxColumn
            // 
            statusDataGridViewTextBoxColumn.DataPropertyName = "Status";
            statusDataGridViewTextBoxColumn.HeaderText = "Статус";
            statusDataGridViewTextBoxColumn.Name = "statusDataGridViewTextBoxColumn";
            // 
            // serviceNameDataGridViewTextBoxColumn
            // 
            serviceNameDataGridViewTextBoxColumn.DataPropertyName = "ServiceName";
            serviceNameDataGridViewTextBoxColumn.HeaderText = "Тату";
            serviceNameDataGridViewTextBoxColumn.Name = "serviceNameDataGridViewTextBoxColumn";
            serviceNameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // dateSlotDataGridViewTextBoxColumn
            // 
            dateSlotDataGridViewTextBoxColumn.DataPropertyName = "DateSlot";
            dateSlotDataGridViewTextBoxColumn.HeaderText = "Время записи";
            dateSlotDataGridViewTextBoxColumn.Name = "dateSlotDataGridViewTextBoxColumn";
            dateSlotDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // Action1
            // 
            Action1.HeaderText = "Действие";
            Action1.Name = "Action1";
            Action1.Resizable = DataGridViewTriState.True;
            Action1.SortMode = DataGridViewColumnSortMode.Automatic;
            Action1.Text = "Удалить";
            Action1.UseColumnTextForButtonValue = true;
            // 
            // appointmentBindingSource1
            // 
            appointmentBindingSource1.DataSource = typeof(Appointment);
            // 
            // tabPage3
            // 
            tabPage3.Controls.Add(saceButton2);
            tabPage3.Controls.Add(MaterialsGrid);
            tabPage3.Location = new Point(4, 24);
            tabPage3.Name = "tabPage3";
            tabPage3.Padding = new Padding(3);
            tabPage3.Size = new Size(964, 442);
            tabPage3.TabIndex = 2;
            tabPage3.Text = "Материалы";
            tabPage3.UseVisualStyleBackColor = true;
            // 
            // saceButton2
            // 
            saceButton2.Location = new Point(852, 15);
            saceButton2.Name = "saceButton2";
            saceButton2.Size = new Size(87, 23);
            saceButton2.TabIndex = 1;
            saceButton2.Text = "Сохранить";
            saceButton2.UseVisualStyleBackColor = true;
            saceButton2.Click += saceButton2_Click;
            // 
            // MaterialsGrid
            // 
            MaterialsGrid.AutoGenerateColumns = false;
            MaterialsGrid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            MaterialsGrid.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn2, nameDataGridViewTextBoxColumn, priceDataGridViewTextBoxColumn, countDataGridViewTextBoxColumn, Action2 });
            MaterialsGrid.DataSource = materialBindingSource;
            MaterialsGrid.Location = new Point(15, 44);
            MaterialsGrid.Name = "MaterialsGrid";
            MaterialsGrid.Size = new Size(933, 377);
            MaterialsGrid.TabIndex = 0;
            MaterialsGrid.CellContentClick += MaterialsGrid_CellContentClick;
            // 
            // idDataGridViewTextBoxColumn2
            // 
            idDataGridViewTextBoxColumn2.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn2.HeaderText = "Id";
            idDataGridViewTextBoxColumn2.Name = "idDataGridViewTextBoxColumn2";
            // 
            // nameDataGridViewTextBoxColumn
            // 
            nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            nameDataGridViewTextBoxColumn.HeaderText = "Наименование";
            nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            // 
            // priceDataGridViewTextBoxColumn
            // 
            priceDataGridViewTextBoxColumn.DataPropertyName = "Price";
            priceDataGridViewTextBoxColumn.HeaderText = "Цена";
            priceDataGridViewTextBoxColumn.Name = "priceDataGridViewTextBoxColumn";
            // 
            // countDataGridViewTextBoxColumn
            // 
            countDataGridViewTextBoxColumn.DataPropertyName = "Count";
            countDataGridViewTextBoxColumn.HeaderText = "Кол-во";
            countDataGridViewTextBoxColumn.Name = "countDataGridViewTextBoxColumn";
            // 
            // Action2
            // 
            Action2.HeaderText = "Декйствие";
            Action2.Name = "Action2";
            Action2.Text = "Удалить";
            Action2.UseColumnTextForButtonValue = true;
            // 
            // materialBindingSource
            // 
            materialBindingSource.DataSource = typeof(Material);
            // 
            // tabPage4
            // 
            tabPage4.Controls.Add(refreshUsedMaterialsBtn);
            tabPage4.Controls.Add(addUsedMaterialBtn);
            tabPage4.Controls.Add(ыфмуИгеещт3);
            tabPage4.Controls.Add(usedMaterialGrid);
            tabPage4.Location = new Point(4, 24);
            tabPage4.Name = "tabPage4";
            tabPage4.Padding = new Padding(3);
            tabPage4.Size = new Size(964, 442);
            tabPage4.TabIndex = 3;
            tabPage4.Text = "Использованные материалы";
            tabPage4.UseVisualStyleBackColor = true;
            // 
            // addUsedMaterialBtn
            // 
            addUsedMaterialBtn.Location = new Point(721, 17);
            addUsedMaterialBtn.Name = "addUsedMaterialBtn";
            addUsedMaterialBtn.Size = new Size(129, 23);
            addUsedMaterialBtn.TabIndex = 3;
            addUsedMaterialBtn.Text = "Учесть материалы";
            addUsedMaterialBtn.UseVisualStyleBackColor = true;
            addUsedMaterialBtn.Click += addUsedMaterialBtn_Click;
            // 
            // ыфмуИгеещт3
            // 
            ыфмуИгеещт3.Location = new Point(865, 17);
            ыфмуИгеещт3.Name = "ыфмуИгеещт3";
            ыфмуИгеещт3.Size = new Size(87, 23);
            ыфмуИгеещт3.TabIndex = 2;
            ыфмуИгеещт3.Text = "Сохранить";
            ыфмуИгеещт3.UseVisualStyleBackColor = true;
            ыфмуИгеещт3.Click += ыфмуИгеещт3_Click;
            // 
            // usedMaterialGrid
            // 
            usedMaterialGrid.AutoGenerateColumns = false;
            usedMaterialGrid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            usedMaterialGrid.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn3, materialDataGridViewTextBoxColumn, tattooDataGridViewTextBoxColumn, Action3 });
            usedMaterialGrid.DataSource = usedMaterialBindingSource;
            usedMaterialGrid.Location = new Point(6, 56);
            usedMaterialGrid.Name = "usedMaterialGrid";
            usedMaterialGrid.Size = new Size(946, 379);
            usedMaterialGrid.TabIndex = 0;
            usedMaterialGrid.CellContentClick += usedMaterialGrid_CellContentClick;
            // 
            // idDataGridViewTextBoxColumn3
            // 
            idDataGridViewTextBoxColumn3.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn3.HeaderText = "Id";
            idDataGridViewTextBoxColumn3.Name = "idDataGridViewTextBoxColumn3";
            // 
            // materialDataGridViewTextBoxColumn
            // 
            materialDataGridViewTextBoxColumn.DataPropertyName = "MaterialName";
            materialDataGridViewTextBoxColumn.HeaderText = "Материал";
            materialDataGridViewTextBoxColumn.Name = "materialDataGridViewTextBoxColumn";
            materialDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // tattooDataGridViewTextBoxColumn
            // 
            tattooDataGridViewTextBoxColumn.DataPropertyName = "TattooName";
            tattooDataGridViewTextBoxColumn.HeaderText = "Тату";
            tattooDataGridViewTextBoxColumn.Name = "tattooDataGridViewTextBoxColumn";
            tattooDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // Action3
            // 
            Action3.HeaderText = "Действие";
            Action3.Name = "Action3";
            Action3.Text = "Удалить";
            Action3.UseColumnTextForButtonValue = true;
            // 
            // usedMaterialBindingSource
            // 
            usedMaterialBindingSource.DataSource = typeof(UsedMaterial);
            // 
            // appointmentBindingSource
            // 
            appointmentBindingSource.DataSource = typeof(Appointment);
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 20F);
            label1.Location = new Point(377, 9);
            label1.Name = "label1";
            label1.Size = new Size(277, 37);
            label1.TabIndex = 1;
            label1.Text = "Администрирование";
            // 
            // refreshUsedMaterialsBtn
            // 
            refreshUsedMaterialsBtn.Location = new Point(631, 17);
            refreshUsedMaterialsBtn.Name = "refreshUsedMaterialsBtn";
            refreshUsedMaterialsBtn.Size = new Size(84, 23);
            refreshUsedMaterialsBtn.TabIndex = 4;
            refreshUsedMaterialsBtn.Text = "Обновить";
            refreshUsedMaterialsBtn.UseVisualStyleBackColor = true;
            refreshUsedMaterialsBtn.Click += refreshUsedMaterialsBtn_Click;
            // 
            // MasterPage
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(996, 582);
            Controls.Add(label1);
            Controls.Add(tabControl1);
            Name = "MasterPage";
            Text = "MasterPage";
            tabControl1.ResumeLayout(false);
            tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)MasterSlotsGrid).EndInit();
            ((System.ComponentModel.ISupportInitialize)workSheduleBindingSource).EndInit();
            tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)MasterClientsGrid).EndInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource1).EndInit();
            tabPage3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)MaterialsGrid).EndInit();
            ((System.ComponentModel.ISupportInitialize)materialBindingSource).EndInit();
            tabPage4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)usedMaterialGrid).EndInit();
            ((System.ComponentModel.ISupportInitialize)usedMaterialBindingSource).EndInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TabControl tabControl1;
        private Label label1;
        private TabPage tabPage1;
        private TabPage tabPage2;
        private TabPage tabPage3;
        private DataGridView MasterSlotsGrid;
        private BindingSource workSheduleBindingSource;
        private Button addSlotBtn;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn userIdDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn workingTimeDataGridViewTextBoxColumn;
        private DataGridViewButtonColumn Action;
        private Button saveButton;
        private Button saveButton1;
        private DataGridView MasterClientsGrid;
        private BindingSource appointmentBindingSource;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn User;
        private DataGridViewTextBoxColumn clientNameDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn statusDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn serviceNameDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn dateSlotDataGridViewTextBoxColumn;
        private DataGridViewButtonColumn Action1;
        private BindingSource appointmentBindingSource1;
        private TabPage tabPage4;
        private DataGridView MaterialsGrid;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn2;
        private DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn priceDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn countDataGridViewTextBoxColumn;
        private DataGridViewButtonColumn Action2;
        private BindingSource materialBindingSource;
        private DataGridView usedMaterialGrid;
        private BindingSource usedMaterialBindingSource;
        private Button saceButton2;
        private Button ыфмуИгеещт3;
        private Button addUsedMaterialBtn;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn3;
        private DataGridViewTextBoxColumn materialDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn tattooDataGridViewTextBoxColumn;
        private DataGridViewButtonColumn Action3;
        private Button refreshUsedMaterialsBtn;
    }
}