<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderreport.aspx.cs" Inherits="cake_shop.pages.orderreport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

 <h1>Order Details Report</h1>

 <div class="report-container">
     <asp:Button ID="btnReport" runat="server"
         Text="Show Order Report"
         OnClick="btnReport_Click" />

 </div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" OnInit="CrystalReportViewer1_Init" />
    </form>
</body>
</html>
