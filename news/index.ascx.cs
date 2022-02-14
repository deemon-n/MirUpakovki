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
using Ideal.Wision.Wislets.Model;

public partial class news_index : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "НОВОСТИ";
        NewsList nl = NewsList.ActiveLists.Items.Find(delegate(NewsList _nl) { return _nl.Name.Equals("Основной", StringComparison.CurrentCultureIgnoreCase); });
        if (null != nl)
            xlvNews.List = nl.GetLatestNews(60);
    }
}