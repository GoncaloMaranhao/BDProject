using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Reflection.Emit;
using System.Windows.Forms;
using static System.ComponentModel.Design.ObjectSelectorEditor;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolBar;


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
            labelAdditionalInfo.Visible = false;
            txtAdditionalInfo.Visible = false;

            datePickerDataRenovacaoCarta.Visible = false;
            cmbCartaEspecial.Visible = false;
            cmbTurno.Visible = false;
            labelCartaEspecial.Visible = false;
            labelTurno.Visible = false;
            lblDataRenovacaoCarta.Visible = false;

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
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM FuncionarioView", con);
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

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM DepartmentView ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView5.DataSource = dt;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM EngenheiroView", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView6.DataSource = dt;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM ViewEngenheiros", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView7.DataSource = dt;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM View_AtribuicaoCamiao", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView8.DataSource = dt;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM View_Atribuicao_Info", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dataGridView9.DataSource = dt;
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
            lblIDCartTrab.Visible = false;
            tbIDCartTrab.Visible = false;
            btnSubmitRemoveCard.Visible = false;

            // Dep buttons
            lbID_Eng.Visible = false;
            lblID_Department.Visible = false;
            btnD_Eng.Visible = false;
            tBlblID_Department.Visible = false;
            Submit10.Visible = false;
            lblIDEng.Visible = false;
            tBIDEng.Visible = false;
            Submit11.Visible = false;
            lblDepName.Visible = false;
            textBox2.Visible = false;
            label7.Visible = false;
            textBox3.Visible = false;
            Iasdf.Visible = false;
            textBox4.Visible = false;
            label8.Visible = false;
            textBox5.Visible = false;
            label9.Visible = false;
            textBox6.Visible = false;
            label10.Visible = false;
            textBox7.Visible = false;
            btnSubmitAddDep.Visible = false;
            ID_Department.Visible = false;
            textBox8.Visible = false;
            btnSubmitRemoveDep.Visible = false;

            // Camiao btns
            textBox10.Visible = false;
            label12.Visible = false;
            textBox11.Visible = false;
            label13.Visible = false;
            label14.Visible = false;
            textBox12.Visible = false;
            label16.Visible = false;
            dateTimePicker1.Visible = false;
            label17.Visible = false;
            dateTimePicker2.Visible = false;
            button11.Visible = false;
            label18.Visible = false;
            textBox14.Visible = false;
            button12.Visible = false;
            label19.Visible = false;
            textBox15.Visible = false;

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

        private void RefreshDepartmentData()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SELECT * FROM DepartmentView ", conn))
                using (var adapter = new SqlDataAdapter(command))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView5.DataSource = dataTable;
                    dataGridView5.Refresh();
                }
            }
        }

        private void RefreshEngenheirosData()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SELECT * FROM ViewEngenheiros ", conn))
                using (var adapter = new SqlDataAdapter(command))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView7.DataSource = dataTable;
                    dataGridView7.Refresh();
                }
            }
        }

        private void RefreshEngenheiroData()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SELECT * FROM EngenheiroView ", conn))
                using (var adapter = new SqlDataAdapter(command))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView6.DataSource = dataTable;
                    dataGridView6.Refresh();
                }
            }
        }

        private void RefreshAtribuicaoCamiaoData()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SELECT * FROM View_AtribuicaoCamiao ", conn))
                using (var adapter = new SqlDataAdapter(command))
                {
                    var dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView8.DataSource = dataTable;
                    dataGridView8.Refresh();
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

        private void btnCarTraOrder_Click(object sender, EventArgs e)
        {
            string query = "EXEC sp_GetCartaoTrabalhoOrdered";
            SqlDataAdapter sda = new SqlDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dataGridView3.DataSource = dt;
        }

        private void SearchCartTrabName_TextChanged(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (var command = new SqlCommand("SearchCartaoTrabalhoByName", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@SearchTerm", SearchCartTrabName.Text);

                    using (var adapter = new SqlDataAdapter(command))
                    {
                        var dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        dataGridView4.DataSource = dataTable;
                    }
                }
            }
        }

        private void button8_Click_1(object sender, EventArgs e)
        {
            lblIDCartTrab.Visible = true;
            tbIDCartTrab.Visible = true;
            btnSubmitRemoveCard.Visible = true;
        }

        private void label4_Click_2(object sender, EventArgs e)
        {

        }

        private void label4_Click_3(object sender, EventArgs e)
        {

        }

        private void btnSubmitRemoveCard_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("DeleteCartaoTrabalho", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", tbIDCartTrab.Text);

                    command.ExecuteNonQuery();

                }
            }

            lblIDCartTrab.Visible = false;
            tbIDCartTrab.Visible = false;
            btnSubmitRemoveCard.Visible = false;
            RefreshCartaoTrabalhoData();
        }

        private void button9_Click_1(object sender, EventArgs e)
        {
            ID_Department.Visible = true;
            textBox8.Visible = true;
            btnSubmitRemoveDep.Visible = true;
        }

        private void lblDepName_Click(object sender, EventArgs e)
        {

        }

        private void btnAddEnginner_Click(object sender, EventArgs e)
        {
            lbID_Eng.Visible = true;
            lblID_Department.Visible = true;
            btnD_Eng.Visible = true;
            tBlblID_Department.Visible = true;
            Submit10.Visible = true;
        }

        private void Submit10_Click(object sender, EventArgs e)
        {
            if (int.TryParse(btnD_Eng.Text, out int idEngenheiro) && int.TryParse(tBlblID_Department.Text, out int idDepartamento))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("AddEngenheiroManager", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ID_Departamento", idDepartamento);
                    cmd.Parameters.AddWithValue("@ID_Engenheiro", idEngenheiro);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                RefreshDepartmentData();
                RefreshEngenheiroData();
            }


            lbID_Eng.Visible = false;
            lblID_Department.Visible = false;
            btnD_Eng.Visible = false;
            tBlblID_Department.Visible = false;
            Submit10.Visible = false;
        }

        private void btnRemoveEnginner_Click(object sender, EventArgs e)
        {
            lblIDEng.Visible = true;
            tBIDEng.Visible = true;
            Submit11.Visible = true;
        }

        private void Submit11_Click(object sender, EventArgs e)
        {
            if (int.TryParse(tBIDEng.Text, out int idEngenheiro))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("RemoveEngenheiroManager", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ID_Departamento", idEngenheiro);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblIDEng.Visible = false;
            tBIDEng.Visible = false;
            Submit11.Visible = false;
            RefreshDepartmentData();
            RefreshEngenheiroData();
        }

        private void btnAddDep_Click(object sender, EventArgs e)
        {
            lblDepName.Visible = true;
            textBox2.Visible = true;
            label7.Visible = true;
            textBox3.Visible = true;
            Iasdf.Visible = true;
            textBox4.Visible = true;
            label8.Visible = true;
            textBox5.Visible = true;
            label9.Visible = true;
            textBox6.Visible = true;
            label10.Visible = true;
            textBox7.Visible = true;
            btnSubmitAddDep.Visible = true;
        }

        private void btnSubmitAddDep_Click(object sender, EventArgs e)
        {
            if (decimal.TryParse(textBox3.Text, out decimal orcamento) && decimal.TryParse(textBox5.Text, out decimal taxaEmissao) && decimal.TryParse(textBox6.Text, out decimal taxaReciclagem) && decimal.TryParse(textBox7.Text, out decimal residuoGerado))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("AddDepartamento", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Nome", textBox2.Text);
                    cmd.Parameters.AddWithValue("@Orcamento", decimal.Parse(textBox3.Text));
                    cmd.Parameters.AddWithValue("@TaxaEmissao", decimal.Parse(textBox5.Text));
                    cmd.Parameters.AddWithValue("@TaxaReciclagem", decimal.Parse(textBox6.Text));
                    cmd.Parameters.AddWithValue("@ResiduoGerado", decimal.Parse(textBox7.Text));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblDepName.Visible = false;
            textBox2.Visible = false;
            label7.Visible = false;
            textBox3.Visible = false;
            Iasdf.Visible = false;
            textBox4.Visible = false;
            label8.Visible = false;
            textBox5.Visible = false;
            label9.Visible = false;
            textBox6.Visible = false;
            label10.Visible = false;
            textBox7.Visible = false;
            btnSubmitAddDep.Visible = false;
            RefreshDepartmentData();
            RefreshEngenheiroData();

        }

        private void dataGridView5_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM DepartmentView", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView5.DataSource = dt;
            }
        }

        private void btnSubmitRemoveDep_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("RemoveDepartamento", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nome_Departamento", textBox8.Text);

                    cmd.ExecuteNonQuery();
                }
            }

            ID_Department.Visible = false;
            textBox8.Visible = false;
            btnSubmitRemoveDep.Visible = false;

            RefreshDepartmentData();
            RefreshEngenheiroData();

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SearchEngenheiro", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nome", textBox9.Text);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        dataGridView7.DataSource = dt;
                    }
                }
            }
        }

        private void button8_Click_2(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM ViewEngenheirosNotManagers", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                dataGridView7.DataSource = dtbl;
            }
        }

        private void dataGridView7_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void tabPage3_Click(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {
        }

        private void button9_Click_2(object sender, EventArgs e)
        {
            textBox10.Visible = true;
            label12.Visible = true;
            textBox11.Visible = true;
            label13.Visible = true;
            label14.Visible = true;
            textBox12.Visible = true;
            label16.Visible = true;
            dateTimePicker1.Visible = true;
            label17.Visible = true;
            dateTimePicker2.Visible = true;
            button11.Visible = true;
        }

        private void button10_Click_1(object sender, EventArgs e)
        {
            label18.Visible = true;
            textBox14.Visible = true;
            button12.Visible = true;
        }

        private void dataGridView8_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button11_Click(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("InsertAtribuicaoCamiao", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@ID_Camiao", SqlDbType.Int));
                    cmd.Parameters["@ID_Camiao"].Value = int.Parse(textBox10.Text);

                    cmd.Parameters.Add(new SqlParameter("@ID_Encomenda", SqlDbType.Int));
                    cmd.Parameters["@ID_Encomenda"].Value = int.Parse(textBox11.Text);

                    cmd.Parameters.Add(new SqlParameter("@ID_Motorista", SqlDbType.Int));
                    cmd.Parameters["@ID_Motorista"].Value = int.Parse(textBox12.Text);

                    cmd.Parameters.Add(new SqlParameter("@Peso_Transportado", SqlDbType.Int));
                    cmd.Parameters["@Peso_Transportado"].Value = int.Parse(textBox15.Text);

                    cmd.Parameters.Add(new SqlParameter("@Data_Inicio", SqlDbType.Date));
                    cmd.Parameters["@Data_Inicio"].Value = dateTimePicker1.Value.Date;

                    cmd.Parameters.Add(new SqlParameter("@Data_Fim", SqlDbType.Date));
                    cmd.Parameters["@Data_Fim"].Value = dateTimePicker2.Value.Date;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("New AtribuicaoCamiao Added Successfully!");
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            textBox10.Visible = false;
            label12.Visible = false;
            textBox11.Visible = false;
            label13.Visible = false;
            label14.Visible = false;
            textBox12.Visible = false;
            label16.Visible = false;
            dateTimePicker1.Visible = false;
            label17.Visible = false;
            dateTimePicker2.Visible = false;
            button11.Visible = false;
            label18.Visible = false;
            label19.Visible = false;
            textBox15.Visible = false;
            RefreshAtribuicaoCamiaoData();
        }

        private void button12_Click(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("DeleteAtribuicaoCamiao", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Atribuicao_ID", SqlDbType.Int));
                    cmd.Parameters["@Atribuicao_ID"].Value = int.Parse(textBox14.Text);

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            textBox14.Visible = false;
            label18.Visible = false;
            button12.Visible = false;
            RefreshAtribuicaoCamiaoData();
        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void tabPage4_Click(object sender, EventArgs e)
        {

        }

        private void textBox16_TextChanged(object sender, EventArgs e)
        {
            Debug.WriteLine("Textbox content changed.");
            Debug.WriteLine($"Textbox content: {textBox16.Text}");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("SearchCamiaoByMatricula", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Matricula", SqlDbType.VarChar, 256));
                    cmd.Parameters["@Matricula"].Value = textBox16.Text;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    Debug.WriteLine($"Number of rows: {dt.Rows.Count}");

                    dataGridView9.DataSource = dt;
                }
            }
        }
    }

}



