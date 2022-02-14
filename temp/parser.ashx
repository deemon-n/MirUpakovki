<%@ WebHandler Language="C#" Class="parser" %>
using System;
using System.Xml;
using System.Web;
using MirUpak.Model;

public class parser : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        /*context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        int iPTotals = 0;
        int iPUpdated = 0;
        int iPAdded = 0;

        foreach (XmlNode xn in doc.SelectNodes("/root/Groups/item"))
        {
            try
            {
                string groupID = getStr(xn, "GroupID");
                string name = getStr(xn, "Name");

                ProductCategory pc = ProductCategory.GetByName(name);

                foreach (XmlNode xn2 in xn.SelectNodes("./Items/item"))
                {
                    iPTotals++;
                    string elementId = getStr(xn2, "ElementId").Trim();
                    string pname = getStr(xn2, "Name");
                    string article = getStr(xn2, "Article");
                    string code = getStr(xn2, "Code");
                    int count = getInt(xn2, "Count");

                    Guid pid = new Guid(elementId);
                    Product p = Schema.Products.SelectSingle("GID = @1", pid);
                    if (null == p)
                    {
                        p = Schema.Products.CreateNew();
                        p.GID = pid;
                        iPAdded++;
                    }
                    if (p.Name != pname || p.Articul != article || p.Code != code || p.Count != count)
                    {
                        p.Name = pname;
                        p.Articul = article;
                        p.Code = code;
                        p.Count = count;
                        p.Update();
                        iPUpdated++;
                    }
                }
            }
            catch (Exception ex)
            {
                rml.Add(new ReportMessage("Exception " + ex.Message));
            }
        }*/
            
    }

    /*private static string getStr(XmlNode xn, string attr)
    {
        string str = string.Empty;

        XmlAttribute xa = xn.Attributes[attr];
        if (null != xa)
        {
            str = xa.Value;
        }
        else
        {
            XmlNode _xn = xn.SelectSingleNode(attr);
            if (null == _xn)
                return string.Empty;
            str = _xn.InnerText;
        }

        if (string.IsNullOrEmpty(str))
            return string.Empty;
        return str.Trim();
    }

    private static int getInt(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        if (string.IsNullOrEmpty(str))
            return 0;
        return int.Parse(str.Replace('\xa0', ' ').Replace(" ", "").Replace(" ", ""));
    }

    private static double getDbl(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        if (string.IsNullOrEmpty(str))
            return 0;
        return double.Parse(str.Replace('.', ','));
    }

    private static bool getBool(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        return str == "1";
    }*/

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}