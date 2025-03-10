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
using System.Text;

public partial class CategoryProductCount : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();

        List<ProductCategory> lpc = Schema.Categories.SelectAll().Items;
        List<Product> lp = Schema.Products.SelectAll().Items;

        int noPhoto = lp.FindAll(delegate (Product p) { return p.ImageUrl.Contains("nophoto.png"); }).Count;

        sb.AppendFormat(@"<p>Количество категорий: {0} шт.</p>", lpc.Count.ToString("N0"));
        sb.AppendFormat(@"<p>Количество товаров: {0} шт.</p>", lp.Count.ToString("N0"));
        sb.AppendFormat(@"<p>Количество товаров с фото: {0} шт.</p>", (lp.Count - noPhoto).ToString("N0"));
        sb.AppendFormat(@"<p>Количество товаров без фото: {0} шт.</p>", noPhoto.ToString("N0"));

        ltOutput.Text = sb.ToString();
    }
}