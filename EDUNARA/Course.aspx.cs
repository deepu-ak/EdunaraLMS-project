using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace EdunaraProject
{
    public partial class Course : System.Web.UI.Page
    {
        // DATABASE CONNECTION: Ensure Initial Catalog matches your DB name
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=edunara_db;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // REPAIR: Removed the login check so students can see courses immediately
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Matches your PHP logic: SELECT * FROM courses
                string query = "SELECT title, description FROM courses ORDER BY id DESC";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptCourses.DataSource = dt;
                        rptCourses.DataBind();
                        pnlNoData.Visible = false;
                    }
                    else
                    {
                        pnlNoData.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    // This will alert you if the database table 'courses' is missing
                    Response.Write("<script>alert('DB Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}