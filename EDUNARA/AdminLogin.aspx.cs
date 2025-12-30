using System;
using System.Data.SqlClient;
using System.Web;
using WebGrease.Activities;

namespace EdunaraProject
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // Credentials matched to your PHP code
        private const string CorrectAdminId = "admin";
        private const string CorrectSecurityKey = "apu123";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear any previous error on fresh load
            if (!IsPostBack) { pnlError.Visible = false; }
        }

        protected void btnAuthenticate_Click(object sender, EventArgs e)
        {
            string inputId = txtAdminId.Text.Trim();
            string inputPass = txtAdminPass.Text.Trim();

            if (inputId == CorrectAdminId && inputPass == CorrectSecurityKey)
            {
                // Set Admin Session
                Session["admin_logged_in"] = true;
                Session["admin_name"] = "System Administrator";

                // Redirect to Admin Dashboard
                Response.Redirect("Admin.aspx");
            }
            else
            {
                // Show Error
                pnlError.Visible = true;
                litError.Text = "Access Denied: Invalid Admin ID or Security Key.";
            }
        }
    }
}