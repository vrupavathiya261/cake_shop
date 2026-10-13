<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cake.aspx.cs" Inherits="cake_shop.pages.cake" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Cakes — Petal & Crumb</title> 
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍰</text></svg>">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/style.css") %>" />
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
      <a href="cake.aspx" class="active">Cakes</a>
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

    <span class="eyebrow">The full menu</span>

    <h1>Our Cakes</h1>

    <p>
      Every cake is baked fresh to order. Browse by category and add your favourites to the cart.
    </p>

    <div class="breadcrumb">
      <a href="../index.aspx">Home</a> / Cakes
    </div>

  </div>
</section>

<div class="drip-divider">
  <svg viewBox="0 0 1440 100" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0,40 C120,10 240,70 360,40 C480,10 600,70 720,40 C840,10 960,70 1080,40 C1200,10 1320,70 1440,40 L1440,0 L0,0 Z" fill="var(--cream)"></path>
  </svg>
</div>

<section style="padding-top:20px;">
    <div class="container">

        <div class="filter-bar">

            <asp:Button ID="btnAll"
                runat="server"
                Text="All"
                CssClass="filter-btn active"
                CommandArgument="All"
                OnClick="Category_Click" />

            <asp:Button ID="btnBabyshower"
                runat="server"
                Text="Babyshower"
                CssClass="filter-btn"
                CommandArgument="Babyshower"
                OnClick="Category_Click" />

            <asp:Button ID="btnCupcakes"
                runat="server"
                Text="Cupcakes"
                CssClass="filter-btn"
                CommandArgument="Cupcakes"
                OnClick="Category_Click" />

            <asp:Button ID="btnBirthday"
                runat="server"
                Text="Birthday"
                CssClass="filter-btn"
                CommandArgument="Birthday"
                OnClick="Category_Click" />

            <asp:Button ID="btnWedding"
                runat="server"
                Text="Wedding"
                CssClass="filter-btn"
                CommandArgument="Wedding"
                OnClick="Category_Click" />

            <asp:Button ID="btnCheesecake"
                runat="server"
                Text="Cheesecake"
                CssClass="filter-btn"
                CommandArgument="Cheesecake"
                OnClick="Category_Click" />

        </div>

    </div>
</section>
<!--<div class="cake-grid" id="cakeGrid">-->
 
    <!-- CAKE CARD CSS + HTML -->
<style>

```css
/* CAKE SECTION */
.cake-section {
    width: 100%;
    margin: 0;
    padding: 10px 0 20px;
    box-sizing: border-box;
}

/* CATEGORY FILTER */
.filter-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    margin: 0 0 20px;
    padding: 0;
}

.filter-btn {
    padding: 10px 25px;
    border: 2px solid #ffc4d3;
    border-radius: 30px;
    background: #f5f0f0;
    color: #663d2b;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.filter-btn.active,
.filter-btn:hover {
    background: #d62f68;
    color: white;
    border-color: #d62f68;
}

/* CAKE GRID */
.cake-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 25px;
    width: 100%;
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 15px;
    box-sizing: border-box;
    align-items: stretch;
}

/* CAKE CARD */
.cake-card {
    width: 100%;
    min-width: 0;
    height: auto;
    display: flex;
    flex-direction: column;
    background: white;
    border-radius: 24px;
    overflow: hidden;
    box-sizing: border-box;
    box-shadow: 0 6px 20px rgba(90, 50, 30, 0.12);
}

/* BIG CAKE IMAGE */
.cake-card .image-box {
    width: 100%;
    height: 450px;
    flex-shrink: 0;
    margin: 0;
    padding: 0;
    overflow: hidden;
}

.cake-card .image-box img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}

/* CATEGORY */
.cake-card .category {
    display: block;
    margin: 7px 20px 2px;
    padding: 6px 12px;
    background: #fff0f3;
    color: #d62f68;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

/* CAKE NAME */
.cake-card h2 {
    margin: 4px 20px;
    color: #663d2b;
    font-family: Georgia, serif;
    font-size: 22px;
    line-height: 1.15;
}

/* DESCRIPTION */
.cake-card p {
    margin: 3px 20px;
    color: #9b8a82;
    font-size: 14px;
    line-height: 1.3;
    min-height: 0;
}

/* WEIGHT */
.weight-box {
    display: flex;
    align-items: center;
    gap: 5px;
    margin: 5px 20px;
    font-weight: bold;
}

.weight {
    margin: 0;
    padding: 3px 8px;
    color: #d62f68;
    background: white;
    border: 1px solid #d62f68;
    border-radius: 15px;
    cursor: pointer;
}

/* PRICE */
.cake-card .price {
    margin: 5px 20px;
    color: #d62f68;
    font-size: 22px;
    font-weight: bold;
}

/* ADD TO CART */
.cake-card .cart-btn {
    width: calc(100% - 40px);
    min-height: 42px;
    flex-shrink: 0;
    margin: 5px 20px 8px;
    padding: 8px;
    background: #663d2b;
    color: white;
    border: none;
    border-radius: 25px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
}

/* VIEW DETAILS */
.cake-card .view {
    display: flex;
    align-items: center;
    justify-content: center;
    width: calc(100% - 40px);
    min-height: 42px;
    flex-shrink: 0;
    box-sizing: border-box;
    margin: 0 20px 12px;
    padding: 8px;
    background: #663d2b;
    color: white !important;
    border: none;
    border-radius: 25px;
    font-size: 15px;
    font-weight: bold;
    text-decoration: none !important;
    cursor: pointer;
    transition: 0.3s;
}

.cake-card .cart-btn:hover,
.cake-card .view:hover {
    background: #4f2d20;
}

/* TABLET */
@media (max-width: 900px) {
    .cake-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 20px;
    }

    .cake-card .image-box {
        height: 380px;
    }
}

/* MOBILE */
@media (max-width: 600px) {
    .cake-grid {
        grid-template-columns: 1fr;
        gap: 20px;
        padding: 0 10px;
    }

    .cake-card .image-box {
        height: 450px;
    }

    .filter-bar {
        gap: 8px;
        margin-bottom: 15px;
    }

    .filter-btn {
        padding: 9px 16px;
        font-size: 14px;
    }
}
```

