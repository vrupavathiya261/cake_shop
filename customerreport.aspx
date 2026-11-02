<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerreport.aspx.cs" Inherits="cake_shop.customerreport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%-- <form id="form1" runat="server">
       <h1>Customer Details Report</h1>
 <center>
 <asp:Button ID="btnReport" runat="server"
     Text="Show Customer Report"
     OnClick="btnReport_Click" />
     <br />
     <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" OnInit="CrystalReportViewer1_Init" />
     </center>
    </form>--%>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <h1>Cake Details Report</h1>

        <div class="report-container">
            <asp:Button ID="btnReport" runat="server"
                Text="Show Cake Report"
                OnClick="btnReport_Click" />

            <CR:CrystalReportViewer
                ID="CrystalReportViewer1"
                runat="server"
                AutoDataBind="true"
                ToolPanelViewType="None"
                HasToggleGroupTreeButton="false" />
        </div>
    </form>
</body>
</html>
