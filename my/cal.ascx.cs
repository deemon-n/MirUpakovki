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
using Ideal.Wision.Schema;
using Ideal.Wision;
using System.Text;
using MirUpak.Model;
using System.Collections.Generic;
using Ideal.Wision.Identity;

public partial class my_cal : UserWintrol
{
    protected double Total = 0;
    protected double Current = 0;
    protected double Outdated = 0;
    protected int Deferment = 0;

    protected void Page_Init(object sender, EventArgs e)
    {
        dr.DateRangeChanged += new my_daterange.OnDateRangeChanged(dr_DateRangeChanged);
    }

    protected void Page_Load(object sender, EventArgs e)
    {   
        Env.CurrentLayout.ContentTitle = "График платежей";
    }

    void dr_DateRangeChanged(DateTime date1, DateTime date2)
    {
        /*DateTime currentMonday = DateTime.Now.Date.AddDays(((int)DateTime.Now.DayOfWeek - 1) * -1);
        DateTime firstMonday = currentMonday.AddDays(-28);
        DateTime lastSunday = currentMonday.AddDays(55);

        StringBuilder sb = new StringBuilder();
        Customer cust = Customer.Current;
        List<Order> los = cust.Orders;

        DateTime dt = firstMonday;
        sb.Append("<table class='data'>");
        while (true)
        {
            string mh = string.Empty;
            string[] ss = new string[7];
            DateTime dt1 = dt;
            DateTime dt2 = dt;

            for (int i = 0; i < 7; i++)
            {
                dt2 = dt;

                ss[i] = "<large>" + dt.Day + "</large>";

                foreach (Order ord in los)
                {
                    if (ord.Date.Date.AddDays(cust.Deferment) == dt)
                    {
                        string _s = "<a href='order-details.aspx?id=" + ord.ID.ToString() + "' target='_blank'>" + ord.Number + "</a> " + ord.Amount.ToString("n2") + " руб.";
                        if (dt < DateTime.Now.Date)
                            _s = "<span style='color:red;'>" + _s + "</span>";
                        ss[i] += _s;
                    }
                }

                dt = dt.AddDays(1);
            }
            if (dt1.Month != dt2.Month)
            {
                mh = string.Format("{0:MM} {0:yyyy}", dt2);
            }


            sb.AppendFormat("<tr><td>{0}", mh);
            for (int i = 0; i < 7; i++)
            {
                sb.Append("<td align='center'>" + ss[i]);
            }

            if (dt > lastSunday)
                break;
        }
        sb.Append("</table>");

        ltCal.Text = sb.ToString();*/

        TimeSpan ts = date2 - date1;
        int qty = Convert.ToInt32(ts.TotalDays) + 1;
        double[] amount = new double[qty];

        Customer cust = Customer.Current;
        Deferment = cust.Deferment;
        List<Order> los = cust.Orders;

        foreach (Order ord in los)
        {
            if (ord.Debt > 0)
            {
                Total += ord.Debt;

                if (ord.OutdatedDays > 0)
                {
                    Outdated += ord.OutdatedDebt;
                }
                else
                {
                    Current += ord.Debt;
                }
            }

            if (ord.Date >= date1 && ord.Date <= date2)
            {
                ts = ord.Date - date1;
                amount[(int)ts.TotalDays] += ord.Amount;
            }
        }

        double max = 0;
        for (int i = 0; i < amount.Length; i++)
        {
            if (amount[i] > max)
                max = amount[i];
        }

        StringBuilder sb1 = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        for (int i = 0; i < amount.Length; i++)
        {
            sb1.Append("<th>" + date1.AddDays(i).ToString("d MMM").ToUpper() + "</th>");
            if (amount[i] > 0)
            {
                sb2.AppendFormat("<td><div>{0:n2}Р</div><div class=\"bar\" style=\"height:{1}px\">&nbsp;</div></td>",
                    amount[i], Convert.ToInt32(190 * amount[i] / max));
            }
            else
            {
                sb2.Append("<td><div class=\"ebar\"></td>");
            }
        }

        ltCal.Text = "<table><tr>" + sb1.ToString() + "</tr><tr>" + sb2.ToString() + "</tr></table>";
    }
}