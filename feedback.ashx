<%@ WebHandler Language="C#" Class="feedback" %>

using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.IO;
using System.Web;
using Quiksoft.FreeSMTP;
using MirUpak.Model;
using Ideal.Core.Net;
using Ideal.Wision.IO;

public class feedback : IHttpHandler
{

    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string type = context.Request["type"];

        SmtpPerson sp = new SmtpPerson("info@ramedia.ru", "���������� �����");
        SmtpPerson sa;
        SmtpMessage sm;

        if (type == "complaint")
        {
            string firstnamecomplaint = context.Request["firstnamecomplaint"];
            string phonecomplaint = context.Request["phonecomplaint"];
            string lastnamecomplaint = context.Request["lastnamecomplaint"];
            string mailcomplaint = context.Request["mailcomplaint"];
            string infocomplaint = context.Request["infocomplaint"];

            string subject = "��������� � ����� ��� ��������. ������ � �����������";
            string from = "��������� � ����� ��� ��������. ������ � �����������";
            string message = "�������: " + firstnamecomplaint + "\r\n";
            message += "���: " + lastnamecomplaint + "\r\n";
            message += "�������: " + phonecomplaint + "\r\n";
            message += "Email: " + mailcomplaint + "\r\n";
            message += "����� ���������: " + infocomplaint + "\r\n";
            message += "\r\n" + "����� ��������: " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
            //Ideal.Core.Net.SmtpServer ssrv = new Ideal.Core.Net.SmtpServer("89.208.146.168");
            foreach (string email in Variables.OrderEmails)
            {
                sa = new SmtpPerson(email, "���������� �����");
                sm = new SmtpMessage(sp, sa, false);
                sm.Subject = subject;
                sm.Body = message;
                sm.IsHtml = false;
                Mail.Send(sm);
                /*Ideal.Core.Net.SmtpMessage smsg = new Ideal.Core.Net.SmtpMessage(new Ideal.Core.Net.SmtpPerson("info@ramedia.ru", from), new Ideal.Core.Net.SmtpPerson(email), subject, message, false);
                Ideal.Core.Net.Smtp.SendMail(ssrv, smsg);*/
            }

            context.Response.Write(string.Format("1"));
        } else
        if (type == "help")
        {
            string helpName = context.Request["helpName"];
            string helpPhone = context.Request["helpPhone"];

            string subject = "��������� � ����� ��� ��������. �������� ������";
            string from = "��������� � ����� ��� ��������. �������� ������";
            string message = "���: " + helpName + "\r\n";
            message += "�������: " + helpPhone + "\r\n";
            message += "\r\n" + "����� ��������: " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();

            //Ideal.Core.Net.SmtpServer ssrv = new Ideal.Core.Net.SmtpServer("89.208.146.168");
            foreach (string email in Variables.OrderEmails)
            {
                sa = new SmtpPerson(email, "���������� �����");
                sm = new SmtpMessage(sp, sa, false);
                sm.Subject = subject;
                sm.Body = message;
                sm.IsHtml = false;
                Mail.Send(sm);
                /*Ideal.Core.Net.SmtpMessage smsg = new Ideal.Core.Net.SmtpMessage(new Ideal.Core.Net.SmtpPerson("info@ramedia.ru", from), new Ideal.Core.Net.SmtpPerson(email), subject, message, false);
                Ideal.Core.Net.Smtp.SendMail(ssrv, smsg);*/
            }

            context.Response.Write(string.Format("1"));
        } else
        if (type == "mail")
        {
            string mailMail = context.Request["mailMail"];

            string subject = "��������� � ����� ��� ��������. ����������� �� ��������";
            string from = "��������� � ����� ��� ��������. ����������� �� ��������";
            string message = "E-mail: " + mailMail + "\r\n";
            message += "\r\n" + "����� ��������: " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
            //Ideal.Core.Net.SmtpServer ssrv = new Ideal.Core.Net.SmtpServer("89.208.146.168");
            foreach (string email in Variables.OrderEmails)
            {
                sa = new SmtpPerson(email, "���������� �����");
                sm = new SmtpMessage(sp, sa, false);
                sm.Subject = subject;
                sm.Body = message;
                sm.IsHtml = false;
                Mail.Send(sm);
                /*Ideal.Core.Net.SmtpMessage smsg = new Ideal.Core.Net.SmtpMessage(new Ideal.Core.Net.SmtpPerson("info@ramedia.ru", from), new Ideal.Core.Net.SmtpPerson(email), subject, message, false);
                Ideal.Core.Net.Smtp.SendMail(ssrv, smsg);*/
            }

            context.Response.Write(string.Format("1"));
        } else
        if (type == "popup")
        {
            string mailMail = context.Request["mail"];

            string subject = "��������� � ����� ��� ��������. ��������� ���������� ����������� �������";
            string from = "��������� � ����� ��� ��������. ��������� ���������� ����������� �������";
            string message = "E-mail: " + mailMail + "\r\n";
            message += "\r\n" + "����� ��������: " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
            //Ideal.Core.Net.SmtpServer ssrv = new Ideal.Core.Net.SmtpServer("89.208.146.168");
            foreach (string email in Variables.OrderEmails)
            {
                sa = new SmtpPerson(email, "���������� �����");
                sm = new SmtpMessage(sp, sa, false);
                sm.Subject = subject;
                sm.Body = message;
                sm.IsHtml = false;
                Mail.Send(sm);
                /*Ideal.Core.Net.SmtpMessage smsg = new Ideal.Core.Net.SmtpMessage(new Ideal.Core.Net.SmtpPerson("info@ramedia.ru", from), new Ideal.Core.Net.SmtpPerson(email), subject, message, false);
                Ideal.Core.Net.Smtp.SendMail(ssrv, smsg);*/
            }

            context.Response.Write(string.Format("1"));
        } else
        if (type == "design")
        {
            string firstnamedesign = context.Request["firstnamedesign"];
            string phonedesign = context.Request["phonedesign"];
            string lastnamedesign = context.Request["lastnamedesign"];
            string maildesign = context.Request["maildesign"];

            string subject = "��������� � ����� ��� ��������. ���������. �������� ������";
            string from = "��������� � ����� ��� ��������. ���������. �������� ������";
            string message = "�������: " + firstnamedesign + "\r\n";
            message += "���: " + lastnamedesign + "\r\n";
            message += "�������: " + phonedesign + "\r\n";
            message += "Email: " + maildesign + "\r\n";
            message += "\r\n" + "����� ��������: " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
            //Ideal.Core.Net.SmtpServer ssrv = new Ideal.Core.Net.SmtpServer("89.208.146.168");
            foreach (string email in Variables.OrderEmails)
            {
                sa = new SmtpPerson(email, "���������� �����");
                sm = new SmtpMessage(sp, sa, false);
                sm.Subject = subject;
                sm.Body = message;
                sm.IsHtml = false;
                Mail.Send(sm);
                /*Ideal.Core.Net.SmtpMessage smsg = new Ideal.Core.Net.SmtpMessage(new Ideal.Core.Net.SmtpPerson("info@ramedia.ru", from), new Ideal.Core.Net.SmtpPerson(email), subject, message, false);
                Ideal.Core.Net.Smtp.SendMail(ssrv, smsg);*/
            }

            context.Response.Write(string.Format("1"));
        }
        else
        {
            context.Response.Write(string.Format("0"));
        }
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

    public bool IsReusable {
        get {
            return false;
        }
    }

}