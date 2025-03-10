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

        xtw.WriteStartElement("rss");
        xtw.WriteAttributeString("xmlns:g", "http://base.google.com/ns/1.0");
        xtw.WriteAttributeString("version", "2.0");

        xtw.WriteStartElement("channel");

        xtw.WriteElementString("title", "ћир упаковки");
        xtw.WriteElementString("description", "ћир упаковки - одна из ведущих компаний по поставке широкого спектра промышленной и пищевой упаковки, канцел€рских товаров известных брендов, офисных принадлежностей и расходных материалов дл€ всей оргтехники");
        xtw.WriteElementString("link", "https://mirupakovki.com/");

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
                    xtw.WriteStartElement("item");

                    xtw.WriteElementString("title", p.Name);
                    xtw.WriteElementString("link", "https://mirupakovki.com" + p.UrlPath);
                    xtw.WriteElementString("description", p.Description.Html);

                    xtw.WriteElementString("g:brand", "ћир упаковки");
                    xtw.WriteElementString("g:condition", "new");
                    if (p.Photo.Exists || p.HasImage)
                    {
                        xtw.WriteElementString("g:image_link", "https://mirupakovki.com" + p.ImageUrl);
                    }
                    xtw.WriteElementString("g:mpn", p.Articul);
                    //https://www.google.com/basepages/producttype/taxonomy-with-ids.en-US.txt
                    xtw.WriteElementString("g:google_product_category", "188");
                    xtw.WriteElementString("g:id", p.ID.ToString());
                    xtw.WriteElementString("g:price", p.ListingPrice.ToString().Replace(',', '.') + " RUB");
                    xtw.WriteElementString("g:product_type", p.Category.Name);
                    xtw.WriteElementString("g:quantity", "1");
                    xtw.WriteElementString("g:shipping_weight", p.Weight.ToString().Replace(',', '.') + " g");
                    xtw.WriteElementString("g:availability", "in stock");

                    xtw.WriteEndElement(); // item
                }
            }
        }

        xtw.WriteEndElement(); // channel
        xtw.WriteEndElement(); // rss

        xtw.Flush();    
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}