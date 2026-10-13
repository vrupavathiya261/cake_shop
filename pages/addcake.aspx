<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addcake.aspx.cs" Inherits="cake_shop.images.addcake" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    

    <link href="../css/style.css" rel="stylesheet" />

</head>
<body>
    <center>
    <form id="form1" runat="server">
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
    </form>
        </center>
</body>
</html>


