using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cake_shop.pages
{
    public partial class view : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCake();
            }
        }


        
        void GetCon()
        {
            string cs = ConfigurationManager
                .ConnectionStrings["dbcon"]
                .ConnectionString;

            con = new SqlConnection(cs);

        }




        void FillCake()
        {
            GetCon();

            con.Open();

            string id = Request.QueryString["id"];

            da = new SqlDataAdapter("select * from cakes_tbl where id=" + id, con);

            ds = new DataSet();
            da.Fill(ds);

            rptCake.DataSource = ds.Tables[0];
            rptCake.DataBind();

            con.Close();
        }
        protected void btnCart_Click(object sender, EventArgs e)
        {
            
            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            Button btn = (Button)sender;
            int cakeId = Convert.ToInt32(btn.CommandArgument);
            int userId = Convert.ToInt32(Session["uid"]);

            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            DropDownList ddl = (DropDownList)item.FindControl("ddlWeight");

            decimal weight = Convert.ToDecimal(ddl.SelectedValue);

            GetCon();
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT price FROM cakes_tbl WHERE id = " + cakeId, con);

            decimal price = Convert.ToDecimal(cmd.ExecuteScalar());
            decimal total = price * weight;

            cmd = new SqlCommand(
                "INSERT INTO Cart_tbl (Cart_Prod_Id, Cart_User_Id, Quantity, Weight, Total, Added_Date) VALUES (" +
                cakeId + "," + userId + ",1," + weight + "," + total + ",GETDATE())", con);

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("cart.aspx");
        }

        protected void rptCake_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}