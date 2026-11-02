using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cake_shop
{
    public partial class customerreport : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new ReportDocument();
        static string Crypath = "";

        void getcon()
        {
            con = new SqlConnection(s);

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from Cake_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/customerdata.xml");
            ds.WriteXmlSchema(s);


            string path = Server.MapPath("customer.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "Cake");
        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }
    }
}