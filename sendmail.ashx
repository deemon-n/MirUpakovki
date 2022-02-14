<%@ WebHandler Language="C#" Class="sendmail" %>
using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.IO;
using System.Web;
using Quiksoft.FreeSMTP;
using MirUpak.Model;

public class sendmail : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        string strHost = context.Request.Url.Host;
        int number = GetRequestNumber();
        string subject = "Заявка #" + number.ToString() + " с сайта " + strHost;
        string from = "Заявка с сайта " + strHost;

        string fromemail = "mail@mirupakovki.com";
        string message = string.Empty;

        foreach (string key in context.Request.Form.AllKeys)
        {
            message += key + ": " + context.Request.Form[key] + "\r\n";
        }
        SmtpServer ssrv = new SmtpServer("89.208.146.168");

        string memail = "mail@mirupakovki.com";
        if (Ideal.Wision.Identity.Manager.IsAuthenticated)
        {
            Customer cust = Customer.Current;
            if (null != cust)
            {
                MuManager mgr = Schema.Managers[cust.OurManagerID];
                if (null != mgr)
                {
                    if (!string.IsNullOrEmpty(mgr.Email))
                    {
                        if (mgr.Email.IndexOf("@") > 0)
                        {
                            memail = mgr.Email;
                        }
                    }
                }
            }
        }

        SmtpMessage smsg = new SmtpMessage(new SmtpPerson(fromemail, from), new SmtpPerson(memail), subject, message, false);
        Smtp.SendMail(ssrv, smsg);
        smsg = new SmtpMessage(new SmtpPerson(fromemail, from), new SmtpPerson("marketolog@mirupakovki.com"), subject, message, false);
        Smtp.SendMail(ssrv, smsg);
        smsg = new SmtpMessage(new SmtpPerson(fromemail, from), new SmtpPerson("mirupakovki@ramedia.ru"), subject, message, false);
        Smtp.SendMail(ssrv, smsg);
        smsg = new SmtpMessage(new SmtpPerson(fromemail, from), new SmtpPerson("maximatwork@mail.ru"), subject, message, false);
        Smtp.SendMail(ssrv, smsg);

        SaveMsg(number, message);
    }

    public int GetRequestNumber()
    {
        string numberFileName = HttpContext.Current.Server.MapPath("~/messageNumber.txt");
        int number = 0;
        if (File.Exists(numberFileName))
        {
            StreamReader sr = new StreamReader(numberFileName, System.Text.Encoding.GetEncoding(1251));
            string snum = sr.ReadToEnd();
            sr.Close();
            int.TryParse(snum, out number);
        }
        number++;
        StreamWriter sw = new StreamWriter(numberFileName, false, System.Text.Encoding.GetEncoding(1251));
        sw.Write(number);
        sw.Close();

        return number;
    }

    public void SaveMsg(int number, string message)
    {
        StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath("~/messages.csv"), true, System.Text.Encoding.GetEncoding(1251));
        sw.WriteLine(number.ToString() + "," + message.Replace("\n", " ").Replace("\r", "").Replace(",", ";") + "," + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString());
        sw.Close();
    }
     
    public bool IsReusable 
    {
        get {
            return false;
        }
    }

}

public sealed class Smtp
{
    public static Exception SendMail(SmtpServer server, SmtpMessage message)
    {
        try
        {
            EmailMessage msgObj = new EmailMessage();

            msgObj.From.Email = message.Sender.Email;
            msgObj.From.Name = message.Sender.Name;

            msgObj.Recipients.Add(message.Acceptor.Email, message.Acceptor.Name, RecipientType.To);

            msgObj.Subject = message.Subject;

            msgObj.CharsetEncoding = System.Text.Encoding.UTF8; //System.Text.Encoding.GetEncoding(System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ANSICodePage);

            msgObj.BodyParts.Add(message.Body, message.IsHtml ? BodyPartFormat.HTML : BodyPartFormat.Plain);

            if (message.headers != null)
            {
                foreach (string hkey in message.headers.Keys)
                {
                    msgObj.CustomHeaders.Add(new CustomHeader(hkey, message.headers[hkey]));
                }
            }

            if (null != message.attachments)
            {
                foreach (SmtpAttachment sa in message.attachments)
                {
                    msgObj.Attachments.Add(sa.FileName, sa.DisplayName);
                }
            }

            SMTP smtpObj = new SMTP(server.ServerName);

            smtpObj.Send(msgObj);

            // erase attachments
            if (null != message.attachments)
            {
                foreach (SmtpAttachment sa in message.attachments)
                {
                    if (sa.EraseAfterTransfer)
                    {
                        try
                        {
                            System.IO.File.Delete(sa.FileName);
                        }
                        finally
                        {
                        }
                    }
                }
            }
        }
        catch (Exception e)
        {
            return e;
        }

        return null;
    }
}

