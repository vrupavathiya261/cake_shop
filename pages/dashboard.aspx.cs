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
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                fillstats();
                fillrecentorders();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillstats()
        {
            getcon();

          
              

                // Total Orders
                cmd = new SqlCommand("SELECT COUNT(*) FROM order_tbl", con);
                lblOrders.Text = cmd.ExecuteScalar().ToString();

                // Total Cakes
                cmd = new SqlCommand("SELECT COUNT(*) FROM cakes_tbl", con);
                lblCakes.Text = cmd.ExecuteScalar().ToString();

                // Total Users
                cmd = new SqlCommand("SELECT COUNT(*) FROM cake_tbl", con);
                lblUsers.Text = cmd.ExecuteScalar().ToString();

                con.Close();
        }



        void fillrecentorders()
        {
            getcon();

            string query =
                "SELECT TOP 5 " +
                "order_Id AS OrderID, " +
                "[Full_Name] AS CustomerName, " +
                "order_date AS OrderDate, " +
                "grand_total AS Amount, " +
                "payment_method AS PaymentMethod, " +
                "[payment_status] AS Status " +
                "FROM order_tbl " +
                "ORDER BY order_Id DESC";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            gvOrders.DataSource = ds.Tables[0];
            gvOrders.DataBind();

            con.Close();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }
    }
}