</style>

<!-- CAKE CARDS -->
<div class="cake-list">

    <div class="cake-grid">

        <asp:Repeater ID="rptCakes"
            runat="server" OnItemCommand="rptCakes_ItemCommand"
         >

            <ItemTemplate>

                <!-- ONE CAKE CARD -->
                <div class="cake-card">

                    <!-- IMAGE -->
                    <div class="image-box">

                        <img src='<%# ResolveUrl("~/cakeimges/" + Eval("image")) %>'
                             alt='<%# Eval("cakename") %>' />

                    </div>


                    <!-- CATEGORY -->
                    <span class="category">
                        <%# Eval("Category") %>
                    </span>


                    <!-- CAKE NAME -->
                    <h2>
                        <%# Eval("CakeName") %>
                    </h2>

                    <!-- DESCRIPTION -->
                    <p>
                        <%# Eval("Description") %>
                    </p>

                    
                    <div class="weight-box">
    <label>Weight:</label>

    <asp:DropDownList ID="ddlWeight" runat="server" CssClass="weight">
        <asp:ListItem Text="1 KG" Value="1"></asp:ListItem>
        <asp:ListItem Text="1.5 KG" Value="1.5"></asp:ListItem>
    </asp:DropDownList>
</div>
                    <!-- PRICE -->
                   <div class="price" data-price="<%# Eval("Price") %>">
    ₹<%# Eval("Price") %>
</div>


                    <!-- ADD TO CART -->
    <asp:Button
    ID="btnCart"
    runat="server"
    Text="🧁 Add to Cart"
    CssClass="cart-btn"
    CommandName="AddToCart"
    CommandArgument='<%# Eval("Id") %>' />

        <asp:HyperLink
    ID="btnView"
    runat="server"
    Text="🧁 View Details"
    CssClass="view"
    NavigateUrl='<%# "view.aspx?id=" + Eval("Id") %>'>
</asp:HyperLink>



                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>







  </div>
</section>

<section style="padding-top:0;">
  <div class="container">

    <div class="cta-banner reveal">

      <div>
        <h2>Can't find what you're craving?an't find what you're craving?d what you're craving?</h2>

        <p>
          We take custom orders for any flavour, size or design — just tell us what you have in mind.
        </p>
      </div>

      <a href="contact.aspx" class="btn btn-primary">
        Request a Custom Cake
      </a>

    </div>

  </div>
</section>

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
          <li><a href="cakes.aspx">Cakes</a></li>
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
<script>
    document.querySelectorAll(".weight").forEach(function (weight) {

        weight.addEventListener("change", function () {

            var priceBox = this.closest(".cake-card").querySelector(".price");

            var price = parseFloat(priceBox.getAttribute("data-price"));

            var kg = parseFloat(this.value);

            priceBox.innerHTML = "₹" + (price * kg);
        });

    });
</script>
    </form>

</body>
</html>