public sealed class SmtpMessage
{
    SmtpPerson sender;
    public SmtpPerson Sender
    {
        get { return sender; }
    }

    SmtpPerson acceptor;
    public SmtpPerson Acceptor
    {
        get { return acceptor; }
    }

    string subject;
    public string Subject
    {
        get { return subject; }
        set { subject = value; }
    }

    string body;
    public string Body
    {
        get { return body; }
        set { body = value; }
    }

    bool isHtml;
    public bool IsHtml
    {
        get { return isHtml; }
        set { isHtml = value; }
    }

    internal NameValueCollection headers = null;
    public NameValueCollection Headers
    {
        get
        {
            if (headers == null)
                headers = new NameValueCollection();

            return headers;
        }
    }

    internal List<SmtpAttachment> attachments;

    public void AddAttachment(SmtpAttachment attachment)
    {
        if (null == attachments)
            attachments = new List<SmtpAttachment>();

        attachments.Add(attachment);
    }

    public SmtpMessage(SmtpPerson sender, SmtpPerson acceptor, string subject, string body, bool isHtml)
    {
        if (null == sender)
            throw new ArgumentNullException("sender");

        if (null == acceptor)
            throw new ArgumentNullException("acceptor");

        this.sender = sender;
        this.acceptor = acceptor;
        this.subject = subject;
        this.body = body;
        this.isHtml = isHtml;
    }

    public SmtpMessage(SmtpPerson sender, SmtpPerson acceptor, bool isHtml)
        : this(sender, acceptor, "", "", isHtml)
    {
    }
}

public sealed class SmtpPerson
{
    string email = "";
    public string Email
    {
        get { return email; }
    }

    string name = "";
    public string Name
    {
        get { return name; }
    }

    public SmtpPerson(string email)
        : this(email, string.Empty)
    {
    }

    public SmtpPerson(string email, string name)
    {
        if (null == email)
            throw new ArgumentNullException("email");

        if (null == name)
            throw new ArgumentNullException("name");

        if (string.Empty == email)
            throw new ArgumentException("Email cannot be empty string", "email");

        this.email = email;
        this.name = name;
    }
}

public sealed class SmtpAttachment
{
    string fileName;
    public string FileName
    {
        get { return fileName; }
    }

    string displayName = "";
    public string DisplayName
    {
        get { return displayName; }
    }

    bool eraseAfterTransfer = false;
    public bool EraseAfterTransfer
    {
        get { return eraseAfterTransfer; }
    }

    public SmtpAttachment(string fileName)
        : this(fileName, "", false)
    {
    }

    public SmtpAttachment(string fileName, string displayName)
        : this(fileName, displayName, false)
    {
    }

    public SmtpAttachment(string fileName, string displayName, bool eraseAfterTransfer)
    {
        if (null == fileName)
            throw new ArgumentNullException("fileName");

        if (null == displayName)
            throw new ArgumentNullException("displayName");

        if (string.Empty == fileName)
            throw new ArgumentException("File name cannot be empty string", "fileName");

        if (!System.IO.File.Exists(fileName))
            throw new ArgumentException(string.Format("File {0} not exists", fileName), "fileName");

        this.fileName = fileName;
        this.displayName = displayName;
        this.eraseAfterTransfer = eraseAfterTransfer;
    }
}

public sealed class SmtpServer
{
    string serverName;
    public string ServerName
    {
        get { return serverName; }
        set { serverName = value; }
    }

    public SmtpServer(string serverName)
    {
        if (null == serverName)
            throw new ArgumentNullException("serverName");

        if (string.Empty == serverName)
            throw new ArgumentException("Server name cannot be empty string", "serverName");

        this.serverName = serverName;
    }
}