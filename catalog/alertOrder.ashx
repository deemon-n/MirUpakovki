<%@ WebHandler Language="C#" Class="alertOrder" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class alertOrder : IHttpHandler {    
        
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string result = "0";
        string snumber = context.Request["number"];
        int number = 0;

        try
        {
            if (!String.IsNullOrEmpty(snumber) && int.TryParse(snumber, out number))
            {
                number++;
                Ideal.Commerce.Order o = Ideal.Commerce.Engine.Current.GetOrder(number);
                if (null != o)
                    result = "1";
            }
        }
        catch { }        
        
        context.Response.Write(result);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}