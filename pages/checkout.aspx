<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="cake_shop.pages.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #fff0f6, #ffe1ec, #fff8fb);
        color: #4a2535;
        padding: 30px 15px;
        min-height: 100vh;
    }

    #form1 {
        width: 100%;
        max-width: 1150px;
        margin: 0 auto;
        padding: 35px;
        background: #ffffff;
        border-radius: 20px;
        box-shadow: 0 10px 35px rgba(194, 24, 91, 0.13);
        border: 1px solid #f5d3df;
    }

    h2 {
        text-align: center;
        font-size: 32px;
        color: #c2185b;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #f8d8e4;
    }

    /* Order Details Table */
    #form1 > table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background: #ffffff;
        border: 1px solid #f1cbd9;
    }

    #form1 > table th {
        background: linear-gradient(135deg, #c2185b, #e75480);
        color: #ffffff;
        padding: 15px;
        text-align: left;
        font-size: 16px;
    }

    #form1 > table td {
        padding: 14px;
        border: 1px solid #f1d7e1;
        font-size: 14px;
        color: #593746;
        overflow-wrap: anywhere;
    }

    #form1 > table tr:nth-child(even) td {
        background: #fff5f8;
    }

    /* GridView Styling */
    #GridView1 {
        width: 90% !important;
        margin: 25px auto !important;
        border-collapse: collapse !important;
        background: #ffffff !important;
        border: 1px solid #f1cbd9 !important;
        color: #593746 !important;
    }

    #GridView1 th {
        background: linear-gradient(135deg, #c2185b, #e75480) !important;
        color: #ffffff !important;
        padding: 15px 10px !important;
        text-align: center !important;
        font-size: 14px !important;
        border: 1px solid #e9b2c7 !important;
        white-space: normal;
    }

    #GridView1 td {
        background: #ffffff !important;
        color: #593746 !important;
        padding: 12px 10px !important;
        text-align: center !important;
        vertical-align: middle !important;
        font-size: 14px !important;
        border: 1px solid #f1d7e1 !important;
    }

    #GridView1 tr:nth-child(even) td {
        background: #fff2f7 !important;
    }

    #GridView1 tr:hover td {
        background: #ffe8f1 !important;
    }

    #GridView1 img {
        width: 80px !important;
        height: 80px !important;
        object-fit: cover;
        border-radius: 10px;
        border: 2px solid #f3c5d6;
        padding: 2px;
    }

    /* Payment Radio Buttons */
    #RadioButtonList1 {
        width: auto !important;
        margin: 0 !important;
        border: none !important;
        background: transparent !important;
    }

    #RadioButtonList1 td {
        border: none !important;
        padding: 8px !important;
        background: transparent !important;
    }

    #RadioButtonList1 input {
        accent-color: #c2185b;
        cursor: pointer;
        margin-right: 6px;
    }

    #RadioButtonList1 label {
        color: #593746;
        cursor: pointer;
        font-size: 14px;
    }

    /* Total Amount */
    #lblSubTotal,
    #lblDeliveryCharge,
    #lblGrandTotal {
        color: #c2185b;
        font-weight: 700;
    }

    /* Place Order Button */
    #btnPlaceOrder {
        background: linear-gradient(135deg, #c2185b, #e75480);
        color: white;
        border: none;
        padding: 15px 45px;
        border-radius: 30px;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        box-shadow: 0 6px 18px rgba(194, 24, 91, 0.25);
        transition: all 0.3s ease;
        margin: 15px auto;
    }

    #btnPlaceOrder:hover {
        background: linear-gradient(135deg, #a3154d, #c2185b);
        transform: translateY(-3px);
        box-shadow: 0 9px 22px rgba(194, 24, 91, 0.35);
    }
