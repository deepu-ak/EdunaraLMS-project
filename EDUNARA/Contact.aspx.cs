using System;
using System.Data.SqlClient;

namespace EdunaraProject
{
    public partial class Contact : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=edunara_db;Integrated Security=True";

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO inquiries (sender_name, sender_email, message) VALUES (@name, @email, @msg)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@msg", txtMessage.Text.Trim());

                conn.Open();
                cmd.ExecuteNonQuery();
                lblStatus.Text = "Thank you! Your message has been sent.";

                txtName.Text = ""; txtEmail.Text = ""; txtMessage.Text = "";
            }
        }
    }
}