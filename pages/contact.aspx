<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="cake_shop.pages.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us — Petal & Crumb</title> 
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🍰</text></svg>"> 
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <form id="form1" runat="server">
       <header class="navbar">
  <div class="container nav-inner">
    <a href="../index.aspx" class="logo"><span class="logo-mark">🍰</span> Petal & Crumb</a>

    <nav class="nav-links">
      <a href="../index.aspx">Home</a>
      <a href="cake.aspx">Cakes</a>
      <a href="about.aspx">About</a>
      <a href="contact.aspx" class="active">Contact</a>
      <a href="login.aspx">Login</a>
      <a href="register.aspx">Register</a>
    </nav>

    <div class="nav-actions">
      <a href="cart.aspx" class="icon-btn" aria-label="View cart">🛍️<span class="cart-count">0</span></a>
      <button class="hamburger" aria-label="Toggle menu">
        <span></span><span></span><span></span>
      </button>
    </div>
  </div>
</header>

<section class="page-header">
  <div class="container">
    <span class="eyebrow">We'd love to hear from you</span>
    <h1>Get in Touch</h1>
    <p>Questions, custom orders or feedback — send us a message and we'll get back within 24 hours.</p>
    <div class="breadcrumb">
      <a href="../index.aspx">Home</a> / Contact
    </div>
  </div>
</section>

<div class="drip-divider">
  <svg viewBox="0 0 1440 100" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0,40 C120,10 240,70 360,40 C480,10 600,70 720,40 C840,10 960,70 1080,40 C1200,10 1320,70 1440,40 L1440,0 L0,0 Z" fill="var(--cream)"></path>
  </svg>
</div>

<section style="padding-top:10px;">
  <div class="container">

    <div class="contact-grid">

      <div class="contact-info-card reveal">
        <h3>Contact Information</h3>

        <div class="contact-row">
          <div class="ic">📍</div>
          <p>12 Bakers Lane, Rajkot, Gujarat, India 360001</p>
        </div>

        <div class="contact-row">
          <div class="ic">📞</div>
          <p>+91 98765 43210</p>
        </div>

        <div class="contact-row">
          <div class="ic">✉️</div>
          <p>hello@petalandcrumb.com</p>
        </div>

        <div class="contact-row">
          <div class="ic">🕐</div>
          <p>Monday – Sunday<br>8:00 AM – 9:00 PM</p>
        </div>

        <div class="social-row">
          <a href="#" aria-label="Facebook">📘</a>
          <a href="#" aria-label="Instagram">📷</a>
          <a href="#" aria-label="Twitter">🐦</a>
          <a href="#" aria-label="WhatsApp">💬</a>
        </div>
      </div>

      <div class="form-card reveal">

        <h3 style="margin-bottom:8px;">Send a Message</h3>

        <p style="color:#a3948a; margin-bottom:24px; font-size:.92rem;">
          Fill in the form below and our team will reach out shortly.
        </p>

        <div class="form-success">
          ✓ Your message has been sent successfully!
        </div>

        <form id="contactForm">

          <div class="field-row">

            <div class="field">
              <label for="cname">Full Name</label>
              <input type="text" id="cname" placeholder="Your name" required>
            </div>

            <div class="field">
              <label for="cemail">Email Address</label>
              <input type="email" id="cemail" placeholder="you@example.com" required>
            </div>

          </div>

          <div class="field">
            <label for="csubject">Subject</label>
            <input type="text" id="csubject" placeholder="What is this about?" required>
          </div>

          <div class="field">
            <label for="cmessage">Message</label>
            <textarea id="cmessage" placeholder="Tell us more..." required></textarea>
          </div>

          <button type="submit" class="btn btn-primary btn-block">
            Send Message ✉️
          </button>

        </form>

      </div>

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

<script src="../js/script.js"></script>
    </form>
</body>
</html>





