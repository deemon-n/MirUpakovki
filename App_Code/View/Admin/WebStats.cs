using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Schema;
using Ideal.WebTruth.Controls;

namespace Berendeevka
{
    [AdminWintrol("{2838F88C-57F4-4268-8AA1-F3729533A187}", typeof(MuAdminGroup), "Веб-статистика", "Статистика посещений")]
    public sealed class WebStats : Wintrol
    {
        static WebStats()
        {
            Ideal.WebTruth.Parser.Collector.Initialize(Ideal.Wision.Core.WisionApplication.DefaultBackendAdapter);
        }

        public WebStats()
        {
            this.Init += new EventHandler(WebStats_Init);
        }

        void WebStats_Init(object sender, EventArgs e)
        {
            WebTruthAnalyzer wta = new WebTruthAnalyzer();
            wta.ID = "wta";
            this.Controls.Add(wta);
        }
    }
}