<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="cake_shop.pages.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart — Petal & Crumb</title>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍰</text></svg>"> 
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .cart-buttons {
    text-align: right;
    margin-top: 25px;
    margin-right: 100px;
    margin-bottom: 30px;
}

.continue-btn,
.checkout-btn {
    padding: 12px 28px;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-left: 10px;
    transition: 0.3s;
}

/* Continue Shopping */
.continue-btn {
    background-color: #ead8ca;
    color: #5a3825;
}

.continue-btn:hover {
    background-color: #d8bfae;
}

/* Checkout */
.checkout-btn {
    background-color: #d85b78;
    color: white;
}

.checkout-btn:hover {
    background-color: #bd4562;
}
    </style>
</head>

<body>
    <form id="form1" runat="server">
      <header class="navbar">
  <div class="container nav-inner">
    <a href="../index.aspx" class="logo">
      <span class="logo-mark">🍰</span> Petal & Crumb
    </a>

    <nav class="nav-links">
      <a href="../index.aspx">Home</a>
      <a href="/pages/cake.aspx">Cakes</a>
      <a href="about.aspx">About</a>
      <a href="contact.aspx">Contact</a>
      <a href="login.aspx">Login</a>
      <a href="register.aspx">Register</a>

    </nav>

    <div class="nav-actions">
      <a href="cart.aspx" class="icon-btn" aria-label="View cart">
        🛍️<span class="cart-count">0</span>
      </a>

      <button class="hamburger" aria-label="Toggle menu">
        <span></span><span></span><span></span>
      </button>
    </div>
  </div>
</header>

<section class="page-header">
  <div class="container">
    <span class="eyebrow">Almost there</span>
    <h1>Your Cart</h1>
    <p>Review your treats before checking out.</p>

    <div class="breadcrumb">
      <a href="../index.aspx">Home</a> / Cart
    </div>
  </div>
</section>

<div class="drip-divider">
  <svg viewBox="0 0 1440 100" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0,40 C120,10 240,70 360,40 C480,10 600,70 720,40 C840,10 960,70 1080,40 C1200,10 1320,70 1440,40 L1440,0 L0,0 Z" fill="var(--cream)"></path>
  </svg>
</div>

      

        <main class="container section">
  <span class="eyebrow">Step 1 of 3</span>

  <div id="cart-content"></div>
   <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    Width="100%"
    DataKeyNames="Cart_Id"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit" 
    OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">

<Columns>
<asp:TemplateField HeaderText="Product Image">
    <ItemTemplate>
        <asp:Image
            ID="Image1"
            runat="server"
            ImageUrl='<%# ResolveUrl("~/cakeimges/" + Eval("Product_Image")) %>'
            Width="100px"
            Height="100px"
            Style="object-fit:cover;" />
    </ItemTemplate>
</asp:TemplateField>

    <asp:BoundField DataField="Cart_Id" HeaderText="Cart ID" ReadOnly="True" />

    <asp:BoundField DataField="Cart_Prod_Id" HeaderText="Product ID" ReadOnly="True" />

    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" ReadOnly="True" />

    <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" />


   <asp:TemplateField HeaderText="Weight">

    <ItemTemplate>
        <%# Eval("Weight") %> Kg
    </ItemTemplate>

    <EditItemTemplate>
        <asp:DropDownList ID="ddlWeight" runat="server">
            <asp:ListItem Text="1 Kg" Value="1.00"></asp:ListItem>
            <asp:ListItem Text="1.5 Kg" Value="1.50"></asp:ListItem>
        </asp:DropDownList>
    </EditItemTemplate>

</asp:TemplateField>

    <asp:TemplateField HeaderText="Quantity">

        <ItemTemplate>
            <%# Eval("Quantity") %>
        </ItemTemplate>

        <EditItemTemplate>
            <asp:DropDownList ID="drpqnt" runat="server" SelectedValue='<%# Eval("Quantity") %>'>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                <asp:ListItem Text="5" Value="5"></asp:ListItem>

            </asp:DropDownList>
        </EditItemTemplate>

    </asp:TemplateField>

    <asp:CommandField HeaderText="Update_Quntity" ShowEditButton="True" />

    <asp:TemplateField HeaderText="Delete ">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="cmd_rmv" CommandArgument='<%# Eval("Cart_Id") %>'>Remove</asp:LinkButton>
        </ItemTemplate>
    </asp:TemplateField>

</Columns>
</asp:GridView>
    <br />
<div style="text-align:right; margin-top:20px; font-size:22px; font-weight:bold;">
    Total
    <asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label>
    <div class="cart-buttons">

    <asp:Button ID="btnContinueShopping"
        runat="server"
        Text="Continue Shopping"
        CssClass="continue-btn"
        PostBackUrl="~/pages/cake.aspx" OnClick="btnContinueShopping_Click1" />

    <asp:Button ID="btnCheckout"
        runat="server"
        Text="Checkout"
        CssClass="checkout-btn"
        PostBackUrl="~/pages/checkout.aspx" OnClick="btnCheckout_Click1" />

</div>
</div>
</main>
        
  


<footer class="footer">
  <div class="container">

    <div class="footer-grid">

      <div class="footer-about">

        <a href="../index.aspx" class="logo">
          <span class="logo-mark">🍰</span> Petal & Crumb
        </a>

        <p>
          A neighbourhood bakery crafting cakes and desserts with real ingredients and a lot of heart since 2013.
        </p>

        <div class="footer-social">
          <a href="#" aria-label="Facebook">📘</a>
          <a href="#" aria-label="Instagram">📷</a>
          <a href="#" aria-label="Twitter">🐦</a>
        </div>

      </div>

      <div>
        <h4>Explore</h4>

        <ul class="footer-links">
          <li><a href="../index.aspx">Home</a></li>
          <li><a href="cake.aspx">Cakes</a></li>
          <li><a href="about.aspx">About Us</a></li>
          <li><a href="contact.aspx">Contact</a></li>
        </ul>
      </div>

      <div>
        <h4>Account</h4>

        <ul class="footer-links">
          <li><a href="login.aspx">Login</a></li>
          <li><a href="register.aspx">Register</a></li>
          <li><a href="cart.aspx">My Cart</a></li>
        </ul>
      </div>

      <div>
        <h4>Visit Us</h4>

        <ul class="footer-links">
          <li>📍 12 Bakers Lane, Rajkot, Gujarat</li>
          <li>📞 +91 98765 43210</li>
          <li>✉️ hello@petalandcrumb.com</li>
          <li>🕐 Mon–Sun · 8am – 9pm</li>
        </ul>
      </div>

    </div>

    <div class="footer-bottom">
      <span>© 2026 Petal & Crumb Bakery. All rights reserved.</span>
      <span>Made fresh daily, one layer at a time.</span>
    </div>

  </div>
</footer>

<script src="../js/script.js"></script>
    </form>
</body>
</html>




