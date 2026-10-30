using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cake_shop.pages
{
    public partial class adminlogin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();

                // Demo admin credentials
                if (username == "admin" && password == "admin123")
                {
                    Session["admin"] = username;

                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Username or Password!";
                }
            }
        }
    }
}








