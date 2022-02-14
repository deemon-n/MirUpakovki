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
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Identity;

public partial class my_acts : UserWintrol
{
    protected void Page_Init(object sender, EventArgs e)
    {
        dr.DateRangeChanged += new my_daterange.OnDateRangeChanged(dr_DateRangeChanged);
    }

    void dr_DateRangeChanged(DateTime date1, DateTime date2)
    {
        List<Tran> lts = Customer.Current.Trans;

        double initial = 0;
        foreach (Tran t in lts)
        {
            if (t.Date < date1)
            {
                initial += (t.Amount * (t.Debt ? 1 : -1));
            }
        }

        StringBuilder sb = new StringBuilder();
        sb.AppendFormat(@"
<table class='data'>
<tr>
<th colspan='5' width='49%'>По данным ООО 'Мир Упаковки'
<th colspan='5' width='49%'>По данным {0}
</tr>
<tr>
<td>№ П/П<td>Дата<td>Документ<td>Дебет<td>Кредит
<td>№ П/П<td>Дата<td>Документ<td>Дебет<td>Кредит
<tr>
<td>Сальдо начальное<td><td><b>{1}</b><td><b>{2}</b>
<td>Сальдо начальное<td><td><td>", Customer.Current.Name.Replace("\"", "'"),
             initial >= 0 ? initial.ToString("n2") : "",
             initial < 0 ? (initial * -1).ToString("n2") : "");

        double debit = 0, credit = 0;
        int count = 1;
        foreach (Tran t in lts)
        {
            if (t.Date >= date1 && t.Date <= date2.AddDays(1))
            {
                sb.AppendFormat(@"
<tr>
<td>{4}<td>{0:d}<td>{1}<td>{2}<td>{3}
<td>{4}<td><td><td><td>
</tr>", t.Date, t.Doc, t.Debt ? t.Amount.ToString("n2") : "", t.Debt ? "" : t.Amount.ToString("n2"), count);
                initial += (t.Amount * (t.Debt ? 1 : -1));
                if (t.Debt)
                    debit += t.Amount;
                else
                    credit += t.Amount;
            }
            count++;
        }

        sb.AppendFormat(@"
<tr>
<td>Обороты за период<td><td><b>{0:n2}</b><td><b>{1:n2}</b>
<td>Обороты за период<td><td><td>
<tr>
<td>Сальдо конечное<td><td><b>{2}</b><td><b>{3}</b>
<td>Сальдо конечное<td><td><td>
</table>", debit, credit,
         initial >= 0 ? initial.ToString("n2") : "",
        initial < 0 ? (initial * -1).ToString("n2") : "");

        ltActs.Text = sb.ToString();
    }    

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Акт сверки";
    }
}