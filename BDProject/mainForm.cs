using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Windows.Forms;
using static System.ComponentModel.Design.ObjectSelectorEditor;


namespace BDProject

{

    public partial class mainForm : Form
    {

        public mainForm()
        {
            InitializeComponent();
            cmbType.SelectedIndexChanged += new System.EventHandler(this.cmbType_SelectedIndexChanged);

        }

        string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";

        private void cmbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Hide all fields initially
            labelAdditionalInfo.Visible = false;
            txtAdditionalInfo.Visible = false;

            datePickerDataRenovacaoCarta.Visible = false;
            cmbCartaEspecial.Visible = false;
            cmbTurno.Visible = false;
            labelCartaEspecial.Visible = false;
            labelTurno.Visible = false;
            lblDataRenovacaoCarta.Visible = false;

            // Depending on the selected type, show the corresponding fields
            string selectedType = cmbType.SelectedItem.ToString();
            if (selectedType == "Engenheiro")
            {
                labelAdditionalInfo.Text = "Curso";
                labelAdditionalInfo.Visible = true;
                txtAdditionalInfo.Visible = true;
            }
            else if (selectedType == "Motorista")
            {
                datePickerDataRenovacaoCarta.Visible = true;
                cmbCartaEspecial.Items.Clear();
                cmbCartaEspecial.Items.Add("Y");
                cmbCartaEspecial.Items.Add("N");
                cmbCartaEspecial.Visible = true;
                labelCartaEspecial.Visible = true;
                lblDataRenovacaoCarta.Visible = true;
            }
            else if (selectedType == "Operario")
            {
                labelAdditionalInfo.Text = "Especializacao";
                labelAdditionalInfo.Visible = true;
                txtAdditionalInfo.Visible = true;

                cmbTurno.Items.Clear();
                cmbTurno.Items.Add("D");
                cmbTurno.Items.Add("N");
                cmbTurno.Visible = true;
                labelTurno.Visible = true;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Funcionario", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView2.DataSource = dt;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM vw_CartaoTrabalho", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView3.DataSource = dt;
            }

            txtID_FuncionarioRemove.Visible = false;
            labelIDRemove.Visible = false;
            btnSubmitRemove.Visible = false;

            labelNome.Visible = false;
            labelSalario.Visible = false;
            labelSexo.Visible = false;
            labelTelemovel.Visible = false;
            labelMorada.Visible = false;
            labelDataNascimento.Visible = false;
            labelEmail.Visible = false;
            labelDataInicioTrabalho.Visible = false;
            labelFuncao.Visible = false;

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

            labelAdditionalInfo.Visible = false;
            txtAdditionalInfo.Visible = false;

            datePickerDataRenovacaoCarta.Visible = false;
            cmbCartaEspecial.Visible = false;
            cmbTurno.Visible = false;
            labelCartaEspecial.Visible = false;
            labelTurno.Visible = false;
            lblDataRenovacaoCarta.Visible = false;

            // CartaoTrabalho buttons
            lblIDCarTra.Visible = false;
            lblIDFun.Visible = false;
            txtIDCarTra.Visible = false;
            txtIDCarFun.Visible = false;
            btnSubmitCarTra.Visible = false;
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }


