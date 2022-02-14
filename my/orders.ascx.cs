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
using Ideal.UI.Web;
using System.Collections.Generic;
using Ideal.Wision.Identity;

public partial class my_orders : UserWintrol
{
    DropDownList ddlStatus;

    protected void Page_Init(object sender, EventArgs e)
    {
        phState.Controls.Add(Factory.CreateLiteralViewstateless("<div style='float:right'>статус: "));

        ddlStatus = new DropDownList();
        ddlStatus.ID = "ddlStatus";
        phState.Controls.Add(ddlStatus);

        phState.Controls.Add(Factory.CreateLiteralViewstateless("</div>"));

        dr.DateRangeChanged += new my_daterange.OnDateRangeChanged(dr_DateRangeChanged);
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "История заказов";

        if (!Page.IsPostBack)
        {
            ddlStatus.Items.Add(new ListItem("Любой", ""));
            List<Order> los = Customer.Current.Orders;
            List<string> lss = new List<string>();
            foreach (Order ord in los)
            {
                int ix = lss.BinarySearch(ord.State);
                if (ix < 0)
                {
                    lss.Insert(~ix, ord.State);
                }
            }
            foreach (string s in lss)
            {
                ddlStatus.Items.Add(s);
            }
        }
    }

    void dr_DateRangeChanged(DateTime date1, DateTime date2)
    {
        List<Order> los = Customer.Current.GetOrders(date1, date2);

        //los = los.FindAll(delegate(Order ord) { return ord.Date >= df.DateFrom && ord.Date <= df.DateTo; });

        if (ddlStatus.SelectedValue.Length > 0)
        {
            los = los.FindAll(delegate(Order ord) { return ord.State == ddlStatus.SelectedValue; });
        }

        xlvOrders.List = los;
    }
}