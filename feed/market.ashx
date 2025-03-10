<%@ WebHandler Language="C#" Class="market"  %>
using System;
using System.Collections.Generic;
using System.Web;
using MirUpak.Model;
using Ideal.Entity;

public class market : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/xml";
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;

        //System.Text.RegularExpressions.Regex rxEntity = new System.Text.RegularExpressions.Regex(@"&\w+;", System.Text.RegularExpressions.RegexOptions.Compiled);

        DateTime dtn = DateTime.Now;

        System.Xml.XmlTextWriter xtw = new System.Xml.XmlTextWriter(context.Response.OutputStream, System.Text.Encoding.UTF8);
        xtw.Formatting = System.Xml.Formatting.Indented;

        xtw.WriteStartDocument();
        xtw.WriteDocType("yml_catalog", null, "shops.dtd", null);
        //xtw.WriteDocType("yml_catalog", "SYSTEM", "", "");

        xtw.WriteStartElement("yml_catalog");
        xtw.WriteAttributeString("date", string.Format("{0}-{1}-{2} {3}:{4}", dtn.Year, dtn.Month, dtn.Day, zf(dtn.Hour), zf(dtn.Minute)));

        xtw.WriteStartElement("shop");

        xtw.WriteElementString("name", "Мир упаковки");
        xtw.WriteElementString("company", "Мир упаковки");
        xtw.WriteElementString("phone", "+7 (4942) 440-888");
        xtw.WriteElementString("url", "https://mirupakovki.com/");

        xtw.WriteStartElement("currencies");
        xtw.WriteStartElement("currency");
        xtw.WriteAttributeString("id", "RUB");
        xtw.WriteAttributeString("rate", "1");
        xtw.WriteEndElement();
        xtw.WriteEndElement();

        // categories
        xtw.WriteStartElement("categories");
        foreach (ProductCategory cat in Schema.Categories.SelectAll())
        {
            if (cat.Active)
            {
                xtw.WriteStartElement("category");
                xtw.WriteAttributeString("id", cat.ID.ToString());
                xtw.WriteAttributeString("parentId", cat.ParentCategoryID.ToString());
                xtw.WriteString(cat.Name);
                xtw.WriteEndElement();
            }
        }
        xtw.WriteEndElement();
        
        // products
        xtw.WriteStartElement("offers");

        //List<Product> lps = Schema.Products.Cache.CachedEntities;
        List<Product> lps = Schema.Products.SelectAll(new SelectOptions("DateCreated", SortOrder.Descending)).Items;
        //lps = lps.FindAll(p => p.Active && p.IsPublic && p.PublicPrice > 1000 && p.HasImage && p.ShopTotalStocks > 0);
        lps = lps.FindAll(p => p.Active);
        foreach (Product p in lps)
        {
            if (p.Category != null)
            {
                if (p.Category.Active)
                {

                    xtw.WriteStartElement("offer");
                    xtw.WriteAttributeString("id", p.ID.ToString());
                    xtw.WriteAttributeString("bid", "10");
                    xtw.WriteAttributeString("type", "vendor.model");
                    xtw.WriteAttributeString("available", p.Active ? "true" : "false");
                    xtw.WriteElementString("url", "https://mirupakovki.com" + p.UrlPath);
                    xtw.WriteElementString("price", p.ListingPrice.ToString().Replace(',', '.'));
                    xtw.WriteElementString("oldprice", p.ListingPrice.ToString().Replace(',', '.'));
                    xtw.WriteElementString("currencyId", "RUB");
                    xtw.WriteElementString("categoryId", p.CategoryID.ToString());
                    if (p.Photo.Exists || p.HasImage)
                        xtw.WriteElementString("picture", "https://mirupakovki.com" + p.ImageUrl);
                    xtw.WriteElementString("typePrefix", p.Category.Name);
                    xtw.WriteElementString("vendor", "Мир упаковки");
                    xtw.WriteElementString("vendorCode", (p.Articul == "") ? p.Name : p.Articul);
                    xtw.WriteElementString("model", (p.Articul == "") ? p.Name : p.Articul);
                    /*string descr = p.Category.Name + " арт." + p.Articul + ". Металл - золото 585 пробы.";
                    if (p.Weight > 0)
                    {
                        descr += " Средний вес - " + p.Weight.ToString() + " гр.";
                    }
                    if (!string.IsNullOrEmpty(p.InsertionDescription))
                    {
                        descr += " Вставки: " + p.InsertionDescription + ".";
                    }*/
                    xtw.WriteElementString("description", (p.Description.Html.Length < 2) ? p.Name : p.Description.Html);
                    xtw.WriteElementString("store", "false");
                    xtw.WriteElementString("pickup", "false");
                    xtw.WriteElementString("delivery", "true");
                    xtw.WriteElementString("manufacturer_warranty", "true");
                    xtw.WriteElementString("sales_notes", "Оплата: Наличные, б/н, пластиковые карты. При заказе товара отсутствующего на складе необходима предоплата товара 20%.");
                    xtw.WriteEndElement(); // offer
                }
            }
        }

        xtw.WriteEndElement(); // offers
        xtw.WriteEndElement(); // shop
        xtw.WriteEndElement(); // yml_catalog

        xtw.Flush();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    protected string zf(int i)
    {
        return i < 10 ? "0" + i.ToString() : i.ToString();
    }
}