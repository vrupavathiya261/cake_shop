using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace cake_shop.images
{
    public partial class addcake : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string fnm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void imageupload()
        {
            fnm = fuCakeImage.FileName;

            string path = Server.MapPath("~/cakeimges/" + fnm);
            fuCakeImage.SaveAs(path);
        }
        void clear()
        {
            txtCakeName.Text = "";
            txtDescription.Text = "";
            ddlCategory.ClearSelection();
            
        }


        protected void Page_Load(object sender, EventArgs e)
        {



           
            {
                getcon();
            }
        }


        protected void btnAddCake_Click(object sender, EventArgs e)
        { 
    
getcon();
        imageupload();

        cmd = new SqlCommand("INSERT INTO cakes_tbl(cakename, description, category, price, image) VALUES('" 
    + txtCakeName.Text + "', '" 
    + txtDescription.Text + "', '" 
    + ddlCategory.SelectedValue + "', '" 
    + TextBox1.Text + "', '" 
    + fnm + "')", con);

        cmd.ExecuteNonQuery();

con.Close();
clear();

        }

       
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}