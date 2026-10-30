<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageuser.aspx.cs" Inherits="cake_shop.pages.manageuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .modern-grid {
            height: 150px;
        }

<style type="text/css">
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #fff0f6, #ffe4ef, #fff7fb);
        color: #4a2636;
        min-height: 100vh;
    }

    /* ADMIN HEADER */
    .header {
        width: 100%;
        min-height: 82px;
        background: #ffffff;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 18px 5%;
        gap: 20px;
        border-bottom: 1px solid #f5e5ec;
        box-shadow: 0 4px 15px rgba(190, 24, 93, 0.08);
        position: relative;
        z-index: 100;
        flex-wrap: wrap;
    }

    .logo {
        color: #d95788;
        font-size: 25px;
        font-weight: 700;
        white-space: nowrap;
    }

    .logo span {
        color: #493440;
    }

    .navbar {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: 8px;
        flex-wrap: wrap;
    }

    .navbar a {
        text-decoration: none;
        color: #6c5964;
        font-size: 14px;
        font-weight: 600;
        padding: 11px 15px;
        border-radius: 8px;
        white-space: nowrap;
        transition: all 0.2s ease;
    }

    .navbar a:hover,
    .navbar a.active {
        color: #cf467b;
        background: #fff0f6;
    }

    .navbar a.logout {
        background: #d95788;
        color: #ffffff;
        padding: 11px 20px;
    }

    .navbar a.logout:hover {
        background: #bd3e70;
    }

    /* PAGE CONTENT */
    .page-container {
        width: 90%;
        max-width: 1200px;
        margin: 30px auto;
    }

    .content-header {
        background: linear-gradient(135deg, #ec4899, #db2777, #be185d);
        color: #ffffff;
        padding: 35px 40px;
        border-radius: 22px;
        margin-bottom: 30px;
        box-shadow: 0 12px 30px rgba(219, 39, 119, 0.22);
        position: relative;
        overflow: hidden;
    }

    .content-header::after {
        content: "♡";
        position: absolute;
        right: 35px;
        top: -25px;
        font-size: 150px;
        color: rgba(255, 255, 255, 0.13);
        pointer-events: none;
    }

    .content-header h1 {
        font-size: 30px;
        margin: 0 0 12px;
        font-weight: 700;
        letter-spacing: 0.3px;
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

    /* TABLE CARD */
    .table-card {
        width: 100%;
        background: rgba(255, 255, 255, 0.96);
        border-radius: 20px;
        padding: 28px;
        border: 1px solid #fce7f3;
        box-shadow: 0 10px 35px rgba(190, 24, 93, 0.10);
    }

    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 15px;
        padding-bottom: 22px;
        margin-bottom: 15px;
        border-bottom: 1px solid #fce7f3;
    }

    .table-header h2 {
        margin: 0;
        font-size: 22px;
        color: #9d174d;
        font-weight: 700;
    }

    .client-count {
        background: #fce7f3;
        color: #be185d;
        padding: 10px 18px;
        border-radius: 30px;
        font-size: 14px;
        font-weight: 600;
        border: 1px solid #fbcfe8;
    }

    .client-count span {
        font-weight: 800;
    }

    /* RESPONSIVE TABLE */
    .table-wrapper {
        width: 100%;
        overflow-x: auto;
        border-radius: 12px;
    }

    .modern-grid {
        width: 100%;
        height: auto;
        border-collapse: separate;
        border-spacing: 0;
        font-size: 14px;
        background: #ffffff;
    }

    .modern-grid th {
        background: linear-gradient(135deg, #fce7f3, #fbcfe8);
        color: #831843;
        padding: 16px 18px;
        text-align: left;
        font-size: 13px;
        font-weight: 700;
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
    }

    .modern-grid tr:last-child td {
        border-bottom: none;
    }

    .modern-grid tr:nth-child(even) td {
        background: #fff8fb;
    }

    .modern-grid tr:hover td {
        background: #fdf0f7;
        transition: background 0.2s ease;
    }

    .user-id-chip {
        display: inline-block;
        background: #fce7f3;
        color: #be185d;
        border: 1px solid #fbcfe8;
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: 700;
        font-size: 12px;
    }

    .modern-grid strong {
        color: #831843 !important;
        font-size: 14px;
    }

    /* DELETE BUTTON */
    .btn-delete {
        display: inline-block;
        text-decoration: none;
        background: #fff0f5;
        color: #be123c;
        border: 1px solid #fecdd3;
        border-radius: 8px;
        padding: 9px 16px;
        font-size: 13px;
        font-weight: 700;
        transition: all 0.25s ease;
        cursor: pointer;
    }

    .btn-delete:hover {
        background: linear-gradient(135deg, #e11d48, #be123c);
        color: #ffffff;
        border-color: #be123c;
        box-shadow: 0 5px 12px rgba(190, 18, 60, 0.20);
        transform: translateY(-2px);
    }

    /* TABLET AND MOBILE */
    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            align-items: flex-start;
            padding: 20px;
        }

        .navbar {
            width: 100%;
            justify-content: flex-start;
        }

        .navbar a {
            padding: 10px 12px;
        }

        .page-container {
            width: 94%;
            margin: 20px auto;
        }

        .content-header {
            padding: 25px 22px;
            border-radius: 16px;
        }

        .content-header h1 {
            font-size: 23px;
        }

        .content-header p {
            font-size: 13px;
        }

        .table-card {
            padding: 16px;
            border-radius: 16px;
        }

        .table-header h2 {
            font-size: 19px;
        }

        .modern-grid th,
        .modern-grid td {
            padding: 13px 14px;
        }
    }

    @media (max-width: 480px) {
        .logo {
            font-size: 21px;
        }

        .navbar {
            gap: 5px;
        }

        .navbar a {
            font-size: 12px;
            padding: 9px 10px;
        }

        .content-header h1 {
            font-size: 21px;
        }

        .table-card {
            padding: 12px;
        }
    }
    
/* Header width fix */
* {
    box-sizing: border-box;
}

html, body {
    width: 100%;
    max-width: 100%;
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

.header {
    width: 100%;
    max-width: 100%;
    margin: 0;
    padding: 15px 25px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 10px;
}

.logo {
    font-size: 22px;
    flex-shrink: 0;
}

.navbar {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-end;
    gap: 5px;
    max-width: 100%;
}

.navbar a {
    padding: 10px 12px;
    font-size: 13px;
}

/* Mobile screen */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        align-items: flex-start;
        padding: 15px;
    }

    .navbar {
        width: 100%;
        justify-content: flex-start;
    }

    .navbar a {
        white-space: normal;
        font-size: 12px;
        padding: 9px 10px;
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
                <h1>Registered Customer Directory</h1>
                <p>View registered clients, monitor profiles, and manage customer accounts</p>
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2>Client Accounts</h2>
                    <span class="client-count">
                        Total Clients: <asp:Label ID="lblUserCount" runat="server" Text="0"></asp:Label>
                    </span>
                </div>

                <div class="table-wrapper">
                    <asp:GridView ID="gvUsers" runat="server" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="Id"
                        CssClass="modern-grid" 
                        GridLines="None"
                        OnRowDeleting="gvUsers_RowDeleting" 
                        OnSelectedIndexChanged="gvUsers_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="User ID">
                                <ItemTemplate>
                                    <span class="user-id-chip">#<%# Eval("Id") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer Name">
                                <ItemTemplate>
                                    <strong style="color: var(--text-heading);"><%# Eval("Full Name") %></strong>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Email Address" HeaderText="Email Address" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" 
                                        CommandName="Delete" 
                                        CssClass="btn-delete"
                                        OnClientClick="return confirm('Are you sure you want to remove this customer account?');">
                                        Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </main>


    </form>
</body>
</html>
