<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="cake_shop.pages.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard | Petal & Crumb</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #fff8fb;
            color: #44323c;
        }

        .header {
            width: 100%;
            min-height: 82px;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 5%;
            gap: 25px;
            border-bottom: 1px solid #f5e5ec;
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
            font-weight: 500;
            padding: 12px 15px;
            border-radius: 8px;
            white-space: nowrap;
            transition: 0.2s;
        }

        .navbar a:hover,
        .navbar a.active {
            color: #cf467b;
            background: #fff0f6;
        }

        .navbar a.logout {
            background: #d95788;
            color: white;
            padding: 12px 20px;
        }

        .navbar a.logout:hover {
            background: #bd3e70;
        }

        .container {
            width: 100%;
            max-width: 1450px;
            margin: auto;
            padding: 38px 5%;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .page-heading h1 {
            font-size: 29px;
            font-weight: 650;
            color: #44323c;
            margin-bottom: 8px;
        }

        .page-heading p {
            font-size: 14px;
            color: #96828e;
            line-height: 1.6;
        }

        .today {
            background: white;
            border: 1px solid #f1dce6;
            border-radius: 10px;
            padding: 13px 18px;
            color: #c74b7c;
            font-size: 13px;
            white-space: nowrap;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 20px;
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid #f1e3e9;
            border-radius: 13px;
            padding: 24px;
            min-width: 0;
            transition: box-shadow 0.2s, transform 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 24px rgba(190, 108, 143, 0.10);
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 22px;
        }

        .stat-title {
            font-size: 14px;
            color: #8c7884;
            font-weight: 500;
        }

        .stat-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            color: #cb4e80;
            background: #fff0f6;
            font-size: 22px;
            flex-shrink: 0;
        }

        .stat-number {
            font-size: 30px;
            line-height: 1.3;
            font-weight: 700;
            color: #493541;
            overflow-wrap: anywhere;
        }

        .stat-note {
            color: #a18d98;
            font-size: 12px;
            margin-top: 9px;
            line-height: 1.5;
        }

        .main-content {
            display: grid;
            grid-template-columns: minmax(0, 1.8fr) minmax(260px, 1fr);
            gap: 22px;
            margin-top: 28px;
        }

        .panel {
            background: #ffffff;
            border: 1px solid #f1e3e9;
            border-radius: 13px;
            padding: 24px;
            min-width: 0;
        }

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 22px;
        }

        .panel-header h2 {
            font-size: 19px;
            color: #493541;
            font-weight: 650;
        }

        .panel-header a {
            color: #cf467b;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            min-width: 500px;
        }

        .orders-table th {
            padding: 14px 12px;
            background: #fff5f9;
            color: #927b88;
            font-size: 12px;
            font-weight: 600;
            white-space: nowrap;
        }

        .orders-table td {
            padding: 17px 12px;
            font-size: 13px;
            color: #65515e;
            border-bottom: 1px solid #f5eaf0;
            white-space: nowrap;
        }

        .orders-table tr:last-child td {
            border-bottom: none;
        }

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .quick-action {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 15px;
            border: 1px solid #f2e3ea;
            border-radius: 10px;
            text-decoration: none;
            background: #ffffff;
            transition: 0.2s;
            min-width: 0;
        }

        .quick-action:hover {
            background: #fff5f9;
            border-color: #edc6d7;
        }

        .action-icon {
            width: 42px;
            height: 42px;
            border-radius: 9px;
            background: #fff0f6;
            color: #cf467b;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            flex-shrink: 0;
        }

        .action-info {
            flex: 1;
            min-width: 0;
        }

        .action-info h3 {
            color: #56414e;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .action-info p {
            color: #a18d98;
            font-size: 12px;
            line-height: 1.5;
        }

        .arrow {
            color: #ce608c;
            font-size: 21px;
            flex-shrink: 0;
        }

        .footer {
            background: #ffffff;
            border-top: 1px solid #f1e3e9;
            text-align: center;
            padding: 22px 15px;
            color: #a18d98;
            font-size: 12px;
        }

        @media (max-width: 1100px) {
            .header {
                align-items: flex-start;
                flex-direction: column;
            }

            .navbar {
                justify-content: flex-start;
                width: 100%;
            }

            .stats {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .main-content {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .header {
                padding: 20px;
            }

            .navbar {
                gap: 5px;
            }

            .navbar a {
                padding: 10px;
                font-size: 12px;
            }

            .container {
                padding: 25px 16px;
            }

            .page-heading {
                align-items: flex-start;
                flex-direction: column;
            }

            .page-heading h1 {
                font-size: 25px;
            }

            .stats {
                grid-template-columns: 1fr;
                gap: 14px;
            }

            .stat-card {
                padding: 21px;
            }

            .panel {
                padding: 17px;
            }

            .panel-header h2 {
                font-size: 17px;
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
            <a href="logout.aspx" class="logout">Logout</a>
        </nav>

    </header>

    <main class="container">

        <section class="page-heading">
            <div>
                <h1>Dashboard Overview</h1>
                <p>Welcome to Petal &amp; Crumb. Manage your bakery in one place.</p>
            </div>

            <div class="today">
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
        </section>

        <section class="stats">

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-title">Total Cakes</span>
                    <div class="stat-icon">&#127856;</div>
                </div>
                <div class="stat-number">
                    <asp:Label ID="lblCakes" runat="server" Text="0"></asp:Label>
                </div>
                <div class="stat-note">Cakes in your collection</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-title">Total Orders</span>
                    <div class="stat-icon">&#9635;</div>
                </div>
                <div class="stat-number">
                    <asp:Label ID="lblOrders" runat="server" Text="0"></asp:Label>
                </div>
                <div class="stat-note">Orders received by your shop</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-title">Total Users</span>
                    <div class="stat-icon">&#9823;</div>
                </div>
                <div class="stat-number">
                    <asp:Label ID="lblUsers" runat="server" Text="0"></asp:Label>
                </div>
                <div class="stat-note">Registered customers</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-title">Total Revenue</span>
                    <div class="stat-icon">&#8377;</div>
                </div>
                <div class="stat-number">
                    &#8377;<asp:Label ID="lblRevenue" runat="server" Text="0"></asp:Label>
                </div>
                <div class="stat-note">Total sales amount</div>
            </div>

        </section>

        <section class="main-content">

            <div class="panel">

                <div class="panel-header">
                    <h2>Recent Orders</h2>
                    <a href="manageorder.aspx">View All &rarr;</a>
                </div>

                <div class="table-wrapper">
                    <asp:GridView ID="gvOrders" runat="server"
                        CssClass="orders-table"
                        AutoGenerateColumns="False"
                        GridLines="None"
                        EmptyDataText="No orders available yet.">

                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="₹{0:N2}" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>

                    </asp:GridView>
                </div>

            </div>

            <div class="panel">

                <div class="panel-header">
                    <h2>Quick Actions</h2>
                </div>

                <div class="quick-actions">

                    <a href="addcake.aspx" class="quick-action">
                        <div class="action-icon">+</div>
                        <div class="action-info">
                            <h3>Add New Cake</h3>
                            <p>Add a new cake to your collection</p>
                        </div>
                        <span class="arrow">&rsaquo;</span>
                    </a>

                    <a href="manageorder.aspx" class="quick-action">
                        <div class="action-icon">&#9635;</div>
                        <div class="action-info">
                            <h3>Manage Orders</h3>
                            <p>View and update customer orders</p>
                        </div>
                        <span class="arrow">&rsaquo;</span>
                    </a>

                    <a href="manageuser.aspx" class="quick-action">
                        <div class="action-icon">&#9823;</div>
                        <div class="action-info">
                            <h3>Manage Users</h3>
                            <p>View registered customers</p>
                        </div>
                        <span class="arrow">&rsaquo;</span>
                    </a>

                    <a href="cake.aspx" class="quick-action">
                        <div class="action-icon">&#127856;</div>
                        <div class="action-info">
                            <h3>View All Cakes</h3>
                            <p>Explore your cake collection</p>
                        </div>
                        <span class="arrow">&rsaquo;</span>
                    </a>

                </div>

            </div>

        </section>

    </main>

    <footer class="footer">
        © 2026 Petal &amp; Crumb. All rights reserved.
    </footer>

    </form>
</body>
</html>
