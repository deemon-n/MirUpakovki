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
using System.Collections.Generic;
using Ideal.Wision;
using Ideal.Wision.Identity;
using Ideal.Wision.Controls;
using Ideal.Commerce;
using MirUpak.Model;
using Ideal.Core.Imaging;

public partial class catalog_sale : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Распродажа";

        xpvProducts.ShowPageRange = false;
        xpvProducts.CountPerPage = 16;
        xpvProducts.List = Product.SaleProductsList;
    }
}