#Button1 {
    position: fixed;
    bottom: 10px;
    left: 10px;
    padding: 4px 10px;
    font-size: 18px;
    background-color: #D85A7F;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
    /* Responsive Design */
    @media screen and (max-width: 768px) {
        body {
            padding: 10px;
        }

        #form1 {
            padding: 15px 8px;
        }

        h2 {
            font-size: 25px;
        }

        #form1 > table {
            width: 100%;
            table-layout: auto;
        }

        #form1 > table td {
            padding: 8px 5px;
            font-size: 12px;
        }

        #GridView1 {
            width: 100% !important;
            table-layout: auto;
        }

        #GridView1 th,
        #GridView1 td {
            padding: 7px 4px !important;
            font-size: 11px !important;
        }

        #GridView1 img {
            width: 50px !important;
            height: 50px !important;
        }

        #btnPlaceOrder {
            padding: 12px 30px;
            font-size: 14px;
        }
    }

    @media screen and (max-width: 480px) {
        h2 {
            font-size: 22px;
        }

        #GridView1 {
            display: block;
            overflow-x: auto;
        }
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <center>
    <h2>Order Confirmation</h2>
</center>

<table border="1" width="90%" align="center"
       cellpadding="8" cellspacing="0">

    <tr>
        <th colspan="4" align="left">Order Details</th>
    </tr>

    <tr>
        <td>Order No.</td>
        <td>
            <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
        </td>
        <td>Order Date</td>
        <td>
            <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td>Customer Name</td>
        <td colspan="3">
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td>Email</td>
        <td colspan="3">
            <asp:Label ID="lblEmail" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td>Mobile</td>
        <td colspan="3">
            <asp:Label ID="lblMobile" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td>Address</td>
        <td colspan="3">
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
        </td>
    </tr>

</table>
        
<br />


<asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    Width="90%"
    HorizontalAlign="Center"
    BorderWidth="1"
    CellPadding="8" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">

    <Columns>
<asp:TemplateField HeaderText="Cake Image">
    <ItemTemplate>
        <asp:Image ID="imgCake" runat="server"
            ImageUrl='<%# ResolveUrl("~/cakeimges/") + Eval("image") %>'
            Width="80px" Height="80px" />
    </ItemTemplate>
</asp:TemplateField>

        <asp:BoundField DataField="cakename"
            HeaderText="Cake Name" />

<asp:BoundField DataField="Weight" HeaderText="Weight (KG)" />

        <asp:BoundField DataField="price"
            HeaderText="Cake Price" />

        <asp:BoundField DataField="Quantity"
            HeaderText="Quantity" />

        <asp:BoundField DataField="Total"
            HeaderText="Total" />

    </Columns>

</asp:GridView>


<br />

<br />

<table border="1" width="90%" align="center"
       cellpadding="8" cellspacing="0">

    <tr>
        <td align="right">Sub Total :</td>
        <td width="20%">
            ₹ <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td align="right">Delivery Charge :</td>
        <td>
            ₹ <asp:Label ID="lblDeliveryCharge" runat="server"></asp:Label>
        </td>
    </tr>

    <tr>
        <td align="right"><b>Grand Total :</b></td>
        <td>
            <b>₹ <asp:Label ID="lblGrandTotal" runat="server"></asp:Label></b>
        </td>
    </tr>

    <tr>
        <td align="right">Payment Method :</td>
        <td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
    <asp:ListItem Text="Cash on Delivery (COD)" Value="COD" />
    <asp:ListItem Text="UPI Payment" Value="UPI" />
</asp:RadioButtonList>
        </td>
    </tr>

    <tr>
        <td align="right">Payment Status :</td>
        <td>
            <asp:Label ID="lblPaymentStatus" runat="server"></asp:Label>
        </td>
    </tr>

</table>

<br />

<center>
    <asp:Button ID="btnPlaceOrder" runat="server"
        Text="Place Order" OnClick="btnPlaceOrder_Click" />

<asp:Button ID="Button1" runat="server" Text="←"
    OnClick="Button1_Click" />
     
  
</center>
    </form>
</body>
</html>
