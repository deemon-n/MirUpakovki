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
using System.Collections.Generic;

public partial class my_oorders : UserWintrol
{
    protected double Total = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Кредиторская задолженность";

        List<Order> los = Customer.Current.OutdatedOrders;
        xlvOrders.List = los;

        foreach (Order ord in los)
        {
            Total += ord.Amount;
        }
    }
}
