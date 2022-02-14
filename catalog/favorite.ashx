<%@ WebHandler Language="C#" Class="favorite" %>

using System;
using System.Web;

public class favorite : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        context.Response.ContentType = "text/html";

        string result = "0";
        string spid = context.Request["pid"];
        int pid = 0;
        string stype = context.Request["type"];

        if (!String.IsNullOrEmpty(stype))
        {
            if (stype == "add")
            {
                try
                {
                    if (!String.IsNullOrEmpty(spid) && int.TryParse(spid, out pid))
                    {
                        MirUpak.Model.Product Product = MirUpak.Model.Schema.Products[pid];
                        /*Сохранение в coo*/
                        MirUpak.Model.LastViewed.Add(Product);
                        MirUpak.Model.LastViewed.Save();
                        result = "1";
                    }
                }
                catch { }
            }
            else if (stype == "del")
            {
                try
                {
                    if (!String.IsNullOrEmpty(spid) && int.TryParse(spid, out pid))
                    {
                        //удаление
                        MirUpak.Model.Product Product = MirUpak.Model.Schema.Products[pid];
                        /*Сохранение в coo*/
                        MirUpak.Model.LastViewed.Del(Product);
                        MirUpak.Model.LastViewed.Save();
                        result = "1";
                    }
                }
                catch { }
            }   
        }

        context.Response.Write(result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}