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
using Ideal.Core.Imaging;

public partial class catalog_item : UserWintrol
{
    protected Product Product;
    ProductCategory category;

    protected string pidStr = string.Empty;    
    
    protected void Page_Init(object sender, EventArgs e)
    {        
        string sid = Env.Request["pid"];
        if (string.IsNullOrEmpty(sid))
            Env.PageNotFound();
        int pid = -1;
        if (!int.TryParse(sid, out pid))
            Env.PageNotFound();
        Product = MirUpak.Model.Schema.Products[pid];

        if (null == Product)
        {
            Env.PageNotFound();
        }
        
        /*category = Product.Category;
        phCatOffice.Visible = (category.ID == 3);
        if (category.PhotoSubHeader.LargeName != string.Empty)
        {
            imgCatalogSubHeader.ImageUrl = Env.AppPath + "/i/pc/" + category.PhotoSubHeader.LargeName;
        }*/

        Env.CurrentLayout.ContentTitle = Product.Name;

        ltName.Text = Product.Name;
        ltCode.Text = Product.Code;
        ltDescr.Text = Product.Description.Html;
        ltPrice.Text = Product.PriceString;
        pidStr = sid;

        ltImgMain.Text = String.Format(@"<img class='img-response' src='{0}' alt='{1}' />", Product.ImageUrl, Product.Name);

        if (Product.Photos.Count > 0)
        { 
            foreach (ImageInfo i in Product.Photos)
            {
                ltImgExt.Text += String.Format(@"<div class='col-md-2 img-prod-little'><img src='{0}/i/p/{1}' alt={2} /></div>", Env.AppPath, i.PreviewName, Product.Name);            
            }
        }


        foreach (ProductCategory pc in ProductCategory.RootCategories)
        {
            ddlCat.Items.Add(new ListItem(pc.Name, pc.ID.ToString()));
        }
        AddDllChildItemCategory();

        //xpvProductsTop.List = MirUpak.Model.Schema.Products.Select("NewProd = @1", true);
        xpvProductsTop.List = LastViewed.List;
    }

    protected void btnSearchProduct_Click(object sender, EventArgs e)
    {
        if (tbSearchProduct.Text.Trim() != "")
        {
            Env.Redirect(Env.AppPath + "/catalog/index.aspx?search=" + tbSearchProduct.Text.Trim());
        }
    }

    protected void ddlCat_Change(object sender, EventArgs e)
    {
        AddDllChildItemCategory();
    }

    void AddDllChildItemCategory()
    {
        ddlCatChild.Items.Clear();
        string cidDDLCat = ddlCat.SelectedValue;
        int cidDDLCatInt = 0;
        if (Int32.TryParse(cidDDLCat, out cidDDLCatInt))
        {
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                foreach (ProductCategory pcc in pcCurr.ChildCategories)
                {
                    ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
        else
        {
            ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
    }
}
