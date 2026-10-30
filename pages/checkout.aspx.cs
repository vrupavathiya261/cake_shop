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
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand Cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                getcon();

                string useremail = Session["email"].ToString();

                da = new SqlDataAdapter(
                    "SELECT * FROM cake_tbl WHERE [Email Address] = @Email", con);

                da.SelectCommand.Parameters.AddWithValue("@Email", useremail);

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblEmail.Text = ds.Tables[0].Rows[0]["Email Address"].ToString();
                    lblAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    lblName.Text = ds.Tables[0].Rows[0]["Full Name"].ToString();
                    lblMobile.Text = ds.Tables[0].Rows[0]["Phone Number"].ToString();
                    lblOrderDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    Fillordergrid();
                }

                con.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }


        //void Fillordergrid()
        //        {
        //            int uid = Convert.ToInt32(Session["uid"]);

        //da = new SqlDataAdapter(
        //    "SELECT p.cakename, p.price, p.image, c.Quantity, c.Weight, c.Total " +
        //    "FROM cakes_tbl p " +
        //    "INNER JOIN Cart_tbl c ON p.Id = c.Cart_Prod_Id " +
        //    "WHERE c.Cart_User_Id = " + Session["uid"], con);


        //            da.SelectCommand.Parameters.AddWithValue("@Id", Session["uid"]);


        //            ds = new DataSet();
        //            da.Fill(ds);

        //            GridView1.DataSource = ds.Tables[0];
        //            GridView1.DataBind();

        //            decimal total = 0;

        //            foreach (DataRow row in ds.Tables[0].Rows)
        //            {
        //                total += Convert.ToDecimal(row["Total"]);
        //            }

        //            lblSubTotal.Text = "₹" + total.ToString("0.00");
        //            lblDeliveryCharge.Text = "₹200.00";
        //            lblGrandTotal.Text = "₹" + (total + 200).ToString("0.00");
        //        }

        void Fillordergrid()
        {
            int uid = Convert.ToInt32(Session["uid"]);

            da = new SqlDataAdapter(
                "SELECT p.cakename, p.price, p.image, c.Quantity, c.Weight, c.Total " +
                "FROM cakes_tbl p " +
                "INNER JOIN Cart_tbl c ON p.Id = c.Cart_Prod_Id " +
                "WHERE c.Cart_User_Id = @Id", con);

            da.SelectCommand.Parameters.AddWithValue("@Id", uid);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            decimal total = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                total += Convert.ToDecimal(row["Total"]);
            }

            lblSubTotal.Text = "₹" + total.ToString("0.00");
            lblDeliveryCharge.Text = "₹200.00";
            lblGrandTotal.Text = "₹" + (total + 200).ToString("0.00");
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {



            getcon();

            lblPaymentStatus.Text = "pending";

            // Generate next order number
            int newOrderNo = Convert.ToInt32(
                new SqlCommand("SELECT ISNULL(MAX(order_no), 1000) + 1 FROM order_tbl", con)
                .ExecuteScalar());

            Cmd = new SqlCommand(
                "INSERT INTO order_tbl " +
                "(order_user_id, Full_Name, Email, mobile, address, order_date, sub_total, delivery_charge, grand_total, payment_method, payment_status, order_no) " +
                "VALUES ('" + Session["uid"] + "', '" +
                lblName.Text + "', '" +
                lblEmail.Text + "', '" +
                lblMobile.Text + "', '" +
                lblAddress.Text + "', GETDATE(), '" +
                lblSubTotal.Text.Replace("₹", "") + "', '200', '" +
                lblGrandTotal.Text.Replace("₹", "") + "', '" +
                RadioButtonList1.SelectedValue + "', '" +
                lblPaymentStatus.Text + "', " + newOrderNo + ")", con);

            Cmd.ExecuteNonQuery();

            // Show order number on checkout page
            lblOrderNo.Text = newOrderNo.ToString();

            con.Close();

            Response.Write("<script>alert('Order placed successfully');</script>");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cake.aspx");
        }
    }

    }
