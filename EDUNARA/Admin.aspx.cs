using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdunaraProject
{
    public partial class Admin : System.Web.UI.Page
    {
        // Connection string
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
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    // Select all courses to show in the GridView
                    string query = "SELECT id, title, description FROM courses ORDER BY id DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvCourses.DataSource = dt;
                    gvCourses.DataBind();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error loading data: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtDesc.Text))
            {
                lblMsg.Text = "Please fill in all fields.";
                lblMsg.ForeColor = System.Drawing.Color.Orange;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO courses (title, description) VALUES (@title, @desc)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@desc", txtDesc.Text.Trim());

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Course added successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;

                    // Clear inputs and refresh list
                    txtTitle.Text = "";
                    txtDesc.Text = "";
                    LoadCourses();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Database error: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void gvCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int courseId = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM courses WHERE id = @id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", courseId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadCourses(); // Refresh the grid
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error deleting: " + ex.Message + "');</script>");
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