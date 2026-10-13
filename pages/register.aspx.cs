using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.ComponentModel.DataAnnotations;


namespace cake_shop.pages
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            {
                getcon();
            }
           

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void Clear()
        {
            rname.Text = "";
            rphone.Text = "";
            remail.Text = "";
            rpass.Text = "";
            rpass2.Text = "";

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string email = remail.Text;
            string password = rpass.Text;

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                Label1.Text = "Welcome, " + email;
            }
            else
            {
                Label1.Text = "Please enter your email and password!";
            }

            if (btnRegister.Text == "Create Account")
            {
                getcon();

 cmd = new SqlCommand("Insert into cake_tbl([Full Name], [Phone Number], [email Address], [password], [Confirm password]) Values('"
+ rname.Text + "','"
+ rphone.Text + "','"
+ remail.Text + "','"
+ rpass.Text + "','"
+ rpass2.Text + "')", con);

                cmd.ExecuteNonQuery();

                Clear();

}

        }


    }
}