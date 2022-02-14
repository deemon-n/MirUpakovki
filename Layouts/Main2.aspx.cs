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

public partial class layouts_Main2 : Layout
{

    static bool comminit = false;
    ProductCategory cat;
    Product prod;

    protected void Page_Init(object sender, EventArgs e)
    {
        /*MirUpak.Model.Commerce.Initialize();
        Ideal.Commerce.Cart cart = MirUpak.Model.Commerce.Engine.CurrentCart;*/
        if (!comminit)
        {
            string ap = Ideal.Wision.Env.AppPath;
            Commerce.Initialize();
            Ideal.Commerce.Cart cart = Commerce.Engine.CurrentCart;
            comminit = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Env.RawUrl.Contains("/catalog/") && !Env.RawUrl.Contains("/catalog/cart.aspx") )
        {
            ProductCategory parentCategory = new ProductCategory();
            ProductCategory currentCategory = new ProductCategory();
            Product product = new Product();
            int id = 0;
            string sid = Env.WisionContext.GetRxKeyValue("cid");
            string spid = Env.Request["pid"];

            if (sid != null)
            {
                if (int.TryParse(sid, out id))
                {
                    cat = MirUpak.Model.Schema.Categories[id];
                    if (null != cat)
                    {
                        parentCategory = cat;
                        currentCategory = cat;
                        phSubHeaderCatalog.Visible = true;
                        try
                        {
                            while (currentCategory != null)//поиск корневой категории
                            {
                                parentCategory = currentCategory;
                                currentCategory = parentCategory.ParentCategory;
                            }

                        }
                        catch { }
                        //phCatOffice.Visible = (parentCategory.ID == 3); блок перейти в каталог офис-заказ
                        if (parentCategory.PhotoSubHeader.LargeName != string.Empty)
                        {
                            imgCatalogSubHeader.ImageUrl = Env.AppPath + "/i/pc/" + parentCategory.PhotoSubHeader.LargeName;
                        }

                    }
                }
            }
            else if (spid != null)
            {
                if (int.TryParse(spid, out id))
                {
                    prod = MirUpak.Model.Schema.Products[id];
                    if (null != prod)
                    {
                        parentCategory = prod.Category;
                        currentCategory = prod.Category;
                        phSubHeaderCatalog.Visible = true;
                        try
                        {
                            while (currentCategory != null)//поиск корневой категории
                            {
                                parentCategory = currentCategory;
                                currentCategory = parentCategory.ParentCategory;
                            }

                        }
                        catch { }
                        //phCatOffice.Visible = (parentCategory.ID == 3); блок перейти в каталог офис-заказ
                        if (parentCategory.PhotoSubHeader.LargeName != string.Empty)
                        {
                            imgCatalogSubHeader.ImageUrl = Env.AppPath + "/i/pc/" + parentCategory.PhotoSubHeader.LargeName;
                        }

                    }
                }
            }

            phPopupFoo.Visible = true;
        }

            tbSearchHeader.Attributes.Add("onblur", "if (this.value=='') this.value='поиск товара'");
        tbSearchHeader.Attributes.Add("onfocus", "if (this.value=='поиск товара') this.value='';");

        tbMSearchHeader.Attributes.Add("onblur", "if (this.value=='') this.value='поиск товара'");
        tbMSearchHeader.Attributes.Add("onfocus", "if (this.value=='поиск товара') this.value='';");


        tbTabletSearchHeader.Attributes.Add("onblur", "if (this.value=='') this.value='поиск товара'");
        tbTabletSearchHeader.Attributes.Add("onfocus", "if (this.value=='поиск товара') this.value='';");   
        
        imgBtnMHeader.ImageUrl = Env.AppPath + "/ii/m-header.png";
        imgBtnTabletHeader.ImageUrl = Env.AppPath + "/ii/m-header.png";        
    }

    protected void btnSearchHeader_Click(object sender, EventArgs e)
    {
        if (tbSearchHeader.Text.Trim() != "" && tbSearchHeader.Text.Trim().ToLower() != "поиск товара")
        {
            Env.Redirect(Env.AppPath + "/catalog/index.aspx?search=" + tbSearchHeader.Text.Trim());
        }
        else if (tbMSearchHeader.Text.Trim() != "" && tbMSearchHeader.Text.Trim().ToLower() != "поиск товара")
        {
            Env.Redirect(Env.AppPath + "/catalog/index.aspx?search=" + tbMSearchHeader.Text.Trim());
        }
        else if (tbTabletSearchHeader.Text.Trim() != "" && tbTabletSearchHeader.Text.Trim().ToLower() != "поиск товара")
        {
            Env.Redirect(Env.AppPath + "/catalog/index.aspx?search=" + tbTabletSearchHeader.Text.Trim());
        }
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
                this.Header.Title = "ћир ”паковки: " + Env.CurrentLayout.ContentTitle;
            }
            else
            {
                this.Header.Title = "ћир ”паковки";
            }
        }
        base.Render(writer);
    }
}
