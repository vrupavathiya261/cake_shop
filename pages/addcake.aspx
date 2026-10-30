<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addcake.aspx.cs" Inherits="cake_shop.images.addcake" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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

/* Header */
.header {
    width: 100%;
    background: #ffffff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 5%;
    box-shadow: 0 4px 15px rgba(190, 24, 93, 0.08);
    border-bottom: 1px solid #f5e5ec;
    flex-wrap: wrap;
    gap: 15px;
}

.logo {
    color: #d95788;
    font-size: 25px;
    font-weight: 700;
}

.logo span {
    color: #493440;
}

.navbar {
    display: flex;
    align-items: center;
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
    transition: 0.3s;
}

.navbar a:hover,
.navbar a.active {
    color: #cf467b;
    background: #fff0f6;
}

.navbar a.logout {
    background: #d95788;
    color: white;
}

/* Add Cake Form */
.cake-container {
    width: 450px;
    max-width: 90%;
    margin: 20px auto;
    padding: 18px 25px;
    background: #ffffff;
    border: 1px solid #fce7f3;
    border-radius: 16px;
    box-shadow: 0 5px 20px rgba(190, 24, 93, 0.13);
    text-align: left;
}

/* Form Heading */
.cake-container h2 {
    text-align: center;
    color: #9d174d;
    font-size: 24px;
    margin: 0 0 15px;
}

/* Labels */
.cake-container label {
    display: block;
    margin-bottom: 5px;
    color: #633548;
    font-size: 14px;
    font-weight: 600;
}

/* Textboxes and Category */
.cake-container input[type="text"],
.cake-container textarea,
.cake-container select {
    width: 100%;
    padding: 8px 10px;
    border: 1px solid #edc4d3;
    border-radius: 7px;
    background: #fffafd;
    color: #4a2633;
    font-family: inherit;
    font-size: 14px;
    outline: none;
    transition: 0.3s;
}

.cake-container input[type="text"]:focus,
.cake-container textarea:focus,
.cake-container select:focus {
    border-color: #d95788;
    box-shadow: 0 0 0 3px rgba(217, 87, 136, 0.12);
}

/* Description */
.cake-container textarea {
    height: 60px;
    resize: vertical;
}

/* Image Upload */
.cake-container input[type="file"] {
    width: 100%;
    padding: 8px;
    border: 1px dashed #d95788;
    border-radius: 7px;
    background: #fff5f9;
    font-size: 13px;
    color: #6b2143;
}

/* Add Cake Button */
.btnAddCake,
.cake-container input[type="submit"] {
    display: block;
    width: 100%;
    margin-top: 12px;
    padding: 10px;
    background: linear-gradient(135deg, #ec4899, #be185d);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 700;
    letter-spacing: 0.3px;
    cursor: pointer;
    box-shadow: 0 4px 10px rgba(190, 24, 93, 0.18);
    transition: all 0.3s ease;
}

.btnAddCake:hover,
.cake-container input[type="submit"]:hover {
    background: linear-gradient(135deg, #be185d, #9d174d);
    box-shadow: 0 6px 14px rgba(190, 24, 93, 0.25);
    transform: translateY(-2px);
}

/* Mobile Responsive */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        padding: 18px;
    }

    .navbar {
        justify-content: center;
    }

    .navbar a {
        padding: 9px 10px;
        font-size: 12px;
    }

    .cake-container {
        width: 92%;
        padding: 18px;
        margin: 20px auto;
    }
}
```css
.cake-container {
    width: 420px;
    margin: 10px auto;
    padding: 12px 22px;
}

.cake-container h2 {
    font-size: 22px;
    margin-bottom: 10px;
}

.cake-container label {
    margin-bottom: 3px;
    font-size: 13px;
}

.cake-container input[type="text"],
.cake-container select {
    padding: 6px 9px;
}

.cake-container textarea {
    height: 45px;
    padding: 6px 9px;
}

.cake-container input[type="file"] {
    padding: 5px;
}

.cake-container input[type="submit"],
.cake-container .btnAddCake {
    padding: 8px;
    margin-top: 8px;
}
```css
.cake-container {
    width: 400px;
    margin: 5px auto;
    padding: 10px 18px;
}

.cake-container h2 {
    font-size: 20px;
    margin-bottom: 7px;
}

.cake-container label {
    margin-bottom: 2px;
    font-size: 12px;
}

.cake-container input[type="text"],
.cake-container select {
    padding: 5px 8px;
    font-size: 13px;
}

.cake-container textarea {
    height: 35px;
    padding: 5px 8px;
}

.cake-container input[type="file"] {
    padding: 3px;
    font-size: 12px;
}

.cake-container input[type="submit"],
.cake-container .btnAddCake {
    padding: 7px;
    margin-top: 5px;
    font-size: 14px;
}


</style>
 

</head>
<body>
    <center>
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
        <br />
        <div class="cake-container">

  <h2>Add New Cake</h2>
        
   <div>
       <label>Cake Name</label>
       <br />
       <asp:TextBox ID="txtCakeName" runat="server"></asp:TextBox>
   </div>

   <br />

   <div>
       <label>Description</label>
       <br />
       <asp:TextBox ID="txtDescription"
           runat="server"
           TextMode="MultiLine"
           Rows="4"></asp:TextBox>
   </div>

   <br />

        <div>
    <label>Price</label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</div>
        <br />
   <div>
       <label>Category</label>
       <br />

       <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">

           <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
           <asp:ListItem Text="Babyshower" Value="Babyshower"></asp:ListItem>
           <asp:ListItem Text="Cupcakes" Value="Cupcakes"></asp:ListItem>
           <asp:ListItem Text="Birthday" Value="Birthday"></asp:ListItem>
           <asp:ListItem Text="Wedding" Value="Wedding"></asp:ListItem>
           <asp:ListItem Text="Cheesecake" Value="Cheesecake"></asp:ListItem>

       </asp:DropDownList>

   </div>

   <br />

   <div>
       <label>Cake Image</label>
       <br />

       <asp:FileUpload ID="fuCakeImage" runat="server" />
   </div>

   <br />

   <asp:Button
       ID="btnAddCake"
       runat="server"
       Text="Add Cake"
       OnClick="btnAddCake_Click" />
            </div>
    </form>
        
        </center>
</body>
</html>


