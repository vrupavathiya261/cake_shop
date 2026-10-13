<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="cake_shop.pages.view" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
 
<head runat="server"> 
 
    <title>View Cake - Petal & Crumb</title> 
 
    <style> 
 
        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box; 
        } 
 
        body { 
            background: #f8f1e8; 
            color: #4d3428; 
            font-family: Georgia, serif; 
        } 
 
        /* HEADER */ 
 
        .header { 
            width: 100%; 
            height: 80px; 
            background: #fffaf5; 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            padding: 0 70px; 
            border-bottom: 1px solid #e5d5c5; 
        } 
 
        .logo { 
            font-size: 28px; 
            font-weight: bold; 
            color: #5b392b; 
        } 
 
        .nav { 
            display: flex; 
            gap: 30px; 
        } 
 
        .nav a { 
            text-decoration: none; 
            color: #5b392b; 
            font-size: 16px; 
        } 
 
        .nav a:hover { 
            color: #a86b50; 
        } 
 
        /* PAGE TITLE */ 
 
        .page-title { 
            text-align: center; 
            padding: 45px 20px 30px; 
        } 
 
        .page-title h1 { 
            font-size: 42px; 
            color: #56372b; 
            margin-bottom: 10px; 
        } 
 
        .page-title p { 
            font-family: Arial, sans-serif; 
            color: #80695c; 
            font-size: 16px; 
        } 
 
        /* MAIN */ 
 
        .main-container { 
            width: 90%; 
            max-width: 1150px; 
            margin: auto; 
        } 
 
        .product-box { 
            background: #fffaf5; 
            border-radius: 20px; 
            padding: 35px; 
            display: grid; 
            grid-template-columns: 48% 52%; 
            gap: 40px; 
            box-shadow: 0 8px 25px rgba(90, 55, 40, 0.12); 
        } 
 
        /* IMAGE */ 
 
        .image-area { 
            display: flex; 
            justify-content: center; 
            align-items: center; 
        } 
 
        .cake-image { 
            width: 100%; 
            max-width: 500px; 
            height: 500px; 
            object-fit: cover; 
            border-radius: 18px; 
            border: 1px solid #ead8c7; 
        } 
 
        /* DETAILS */ 
 
        .details-area { 
            padding: 10px 15px; 
        } 
 
        .category { 
            display: inline-block; 
            background: #ead9c9; 
            color: #694838; 
            padding: 8px 17px; 
            border-radius: 20px; 
            font-family: Arial, sans-serif; 
            font-size: 14px; 
            margin-bottom: 15px; 
        } 
 
        .cake-name { 
            font-size: 38px; 
            color: #4e3024; 
            margin-bottom: 12px; 
        } 
 
        .rating { 
            margin-bottom: 20px; 
        } 
 
        .stars { 
            color: #d39a38; 
            font-size: 22px; 
            letter-spacing: 3px; 
        } 
 
        .reviews { 
            color: #80695b; 
            font-family: Arial, sans-serif; 
            font-size: 14px; 
            margin-left: 8px; 
        } 
 
        .description { 
            font-family: Arial, sans-serif; 
            color: #675349; 
            font-size: 16px; 
            line-height: 1.7; 
            margin-bottom: 20px; 
        } 
 
        .price { 
            font-size: 32px; 
            font-weight: bold; 
            color: #8b523b; 
            margin-bottom: 22px; 
        } 
 
        /* INFO */ 
 
        .info-box { 
            background: #f5ebe1; 
            border-radius: 12px; 
            padding: 15px 18px; 
            margin-bottom: 22px; 
        } 
 
        .info-row { 
            display: flex; 
            justify-content: space-between; 
            padding: 9px 0; 
            border-bottom: 1px solid #e0cfc0; 
            font-family: Arial, sans-serif; 
        } 
 
        .info-row:last-child { 
            border-bottom: none; 
        } 
 
        .info-label { 
            font-weight: bold; 
            color: #57392d; 
        } 
 
        .info-value { 
            color: #745c4e; 
        } 
 
        /* WEIGHT */ 
 
        .weight-label { 
            display: block; 
            font-weight: bold; 
            font-size: 17px; 
            margin-bottom: 9px; 
        } 
 
        .weight-dropdown { 
            width: 100%; 
            padding: 12px; 
            border: 1px solid #cdb8a6; 
            border-radius: 8px; 
            background: white; 
            font-size: 15px; 
            margin-bottom: 25px; 
        } 
 
        /* BUTTONS */ 
 
        .button-area { 
            display: flex; 
            gap: 15px; 
            align-items: center; 
        } 
 
        .back-button { 
            display: inline-block; 
            text-decoration: none; 
            background: #ead9c9; 
            color: #573a2d; 
            padding: 14px 23px; 
            border-radius: 8px; 
            font-size: 16px; 
        } 
 
        .back-button:hover { 
            background: #dcc4b1; 
        } 
 
        .cart-button { 
            background: #80523d; 
            color: white; 
            border: none; 
            padding: 14px 25px; 
            border-radius: 8px; 
            font-family: Georgia, serif; 
            font-size: 16px; 
            cursor: pointer; 
        } 
 
        .cart-button:hover { 
            background: #633e30; 
        } 
        #ddlWeight {
    width: 200px;
    padding: 12px 15px;
    margin: 10px 0 20px;
    border: 1px solid #e5cbb8;
    border-radius: 8px;
    background-color: #fffaf5;
    color: #603b2d;
    font-size: 16px;
    font-family: Arial, sans-serif;
    cursor: pointer;
    outline: none;
    transition: 0.3s;
}

