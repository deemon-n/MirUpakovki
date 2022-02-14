using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using Ideal.Wision.Schema;
using MirUpak.Model;
using Ideal.Wision.Identity;

public partial class my_orderdetails : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string soid = Env.Request["id"];
        int oid = int.Parse(soid);
        Order o = Schema.Orders[oid];
        if (null == o)
            Env.PageNotFound();
        if (o.INN != Customer.Current.ID)
            Env.PageNotFound();

        Env.CurrentLayout.ContentTitle = "Заказ №" + o.Number;

        xlvOrderItems.List = o.Items;
    }
}
