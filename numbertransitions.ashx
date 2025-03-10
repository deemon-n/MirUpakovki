<%@ WebHandler Language="C#" Class="numbertransitions" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;
using MirUpak.Model;

public class numbertransitions : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        context.Response.ContentType = "text/html";
        string sid = context.Request["id"];
        int id = 0;

        if (!String.IsNullOrEmpty(sid) && int.TryParse(sid, out id))
        {
            Ad ad = Schema.Ads.SelectKey(id);
            if (null != ad)
            {
                int count = ad.NumberTransitions;
                count++;
                ad.NumberTransitions = count;
                ad.Update();
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}