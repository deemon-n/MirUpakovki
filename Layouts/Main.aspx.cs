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

public partial class MirUpakLayout : Layout
{
    protected string BodyClass
    {
        get
        {
            return Env.VirtualPagePath.Equals("/about/black/index.aspx", StringComparison.CurrentCultureIgnoreCase) ? " class='black'" : "";
        }
    }

    protected string Bl
    {
        get
        {
            return Env.VirtualPagePath.Equals("/about/black/index.aspx", StringComparison.CurrentCultureIgnoreCase) ? "bl" : "";
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        /*MirUpak.Model.Commerce.Initialize();
        Ideal.Commerce.Cart cart = MirUpak.Model.Commerce.Engine.CurrentCart;*/
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.CssFile = "~/css/mu.css";
        if (!Env.PageIsRoot)
        {
            phCats.Visible = true;
            foreach (ProductCategory pc in ProductCategory.RootCategories)
            {
                if (!pc.Own)
                    ltCats.Text += string.Format("<a href='/catalog/{0}/'>{1}</a> &nbsp; ", pc.ID, pc.Name);
            }
        }

        tabLogin.Visible = Manager.IsAnonymous;
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

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Manager.TryLogon(tbEmail.Text, tbPassword.Text, true, false) == null)
        {
            Env.RegisterStartupMessage("errl", "Неверно указан email или пароль! Возможно, Вы не зарегистрированы или были заблокированы администратором"); ;
        }
        else
        {
            Env.Redirect("~/my/index.aspx");
        }
    }
}