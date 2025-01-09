namespace WinFormsApp1
{
    partial class MyAppointmentsPage
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
            Grid = new DataGridView();
            appointmentBindingSource = new BindingSource(components);
            idDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            statusDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            tattooDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            workSheduleDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)Grid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource).BeginInit();
            SuspendLayout();
            // 
            // Grid
            // 
            Grid.AllowUserToAddRows = false;
            Grid.AllowUserToDeleteRows = false;
            Grid.AllowUserToOrderColumns = true;
            Grid.AutoGenerateColumns = false;
            Grid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            Grid.Columns.AddRange(new DataGridViewColumn[] { idDataGridViewTextBoxColumn, statusDataGridViewTextBoxColumn, tattooDataGridViewTextBoxColumn, workSheduleDataGridViewTextBoxColumn });
            Grid.DataSource = appointmentBindingSource;
            Grid.Location = new Point(1, 3);
            Grid.Name = "Grid";
            Grid.ReadOnly = true;
            Grid.Size = new Size(805, 435);
            Grid.TabIndex = 0;
            // 
            // appointmentBindingSource
            // 
            appointmentBindingSource.DataSource = typeof(Appointment);
            // 
            // idDataGridViewTextBoxColumn
            // 
            idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            idDataGridViewTextBoxColumn.HeaderText = "Id";
            idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            idDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // statusDataGridViewTextBoxColumn
            // 
            statusDataGridViewTextBoxColumn.DataPropertyName = "Status";
            statusDataGridViewTextBoxColumn.HeaderText = "Статус";
            statusDataGridViewTextBoxColumn.Name = "statusDataGridViewTextBoxColumn";
            statusDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // tattooDataGridViewTextBoxColumn
            // 
            tattooDataGridViewTextBoxColumn.DataPropertyName = "ServiceName";
            tattooDataGridViewTextBoxColumn.HeaderText = "Услуга";
            tattooDataGridViewTextBoxColumn.Name = "tattooDataGridViewTextBoxColumn";
            tattooDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // workSheduleDataGridViewTextBoxColumn
            // 
            workSheduleDataGridViewTextBoxColumn.DataPropertyName = "DateSlot";
            workSheduleDataGridViewTextBoxColumn.HeaderText = "Время записи";
            workSheduleDataGridViewTextBoxColumn.Name = "workSheduleDataGridViewTextBoxColumn";
            workSheduleDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // MyAppointmentsPage
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(832, 450);
            Controls.Add(Grid);
            Name = "MyAppointmentsPage";
            Text = "MyAppointmentsPage";
            ((System.ComponentModel.ISupportInitialize)Grid).EndInit();
            ((System.ComponentModel.ISupportInitialize)appointmentBindingSource).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView Grid;
        private BindingSource appointmentBindingSource;
        private DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn statusDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn tattooDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn workSheduleDataGridViewTextBoxColumn;
    }
}