using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision;
using System.Text.RegularExpressions;
using Ideal.Core.Imaging;

public class Variables
{
    static Guid guidOrderEmail = new Guid("{39EEDE01-8D63-4e29-B1EF-2F0E0C992FD2}");
    static string orderEmail = String.Empty;
    public static string OrderEmail
    {
        get
        {
            if (orderEmail == String.Empty)
            {
                Settings.Store.RetrieveString(guidOrderEmail, Guid.Empty, ref orderEmail);
            }
            return orderEmail;
        }
        set
        {
            orderEmail = value;
            Settings.Store.StoreString(guidOrderEmail, Guid.Empty, orderEmail);
        }
    }

    public static List<string> OrderEmails
    {
        get
        {
            List<string> ls = new List<string>();
            foreach (string s in OrderEmail.Split(','))
            {
                if (s.Trim().Length > 5)
                {
                    ls.Add(s.Trim());
                }
            }
            return ls;
        }
    }
}