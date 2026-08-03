<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="cake_shop.pages.register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register — Petal & Crumb</title>

    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍰</text></svg>" />
    <link rel="stylesheet" href="../css/style.css" />
</head>

<body>
<form id="form1" runat="server">

<header class="navbar">
  <div class="container nav-inner">
    <a href="../index.html" class="logo"><span class="logo-mark">🍰</span> Petal & Crumb</a>
    <nav class="nav-links">
      <a href="../index.html">Home</a>
      <a href="cakes.aspx">Cakes</a>
      <a href="about.aspx">About</a>
      <a href="contact.aspx">Contact</a>
      <a href="login.aspx">Login</a>
      <a href="register.aspx" class="active">Register</a>
    </nav>
    <div class="nav-actions">
      <a href="cart.aspx" class="icon-btn" aria-label="View cart">🛍️<span class="cart-count">0</span></a>
      <button type="button" class="hamburger" aria-label="Toggle menu"><span></span><span></span><span></span></button>
    </div>
  </div>
</header>

<section class="auth-wrap">
  <div class="container">
    <div class="auth-grid reveal in">
      <div class="auth-visual">
        <span class="eyebrow" style="color:#fff;">Join the bakery</span>
        <h2>Sweeten<br />every<br />celebration.</h2>
        <p>Create an account to save your favourite cakes and speed through checkout.</p>
        <img src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=500&q=80" alt="Chocolate truffle cake" />
      </div>

      <div class="auth-form">
        <h2>Create Account</h2>
        <p>It only takes a minute to get started.</p>

        <asp:Label ID="lblSuccess" runat="server" CssClass="form-success" Text="✓ Account created! Please log in." Visible="false"></asp:Label>

        <div class="field-row">
            <div class="field">
              <label>Full Name</label>
              <asp:TextBox ID="rname" runat="server" CssClass="input" placeholder="Your name" required></asp:TextBox>
            </div>

            <div class="field">
              <label>Phone Number</label>
              <asp:TextBox ID="rphone" runat="server" CssClass="input" placeholder="+91 00000 00000" required></asp:TextBox>
            </div>
        </div>

        <div class="field">
            <label>Email Address</label>
            <asp:TextBox ID="remail" runat="server" CssClass="input" TextMode="Email" placeholder="you@example.com" required></asp:TextBox>
        </div>

        <div class="field-row">
            <div class="field">
              <label>Password</label>
              <asp:TextBox ID="rpass" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            </div>

            <div class="field">
              <label>Confirm Password</label>
              <asp:TextBox ID="rpass2" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            </div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="checkbox-row">
            <asp:CheckBox ID="chkAgree" runat="server" />
            I agree to the <a href="#">Terms</a> & <a href="#">Privacy Policy</a>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Create Account"
            CssClass="btn btn-primary btn-block"
            OnClick="btnRegister_Click" />

        <p class="auth-switch">Already have an account? <a href="login.aspx">Log in</a></p>
      </div>
    </div>
  </div>
</section>

<footer class="footer" style="margin-top:0;">
  <div class="container">
    <div class="footer-bottom" style="border-top:none; padding-top:0;">
      <span>© 2026 Petal & Crumb Bakery. All rights reserved.</span>
      <span>Made fresh daily, one layer at a time.</span>
    </div>
  </div>
</footer>

</form>

<script src="../js/script.js"></script>
</body>
</html>