<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="cake_shop.pages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="../css/style.css" />

</head>
<body>
    <form id="form1" runat="server">
        <header class="navbar">
    <div class="container nav-inner">

        <a href="../index.html" class="logo">
            <span class="logo-mark">🍰</span> Petal & Crumb
        </a>

        <nav class="nav-links">
            <a href="../index.aspx">Home</a>
            <a href="cake.aspx">Cakes</a>
            <a href="about.aspx">About</a>
            <a href="contact.aspx">Contact</a>
            <a href="Login.aspx" class="active">Login</a>
            <a href="register.aspx">Register</a>
        </nav>

        <div class="nav-actions">
            <a href="cart.aspx" class="icon-btn">
                🛍️
                <span class="cart-count">0</span>
            </a>

            <button type="button" class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>

    </div>
</header>


<section class="auth-wrap">

    <div class="container">

        <div class="auth-grid reveal in">

            <!-- LEFT SIDE -->

            <div class="auth-visual">

                <span class="eyebrow" style="color:#fff;">
                    Welcome back
                </span>

                <h2>
                    Good things<br />
                    come to those<br />
                    who bake.
                </h2>

                <p>
                    Log in to track your orders, save favourite cakes
                    and check out faster.
                </p>

                <img src="https://images.unsplash.com/photo-1621303837174-89787a7d4729?auto=format&fit=crop&w=500&q=80"
                     alt="Strawberry cream cake" />

            </div>


            <!-- RIGHT SIDE -->

            <div class="auth-form">

                <h2>Log In</h2>

                <p>
                    Enter your details to access your account.
                </p>


                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="form-success">
                </asp:Label>


                <div class="field">

                    <label>Email Address</label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        TextMode="Email"
                        placeholder="you@example.com">
                    </asp:TextBox>

                </div>


                <div class="field">

                    <label>Password</label>

                    <asp:TextBox ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        placeholder="••••••••">
                    </asp:TextBox>

                </div>


                <div class="checkbox-row"
                     style="justify-content:space-between;display:flex;">

                    <label style="display:flex;align-items:center;gap:8px;">

                        <asp:CheckBox ID="chkRemember"
                            runat="server" />

                        Remember me

                    </label>

                    <a href="#">Forgot password?</a>

                </div>


                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Log In"
                    CssClass="btn btn-primary btn-block"
                    OnClick="btnLogin_Click" />


                <div class="divider-or">
                    or continue with
                </div>


                <div class="social-login">

                    <button type="button">
                        🔍 Google
                    </button>

                    <button type="button">
                        📘 Facebook
                    </button>

                </div>


                <p class="auth-switch">

                    Don't have an account?

                    <a href="register.aspx">
                        Create one
                    </a>

                </p>

            </div>

        </div>

    </div>

</section>


<footer class="footer" style="margin-top:0;">

    <div class="container">

        <div class="footer-bottom"
             style="border-top:none;padding-top:0;">

            <span>
                © 2026 Petal & Crumb Bakery. All rights reserved.
            </span>

            <span>
                Made fresh daily, one layer at a time.
            </span>

        </div>

    </div>

</footer>


</form>

<script src="../js/script.js"></script>
    
</body>
</html>





