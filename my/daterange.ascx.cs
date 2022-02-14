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

public partial class my_daterange : System.Web.UI.UserControl
{
    public delegate void OnDateRangeChanged(DateTime date1, DateTime date2);
    protected event OnDateRangeChanged dateRangeChanged;
    public event OnDateRangeChanged DateRangeChanged
    {
        add { dateRangeChanged += value; }
        remove { dateRangeChanged -= value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            tb1.Text = DateTime.Now.AddMonths(-1).ToShortDateString();
            tb2.Text = DateTime.Now.ToShortDateString();

            dateRangeChanged(DateTime.Parse(tb1.Text.Trim()), DateTime.Parse(tb2.Text.Trim()));
        }
    }
    
    protected void btnApply_Click(object sender, EventArgs e)
    {
        if (null != dateRangeChanged)
        {
            dateRangeChanged(DateTime.Parse(tb1.Text.Trim()), DateTime.Parse(tb2.Text.Trim()));
        }
    }
}