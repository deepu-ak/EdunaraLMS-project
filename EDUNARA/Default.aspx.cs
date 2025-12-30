using System;
using System.Web;
using System.Web.UI;

namespace EdunaraProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set the current year in footer
            litYear.Text = DateTime.Now.Year.ToString();

            // Check if User Session exists (same as your PHP logic)
            if (Session["user_name"] != null)
            {
                phLoggedIn.Visible = true;
                phLoggedOut.Visible = false;
                litUserName.Text = HttpUtility.HtmlEncode(Session["user_name"].ToString());
            }
            else
            {
                phLoggedIn.Visible = false;
                phLoggedOut.Visible = true;
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to home
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}