#ddlWeight:hover {
    border-color: #895740;
}

#ddlWeight:focus {
    border-color: #895740;
    box-shadow: 0 0 5px rgba(137, 87, 64, 0.3);
}
 
       
 
        .why-section { 
            width: 90%; 
            max-width: 1150px; 
            margin: 70px auto; 
        } 
 
        .why-title { 
            text-align: center; 
            font-size: 32px; 
            color: #57382c; 
            margin-bottom: 35px; 
        } 
 
        .why-grid { 
            display: grid; 
            grid-template-columns: repeat(3, 1fr); 
            gap: 25px; 
        } 
 
        .why-card { 
            background: #fffaf5; 
            padding: 30px 22px; 
            text-align: center; 
            border-radius: 15px; 
            box-shadow: 0 5px 18px rgba(90, 55, 40, 0.10); 
        } 
 
        .why-icon { 
            font-size: 40px; 
            margin-bottom: 15px; 
        } 
 
        .why-card h3 { 
            color: #5b392b; 
            margin-bottom: 10px; 
        } 
 
        .why-card p { 
            font-family: Arial, sans-serif; 
            color: #756054; 
            line-height: 1.6; 
        } 
 
        /* FOOTER */ 
 
        .footer { 
            background: #4e3025; 
            color: white; 
            text-align: center; 
            padding: 25px; 
            margin-top: 60px; 
        } 
 
        .footer p { 
            font-family: Arial, sans-serif; 
            font-size: 14px; 
        } 
 
        /* RESPONSIVE */ 
 
        @media(max-width: 850px) { 
 
            .header { 
                height: auto; 
                padding: 20px; 
                flex-direction: column; 
                gap: 15px; 
            } 
 
            .product-box { 
                grid-template-columns: 1fr; 
            } 
 
            .cake-image { 
                height: 400px; 
            } 
 
            .why-grid { 
                grid-template-columns: 1fr; 
            } 
 
        } 
 
    </style> 
 
</head> 
 
<body> 
 
<form id="form1" runat="server"> 
 
    <!-- HEADER --> 
 
    <div class="header"> 
 
        <div class="logo"> 
            🍰 Petal & Crumb 
        </div> 
 
        <div class="nav"> 
 
            <a href="cake.aspx">Home</a> 
 
            <a href="cake.aspx">Cakes</a> 
 
            <a href="about.aspx">About</a> 
 
            <a href="contact.aspx">Contact</a> 
 
            <a href="login.aspx">Login</a> 
 
        </div> 
 
    </div> 
 
 
    <!-- TITLE --> 
 
    <div class="page-title"> 
 
        <h1>Our Delicious Cake</h1> 
 
        <p>Made with love, baked with happiness ❤️</p> 
 
    </div> 
 
 
    <!-- PRODUCT --> 
 
    <div class="main-container"> 
 
