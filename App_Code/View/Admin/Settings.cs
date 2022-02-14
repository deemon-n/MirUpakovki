using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using System.Web.UI.WebControls;
using Ideal.Wision.Schema;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using System.Text.RegularExpressions;

namespace BravoStar
{
    [AdminWintrol("{EF488E8B-0C6A-4283-85EE-D46538EE988B}", typeof(MuAdminGroup), "Настройки сайта", "Управление настройками сайта")]
    public class Settings : Wintrol
    {
        Button btnSave = null;
        TextBox tbOrderEmail = null;

        public Settings()
        {
            this.Init += new EventHandler(Settings_Init);
        }

        void Settings_Init(object sender, EventArgs e)
        {
            this.ID = "Settings";

            btnSave = new Button();
            btnSave.Text = "Сохранить";
            btnSave.Click += new EventHandler(btnSave_Click);

            tbOrderEmail = new TextBox();
            tbOrderEmail.ID = "tbOE";
            tbOrderEmail.EnableViewState = false;
            tbOrderEmail.Width = Unit.Pixel(300);
            tbOrderEmail.Text = Variables.OrderEmail;

            HtmlTable table = new HtmlTable();

            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();
            row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
            cell = new HtmlTableCell();
            cell.InnerText = "Email для заказов";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.Controls.Add(tbOrderEmail);
            row.Cells.Add(cell);
            table.Rows.Add(row);

            this.Controls.Add(table);
            this.Controls.Add(btnSave);
        }

        void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            Variables.OrderEmail = tbOrderEmail.Text.Trim();

            Env.RegisterStartupMessage("settingsWasSaved", "Настройки успешно сохранены.");
        }
    }
}