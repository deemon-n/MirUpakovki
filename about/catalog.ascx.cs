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

public partial class about_catalog : UserWintrol, INavigable
{
    ProductCategory cat;

    protected void Page_Init(object sender, EventArgs e)
    {
        int id = 0;
        string sid = Env.Request["cid"];
        string cname = "Категории";
        List<ProductCategory> lpcs = null;
        if (sid != null)
        {
            if (!int.TryParse(sid, out id))
                Env.PageNotFound();
            cat = MirUpak.Model.Schema.Categories[id];
            if (null == cat)
                Env.PageNotFound();
            cname = cat.Name;

            lpcs = cat.ChildCategories;
            List<Product> lps = cat.Products;
            if (null != lps)
            {
                if (lps.Count > 0)
                {
                    xpvProducts.Arguments.Add("categoryName", cat.Name);
                    xpvProducts.List = cat.Products;
                    xpvProducts.Visible = false;
                }
            }

            //phBottom.Visible = cat.ParentCategoryID > 0 && !cat.Own;
            /*if (cat.ParentCategoryID > 0)
            {*/
                ltCatName.Text = cat.ParentCategoryID == 0 ? cat.Name : cat.ParentCategory.Name;

                ltTop.Text = "<div style='margin-bottom: 20px; position: relative;'>";
                if (cat.UpShadedText.Length > 3)
                {
                    ltTop.Text += "<div class='topShade'><div class='header'>" + cat.Name + "</div><div>" + cat.UpShadedText + "</div></div>";
                }
                if (cat.Photos.Count > 0)
                {
                    if (cat.Photos.Count > 1)
                    {
                        int maxW = 0;
                        int maxH = 0;
                        foreach (ImageInfo ii in cat.Photos)
                        {
                            if (ii.LargeSize.Width > maxW) maxW = ii.LargeSize.Width;
                            if (ii.LargeSize.Height > maxH) maxH = ii.LargeSize.Height;
                        }

                        ltTop.Text += "<div class='scrollh' style='width:" + maxW + "px; height: " + maxH + "px;'>";
                        foreach (ImageInfo ii in cat.Photos)
                        {
                            ltTop.Text += "<img src='/i/pc/" + ii.LargeName + "'/>";
                        }
                        ltTop.Text += "</div>";
                    }
                    else
                    {
                        ltTop.Text += "<img src='/i/pc/" + cat.Photos[0].LargeName + "'/>";
                    }
                }
                ltTop.Text += "</div>";

                ltTop.Text += "<div style='width: 474px; float:left; margin-right: 1px; padding-right:20px; overflow:auto;'>" + cat.Description.Html + "&nbsp;</div>";
                ltTop.Text += "<div style='width: 485px; float:left;'>";
                if (cat.PhotoRight.Exists || cat.PhotoRightLink.Length > 3)
                {
                    /// если ссылка правая указана, а фото правое не указано
                    /// то не выводить ничего
                    if (cat.PhotoRight.Exists)
                    {
                        if (cat.PhotoRightLink.Length > 3)
                        {
                            ltTop.Text += "<a href='" + cat.PhotoRightLink + "'><img src='/i/pc/" + cat.PhotoRight.LargeName + "' style='margin-bottom:20px;'/></a>";
                        }
                        else
                        {
                            ltTop.Text += "<img src='/i/pc/" + cat.PhotoRight.LargeName + "' style='margin-bottom:20px;'/>";
                        }
                    }
                }
                else
                {
                    ltTop.Text += "<img src='/ii/prodr.jpg' style='margin-bottom:20px;'/>";
                }

                if (cat.PhotosRight.Count > 0)
                {
                    int maxW = 0;
                    int maxH = 0;
                    foreach (ImageInfo ii in cat.PhotosRight)
                    {
                        if (ii.LargeSize.Width > maxW) maxW = ii.LargeSize.Width;
                        if (ii.LargeSize.Height > maxH) maxH = ii.LargeSize.Height;
                    }

                    ltTop.Text += "<div class='scrollh' style='width:" + maxW + "px; height: " + maxH + "px;margin-bottom:20px;'>";
                    foreach (ImageInfo ii in cat.PhotosRight)
                    {
                        ltTop.Text += "<img src='/i/pc/" + ii.LargeName + "'/>";
                    }
                    ltTop.Text += "</div>";
                }

                ltTop.Text += cat.DescriptionRight.Html + "</div>";

                if (cat.ParentCategoryID > 0)
                {
                    List<ProductCategory> siblings = cat.ParentCategory.ChildCategories;
                    for (int i = 0; i < siblings.Count; i++)
                    {
                        Literal lt = null;
                        if (i % 3 == 0) lt = ltCats1;
                        if (i % 3 == 1) lt = ltCats2;
                        if (i % 3 == 2) lt = ltCats3;
                        lt.Text += "<div style='margin-bottom: 5px;'><a style='color:#fff;' href='/about/catalog.aspx?cid=" + siblings[i].ID + "'>" + siblings[i].Name + "</a></div>";
                    }
                }
            /*}*/
        }
        else
        {
            lpcs = ProductCategory.RootCategories;
            //phBottom.Visible = false;
        }

        Env.CurrentLayout.ContentTitle = cname;

        xlvChildCategory.List = lpcs;
        xlvChildCategory.Visible = false;
    }

    #region INavigable Members

    public INavigator GetNavigator()
    {
        if (null == cat) return new RootProductCategoryNavigator();
        return new ProductCategoryNavigator(cat);
    }

    #endregion
}
