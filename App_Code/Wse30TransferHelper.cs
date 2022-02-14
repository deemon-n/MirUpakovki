using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using Ideal.ImpexLib;
using System.Text;
using System.IO;
using Ideal.ImpexLib.Compression;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using Ideal.Wision;
using System.Data.SqlClient;
using Ideal.Wision.Identity;
using Ideal.Wision.IO;
using Ideal.Core.Net;
using System.Xml;
using MirUpak.Model;
using System.Runtime.Serialization.Json;

/// <summary>
/// Summary description for Wse30TransferHelper
/// </summary>
public class Wse30TransferHelper : Ideal.ImpexLib.WSE.TransferHelper
{
    public Wse30TransferHelper(int password) : base(password) { }

    public Wse30TransferHelper(int password, string fileName, byte[] data, CompressionType compression)
        : base(password, fileName, data, compression)
    {

    }

    public override ReportMessage[] HandleData()
    {
        List<ReportMessage> rml = new List<ReportMessage>(base.BeforeProcessing());
        foreach (ReportMessage rm in rml)
        {
            if (rm.Type == MessageType.Error) return rml.ToArray();
        }
        //return rml.ToArray();
        try
        {
            switch (this.fileName.ToLower().Trim())
            {
                case "customers.xml":
                    HandleCustomers(rml);
                    break;
                case "acts.xml":
                    HandleTrans(rml);
                    break;
                case "orders.xml":
                    HandleOrders(rml);
                    break;
                case "products.json":
                    HandleProducts(rml);
                    break;
                default: break;
            }
        }
        catch (Exception ex)
        {
            rml.Add(new ReportMessage(
                "При обработке файла " + this.fileName + " возникла ошибка: " + ex.Message,
                MessageType.Error));
        }
        return rml.ToArray();
    }

    int iTotals = 0;
    int iUpdated = 0;
    int iAdded = 0;
    //int iDeactivated = 0;
    void HandleCustomers(List<ReportMessage> rml)
    {
        try
        {
            DateTime start = DateTime.Now;

            
            rml.Add(new ReportMessage("Начало обновления данных...", MessageType.Info));

            MemoryStream ms = new MemoryStream(this.data);
            StreamReader sr = new StreamReader(ms, Encoding.GetEncoding(1251));
            string s = sr.ReadToEnd();

            /*try
            {
                StreamWriter sw = new StreamWriter(Env.Server.MapPath(string.Format("~/uploads/full-{0:yyyyMMdd-HHmm}.xml", DateTime.Now)));
                sw.Write(s);
                sw.Close();
            }
            catch { }*/

            ImportCustomersXml(s, rml);

            sr.Close();

            TimeSpan dur = DateTime.Now - start;

            
            rml.Add(new ReportMessage(string.Format("Обновление заказчиков завершено. Время: {0} мин. {1} сек.", dur.Minutes, dur.Seconds), MessageType.Info));
            rml.Add(new ReportMessage("Всего заказчиков: " + iTotals.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Добавлено заказчиков: " + iAdded.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Обновлено заказчиков: " + iUpdated.ToString(), MessageType.Info));

        }
        finally
        {
            //sw.Close();
        }
    }

