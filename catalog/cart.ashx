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
                    }
                    else
                    {
                        Ideal.Commerce.Engine.Current.CurrentCart.Items.Add(prod);
                    }
                }            
        }

        Ideal.Commerce.Cart ca = MirUpak.Model.Commerce.Engine.CurrentCart;
        if (ca.IsEmpty)            
            context.Response.Write("пуста");
        else
        context.Response.Write(string.Format("Услуг: <b id='count-service'>{0}</b> на <b id='price-service'>{1:n2}</b> руб.", ca.Items.Count, ca.TotalAmount));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }    
}