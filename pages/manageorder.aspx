<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageorder.aspx.cs" Inherits="cake_shop.pages.manageorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <header class="admin-nav">
            <div class="brand-wrap">
                <a href="admindash.aspx" class="brand-logo">MyHome <span>Interiors</span></a>
                <span class="badge-admin">Admin Studio</span>
            </div>

            <nav class="nav-links">
                <a href="admindash.aspx">Dashboard</a>
                <a href="addproduct.aspx">Add Product</a>
                <a href="mange_order.aspx" class="active">Orders</a>
                <a href="manage_users.aspx">Customers</a>
                <a href="logout.aspx" class="btn-logout">Logout</a>
            </nav>
        </header>

        <main class="page-container">
            <div class="content-header">
                <h1>Orders Management</h1>
                <p>Track, manage, and update live client orders & fulfillment</p>
            </div>

            <div class="table-card">
                <div class="table-wrapper">
                    <asp:GridView ID="GridView1" runat="server" 
                        DataKeyNames="Order_Id"
                        AutoGenerateColumns="False" 
                        CssClass="modern-grid" 
                        GridLines="None"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowUpdating="GridView1_RowUpdating" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Order ID">
                                <ItemTemplate>
                                    <span class="order-id-chip">#<%# Eval("Order_Id") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Order Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Added_Date", "{0:dd MMM yyyy, hh:mm tt}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Amount">
                                <ItemTemplate>
                                    <span class="amount-text">₹<%# Eval("Total") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Payment Method">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("order_payment_method") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                        <asp:ListItem Value="Dispatched">Dispatched</asp:ListItem>
                                        <asp:ListItem Value="Paid">Paid</asp:ListItem>
                                        <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                        <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("order_payment_status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Actions" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </main>




    </form>
</body>
</html>
