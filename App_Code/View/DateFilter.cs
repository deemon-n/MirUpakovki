using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.UI.Web;
using Ideal.Wision;

public sealed class DateFilter : Control, IPostBackEventHandler
{
    public DateTime DateFrom;
    public DateTime DateTo;

    DropDownList ddlDateRange;
    Literal ltDateRange;

    Panel pnlView;

    DateTime dtCustomFrom = DateTime.Now.AddDays(-7);
    DateTime dtCustomTo = DateTime.Now;

    Panel pnlCustomDates;

    DropDownList ddlCDDayFrom;
    DropDownList ddlCDMonthFrom;
    DropDownList ddlCDYearFrom;

    DropDownList ddlCDDayTo;
    DropDownList ddlCDMonthTo;
    DropDownList ddlCDYearTo;

    public DateFilter()
    {
        this.Init += new EventHandler(DateFilter_Init);
        this.Load += new EventHandler(DateFilter_Load);
        this.PreRender += new EventHandler(DateFilter_PreRender);
    }

    void DateFilter_PreRender(object sender, EventArgs e)
    {
        ltDateRange.Text = string.Format(" (сейчас: с <b>{0}</b> по <b>{1}</b>)",
            DateFrom.ToShortDateString(), DateTo.ToShortDateString());
    }

    void DateFilter_Init(object sender, EventArgs e)
    {
        this.Page.RequiresControlState(this);

        pnlView = new Panel();
        pnlView.ID = "pv";
        this.Controls.Add(pnlView);

        Literal lt = new Literal();
        lt.ID = "lt";
        lt.EnableViewState = false;
        lt.Text = "Показать за: ";
        pnlView.Controls.Add(lt);

        ddlDateRange = new DropDownList();
        ddlDateRange.ID = "ddlDR";
        ddlDateRange.EnableViewState = true;
        ddlDateRange.Items.Add(new ListItem("сегодня", "today"));
        ddlDateRange.Items.Add(new ListItem("вчера", "yesterday"));
        ddlDateRange.Items.Add(new ListItem("эту неделю", "week"));
        ddlDateRange.Items.Add(new ListItem("этот месяц", "month"));
        ddlDateRange.Items.Add(new ListItem("последний месяц", "lastmonth"));
        ddlDateRange.Items.Add(new ListItem("выбранный период", "custom"));
        ddlDateRange.Items.Add(new ListItem("все", "all"));
        ddlDateRange.AutoPostBack = true;
        ddlDateRange.SelectedIndexChanged += new EventHandler(ddlDateRange_SelectedIndexChanged);
        if (!Page.IsPostBack)
        {
            ddlDateRange.SelectedIndex = 0;
        }
        pnlView.Controls.Add(ddlDateRange);

        ltDateRange = new Literal();
        ltDateRange.EnableViewState = false;
        ltDateRange.ID = "ltDR";
        pnlView.Controls.Add(ltDateRange);

        // custom date
        pnlCustomDates = new Panel();
        pnlCustomDates.ID = "pnlCD";
        pnlCustomDates.CssClass = "cdate";
        pnlView.Controls.Add(pnlCustomDates);

        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless("Диапазон: с "));