<asp:Repeater ID="rptCake" runat="server" OnItemCommand="rptCake_ItemCommand"> 
            <ItemTemplate> 
 
                <div class="product-box"> 
 
 
                    <!-- IMAGE --> 
 
                    <div class="image-area"> 
 
                        <asp:Image 
                            ID="imgCake" 
                            runat="server" 
                            CssClass="cake-image" 
                            ImageUrl='<%# ResolveUrl("~/cakeimges/" + Eval("image")) %>' 
                            AlternateText='<%# Eval("cakename") %>' /> 
 
                    </div> 
 
 
                    <!-- DETAILS --> 
 
                    <div class="details-area"> 
 
                        <span class="category"> 
                            <%# Eval("category") %> 
                        </span> 
 
 
                        <h2 class="cake-name"> 
                            <%# Eval("cakename") %> 
                        </h2> 
 
 
                        <div class="rating"> 
 
                            <span class="stars"> 
                                ★★★★★ 
                            </span> 
 
                            <span class="reviews"> 
                                4.9 (25 Reviews) 
                            </span> 
 
                        </div> 
 
 
                        <p class="description"> 
                            <%# Eval("description") %> 
                        </p> 
 
<div class="price" data-price="<%# Eval("price") %>"> 
    ₹<%# Eval("price") %></div> 

                        
        <asp:DropDownList ID="ddlWeight" runat="server"> 
            <asp:ListItem Text="1 KG" Value="1"></asp:ListItem> 
            <asp:ListItem Text="1.5 KG" Value="1.5"></asp:ListItem> 
        </asp:DropDownList> 

                        <!-- INFO --> 
 
                        <div class="info-box"> 
 
                            <div class="info-row"> 
 
                                <span class="info-label"> 
                                    Cake ID 
                                </span> 
 
                                <span class="info-value"> 
                                    <%# Eval("id") %> 
                                </span> 
 
                            </div> 
 
 
                            <div class="info-row"> 
 
                                <span class="info-label"> 
                                    Category 
                                </span> 
 
                                <span class="info-value"> 
                                    <%# Eval("category") %> 
                                </span> 
 
                            </div> 
 
                        </div> 
 
 
                        <!-- WEIGHT --> 
 
                       <asp:Repeater ID="rptCake" runat="server"> 
 
    <ItemTemplate> 
 
        <!-- Cake details --> 
 
 
        <asp:Button ID="btnCart" 
            runat="server" 
            Text="Add to Cart" 
            CommandArgument='<%# Eval("Id") %>' 
            OnClick="btnCart_Click" /> 
 
    </ItemTemplate> 
 
</asp:Repeater> 
 
                        <!-- BUTTONS --> 
 
                        <div class="button-area"> 
 
                            <a href="cake.aspx" 
                               class="back-button"> 
 
                                ← Back to Cakes 
 
                            </a> 
 
 
                            <asp:Button 
                                ID="btnCart" 
                                runat="server" 
                                Text="🧁 Add to Cart" 
                                CssClass="cart-button" 
                                CommandArgument='<%# Eval("id") %>' 
                                OnClick="btnCart_Click" /> 
 
                        </div> 
 
                    </div> 
 
                </div> 
 
            </ItemTemplate> 
 
        </asp:Repeater> 
 
    </div> 
 
 
    <!-- WHY CHOOSE --> 
 
    <div class="why-section"> 
 
        <h2 class="why-title"> 
            Why Choose Petal & Crumb? 
          </h2> 
 
 
        <div class="why-grid"> 
 
 
            <div class="why-card"> 
 
                <div class="why-icon"> 
                    🎂 
                </div> 
 
                <h3>Freshly Baked</h3> 
 
                <p> 
                    Every cake is freshly baked using 
                    quality ingredients. 
                </p> 
 
            </div> 
 
 
            <div class="why-card"> 
 
                <div class="why-icon"> 
                    ❤️ 
                </div> 
 
                <h3>Made With Love</h3> 
 
                <p> 
                    Every cake is prepared with care 
                    and attention. 
                </p> 
 
            </div> 
 
 
            <div class="why-card"> 
 
                <div class="why-icon"> 
                    🚚 
                </div> 
 
                <h3>Fast Delivery</h3> 
 
                <p> 
                    Get your favourite cake delivered 
                    fresh to your doorstep. 
                </p> 
 
            </div> 
 
 
        </div> 
 
    </div> 
 
 
    <!-- FOOTER --> 
 
    <div class="footer"> 
 
        <p> 
            © 2026 Petal & Crumb | Fresh Cakes Made With Love ❤️ 
        </p> 
 
    </div> 
    <script> 
        function changePrice(weight) {

            var kg = parseFloat(weight.value);

            var priceBox = document.querySelector(".price");

            var price = parseFloat(priceBox.getAttribute("data-price"));

            priceBox.innerHTML = "₹" + (price * kg);
        }
    </script> 
 
</form> 
 
</body> 
 
</html> isme app muje error solve kr k pura code do jisse viewdetilsa page mse addto cart succefully ho jaye and upadte bhi hp weight and qunity