<%@ WebHandler Language="C#" Class="cartRefresh" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class cartRefresh : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string count = context.Request["count"];
        string name = context.Request["name"];
        string qias = string.Empty;
        string cias = string.Empty;
        
        Ideal.Commerce.Cart ca =  MirUpak.Model.Commerce.Engine.CurrentCart;

        if (!String.IsNullOrEmpty(count) && !String.IsNullOrEmpty(name) && name.Substring(0, 3).ToLower() == "qty")
        {            
            Ideal.Commerce.CartItem ci = ca.Items.GetItem(new Guid((name.Remove(0, 3))));
            if (null != ci)
            {
                int qty = 0;
                if (Int32.TryParse(count, out qty))
                {
                    if (qty < 0) //if (qty <= 0) - если нужно удалять при вводе 0
                        ci.Remove();
                    else
                    {
                        ci.Quantity = qty;
                        ci.Update();
                    }
                }
                qias = ci.Amount.ToString("N2");
                cias = ci.ID.ToString();
            }
        }

        context.Response.Write(string.Format("{0}|{1} руб.|{2} руб.|{3}", count, ca.TotalAmount.ToString("N2"), qias, cias));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}