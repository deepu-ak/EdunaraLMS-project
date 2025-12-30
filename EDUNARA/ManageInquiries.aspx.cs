using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdunaraProject
{
    public partial class ManageInquiries : System.Web.UI.Page
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
                LoadInquiries();
            }
        }

        private void LoadInquiries()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    // Selecting name, email, message, and date
                    string query = "SELECT id, sender_name, sender_email, message, submitted_at FROM inquiries ORDER BY submitted_at DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvInquiries.DataSource = dt;
                    gvInquiries.DataBind();

                    // Show "No Data" label if table is empty
                    lblNoData.Visible = (dt.Rows.Count == 0);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void gvInquiries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int inquiryId = Convert.ToInt32(gvInquiries.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM inquiries WHERE id = @id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", inquiryId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadInquiries(); // Refresh the grid
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Failed to delete message: " + ex.Message + "');</script>");
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