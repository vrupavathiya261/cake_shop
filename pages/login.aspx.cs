using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace cake_shop.pages
{
    public partial class login : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            {
                {
                    getcon();
                }


            }

            void getcon()
            {
                con = new SqlConnection(s);
               
            }
            void Clear()
            {

                txtEmail.Text = "";
                txtPassword.Text = "";

            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtEmail.Text) &&
         !string.IsNullOrEmpty(txtPassword.Text))
            {
                con.Open();

                cmd = new SqlCommand(
                    "select Id from cake_tbl where [Email Address]='" +
                    txtEmail.Text + "' and Password='" +
                    txtPassword.Text + "'", con);

                object result = cmd.ExecuteScalar();

                con.Close();

                if (result != null)
                {
                    Session["uid"] = result.ToString();
                    Session["email"] = txtEmail.Text;

                    Response.Redirect("~/index.aspx");
                }
                else
                {
                    Response.Write("Invalid Email or Password");
                }
            }
            else
            {
                Response.Write("Please enter Email and Password");
            }
        }
    }
}
    
