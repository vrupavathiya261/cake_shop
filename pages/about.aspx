<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="cake_shop.pages.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>About Us — Petal & Crumb</title> 
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍰</text></svg>">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <!-- ===================== NAVBAR ===================== -->

<header class="navbar">

  <div class="container nav-inner">

    <a href="../index.aspx" class="logo">
        <span class="logo-mark">🍰</span> Petal & Crumb
    </a>

    <nav class="nav-links">

      <a href="../index.aspx">
          Home
      </a>

      <a href="cakes.aspx">
          Cakes
      </a>

      <a href="about.aspx" class="active">
          About
      </a>

      <a href="contact.aspx">
          Contact
      </a>

      <a href="login.aspx">
          Login
      </a>

      <a href="register.aspx">
          Register
      </a>

    </nav>

    <div class="nav-actions">

      <a href="cart.aspx"
         class="icon-btn"
         aria-label="View cart">

          🛍️

          <span class="cart-count">0</span>

      </a>

      <button type="button"
              class="hamburger"
              aria-label="Toggle menu">

          <span></span>
          <span></span>
          <span></span>

      </button>

    </div>

  </div>

</header>


<!-- ===================== PAGE HEADER ===================== -->

<section class="page-header">

  <div class="container">

    <span class="eyebrow">
        Our story
    </span>

    <h1>
        About Petal & Crumb
    </h1>

    <p>
        From a tiny home kitchen to your favourite neighbourhood bakery.
    </p>

    <div class="breadcrumb">

        <a href="../index.aspx">
            Home
        </a>

        / About

    </div>

  </div>

</section>


<!-- ===================== DRIP DIVIDER ===================== -->

<div class="drip-divider">

  <svg viewBox="0 0 1440 100"
       preserveAspectRatio="none"
       xmlns="http://www.w3.org/2000/svg">

    <path
      d="M0,40 C120,10 240,70 360,40 C480,10 600,70 720,40 C840,10 960,70 1080,40 C1200,10 1320,70 1440,40 L1440,0 L0,0 Z"
      fill="var(--cream)">
    </path>

  </svg>

</div>


<!-- ===================== ABOUT ===================== -->

<section style="padding-top:10px;">

  <div class="container">

    <div class="about-hero">

     


<asp:Image ID="Image1" runat="server"
    ImageUrl="~/images/mycake.jpg"
    Width="800px"
    Height="450px" />


      <div class="reveal">

        <span class="eyebrow">
            Since 2013
        </span>

        <h2>
            Every cake starts with a good story
        </h2>

        <p style="color:#7a6a62; margin:16px 0;">

            Petal & Crumb began in a small home kitchen where our founder,
            Meera, baked cakes for friends and family every weekend.
            Word spread quickly — soon neighbours were placing orders,
            and what started as a hobby became a full-time passion.

        </p>

        <p style="color:#7a6a62; margin-bottom:24px;">

            Today we're a small team of bakers and decorators who still
            measure every cup of flour by hand and pipe every rose one petal
            at a time. No shortcuts, no preservatives — just honest,
            from-scratch baking.

        </p>

        <a href="cakes.aspx"
           class="btn btn-primary">

            Explore Our Cakes

        </a>

      </div>

    </div>


    <!-- ===================== VALUES ===================== -->

    <div class="section-head reveal"
         style="margin-top:90px;">

      <span class="eyebrow">
          What we stand for
      </span>

      <h2>
          Our Values
      </h2>

    </div>


    <div class="about-values">


      <div class="value-card reveal">

        <div class="feature-icon">
            🌱
        </div>

        <h4>
            Real Ingredients
        </h4>

        <p>
            Farm-fresh eggs, real butter and cream —
            never artificial substitutes.
        </p>

      </div>


      <div class="value-card reveal">

        <div class="feature-icon">
            ✋
        </div>

        <h4>
            Handcrafted Always
        </h4>

        <p>
            Every layer, swirl and sugar flower is shaped by hand,
            never machine-made.
        </p>

      </div>


      <div class="value-card reveal">

        <div class="feature-icon">
            🤍
        </div>

        <h4>
            Baked with Care
        </h4>

        <p>
            We treat every order like it's for our own family's celebration.
        </p>

      </div>


    </div>


    <!-- ===================== TEAM ===================== -->

    <div class="section-head reveal"
         style="margin-top:90px;">

      <span class="eyebrow">
          The people behind the icing
      </span>

      <h2>
          Meet Our Bakers
      </h2>

    </div>


    <div class="team-grid">


      <div class="team-card reveal">

        <img
          src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?auto=format&fit=crop&w=300&q=80"
          alt="Meera, founder and head baker">

        <h4>
            Meera Shah
        </h4>

        <span>
            Founder & Head Baker
        </span>

      </div>


      <div class="team-card reveal">

        <img
          src="https://images.unsplash.com/photo-1583394293214-28ded15ee548?auto=format&fit=crop&w=300&q=80"
          alt="Arjun, pastry chef">

        <h4>
            Arjun Rao
        </h4>

        <span>
            Pastry Chef
        </span>

      </div>


      <div class="team-card reveal">

        <img
          src="https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=300&q=80"
          alt="Divya, cake decorator">

        <h4>
            Divya Nair
        </h4>

        <span>
            Cake Decorator
        </span>

      </div>


    </div>

  </div>

