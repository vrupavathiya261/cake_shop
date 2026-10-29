using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cake_shop.pages
{
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            ViewState["uid"] = Session["uid"];

            getcon();

            if (!IsPostBack)
            {
                fillcartgrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        void fillcartgrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select c.Cart_Id, c.Cart_Prod_Id, " +
                "p.image as Product_Image, " +
                "p.cakename as Product_Name, " +
                "c.Total as Price, " +
                "c.Quantity, c.Weight, c.Total, c.Added_Date " +
                "from cakes_tbl p " +
                "inner join Cart_tbl c " +
                "on p.Id = c.Cart_Prod_Id " +
                "where c.Cart_User_Id = " + Session["uid"], con);

            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            decimal total = 0;

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                decimal price = Convert.ToDecimal(dr["Price"]);
                int quantity = Convert.ToInt32(dr["Quantity"]);

                total = total + (price * quantity);
            }

            lblTotal.Text = "Amount is ₹: " + total.ToString("0.00");

            con.Close();
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            DropDownList drpqnt = (DropDownList)row.FindControl("drpqnt");
            DropDownList ddlWeight = (DropDownList)row.FindControl("ddlWeight");

            int qty = Convert.ToInt32(drpqnt.SelectedValue);
            decimal weight = Convert.ToDecimal(ddlWeight.SelectedValue);

            getcon();

            cmd = new SqlCommand(
                "select p.price from cakes_tbl p " +
                "inner join Cart_tbl c on p.Id = c.Cart_Prod_Id " +
                "where c.Cart_Id=" + cartId, con);

            decimal basePrice = Convert.ToDecimal(cmd.ExecuteScalar());

            decimal total = basePrice * weight * qty;

            cmd = new SqlCommand(
                "update Cart_tbl set " +
                "Weight=" + weight +
                ", Quantity=" + qty +
                ", Total=" + total +
                " where Cart_Id=" + cartId +
                " AND Cart_User_Id=" + ViewState["uid"], con);

            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            fillcartgrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillcartgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_rmv")
            {
                int cartId = Convert.ToInt16(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("delete from Cart_tbl where Cart_Id=" + cartId + " AND Cart_User_Id=" + ViewState["uid"], con);
                cmd.ExecuteNonQuery();
                fillcartgrid();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillcartgrid();

        }

        protected void btnContinueShopping_Click1(object sender, EventArgs e)
        {
            Response.Redirect("cake.aspx");
        }

        protected void btnCheckout_Click1(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }
    }
}











