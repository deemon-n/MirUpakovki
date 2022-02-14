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

public partial class MirUpakLayoutEn : Layout
{
    protected void Page_Init(object sender, EventArgs e)
    {
        /*MirUpak.Model.Commerce.Initialize();
        Ideal.Commerce.Cart cart = MirUpak.Model.Commerce.Engine.CurrentCart;*/
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
                this.Header.Title = "Mir Upakovki: " + Env.CurrentLayout.ContentTitle;
            }
            else
            {
                this.Header.Title = "Mir Upakovki";
            }
        }
        base.Render(writer);
    }    
}