    public void ImportCustomersXml(string xml, List<ReportMessage> rml)
    {
        XmlDocument doc = new XmlDocument();
        //doc.Load(Server.MapPath("~/full.xml"));
        doc.LoadXml(xml);

        iTotals = 0;
        iUpdated = 0;
        iAdded = 0;
        //iDeactivated = 0;
        
        //List<Customer> lcs = Schema.Customers.SelectAll().Items;
        foreach (XmlNode xn in doc.SelectNodes("/customers/customer"))
        {
            try
            {
                iTotals++;
                string sinn = getStr(xn, "INN").Trim();
                if (string.IsNullOrEmpty(sinn))
                    continue;
                long inn = -1;
                if (!long.TryParse(sinn, out inn))
                    continue;
                //Customer c = lcs.Find(delegate(Customer _c) { return _c.INN == sinn; });
                Customer c = Schema.Customers[inn];
                if (null == c)
                {
                    c = Schema.Customers.CreateNew();
                    c.ID = inn;
                    iAdded++;
                }
                else
                {
                    iUpdated++;
                }

                if (!long.TryParse(getStr(xn, "ourINN").Trim(), out c.OurINN))
                    continue;
                c.Name = getStr(xn, "name").Trim();
                if (string.IsNullOrEmpty(c.Name))
                    continue;
                c.Email = getStr(xn, "email").Trim();
                c.Phone = getStr(xn, "phone").Trim();
                c.AgreementNumber = getStr(xn, "agreementNumber").Trim();
                c.AgreementDate = getDate(xn, "agreementDate");
                c.AgreementFinish = getDate(xn, "agreementFinish");
                c.LawAddress = getStr(xn, "lawAddress").Trim();
                c.PostAddress = getStr(xn, "postAddress").Trim();
                c.BankIK = getStr(xn, "bankIK").Trim();
                c.BankName = getStr(xn, "bankName").Trim();
                c.BankRS = getStr(xn, "bankRS").Trim();
                c.BankKS = getStr(xn, "bankKS").Trim();
                c.Number = getStr(xn, "number").Trim();
                c.Debt = getDbl(xn, "debt");
                string sAID = getStr(xn, "agreementGUID");
                c.AgreementID = sAID.Length == 36 ? new Guid(sAID) : Guid.Empty;
                c.Deferment = getInt(xn, "agreementDays");

                /*foreach (XmlNode xni in xn.SelectNodes("tags/tag"))
                {
                    string sTagID = xni.Attributes["id"].Value;
                    if (tags == string.Empty)
                        p.TagID = int.Parse(sTagID);
                    tags += "#" + sTagID;
                }*/
                c.Active = true;
                c.Update();

                //lсs.Remove(p);
            }
            catch (Exception ex)
            {
                //ltMsgs.Text += ex.Message + "<br/>";
                rml.Add(new ReportMessage("Exception " + ex.Message));
            }
        }
        /*foreach (Product p in laps)
        {
            p.Active = false;
            p.Update();
        } */       
    }

    int iTTotals = 0;
    int iTUpdated = 0;
    int iTAdded = 0;
    void HandleTrans(List<ReportMessage> rml)
    {
        try
        {
            DateTime start = DateTime.Now;


            rml.Add(new ReportMessage("Начало обновления данных...", MessageType.Info));

            MemoryStream ms = new MemoryStream(this.data);
            StreamReader sr = new StreamReader(ms, Encoding.GetEncoding(1251));
            string s = sr.ReadToEnd();

            /*try
            {
                StreamWriter sw = new StreamWriter(Env.Server.MapPath(string.Format("~/uploads/full-{0:yyyyMMdd-HHmm}.xml", DateTime.Now)));
                sw.Write(s);
                sw.Close();
            }
            catch { }*/

            ImportTransXml(s, rml);

            sr.Close();

            TimeSpan dur = DateTime.Now - start;


            rml.Add(new ReportMessage(string.Format("Обновление транзакций завершено. Время: {0} мин. {1} сек.", dur.Minutes, dur.Seconds), MessageType.Info));
            rml.Add(new ReportMessage("Всего транзакций: " + iTTotals.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Добавлено транзакций: " + iTAdded.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Обновлено транзакций: " + iTUpdated.ToString(), MessageType.Info));

        }
        finally
        {
            //sw.Close();
        }
    }

    public void ImportTransXml(string xml, List<ReportMessage> rml)
    {
        XmlDocument doc = new XmlDocument();
        doc.LoadXml(xml);

        iTTotals = 0;
        iTUpdated = 0;
        iTAdded = 0;

        List<Customer> lcs = Schema.Customers.SelectAll().Items;
        foreach (XmlNode xn in doc.SelectNodes("/items/item"))
        {
            try
            {
                iTotals++;
                string sinn = getStr(xn, "customerINN").Trim();
                long inn = -1;
                if (!long.TryParse(sinn, out inn))
                    continue;
                DateTime date = getDate(xn, "date");
                //Customer c = lcs.Find(delegate(Customer _c) { return _c.INN == sinn; });
                Customer c = Schema.Customers[inn];
                if (null != c)
                {                    
                    string sdoc = getStr(xn, "doc").Trim();
                    List<Tran> lts = Schema.Trans.Select("INN = @1 AND Date = @2", inn, date).Items;
                    Tran t = lts.Find(delegate(Tran _t) { return _t.Doc == sdoc; });
                    if (null == t)
                    {
                        t = Schema.Trans.CreateNew();
                        t.INN = inn;
                        t.Doc = sdoc;
                        t.Date = date;
                        iTAdded++;
                    }
                    else
                    {
                        iTUpdated++;
                    }

                    t.OurINN = long.Parse(getStr(xn, "ourINN").Trim());
                    t.INN = inn;
                    t.Amount = getDbl(xn, "amount");
                    t.Debt = getBool(xn, "debt");
                    t.Update();
                }
            }
            catch (Exception ex)
            {
                rml.Add(new ReportMessage("Exception " + ex.Message));
            }
        }
    }

