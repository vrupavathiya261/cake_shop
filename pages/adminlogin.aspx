<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="cake_shop.pages.adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Admin Login | Petal & Crumb</title>
    <style>
    body {
        margin: 0;
        font-family: Arial;
        background: #fff4f8;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .login-box {
        width: 350px;
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 5px 20px #e5c5d3;
    }

    h2 {
        text-align: center;
        color: #d95788;
    }

    .field {
        width: 100%;
        padding: 11px;
        margin: 10px 0;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 6px;
    }

    .btn {
        width: 100%;
        padding: 12px;
        background: #d95788;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        margin-top: 12px;
    }

    .message {
        display: block;
        margin-top: 15px;
        text-align: center;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
          <div class="login-box">

      <h2>Admin Login</h2>

      <asp:TextBox ID="txtUsername" runat="server"
          CssClass="field"
          placeholder="Enter Username">
      </asp:TextBox>

      <asp:TextBox ID="txtPassword" runat="server"
          CssClass="field"
          TextMode="Password"
          placeholder="Enter Password" OnTextChanged="txtPassword_TextChanged">
      </asp:TextBox>

      <asp:Button ID="btnLogin" runat="server"
          Text="Login"
          CssClass="btn"
          OnClick="btnLogin_Click" />

      <asp:Label ID="lblMessage" runat="server"
          CssClass="message" ForeColor="Red">
      </asp:Label>

  </div>
    </form>
</body>
</html>




