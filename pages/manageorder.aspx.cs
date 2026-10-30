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
    public partial class manageorder : System.Web.UI.Page
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
                fillordergrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

     //   void fillordergrid()
     //   {
     //       getcon();

            

     //       string q = @"SELECT 
     //    o.order_Id AS Order_Id, 
     //    o.order_user_id AS Id, 
     //    p.cakename, 
     //    c.quantity AS Quantity, 
     //    (p.price * c.Quantity) AS grand_total,
     //    o.order_Date AS Added_Date, 
     //    o.grand_total AS Total, 
     //    o.payment_method, 
     //    o.payment_status
     //FROM order_tbl o
     //INNER JOIN cake_tbl u ON o.order_user_id = u.Id
     //LEFT JOIN Cart_tbl c ON o.order_user_id = c.Cart_User_Id
     //LEFT JOIN cakes_tbl p ON c.Cart_prod_Id = p.Id
     //GROUP BY
     //    o.order_Id,
     //    o.order_user_id,
     //    p.cakename,
     //    c.quantity,
     //    p.price,
     //    o.order_Date,
     //    o.grand_total,
     //    o.payment_method,
     //    o.payment_status
     //ORDER BY o.order_Date DESC, o.order_Id DESC"; 
     //       da = new SqlDataAdapter(q, con);

     //       ds = new DataSet();
     //       da.Fill(ds);

     //       GridView1.DataSource = ds;
     //       GridView1.DataBind();

     //       con.Close();
     //   }
     
void fillordergrid()
        {
            getcon();

            string q = @"SELECT 
        o.order_Id AS Order_Id, 
        o.order_user_id AS Id, 
        ISNULL(p.cakename, 'Cake') AS cakename, 
        ISNULL(c.quantity, 0) AS Quantity, 
        ISNULL(c.Total, 0) AS grand_total,
        o.order_Date AS Added_Date, 
        ISNULL(o.grand_total, 0) AS Total, 
        o.payment_method, 
        o.payment_status
    FROM order_tbl o
    INNER JOIN cake_tbl u ON o.order_user_id = u.Id
    LEFT JOIN Cart_tbl c ON o.order_user_id = c.Cart_User_Id
    LEFT JOIN cakes_tbl p ON c.Cart_prod_Id = p.Id
    ORDER BY o.order_Date DESC, o.order_Id DESC";

            da = new SqlDataAdapter(q, con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            con.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillordergrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillordergrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            Label lblOrderId = (Label)row.FindControl("Label1");
            DropDownList ddlStatus = (DropDownList)row.FindControl("DropDownList1");

            string orderId = "";

            if (lblOrderId != null)
            {
                orderId = lblOrderId.Text.Trim();
            }
            else if (GridView1.DataKeys.Count > 0 && GridView1.DataKeys[e.RowIndex].Value != null)
            {
                orderId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            }

            if (!string.IsNullOrEmpty(orderId) && ddlStatus != null)
            {
                string status = ddlStatus.SelectedValue;

                getcon();

                cmd = new SqlCommand("UPDATE order_tbl SET payment_status='" + status + "' WHERE order_id='" + orderId + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.EditIndex = -1;
            fillordergrid();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            int orderId = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];
            DropDownList ddlStatus = (DropDownList)row.FindControl("DropDownList1");
            string status = ddlStatus.SelectedValue;

            getcon();

            cmd = new SqlCommand("UPDATE order_tbl SET payment_status='" + status + "' WHERE order_id='" + orderId + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillordergrid();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }
    }
}
    