    int iOTotals = 0;
    int iOiTotals = 0;
    int iOUpdated = 0;
    int iOAdded = 0;
    void HandleOrders(List<ReportMessage> rml)
    {
        try
        {
            DateTime start = DateTime.Now;


            rml.Add(new ReportMessage("Начало обновления данных...", MessageType.Info));

            MemoryStream ms = new MemoryStream(this.data);
            StreamReader sr = new StreamReader(ms, Encoding.GetEncoding(1251));
            string s = sr.ReadToEnd();

            /*try
            {
                StreamWriter sw = new StreamWriter(Env.Server.MapPath(string.Format("~/uploads/full-{0:yyyyMMdd-HHmm}.xml", DateTime.Now)));
                sw.Write(s);
                sw.Close();
            }
            catch { }*/

            ImportOrdersXml(s, rml);

            sr.Close();

            TimeSpan dur = DateTime.Now - start;

            rml.Add(new ReportMessage(string.Format("Обновление заказов завершено. Время: {0} мин. {1} сек.", dur.Minutes, dur.Seconds), MessageType.Info));
            rml.Add(new ReportMessage("Всего заказов: " + iOTotals.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Всего позиций заказов: " + iOiTotals.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Добавлено заказов: " + iOAdded.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Обновлено заказов: " + iOUpdated.ToString(), MessageType.Info));

        }
        finally
        {
            //sw.Close();
        }
    }

    public void ImportOrdersXml(string xml, List<ReportMessage> rml)
    {
        XmlDocument doc = new XmlDocument();
        doc.LoadXml(xml);

        iOTotals = 0;
        iOiTotals = 0;
        iOUpdated = 0;
        iOAdded = 0;

        List<Customer> lcs = Schema.Customers.SelectAll().Items;
        foreach (XmlNode xn in doc.SelectNodes("/ordes/order"))
        {
            try
            {
                iOTotals++;
                string sinn = getStr(xn, "customerINN").Trim();
                long inn = -1;
                if (!long.TryParse(sinn, out inn))
                    continue;
                string number = getStr(xn, "number");
                //Customer c = lcs.Find(delegate(Customer _c) { return _c.INN == sinn; });
                Customer c = Schema.Customers[inn];
                if (null != c)
                {
                    string sdoc = getStr(xn, "doc").Trim();
                    Order o = Schema.Orders.SelectSingle("INN = @1 AND Date = @2 AND Number = @3", inn, getDate(xn, "date"), number);
                    if (null == o)
                    {
                        o = Schema.Orders.CreateNew();
                        o.Number = number;
                        iOAdded++;
                    }
                    else
                    {
                        iOUpdated++;
                    }

                    o.OurINN = long.Parse(getStr(xn, "ourINN").Trim());
                    o.INN = inn;
                    o.Date = getDate(xn, "date");
                    o.DeliveryDate = getDate(xn, "deliveryDate");
                    o.Bill = getStr(xn, "bill").Trim();
                    o.Amount = getDbl(xn, "amount");
                    o.Debt = getDbl(xn, "debt");
                    o.State = getStr(xn, "state").Trim();
                    o.DeliveryAdress = getStr(xn, "deliveryAdress");
                    o.OutdatedDays = getInt(xn, "outdatedDays");
                    o.OutdatedDebt = getDbl(xn, "outdatedDebt");
                    o.Update();

                    List<OrderItem> lois = o.Items;
                    foreach (XmlNode xni in xn.SelectNodes("item"))
                    {
                        iOiTotals++;
                        string code = getStr(xni, "code").Trim();
                        OrderItem oi = lois.Find(delegate(OrderItem _oi) { return _oi.Code == code; });
                        if (null == oi)
                        {
                            oi = Schema.OrderItems.CreateNew();
                            oi.Code = code;
                            oi.OrderID = o.ID;
                            
                        }
                        oi.Name =  getStr(xni, "name").Trim();
                        oi.Price = getDbl(xni, "price");
                        oi.Qty = getDbl(xni, "qty");
                        oi.Amount = getDbl(xni, "summa");                        
                        oi.Update();
                    }
                }
            }
            catch (Exception ex)
            {
                rml.Add(new ReportMessage("Exception " + ex.Message));
            }
        }
    }

    int iPTotals = 0;
    int iPUpdated = 0;
    int iPAdded = 0;
    int iPDisabled = 0;
    void HandleProducts(List<ReportMessage> rml)
    {
        try
        {
            DateTime start = DateTime.Now;

            rml.Add(new ReportMessage("Начало обновления товаров...", MessageType.Info));

            Encoding enc1251 = Encoding.GetEncoding(1251);
            MemoryStream ms = new MemoryStream(this.data);
            StreamReader sr = new StreamReader(ms, enc1251);
            string s = sr.ReadToEnd();

            XmlDocument xml = new XmlDocument();
            xml.Load(JsonReaderWriterFactory.CreateJsonReader(Encoding.UTF8.GetBytes(s), new XmlDictionaryReaderQuotas()));

            try
            {
                StreamWriter sw = new StreamWriter(Env.Server.MapPath(string.Format("~/uploads/products-{0:yyyyMMdd-HHmm}.json", DateTime.Now)));
                sw.Write(s);
                sw.Close();

                xml.Save(Env.Server.MapPath(string.Format("~/uploads/products-{0:yyyyMMdd-HHmm}.xml", DateTime.Now)));
            }
            catch { }

            ImportProductsXml(xml, rml);

            sr.Close();

            TimeSpan dur = DateTime.Now - start;

            rml.Add(new ReportMessage(string.Format("Обновление товаров завершено. Время: {0} мин. {1} сек.", dur.Minutes, dur.Seconds), MessageType.Info));
            rml.Add(new ReportMessage("Всего товаров: " + iPTotals.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Добавлено товаров: " + iPAdded.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Обновлено товаров: " + iPUpdated.ToString(), MessageType.Info));
            rml.Add(new ReportMessage("Деактивировано товаров: " + iPDisabled.ToString(), MessageType.Info));

        }
        finally
        {
            //sw.Close();
        }
    }

    List<Product> laps = null;
    public void ImportProductsXml(XmlDocument doc, List<ReportMessage> rml)
    {
        /*iPTotals = 0;
        iPUpdated = 0;
        iPAdded = 0;*/

        laps = Schema.Products.Select("Active = @1", true).Items;

        foreach (XmlNode xn in doc.SelectNodes("/root/Groups/item"))
        {
            try
            {
                string groupID = getStr(xn, "GroupId");
                /*if (groupID.Equals("fb234a1e-04ee-11e0-83f9-001517c571a9", StringComparison.CurrentCultureIgnoreCase))
                    System.Diagnostics.Debugger.Break();*/
                string name = getStr(xn, "Name");
                /*if (name.Equals("Плёнка"))
                    System.Diagnostics.Debugger.Break();*/
                ProductCategory pc = ProductCategory.GetByName(name);

                foreach (XmlNode xnc2 in xn.SelectNodes("./Items/item"))
                {
                    string groupID2 = getStr(xnc2, "GroupId");
                    /*if (groupID2.Equals("fb234a1e-04ee-11e0-83f9-001517c571a9", StringComparison.CurrentCultureIgnoreCase))
                        System.Diagnostics.Debugger.Break();*/
                    string name2 = getStr(xnc2, "Name");
                    /*if (name2.Equals("Перчатки ПВХ и Х/Б"))
                        System.Diagnostics.Debugger.Break();*/

                    ProductCategory pc2 = ProductCategory.GetByName(pc, name2);

                    foreach (XmlNode xn2 in xnc2.SelectNodes("./Items/item"))
                    {
                        string groupID3 = getStr(xn2, "GroupId");
                        if (!string.IsNullOrEmpty(groupID3))
                        {
                            string name3 = getStr(xn2, "Name");
                            ProductCategory pc3 = ProductCategory.GetByName(pc2, name3);
                            // try to find product on 3rd nest level
                            foreach (XmlNode xn3 in xn2.SelectNodes("./Items/item"))
                            {
                                TryToParseElement(rml, pc3, xn3);
                            }
                        }

                        // try to find product on 2nd nest level
                        TryToParseElement(rml, pc2, xn2);
                    }
                }
            }
            catch (Exception ex)
            {
                rml.Add(new ReportMessage("Exception " + ex.Message));
            }
        }

        foreach (Product p in laps)
        {
            if (p.Active)
            {
                iPDisabled++;
                p.Active = false;
                p.Update();
            }
        }
    }

    private void TryToParseElement(List<ReportMessage> rml, ProductCategory pc2, XmlNode xn2)
    {
        string elementId = getStr(xn2, "ElementId").Trim();
        if (!string.IsNullOrEmpty(elementId))
        {
            string code = string.Empty;
            try
            {
                iPTotals++;

                string pname = getStr(xn2, "Name");
                string article = getStr(xn2, "Article");
                code = getStr(xn2, "Code");
                int count = Convert.ToInt32(Math.Floor(getDbl(xn2, "Count")));
                double price = getDbl(xn2, "Price");
                bool sale = (Convert.ToInt32(Math.Floor(getDbl(xn2, "Sale"))) == 1) ? true : false;

                Guid pid = new Guid(elementId);
                Product p = Schema.Products.SelectSingle("GID = @1", pid);
                if (null == p)
                {
                    p = Schema.Products.CreateNew();
                    p.Active = true;
                    p.GID = pid;
                    iPAdded++;
                }
                
                if (p.Name != pname || p.Articul != article || p.Code != code || p.Count != count
                    || p.CategoryID != pc2.ID || p.BasePrice != price || !p.Active || p.SaleProducts != sale)
                {
                    p.Name = pname;
                    p.Articul = article;
                    p.Code = code;
                    p.Count = count;
                    p.CategoryID = pc2.ID;
                    p.BasePrice = price;
                    p.Active = true;
                    p.SaleProducts = sale;
                    p.Update();
                    iPUpdated++;
                }

                laps.RemoveAll(delegate(Product _p) { return _p.id == p.id; });
            }
            catch (Exception ex)
            {
                rml.Add(new ReportMessage("Exception " + ex.Message + " (#" + code + ")"));
            }
        }
    }

    private static string getStr(XmlNode xn, string attr)
    {
        string str = string.Empty;

        XmlAttribute xa = xn.Attributes[attr];
        if (null != xa)
        {
            str = xa.Value;
        }
        else
        {
            XmlNode _xn = xn.SelectSingleNode(attr);
            if (null == _xn)
                return string.Empty;
            str = _xn.InnerText;
        }

        if (string.IsNullOrEmpty(str))
            return string.Empty;
        return str.Trim();
    }

    private static int getInt(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        if (string.IsNullOrEmpty(str))
            return 0;
        return int.Parse(str.Replace('\xa0', ' ').Replace(" ", "").Replace(" ", ""));
    }

    private static double getDbl(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        if (string.IsNullOrEmpty(str))
            return 0;
        return double.Parse(str.Replace('.', ','));
    }

    private static bool getBool(XmlNode xn, string attr)
    {
        string str = getStr(xn, attr);
        return str == "1";
    }
    
    /*private string getStr(XmlNode xn, string attr)
    {
        XmlAttribute xa = xn.Attributes[attr];
        if (null == xa)
            return string.Empty;
        string str = xa.Value;
        if (string.IsNullOrEmpty(str))
            return string.Empty;
        return str.Trim();
    }

    private int getInt(XmlNode xn, string attr)
    {
        XmlAttribute xa = xn.Attributes[attr];
        if (null == xa)
            return 0;
        string str = xa.Value;
        if (string.IsNullOrEmpty(str))
            return 0;
        return int.Parse(str);
    }

    private double getDbl(XmlNode xn, string attr)
    {
        XmlAttribute xa = xn.Attributes[attr];
        if (null == xa)
            return 0;
        string str = xa.Value;
        if (string.IsNullOrEmpty(str))
            return 0;
        return double.Parse(str.Replace('.', ','));
    }

    private bool getBool(XmlNode xn, string attr)
    {
        XmlAttribute xa = xn.Attributes[attr];
        if (null == xa)
            return false;
        return xa.Value == "1";
    }*/

    static DateTime Date2000 = new DateTime(2000, 1, 1);
    private DateTime getDate(XmlNode xn, string attr)
    {
        XmlAttribute xa = xn.Attributes[attr];
        if (null == xa)
            return Date2000;
        string str = xa.Value;
        if (string.IsNullOrEmpty(str))
            return Date2000;
        string[] ss =  str.Trim().Split('.');
        if (ss.Length != 3)
            return Date2000;
        try
        {
            DateTime dt = new DateTime(int.Parse(ss[2]), int.Parse(ss[1]), int.Parse(ss[0]));
            return dt;
        }
        catch
        {
        }

        return Date2000;
    }

    public override bool CheckPassword()
    {
        //return password == "qwerty".GetHashCode();
        return true; // BAD BAD BAD !!!
    }
}