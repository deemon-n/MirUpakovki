using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using MirUpak.Model;

namespace MirUpak.Model
{
    public static class LastViewed
    {
        const int ListSize = 30; //количество выводимых
        const string MarkerName = "lvps";

        private static List<Product> Load()
        {
            List<Product> lps = new List<Product>();
            HttpCookie coo = HttpContext.Current.Request.Cookies[MarkerName];
            if (null != coo)
            {
                if (!string.IsNullOrEmpty(coo.Value))
                {
                    foreach (string spid in coo.Value.Split(','))
                    {
                        int pid = -1;
                        if (int.TryParse(spid, out pid))
                        {
                            //Product p = Schemas.Inventory.Products[pid];
                            Product p = Schema.Products[pid];
                            if (null != p)
                            {
                                lps.Add(p);
                                if (lps.Count == ListSize)
                                    break;
                            }
                        }
                    }
                }
            }
            return lps;
        }

        public static List<Product> List
        {
            get
            {
                object oSL = HttpContext.Current.Items[MarkerName];
                if (null == oSL)
                {
                    List<Product> lps = Load();
                    HttpContext.Current.Items[MarkerName] = lps;
                    return lps;
                }
                else
                {
                    return (List<Product>)oSL;
                }
            }
        }

        public static void Add(Product newProduct)
        {
            List<Product> lps = List;
            foreach (Product p in lps)
            {
                if (p.ID == newProduct.ID)
                    return;
            }
            lps.Insert(0, newProduct);
            HttpContext.Current.Items[MarkerName] = lps;
        }

        public static void Del(Product newProduct)
        {
            List<Product> lps = List;
            foreach (Product p in lps)
            {
                if (p.ID == newProduct.ID)
                {
                    lps.Remove(newProduct);
                    HttpContext.Current.Items[MarkerName] = lps;
                    return;
                }
            }
        }

        public static void Save()
        {
            object oSL = HttpContext.Current.Items[MarkerName];
            if (null != oSL)
            {
                int count = 0;
                string newcoo = string.Empty;
                List<Product> lps = (List<Product>)oSL;
                foreach (Product p in lps)
                {
                    newcoo += p.ID + ",";
                    count++;
                    if (count == ListSize)
                        break;
                }
                if (newcoo.Length > 1)
                    newcoo = newcoo.Remove(newcoo.Length - 1);
                HttpCookie coo = new HttpCookie(MarkerName, newcoo);
                coo.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(coo);
            }
        }
    }
}