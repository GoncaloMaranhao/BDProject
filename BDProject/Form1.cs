using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Windows.Forms;


namespace BDProject


{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Funcionario", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView2.DataSource = dt;
            }

            txtID_FuncionarioRemove.Visible = false;
            labelIDRemove.Visible = false;
            btnSubmitRemove.Visible = false;

            labellID.Visible = false;
            labelNome.Visible = false;
            labelSalario.Visible = false;
            labelSexo.Visible = false;
            labelTelemovel.Visible = false;
            labelMorada.Visible = false;
            labelDataNascimento.Visible = false;
            labelEmail.Visible = false;
            labelDataInicioTrabalho.Visible = false;
            labelFuncao.Visible = false;

            txtID_Funcionario.Visible = false;
            txtNome.Visible = false;
            txtSalario.Visible = false;
            cmbSexo.Visible = false;
            txtTelemovel.Visible = false;
            txtMorada.Visible = false;
            datePickerDataNascimento.Visible = false;
            txtEmail.Visible = false;
            datePickerDataInicioTrabalho.Visible = false;
            cmbType.Visible = false;
            btnSubmit.Visible = false;
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

            cmbSexo.Items.Add("M");
            cmbSexo.Items.Add("F");
            cmbType.Items.Add("Engenheiro");
            cmbType.Items.Add("Motorista");
            cmbType.Items.Add("Operario");

            labellID.Visible = true;
            labelNome.Visible = true;
            labelSalario.Visible = true;
            labelSexo.Visible = true;
            labelTelemovel.Visible = true;
            labelMorada.Visible = true;
            labelDataNascimento.Visible = true;
            labelEmail.Visible = true;
            labelDataInicioTrabalho.Visible = true;
            labelFuncao.Visible = true;

            txtID_Funcionario.Visible = true;
            txtNome.Visible = true;
            txtSalario.Visible = true;
            cmbSexo.Visible = true;
            txtTelemovel.Visible = true;
            txtMorada.Visible = true;
            datePickerDataNascimento.Visible = true;
            txtEmail.Visible = true;
            datePickerDataInicioTrabalho.Visible = true;
            cmbType.Visible = true;
            btnSubmit.Visible = true;


        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void RefreshDataGridView()
        {
            string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Funcionario", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView2.DataSource = dt;
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        // ADD Funcionario
        private void button1_Click_1(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AddFuncionario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@ID_Funcionario", SqlDbType.Int).Value = txtID_Funcionario.Text;
                    cmd.Parameters.Add("@Nome", SqlDbType.VarChar).Value = txtNome.Text;
                    cmd.Parameters.Add("@Salario", SqlDbType.Decimal).Value = txtSalario.Text;
                    cmd.Parameters.Add("@Sexo", SqlDbType.Char).Value = cmbSexo.SelectedItem.ToString();
                    cmd.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = txtTelemovel.Text;
                    cmd.Parameters.Add("@Morada", SqlDbType.VarChar).Value = txtMorada.Text;
                    cmd.Parameters.Add("@Data_nascimento", SqlDbType.Date).Value = datePickerDataNascimento.Value;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Data_inicio_trabalho", SqlDbType.Date).Value = datePickerDataInicioTrabalho.Value;
                    cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = cmbType.SelectedItem.ToString();

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            RefreshDataGridView();

            labellID.Visible = false;
            labelNome.Visible = false;
            labelSalario.Visible = false;
            labelSexo.Visible = false;
            labelTelemovel.Visible = false;
            labelMorada.Visible = false;
            labelDataNascimento.Visible = false;
            labelEmail.Visible = false;
            labelDataInicioTrabalho.Visible = false;
            labelFuncao.Visible = false;

            txtID_Funcionario.Visible = false;
            txtNome.Visible = false;
            txtSalario.Visible = false;
            cmbSexo.Visible = false;
            txtTelemovel.Visible = false;
            txtMorada.Visible = false;
            datePickerDataNascimento.Visible = false;
            txtEmail.Visible = false;
            datePickerDataInicioTrabalho.Visible = false;
            cmbType.Visible = false;

            btnSubmit.Visible = false;
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void labelSalario_Click(object sender, EventArgs e)
        {

        }

        private void labelDataNascimento_Click(object sender, EventArgs e)
        {

        }

        private void RemoveFuncionarioButton_Click(object sender, EventArgs e)
        {
            txtID_FuncionarioRemove.Visible = true;
            labelIDRemove.Visible = true;
            btnSubmitRemove.Visible = true;

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("RemoveFuncionario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@ID_Funcionario", SqlDbType.Int).Value = txtID_FuncionarioRemove.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        
            RefreshDataGridView();
            btnSubmitRemove.Visible = false;

        }
    }
}