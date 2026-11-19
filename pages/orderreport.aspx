<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderreport.aspx.cs" Inherits="cake_shop.pages.orderreport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', Arial, sans-serif;
        background: #fff5f8;
        color: #4a2635;
        padding: 30px;
    }

    #form1 {
        width: 100%;
        max-width: 1450px;
        margin: auto;
    }

    /* Page Heading */
    h1 {
        background: linear-gradient(135deg, #e879a5, #f5a6c5);
        color: white;
        text-align: center;
        padding: 28px 20px;
        font-size: 30px;
        font-weight: 700;
        border-radius: 15px;
        margin-bottom: 25px;
        box-shadow: 0 5px 18px rgba(218, 112, 147, 0.20);
    }

    /* Report Container */
    .report-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(180, 90, 125, 0.10);
    }

    /* Show Report Button */
    #btnReport {
        display: inline-block;
        background: #e879a5;
        color: white;
        border: none;
        padding: 13px 25px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        margin-bottom: 25px;
        transition: 0.3s;
        box-shadow: 0 4px 12px rgba(218, 112, 147, 0.20);
    }

    #btnReport:hover {
        background: #d9578b;
        transform: translateY(-2px);
    }

    /* Crystal Report Viewer */
    #CrystalReportViewer1 {
        display: block;
        width: 100% !important;
        background: white;
        border: 1px solid #f2c9d9;
        border-radius: 12px;
        padding: 15px;
        margin-top: 5px;
        box-shadow: 0 5px 20px rgba(180, 90, 125, 0.10);
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        body {
            padding: 12px;
        }

        h1 {
            font-size: 23px;
            padding: 22px 10px;
        }

        #btnReport {
            width: 100%;
        }

        #CrystalReportViewer1 {
            padding: 5px;
        }

        .report-container {
            padding: 12px;
        }
    }
</style>

    </style>
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
