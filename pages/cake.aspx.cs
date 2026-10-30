

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cake_shop.pages
{
    public partial class cake : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s= ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillcake();
            }
        }

        void fillcake()
        {
            SqlConnection con = new SqlConnection(s);
            con.Open();

            string query = "select * from cakes_tbl";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataSet ds = new DataSet();

            da.Fill(ds);

            rptCakes.DataSource = ds.Tables[0];
            rptCakes.DataBind();

            con.Close();
        }

        protected void Category_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            string category = btn.CommandArgument;

            SqlConnection con = new SqlConnection(s);
            con.Open();

            string query = "select * from cakes_tbl where category='" + category + "'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataSet ds = new DataSet();

            da.Fill(ds);

            rptCakes.DataSource = ds.Tables[0];
            rptCakes.DataBind();

            con.Close();
        }

        protected void rptCakes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           

            if (e.CommandName == "AddToCart")
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("login.aspx");
                    return;
                }

                int cakeId = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(Session["uid"]);

                SqlConnection con = new SqlConnection(s);
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT price FROM cakes_tbl WHERE id=" + cakeId, con);

                decimal price = Convert.ToDecimal(cmd.ExecuteScalar());

              
cmd = new SqlCommand(
    "INSERT INTO Cart_tbl (Cart_Prod_Id, Cart_User_Id, Quantity, Total, Added_Date) VALUES ("
    + cakeId + ", " + userId + ", 1, " + price + ", GETDATE())", con);

            
                    
                cmd.ExecuteNonQuery();

                con.Close();

                Response.Redirect("cart.aspx");
            }


        }
    }
    }