        private void button1_Click(object sender, EventArgs e)
        {

            if (!cmbSexo.Items.Contains("M"))
            {
                cmbSexo.Items.Add("M");
            }

            if (!cmbSexo.Items.Contains("F"))
            {
                cmbSexo.Items.Add("F");
            }

            if (!cmbType.Items.Contains("Engenheiro"))
            {
                cmbType.Items.Add("Engenheiro");
            }

            if (!cmbType.Items.Contains("Motorista"))
            {
                cmbType.Items.Add("Motorista");
            }

            if (!cmbType.Items.Contains("Operario"))
            {
                cmbType.Items.Add("Operario");
            }


            labelNome.Visible = true;
            labelSalario.Visible = true;
            labelSexo.Visible = true;
            labelTelemovel.Visible = true;
            labelMorada.Visible = true;
            labelDataNascimento.Visible = true;
            labelEmail.Visible = true;
            labelDataInicioTrabalho.Visible = true;
            labelFuncao.Visible = true;

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

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // VIEW AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Funcionario", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView2.DataSource = dt;
            }
        }

        

        private void RefreshCartaoTrabalhoData()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SELECT * FROM vw_CartaoTrabalho", conn))
                using (var adapter = new SqlDataAdapter(command))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView3.DataSource = dataTable;
                    dataGridView3.Refresh();
                }
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

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AddFuncionario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    //cmd.Parameters.Add("@ID_Funcionario", SqlDbType.Int).Value = txtID_Funcionario.Text;
                    cmd.Parameters.Add("@Nome", SqlDbType.VarChar).Value = txtNome.Text;
                    cmd.Parameters.Add("@Salario", SqlDbType.Decimal).Value = txtSalario.Text;
                    cmd.Parameters.Add("@Sexo", SqlDbType.Char).Value = cmbSexo.SelectedItem.ToString();
                    cmd.Parameters.Add("@Telemovel", SqlDbType.VarChar).Value = txtTelemovel.Text;
                    cmd.Parameters.Add("@Morada", SqlDbType.VarChar).Value = txtMorada.Text;
                    cmd.Parameters.Add("@Data_nascimento", SqlDbType.Date).Value = datePickerDataNascimento.Value;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Data_inicio_trabalho", SqlDbType.Date).Value = datePickerDataInicioTrabalho.Value;
                    cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = cmbType.SelectedItem.ToString();


                    if (cmbType.SelectedItem.ToString() == "Motorista")
                    {
                        cmd.Parameters.Add("@Data_Renovacao_Carta", SqlDbType.Date).Value = datePickerDataRenovacaoCarta.Value;
                        cmd.Parameters.Add("@Carta_Especial", SqlDbType.Char).Value = cmbCartaEspecial.SelectedItem.ToString();
                    }
                    else if (cmbType.SelectedItem.ToString() == "Operario")
                    {
                        cmd.Parameters.Add("@Turno", SqlDbType.Char).Value = cmbTurno.SelectedItem.ToString();
                        cmd.Parameters.Add("@Especializacao", SqlDbType.VarChar).Value = labelAdditionalInfo.Text;
                    }
                    else if (cmbType.SelectedItem.ToString() == "Engenheiro")
                    {
                        cmd.Parameters.Add("@Curso", SqlDbType.Char).Value = txtAdditionalInfo.Text;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
            }

            RefreshDataGridView();

            labelNome.Visible = false;
            labelSalario.Visible = false;
            labelSexo.Visible = false;
            labelTelemovel.Visible = false;
            labelMorada.Visible = false;
            labelDataNascimento.Visible = false;
            labelEmail.Visible = false;
            labelDataInicioTrabalho.Visible = false;
            labelFuncao.Visible = false;

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

        private void button1_Click_3(object sender, EventArgs e)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("GetAverageAge", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtAverageAge.Text = reader["AverageAge"].ToString();
                        }
                    }
                }
            }
        }

        private void textBox2_TextChanged_2(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_3(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("ApplyBonus", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    dataGridView2.DataSource = dataTable;
                }
            }
        }

        private void label1_Click_2(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_4(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("SearchFuncionario", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Search", SqlDbType.VarChar, 256));
                    cmd.Parameters["@Search"].Value = txtSearch.Text;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("GetFuncionariosOrderedBySalario", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("GetFuncionariosOrderedByAge", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("GetFuncionariosOrderedByDataNascimento", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("GetFuncionariosOrderedByDataInicioTrabalho", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void label4_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void labelCartaEspecial_Click(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("GenerateCartaoTrabalho", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.ExecuteNonQuery();
                }
            }

            RefreshCartaoTrabalhoData();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            lblIDCarTra.Visible = true;
            lblIDFun.Visible = true;
            txtIDCarTra.Visible = true;
            txtIDCarFun.Visible = true;
            btnSubmitCarTra.Visible = true;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("AssociateCartaoToFuncionario", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID_CartaoTrabalho", txtIDCarTra.Text);
                    command.Parameters.AddWithValue("@ID_Funcionario", txtIDCarFun.Text);
                    command.ExecuteNonQuery();
                }
            }

            lblIDCarTra.Visible = false;
            lblIDFun.Visible = false;
            txtIDCarTra.Visible = false;
            txtIDCarFun.Visible = false;
            btnSubmitCarTra.Visible = false;

            RefreshCartaoTrabalhoData();
        }

        private void SearchCartTrab_TextChanged(object sender, EventArgs e)
        {

            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (var command = new SqlCommand("SearchCartaoTrabalho", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@SearchTerm", SearchCartTrab.Text);

                        using (var adapter = new SqlDataAdapter(command))
                        {
                            var dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            dataGridView4.DataSource = dataTable;
                        }
                    }
                }

            }
        }
    }
}


