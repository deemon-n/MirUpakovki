<%@ WebHandler Language="C#" Class="cart" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class cart : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string pid = context.Request["pid"];
        string scount = context.Request["count"];
        int count = 0;
        if (null != pid)
        {
            MirUpak.Model.Product prod = MirUpak.Model.Schema.Products[int.Parse(pid)];
            if (null != prod)
            {
                if (!String.IsNullOrEmpty(scount) && int.TryParse(scount, out count))
                {
                    Ideal.Core.Settings.SettingsCollection sc = new Ideal.Core.Settings.SettingsCollection();
                    sc.SetSettingsValue("count", count.ToString());

                    Ideal.Commerce.Engine.Current.CurrentCart.Items.Add(prod, count);
                    string jsonYaMetrika = JSONProduct.AddProducts.GetJSON(prod, count);
                    context.Response.Write(jsonYaMetrika);
                }
                else
                {
                    Ideal.Commerce.Engine.Current.CurrentCart.Items.Add(prod);
                    string jsonYaMetrika = JSONProduct.AddProducts.GetJSON(prod, 1);
                    context.Response.Write(jsonYaMetrika);
                }                
            }
            else
                context.Response.Write("null");
        }
        else
            context.Response.Write("null");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}