        int nyear = DateTime.Now.Year;
        ddlCDDayFrom = CreateDropDown("ddlcddayf", 1, 31);
        ddlCDMonthFrom = CreateDropDown("ddlcdmonf", 1, 12);
        ddlCDYearFrom = CreateDropDown("ddlcdyearf", nyear - 5, nyear);
        pnlCustomDates.Controls.Add(ddlCDDayFrom);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" . "));
        pnlCustomDates.Controls.Add(ddlCDMonthFrom);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" . "));
        pnlCustomDates.Controls.Add(ddlCDYearFrom);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" по "));

        ddlCDDayTo = CreateDropDown("ddlcddayt", 1, 31);
        ddlCDMonthTo = CreateDropDown("ddlcdmont", 1, 12);
        ddlCDYearTo = CreateDropDown("ddlcdyeart", nyear - 5, nyear);
        pnlCustomDates.Controls.Add(ddlCDDayTo);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" . "));
        pnlCustomDates.Controls.Add(ddlCDMonthTo);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" . "));
        pnlCustomDates.Controls.Add(ddlCDYearTo);
        pnlCustomDates.Controls.Add(Factory.CreateLiteralViewstateless(" &nbsp; "));
        Button btnCDApply = Factory.CreateButton("btnCDApply", "Показать");
        btnCDApply.Click += new EventHandler(btnCDApply_Click);
        pnlCustomDates.Controls.Add(btnCDApply);

    }

    void DateFilter_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pnlCustomDates.Visible = false;

            DateTime dtNow = DateTime.Now;
            DateTime dtLW = DateTime.Now.AddDays(-7);
            ddlCDDayFrom.SelectedIndex = -1; foreach (ListItem li in ddlCDDayFrom.Items) { if (li.Value == dtLW.Day.ToString()) { li.Selected = true; break; } }
            ddlCDMonthFrom.SelectedIndex = -1; foreach (ListItem li in ddlCDMonthFrom.Items) { if (li.Value == dtLW.Month.ToString()) { li.Selected = true; break; } }
            ddlCDYearFrom.SelectedIndex = -1; foreach (ListItem li in ddlCDYearFrom.Items) { if (li.Value == dtLW.Year.ToString()) { li.Selected = true; break; } }
            ddlCDDayTo.SelectedIndex = -1; foreach (ListItem li in ddlCDDayTo.Items) { if (li.Value == dtNow.Day.ToString()) { li.Selected = true; break; } }
            ddlCDMonthTo.SelectedIndex = -1; foreach (ListItem li in ddlCDMonthTo.Items) { if (li.Value == dtNow.Month.ToString()) { li.Selected = true; break; } }
            ddlCDYearTo.SelectedIndex = -1; foreach (ListItem li in ddlCDYearTo.Items) { if (li.Value == dtNow.Year.ToString()) { li.Selected = true; break; } }
        }

        FilterLoad();
    }

    private void FilterLoad()
    {
        DateTime dtFrom = new DateTime(2000, 1, 1);
        DateTime dtNow = DateTime.Now;
        DateTime dtTo = dtNow;

        switch (ddlDateRange.SelectedValue)
        {
            case "today": dtFrom = new DateTime(dtNow.Year, dtNow.Month, dtNow.Day); break;
            case "yesterday": dtTo = new DateTime(dtNow.Year, dtNow.Month, dtNow.Day); dtFrom = dtTo.AddDays(-1); break;
            case "week": dtFrom = dtNow.AddDays(-7); break;
            case "month": dtFrom = new DateTime(dtNow.Year, dtNow.Month, 1); break;
            case "lastmonth": dtFrom = dtNow.AddMonths(-1); break;
            case "custom": dtFrom = dtCustomFrom; dtTo = dtCustomTo; break;
        }

        DateFrom = dtFrom;
        DateTo = dtTo;
    }

    void ddlDateRange_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlCustomDates.Visible = ddlDateRange.SelectedValue == "custom";
    }

    void btnCDApply_Click(object sender, EventArgs e)
    {
        DateTime dtCD1;
        DateTime dtCD2;

        try
        {
            dtCD1 = new DateTime(int.Parse(ddlCDYearFrom.SelectedValue),
                int.Parse(ddlCDMonthFrom.SelectedValue), int.Parse(ddlCDDayFrom.SelectedValue));
        }
        catch
        {
            Env.RegisterStartupMessage("dt1", "Неверно выбрана исходная дата!");
            return;
        }

        try
        {
            dtCD2 = new DateTime(int.Parse(ddlCDYearTo.SelectedValue),
                int.Parse(ddlCDMonthTo.SelectedValue), int.Parse(ddlCDDayTo.SelectedValue));
        }
        catch
        {
            Env.RegisterStartupMessage("dt2", "Неверно выбрана конечная дата!");
            return;
        }

        if (dtCD2 < dtCD1)
        {
            Env.RegisterStartupMessage("dt2l1", "Конечная дата меньше исходной!");
            return;
        }

        this.dtCustomFrom = dtCD1;
        this.dtCustomTo = dtCD2;

        DateFrom = dtCD1;
        DateTo = dtCD2;
    }

    private DropDownList CreateDropDown(string id, int iFrom, int iTo)
    {
        DropDownList ddl = new DropDownList();
        ddl.ID = id;
        for (int i = iFrom; i <= iTo; i++)
        {
            ListItem li = new ListItem(i.ToString(), i.ToString());
            ddl.Items.Add(li);
        }

        return ddl;
    }

    #region control state

    protected override object SaveControlState()
    {
        object obj = base.SaveControlState();

        object[] objcs = new object[2];
        objcs[0] = this.dtCustomFrom;
        objcs[1] = this.dtCustomTo;

        if (obj != null)
        {
            return new Pair(obj, objcs);
        }
        else
        {
            return objcs;
        }
    }

    protected override void LoadControlState(object savedState)
    {
        object[] objcs = null;

        if (savedState != null)
        {
            Pair p = savedState as Pair;
            if (p != null)
            {
                base.LoadControlState(p.First);
                objcs = (object[])p.Second;

            }
            else
            {
                objcs = (object[])savedState;
            }
        }

        this.dtCustomFrom = (DateTime)objcs[0];
        this.dtCustomTo = (DateTime)objcs[1];
    }
    #endregion

    #region IPostBackEventHandler Members

    public void RaisePostBackEvent(string eventArgument)
    {

    }

    #endregion
}