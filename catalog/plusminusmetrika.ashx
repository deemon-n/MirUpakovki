<%@ WebHandler Language="C#" Class="plusminusmetrika" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class plusminusmetrika : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string type = context.Request["type"];
        string pid = context.Request["pid"];
        MirUpak.Model.Product prod = MirUpak.Model.Schema.Products[int.Parse(pid)];
        if (!string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(pid) && prod != null)
        {
            if (type == "plus")
            {
                string jsonYaMetrika = JSONProduct.AddProducts.GetJSON(prod, 1);
                context.Response.Write(jsonYaMetrika);
            }
            else if (type == "minus")
            {
                string jsonYaMetrika = JSONProduct.RemoveProducts.GetJSON(prod, 1);
                context.Response.Write(jsonYaMetrika);
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