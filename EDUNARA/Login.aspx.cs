using System;
using System.Data.SqlClient;
using WebGrease.Activities;

namespace EdunaraProject
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=edunara_db;Integrated Security=True";

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // Parameterized query is safer than mysqli_real_escape_string
                    string sql = "SELECT id, full_name FROM users WHERE email = @email AND password = @password";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Set Sessions (Mimicking PHP $_SESSION)
                        Session["user_id"] = reader["id"].ToString();
                        Session["user_name"] = reader["full_name"].ToString();

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        pnlError.Visible = true;
                        litError.Text = "Invalid email or password!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlError.Visible = true;
                litError.Text = "Database Error: " + ex.Message;
            }
        }
    }
}