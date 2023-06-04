using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
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

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
        public void HashAndStorePassword()
        {
            string password = "adminBD";  
            byte[] salt = GetSalt();
            string hashedPassword = HashPassword(password, salt);
            System.Diagnostics.Debug.WriteLine(hashedPassword);
        }


        private string HashPassword(string password, byte[] salt)
        {
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000))
            {
                byte[] hash = pbkdf2.GetBytes(20);
                byte[] hashBytes = new byte[36];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 20);
                return Convert.ToBase64String(hashBytes);
            }
        }

        private byte[] GetSalt()
        {
            byte[] salt = new byte[16];
            RandomNumberGenerator.Fill(salt);
            return salt;
        }


        (string, byte[]) GetHashedPasswordFromDB(string username)
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
                            string hashedPassword = reader["HashedPassword"] as string;
                            byte[] salt = (byte[])reader["Salt"];
                            return (hashedPassword, salt);
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

            (string hashedPasswordFromDB, byte[] salt) = GetHashedPasswordFromDB(username);
            string hashedPassword = HashPassword(password, salt);

            if (hashedPassword == hashedPasswordFromDB)
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


