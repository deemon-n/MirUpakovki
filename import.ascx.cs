using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using Ideal.Wision;
using Ideal.Wision.Schema;
using Ideal.ImpexLib;
using System.Collections.Generic;

public partial class import : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Wse30TransferHelper wse = new Wse30TransferHelper(123);
        StreamReader sr = new StreamReader(Env.Server.MapPath("~/import/customers.xml"));
        string s = sr.ReadToEnd();
        sr.Close();
        List<ReportMessage> lrs = new List<ReportMessage>();
        wse.ImportCustomersXml(s, lrs);

        sr = new StreamReader(Env.Server.MapPath("~/import/acts.xml"));
        s = sr.ReadToEnd();
        sr.Close();
        lrs = new List<ReportMessage>();
        wse.ImportTransXml(s, lrs);

        sr = new StreamReader(Env.Server.MapPath("~/import/orders.xml"));
        s = sr.ReadToEnd();
        sr.Close();
        lrs = new List<ReportMessage>();
        wse.ImportOrdersXml(s, lrs);
    }
}