</section>


<!-- ===================== CTA ===================== -->

<section style="padding-top:0;">

  <div class="container">

    <div class="cta-banner reveal">

      <div>

        <h2>
            Ready to taste the difference?
        </h2>

        <p>
            Order your first cake today and see why our customers
            keep coming back.
        </p>

      </div>

      <a href="cakes.aspx"
         class="btn btn-primary">

          Order Now

      </a>

    </div>

  </div>

</section>


<!-- ===================== FOOTER ===================== -->

<footer class="footer">

  <div class="container">

    <div class="footer-grid">


      <!-- ABOUT -->

      <div class="footer-about">

        <a href="../index.aspx"
           class="logo">

          <span class="logo-mark">
              🍰
          </span>

          Petal & Crumb

        </a>

        <p>
            A neighbourhood bakery crafting cakes and desserts
            with real ingredients and a lot of heart since 2013.
        </p>

        <div class="footer-social">

          <a href="#" aria-label="Facebook">
              📘
          </a>

          <a href="#" aria-label="Instagram">
              📷
          </a>

          <a href="#" aria-label="Twitter">
              🐦
          </a>

        </div>

      </div>


      <!-- EXPLORE -->

      <div>

        <h4>
            Explore
        </h4>

        <ul class="footer-links">

          <li>
            <a href="../index.aspx">
                Home
            </a>
          </li>

          <li>
            <a href="cakes.aspx">
                Cakes
            </a>
          </li>

          <li>
            <a href="about.aspx">
                About Us
            </a>
          </li>

          <li>
            <a href="contact.aspx">
                Contact
            </a>
          </li>

        </ul>

      </div>


      <!-- ACCOUNT -->

      <div>

        <h4>
            Account
        </h4>

        <ul class="footer-links">

          <li>
            <a href="login.aspx">
                Login
            </a>
          </li>

          <li>
            <a href="register.aspx">
                Register
            </a>
          </li>

          <li>
            <a href="cart.aspx">
                My Cart
            </a>
          </li>

        </ul>

      </div>


      <!-- VISIT US -->

      <div>

        <h4>
            Visit Us
        </h4>

        <ul class="footer-links">

          <li>
              📍 12 Bakers Lane, Rajkot, Gujarat
          </li>

          <li>
              📞 +91 98765 43210
          </li>

          <li>
              ✉️ hello@petalandcrumb.com
          </li>

          <li>
              🕐 Mon–Sun · 8am – 9pm
          </li>

        </ul>

      </div>


    </div>


    <div class="footer-bottom">

      <span>
          © 2026 Petal & Crumb Bakery. All rights reserved.
      </span>

      <span>
          Made fresh daily, one layer at a time.
      </span>

    </div>

  </div>

</footer>


<!-- ===================== JAVASCRIPT ===================== -->

<script src="../js/script.js"></script>


       
    </form>
</body>
</html>







