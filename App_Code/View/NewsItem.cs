using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema;
using Ideal.Wision.Controls;
using Ideal.Wision;
using Ideal.Wision.Wislets.Model;

namespace MirUpak
{
    public sealed class NewsItem : Wintrol
    {
        XsltView xvNewsItem;

        public NewsItem()
        {
            this.Init += new EventHandler(NewsItem_Init);
        }

        void NewsItem_Init(object sender, EventArgs e)
        {
            NewsTitle ni = NewsTitle.GetByID(new Guid(Env.WisionContext.GetRxKeyValue("niid")));
            if (ni == null)
                Env.PageNotFound();

            Env.CurrentLayout.ContentTitle = ni.Name;

            xvNewsItem = new XsltView();
            xvNewsItem.ID = "xvni";
            xvNewsItem.StyleSheetLocation = "~/xsl/newsitem.xsl";
            xvNewsItem.XmlItem = ni;

            this.Controls.Add(xvNewsItem);
        }
    }
}