using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Windows.Forms;

namespace BDProject
{
    public partial class login : Form
    {
        public login()
        {
            InitializeComponent();
            textBoxPassword.PasswordChar = '*';
        }

        private string HashPassword(string password, byte[] salt)
        {
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000))
            {
                byte[] hash = pbkdf2.GetBytes(20);
                return Convert.ToBase64String(hash);
            }
        }

        private void Form3_Load(object sender, EventArgs e)
        {
        }

        private void label1_Click(object sender, EventArgs e)
        {
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
        }


        (string, byte[]) GetHashedPasswordAndSaltFromDB(string username)
        {
            string connectionString = @"Data Source=DESKTOP-814R5P6;Initial Catalog=MyLocalDB;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetHashedPassword", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedHashedPassword = reader["HashedPassword"] as string;
                            byte[] storedSalt = (byte[])reader["Salt"]; 

                            return (storedHashedPassword, storedSalt);
                        }
                        else
                        {
                            return (null, null);
                        }
                    }
                }
            }
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            string username = textBoxUsername.Text;
            string password = textBoxPassword.Text;

            (string storedHashedPassword, byte[] storedSalt) = GetHashedPasswordAndSaltFromDB(username);

            string inputHashedPassword = HashPassword(password, storedSalt);

            if (inputHashedPassword == storedHashedPassword)
            {
                this.Hide();
                mainForm funcionarioForm = new mainForm();
                funcionarioForm.Show();
            }
            else
            {
                MessageBox.Show("Invalid username or password", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
