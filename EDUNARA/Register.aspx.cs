using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace EdunaraProject
{
    public partial class Register : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=edunara_db;Integrated Security=True";

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // 1. Check if email exists
                    string checkSql = "SELECT COUNT(*) FROM users WHERE email = @email";
                    SqlCommand checkCmd = new SqlCommand(checkSql, conn);
                    checkCmd.Parameters.AddWithValue("@email", email);
                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        ShowMessage("This email is already registered.", "error");
                    }
                    else
                    {
                        // 2. Insert new user
                        string insertSql = "INSERT INTO users (full_name, email, password) VALUES (@name, @email, @pass)";
                        SqlCommand insertCmd = new SqlCommand(insertSql, conn);
                        insertCmd.Parameters.AddWithValue("@name", name);
                        insertCmd.Parameters.AddWithValue("@email", email);
                        insertCmd.Parameters.AddWithValue("@pass", password); // Use hashing for production!

                        insertCmd.ExecuteNonQuery();
                        ShowMessage("Registration successful! <a href='Login.aspx'>Login here</a>", "success");
                        ClearForm();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Database error: " + ex.Message, "error");
            }
        }

        private void ShowMessage(string msg, string type)
        {
            string cssClass = (type == "success") ? "alert success" : "alert error";
            phMessage.Controls.Add(new LiteralControl($"<div class='{cssClass}'>{msg}</div>"));
        }

        private void ClearForm()
        {
            txtName.Text = txtEmail.Text = txtPassword.Text = txtConfirm.Text = "";
        }
    }
}