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
using MirUpak.Model;
using System.Collections.Generic;
using Ideal.Wision.Wislets.Model;
using DynaControlslLibrary;
using Ramedia.UI;
using Ideal.Entity;

public partial class index : UserWintrol
{
    protected void Page_Init(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "";

        string urlslider = string.Empty;
        foreach (Ad ad in Ad.GetList())
        {
            urlslider = (ad.Url != string.Empty) ? ad.Url : "javascript:void(0);";
            ltSlider.Text += String.Format(@"<div class='slide_item'><a href='{2}'><img src='{0}/i/p/{1}' alt='' /></a></div>", Env.AppPath, ad.Image.LargeName, urlslider);
        }

        xpvSliderProductsSpec.List = Product.SpecialProductsList;
        xpvSliderProductsTop.List = Product.TopProductsList;
        xpvSliderProductsSale.List = Product.SaleProductsListIndex;
    }
}