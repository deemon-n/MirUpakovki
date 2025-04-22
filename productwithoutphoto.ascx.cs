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
using Ideal.Entity;

public partial class productwithoutphoto : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Товары без фото";

        List<Product> lp = Schema.Products.Select("HasImage = @1 AND Active = @2", new SelectOptions("Code", SortOrder.Ascending), false, true).Items.FindAll(delegate (Product p) { return !p.Photo.Exists && !p.PhotoSpec.Exists; });

        int count = 1;
        foreach (Product p in lp)
        {
            lOutput.Text += string.Format(@"<div><b>{0}</b></div>", p.Code, count);
            count++;
        }
    }
}