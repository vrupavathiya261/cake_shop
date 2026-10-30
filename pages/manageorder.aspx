<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageorder.aspx.cs" Inherits="cake_shop.pages.manageorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        

    * {
        box-sizing: border-box;
    }

    html, body {
        margin: 0;
        padding: 0;
        width: 100%;
        min-height: 100%;
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #fff0f6, #ffe4ef, #fff7fb);
        color: #4a2636;
        overflow-x: hidden;
    }

    /* HEADER */
    .header {
        width: 100%;
        min-height: 82px;
        padding: 18px 28px;
        background: #ffffff;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 15px;
        border-bottom: 1px solid #f5e5ec;
        box-shadow: 0 4px 15px rgba(190, 24, 93, 0.08);
        position: sticky;
        top: 0;
        z-index: 1000;
        flex-wrap: wrap;
    }

    .logo {
        color: #d95788;
        font-size: 25px;
        font-weight: 800;
        white-space: nowrap;
        flex-shrink: 0;
    }

    .logo span {
        color: #493440;
    }

    .navbar {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: 5px;
        flex-wrap: wrap;
    }

    .navbar a {
        display: inline-block;
        text-decoration: none;
        color: #6c5964;
        font-size: 13px;
        font-weight: 600;
        padding: 11px 14px;
        border-radius: 9px;
        white-space: nowrap;
        transition: 0.2s ease;
    }

    .navbar a:hover,
    .navbar a.active {
        color: #cf467b;
        background: #fff0f6;
    }

    /* PAGE CONTAINER */
    .page-container {
        width: 90%;
        max-width: 1320px;
        margin: 32px auto;
        min-height: 75vh;
    }

    /* PINK BANNER */
    .content-header {
        background: linear-gradient(110deg, #ed4096, #c31361);
        color: #ffffff;
        padding: 40px 44px;
        border-radius: 25px;
        margin-bottom: 32px;
        box-shadow: 0 12px 30px rgba(219, 39, 119, 0.20);
        position: relative;
        overflow: hidden;
    }

    .content-header::after {
        content: "\2661";
        position: absolute;
        right: 35px;
        top: 5px;
        font-size: 115px;
        line-height: 1.5;
        color: rgba(255, 255, 255, 0.15);
        pointer-events: none;
    }

    .content-header h1 {
        font-size: 34px;
        margin: 0 0 12px;
        font-weight: 800;
        letter-spacing: -0.5px;
        color: #ffffff;
        position: relative;
        z-index: 1;
    }

    .content-header p {
        margin: 0;
        font-size: 15px;
        line-height: 1.7;
        color: #fff0f7;
        position: relative;
        z-index: 1;
    }

    /* WHITE TABLE CARD */
    .table-card {
        width: 100%;
        background: rgba(255, 255, 255, 0.97);
        border-radius: 23px;
        padding: 28px;
        border: 1px solid #fce7f3;
        box-shadow: 0 10px 35px rgba(190, 24, 93, 0.10);
        overflow: hidden;
    }

    /* TABLE SCROLL */
    .table-wrapper {
        width: 100%;
        overflow-x: auto;
        border-radius: 12px;
    }

    /* ORDER TABLE */
    .modern-grid {
        width: 100%;
        min-width: 850px;
        border-collapse: separate;
        border-spacing: 0;
        font-size: 14px;
        background: #ffffff;
    }

    .modern-grid th {
        background: linear-gradient(135deg, #fce7f3, #fbcfe8);
        color: #831843;
        padding: 17px 18px;
        text-align: left;
        font-size: 12px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid #f9a8d4;
        white-space: nowrap;
    }

    .modern-grid td {
        padding: 17px 18px;
        color: #6b344e;
        border-bottom: 1px solid #fce7f3;
        vertical-align: middle;
        background: #ffffff;
    }

    .modern-grid tr:nth-child(even) td {
        background: #fff8fb;
    }

    .modern-grid tr:hover td {
        background: #fdf0f7;
        transition: background 0.2s ease;
    }

    .modern-grid tr:last-child td {
        border-bottom: none;
    }

    /* ORDER ID */
    .order-id-chip {
        display: inline-block;
        background: #fce7f3;
        color: #be185d;
        border: 1px solid #fbcfe8;
        padding: 7px 12px;
        border-radius: 9px;
        font-weight: 800;
        font-size: 12px;
        white-space: nowrap;
    }

    /* AMOUNT */
    .amount-text {
        color: #be185d;
        font-size: 14px;
        font-weight: 800;
        white-space: nowrap;
    }

    /* STATUS LABEL */
    .modern-grid td span.status,
    .modern-grid td .status-label {
        display: inline-block;
        padding: 7px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
    }

    /* STATUS DROPDOWN */
    .modern-grid select {
        min-width: 120px;
        max-width: 100%;
        padding: 9px 11px;
        background: #fff7fb;
        border: 1px solid #efbfd3;
        border-radius: 9px;
        color: #8d2856;
        font-size: 13px;
        outline: none;
        cursor: pointer;
    }

    .modern-grid select:focus {
        border-color: #d94783;
        box-shadow: 0 0 0 3px rgba(217, 71, 131, 0.10);
    }

    /* EDIT BUTTON */
    .modern-grid a {
        display: inline-block;
        text-decoration: none;
        background: #fff0f5;
        color: #be123c !important;
        border: 1px solid #fecdd3;
        border-radius: 9px;
        padding: 9px 15px;
        font-size: 12px;
        font-weight: 700;
        margin: 2px;
        transition: 0.2s ease;
        white-space: nowrap;
    }

    .modern-grid a:hover {
        background: linear-gradient(135deg, #e11d48, #be123c);
        color: #ffffff !important;
        border-color: #be123c;
        box-shadow: 0 4px 12px rgba(190, 18, 60, 0.18);
    }

    /* EMPTY TABLE */
    .modern-grid td[colspan] {
        text-align: center;
        padding: 30px;
        color: #b1849a;
    }

    /* TABLET */
    @media screen and (max-width: 1000px) {
        .header {
            padding: 15px 22px;
            gap: 12px;
        }

        .logo {
            font-size: 23px;
        }

        .navbar {
            justify-content: flex-start;
        }

        .navbar a {
            padding: 9px 11px;
            font-size: 12px;
        }

        .page-container {
            width: 94%;
            margin: 26px auto;
        }

        .content-header {
            padding: 30px;
        }

        .content-header h1 {
            font-size: 28px;
        }

        .table-card {
            padding: 20px;
        }
    }

    /* MOBILE */
    @media screen and (max-width: 600px) {
        .header {
            flex-direction: column;
            align-items: flex-start;
            padding: 15px 18px;
            gap: 10px;
        }

        .logo {
            font-size: 22px;
        }

        .navbar {
            width: 100%;
            justify-content: flex-start;
            gap: 4px;
        }

        .navbar a {
            font-size: 11px;
            padding: 8px 9px;
        }

        .page-container {
            width: 94%;
            margin: 22px auto;
        }

        .content-header {
            padding: 25px 20px;
            border-radius: 18px;
            margin-bottom: 22px;
        }

        .content-header::after {
            right: 8px;
            top: 5px;
            font-size: 75px;
        }

        .content-header h1 {
            font-size: 23px;
        }

        .content-header p {
            font-size: 12px;
        }

        .table-card {
            padding: 12px;
            border-radius: 17px;
        }

        .modern-grid th,
        .modern-grid td {
            padding: 13px 12px;
        }
    }
</style>

    
   
</head>
<body>
    <form id="form1" runat="server">
        
                   <header class="header">

        <div class="logo">Petal <span>&amp; Crumb</span></div>

        <nav class="navbar">
            <a href="dashboard.aspx" class="active">Dashboard</a>
            <a href="manageorder.aspx">Manage Order</a>
            <a href="manageuser.aspx">Manage User</a>
            <a href="addcake.aspx">Add Cake</a>
            
<asp:LinkButton ID="lnkLogout" runat="server"
    OnClick="lnkLogout_Click">
    Logout
</asp:LinkButton>

          
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
                                    <span class="order-id-chip">#<%# Eval("order_Id") %></span>
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
                                    <span class="amount-text">₹<%# Eval("grand_total") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Payment Method">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("payment_method") %>'></asp:Label>
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
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("payment_status") %>'></asp:Label>
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
