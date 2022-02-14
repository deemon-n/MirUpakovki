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
using Ideal.Wision.Schema;
using System.Xml;
using System.Collections.Generic;
using System.IO;
using Ideal.Wision;
using System.Text.RegularExpressions;
using MirUpak.Model;

public partial class importimages : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static Regex rxName = new Regex(@"(?<art>[\d\-]+)\.jpg", RegexOptions.Compiled | RegexOptions.IgnoreCase);
    protected void btnImport_Click(object sender, EventArgs e)
    {
        DirectoryInfo di = new DirectoryInfo(Env.Server.MapPath("~/uimages/"));
        FileInfo[] fis = di.GetFiles("*.jpg");
        foreach (FileInfo fi in fis)
        {
            Match m = rxName.Match(fi.Name);
            if (m.Success)
            {
                string code = m.Groups["art"].Value;
                Product p = Product.GetByCode(code);
                if (null == p)
                {
                    ltMsgs.Text += fi.Name + " отсутствует<br/>";
                    continue;
                }

                try
                {
                    p.CreateImageFromFile(fi.FullName);
                }
                catch (Exception ex)
                {
                    ltMsgs.Text += fi.Name + ": " + ex.Message;
                }
            }
        }
    }
}