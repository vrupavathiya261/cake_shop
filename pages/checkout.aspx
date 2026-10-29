<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="cake_shop.pages.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    CellPadding="8">

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
            <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
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
        Text="Place Order" />
</center>
    </form>
</body>
</html>
