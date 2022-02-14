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
using Ideal.Core.Net;

public partial class job_index : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Вакансии";
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string subj = "Вакансия с сайта";
            if (tbSubject.Text.Trim().Length > 0)
                subj += ": " + tbSubject.Text.Trim();
            string body = String.Format(@"
<table cellpadding='3' border='1'>
    <tr>
        <td>Имя:</td>
        <td>{0}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>{1}</td>
    </tr>
    <tr>
        <td>Тема:</td>
        <td>{2}</td>
    </tr>
</table>
<br>Сообщение:<br><br>{3}", tbName.Text.Trim(), tbEmail.Text.Trim(), tbSubject.Text.Trim(), tbText.Text.Trim());

            SmtpPerson spFrom = new SmtpPerson((tbEmail.Text.Trim().Length > 0) ? tbEmail.Text.Trim() : "personal@mirupakovki.com", tbName.Text.Trim());
            SmtpMessage msg = new SmtpMessage(spFrom, new SmtpPerson("personal@mirupakovki.com"), subj, body, true);
            if (!string.IsNullOrEmpty(fuResume.FileName))
            {
                string path = Env.Server.MapPath("~/i/u/" + System.IO.Path.GetFileName(fuResume.FileName));
                fuResume.SaveAs(path);
                msg.AddAttachment(new SmtpAttachment(path, System.IO.Path.GetFileName(fuResume.FileName), true));
            }
            Ideal.Wision.IO.Mail.Send(msg);

            pnlForm.Visible = false;
            pnlThanks.Visible = true;
        }
    }
}