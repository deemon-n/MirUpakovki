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
using Ideal.Wision;
using Ideal.Core.Imaging;
using System.Collections.Generic;
using Ideal.Entity;
using MirUpak.Model;
using Ideal.Wision.Identity;

public partial class MyLayout : Layout
{
    protected Customer Customer;
    protected MuManager MuManager;

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Manager.IsAnonymous)
            Env.Redirect("~/index.aspx");

        Customer = Customer.Current;
        if (Customer == null)
            Env.Redirect("~/index.aspx");
        MuManager = Schema.Managers[Customer.OurManagerID];

        Company comp = Company.Get(Customer.OurINN);
        if (null == comp)
            Env.Redirect("~/index.aspx");

        ltReqs.Text = comp.HtmlDescription;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.CssFile = "~/css/mu.css";
    }
    
    protected override Container DefaultContainer
	{
        get { return contDefault; }
	}

    protected override void Render(HtmlTextWriter writer)
    {
        if (null != Env.CurrentLayout.ContentTitle)
        {
            if (Env.CurrentLayout.ContentTitle.Length > 0)
            {
                this.Header.Title = "Мир Упаковки: " + Env.CurrentLayout.ContentTitle;
            }
            else
            {
                this.Header.Title = "Мир Упаковки";
            }
        }
        base.Render(writer);
    }
}