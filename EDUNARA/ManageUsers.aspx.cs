using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdunaraProject
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=edunara_db;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Security Check
            if (Session["admin_logged_in"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers(string search = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    string query = "SELECT id, full_name, email FROM users";
                    if (!string.IsNullOrEmpty(search))
                    {
                        query += " WHERE full_name LIKE @search OR email LIKE @search";
                    }
                    query += " ORDER BY id DESC";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();

                    if (dt.Rows.Count == 0)
                    {
                        lblMsg.Text = "No users found.";
                        lblMsg.ForeColor = System.Drawing.Color.Gray;
                    }
                    else
                    {
                        lblMsg.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers(txtSearch.Text.Trim());
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM users WHERE id = @id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", userId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadUsers(); // Refresh the grid
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Delete failed: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}