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
using Ideal.Commerce;
using Ideal.Wision;
using System.Text;
using Ideal.Wision.Identity;
using Ideal.Core.Net;
using Ideal.Wision.IO;
using Aspose.Excel;
using System.Collections.Generic;
using MirUpak.Model;
using System.IO;

public partial class cart : UserWintrol, IPostBackEventHandler
{
    Cart c = MirUpak.Model.Commerce.Engine.CurrentCart;

    void Show(string what)
    {
        pnlCheckout.Visible = false;
        pnlItems.Visible = false;
        pnlNoItems.Visible = false;
        pnlDetails.Visible = false;

        switch (what)
        {
            case "check": pnlCheckout.Visible = true;
                return;

            case "items": pnlItems.Visible = true;
                return;

            case "noitems": pnlNoItems.Visible = true;
                return;

            case "details": pnlDetails.Visible = true;
                return;
        }
    }

    private void BindCart()
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCart();

            if (c.Items.Count > 0)
                Show("items");
            else
                Show("noitems");
        }

        Env.CurrentLayout.ContentTitle = "Корзина";        

        this.PreRender += new EventHandler(cart_PreRender);
        
    }

    //double totalWeight = 0;

    private void RenderCart()
    {
        StringBuilder sb = new StringBuilder();

        //totalWeight = 0;

        List<CartItem> lci = new List<CartItem>();/*СОРТИРОВКА ПО НАЗВАНИЮ КАТЕГОРИИ!!!*/
        foreach (CartItem ci in c.Items)
        {
            lci.Add(ci);
        }
        lci.Sort(delegate(CartItem x, CartItem y) {
            Product prodx = (Product)x.Product;
            Product prody = (Product)y.Product;
            int ix = prodx.RootCategory.Name.CompareTo(prody.RootCategory.Name);
            if (ix != 0)
                return ix;
            ix = prodx.ParentCategory.Name.CompareTo(prody.ParentCategory.Name);
            if (ix != 0)
                return ix;

            return prodx.Name.CompareTo(prody.Name);             
        });

        string strCatName = string.Empty;
        string strParentCatName = string.Empty;
        foreach (CartItem ci in lci)
        //foreach (CartItem ci in c.Items)
        {
            Product prod = (Product)ci.Product;            
            string pid = prod.ID.ToString();
            string settings = ci.CustomSettings.GetSettingsValue("count");

            sb.AppendFormat(@"
        <div class='cart-item'>
            <div class='row'>
                <div class='col-md-2'>
                    <a href='{7}/catalog/item.aspx?pid={10}'><img class='img-cart-item' src='{14}' alt='{11}'></a>
                </div>
                <div class='col-md-6'>
                    <div class='title-cart-item'><a href='{7}/catalog/item.aspx?pid={10}'>{11}</a></div>
                    <div class='article-cart-item'>Код товара: {1}</div>
                    <div class='fav-cart favor-cart-item' pid='{10}' style='width:175px;'><a href='javascript:void(0);'>Добавить в избранное</a></div>
                </div>
                <div class='col-md-4'>
                    <div class='count-cart-item'>
                        <div class='count-cart quant_inner'>
                          <input type=""text"" style=""margin-left: 16px; width:25px"" class='count-input count count-cart-item-cur wide' name=""qty{3}"" value=""{4}"" class=""wide form-control"" />
                          
                          <div class='quant_button plus-count'>
                            <img src='{7}/ii/plus.png' alt='' />
                          </div>
                          <div class='quant_button minus-count'>
                            <img src='{7}/ii/minus.png' alt='' />
                          </div>
                        </div>
                    </div>
                    <div class='price-cart-item' pci='{3}'>{9}</div>
                    <div class='clearfix'></div>                    
                    <div class='del-cart-item'>
                        <a href=""javascript:{6}""><img src='{7}/ii/del.png' alt='удалить' /></a>
                    </div>
                </div>
            </div>            
        </div>
", prod.Photo.PreviewName, prod.Articul, "", ci.ID.ToString(), ci.Quantity, "",
 this.Page.ClientScript.GetPostBackEventReference(this, "rem" + ci.ID.ToString()),
 Env.AppPath, settings, ci.Amount.ToString("N2") + " руб."/*prod.Price.ToString("N2") + " руб."*/, prod.ID, prod.Name, prod.Category.Name, settings, prod.ImageUrl);
        }

        this.ltCart.Text = sb.ToString();
        ltTotalCount.Text = c.ItemCount.ToString();
        ltTotalCount2.Text = c.ItemCount.ToString();
        ltTotalAmount.Text = c.TotalAmount.ToString("N2");
        //xpvProductsTop.List = MirUpak.Model.Schema.Products.Select("NewProd = @1", true);
        xpvProductsTop.List = LastViewed.List;

        byte countManager = 0;
        foreach (MirUpak.Model.MuManager manager in MirUpak.Model.MuManager.ManagerListActive)
        {
            countManager++;
            ltManagerList.Text += String.Format(@"<input type='radio' title='{0}' value='{1}' name='manager' id='manager{2}'/><label for='manager{2}'>{3}</label><br />", manager.LastName + " " + manager.Name.Substring(0, 1) + "." + manager.SurName.Substring(0, 1) + ".", manager.Email, countManager, manager.LastName + " " + manager.Name + " " + manager.SurName);
        }

    }


    void cart_PreRender(object sender, EventArgs e)
    {
        RenderCart();
        //this.labTotal.Text = string.Format("В Вашей корзине <b>{0}</b> позиций общим весом <b>{1}</b> г.", c.Items.Count, totalWeight);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateCart();
    }

    private void UpdateCart()
    {

        foreach (string key in Request.Form.AllKeys)
        {
            if (key.Length > 3)
            {
                if (key.Substring(0, 3).ToLower() == "qty")
                {
                    CartItem ci = c.Items.GetItem(new Guid((key.Remove(0, 3))));
                    if (null != ci)
                    {
                        int qty = 0;
                        if (Int32.TryParse(Request.Form[key], out qty))
                        {
                            if (qty <= 0)
                                ci.Remove();
                            else
                            {
                                Product p = MirUpak.Model.Schema.Products.SelectSingle("GID = @1", ci.ProductID);
                                if (p != null)
                                {
                                    //if (qty > p.WarehouseCount)
                                    //{
                                    //    Env.RegisterStartupMessage("warehouseCountMessage", "На складе нет указанного количества товара!");
                                    //    qty = p.WarehouseCount;
                                    //}
                                }
                                ci.Quantity = qty;
                                ci.Update();
                            }
                        }
                    }
                }
            }
        }

        BindCart();
    }

    protected void btnOrderIt_Click(object sender, EventArgs e)
    {
        UpdateCart();

        if (c.Items.Count == 0)
            return;

            Ideal.Commerce.Order o = c.CheckOut();
            //labOrder.Text = o.Number.ToString();        
            //o.CustomerText += "E-mail: " + tbEmail.Text.Trim() + "<br />";        
            //o.CustomerText += tbRemarks.Text.Trim();
            o.CustomerText += "<br />Имя заказчика: " + tbFIO.Text.Trim() + "<br />";
            o.CustomerText += "Email заказчика: " + tbMail.Text.Trim() + "<br />";
            o.CustomerText += "Телефон заказчика: " + tbPhone.Text.Trim() + "<br />";
            o.CustomerText += "Организация: " + tbOrgan.Text.Trim() + "<br />";
            if (hfChoiceDelivery.Value == "2")
            {
                o.CustomerText += "Необходима доставка<br />";
                o.CustomerText += "Город: " + tbCartCity.Text.Trim() + "<br />";
                o.CustomerText += "Улица: " + tbCartStreet.Text.Trim() + "<br />";
                o.CustomerText += "Дом/Корпус: " + tbCartHouse.Text.Trim() + "<br />";
                o.CustomerText += "Квартира: " + tbWohn.Text.Trim() + "<br />";
                o.CustomerText += "Дата доставки: " + tbCartDate.Text.Trim() + "<br />";
                o.CustomerText += "Время доставки: " + tbCartTime.Text.Trim() + "<br />";
            }
            if (hfChoicePay.Value == "2")
            {
                o.CustomerText += "Оплата по счету<br />";
                o.CustomerText += "Реквизиты: " + tbRekviz.Text.Trim() + "<br />";
            }
            o.Update();

            string fileName = Env.Server.MapPath("~/orders/" + o.Number.ToString() + ".xls");
            ExportToFile(fileName, o);

            SendEmail(o, fileName);

            Show("check");

            Env.RegisterStartupScript("goal", "reachGoalGo('Order')");            
    }

    protected void btnClean_Click(object sender, EventArgs e)
    {
        c.Items.RemoveAll();
        Show("noitems");
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        Show("details");
        Env.CurrentLayout.ContentTitle = "Оформить заказ";
        FillConfirm();
    }

    #region IPostBackEventHandler Members

    void IPostBackEventHandler.RaisePostBackEvent(string eventArgument)
    {
        if (eventArgument.Length > 3)
        {
            if (eventArgument.Substring(0, 3).ToLower() == "rem")
            {
                CartItem ci = c.Items.GetItem(new Guid(eventArgument.Remove(0, 3)));
                if (ci != null)
                    ci.Remove();
            }
        }

        if (c.ItemCount == 0)
            Env.RedirectToItself();
    }

    #endregion

    void FillConfirm()
    {
        StringBuilder sb = new StringBuilder();
        foreach (Ideal.Commerce.CartItem ci in c.Items)
        {
            Product p = (Product)ci.Product;
            sb.AppendFormat(@"
            <div class='col-md-12 fill-item gilroy-font'>
                <div class='col-md-10'>{0}</div><div class='col-md-2 text-right'>{2}Р</div>
            </div>
            ", p.Name, ci.Quantity, (ci.ProductPrice * ci.Quantity).ToString("N2"));
        }
        sb.AppendFormat(@"
            <div class='col-md-12 fill-item'></div>
            <div class='col-md-12 fill-item'></div>
            <div class='col-md-12 fill-item gilroy-font'>
                <div class='col-md-10'>Итого к оплате</div><div class='col-md-2 text-right total_fill'>{0}р</div>
            </div>
            ", c.TotalAmount.ToString("N2"));
        ltFillConfirm.Text = sb.ToString();
    }

    void SendEmail(Ideal.Commerce.Order order, string fileName)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<table cellpadding='3' cellspacing='0'>");
        sb.Append(String.Format(@"<tr><td><b>Дата заказа</b></td><td><b>{0}</b></td></tr>", DateTime.Now.ToLongDateString()));
        sb.Append(String.Format(@"<tr><td><b>Номер заказа</b></td><td><b>{0}</b></td></tr>", order.Number.ToString()));

        sb.Append(String.Format(@"<tr><td>Имя заказчика</td><td>{0}</td></tr>", tbFIO.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Email заказчика</td><td>{0}</td></tr>", tbMail.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Телефон заказчика</td><td>{0}</td></tr>", tbPhone.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Организация</td><td>{0}</td></tr>", tbOrgan.Text.Trim()));
        //sb.Append(String.Format(@"<tr><td>Комментарий</td><td>{0}</td></tr>", tbRemarks.Text.Trim()));

        if (hfChoiceDelivery.Value == "2")
        {
            sb.Append(String.Format(@"<tr><td colspan='2'>Необходима доставка</td></tr>", tbOrgan.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Город</td><td>{0}</td></tr>", tbCartCity.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Улица</td><td>{0}</td></tr>", tbCartStreet.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Дом/Корпус</td><td>{0}</td></tr>", tbCartHouse.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Квартира</td><td>{0}</td></tr>", tbWohn.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Дата доставки</td><td>{0}</td></tr>", tbCartDate.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Время доставки</td><td>{0}</td></tr>", tbCartTime.Text.Trim()));
        }
        if (hfChoicePay.Value == "2")
        {
            sb.Append(String.Format(@"<tr><td colspan='2'>Оплата по счету</td></tr>", tbOrgan.Text.Trim()));
            sb.Append(String.Format(@"<tr><td>Реквизиты</td><td>{0}</td></tr>", tbRekviz.Text.Trim()));
        }

        sb.Append("</table>");

        sb.Append("<table cellpadding='3' cellspacing='0' border='1px'>");
        sb.Append(String.Format(@"<tr><td colspan='5'><b>Данные по заказу</b></td></tr>"));
        sb.Append(String.Format(@"<tr><td><b>№</b></td><td><b>Название</b></td><td><b>Кол-во</b></td><td><b>Цена за шт.</b></td><td><b>Сумма</b></td></tr>"));

        int i = 1;
        double itemsCount = 0;

        List<Ideal.Commerce.OrderItem> lci = new List<Ideal.Commerce.OrderItem>();/*СОРТИРОВКА ПО НАЗВАНИЮ КАТЕГОРИИ!!!*/
        foreach (Ideal.Commerce.OrderItem ci in order.Items)
        {
            lci.Add(ci);
        }
        lci.Sort(delegate(Ideal.Commerce.OrderItem x, Ideal.Commerce.OrderItem y)
        {
            Product prodx = (Product)x.Product;
            Product prody = (Product)y.Product;
            int ix = prodx.RootCategory.Name.CompareTo(prody.RootCategory.Name);
            if (ix != 0)
                return ix;
            ix = prodx.ParentCategory.Name.CompareTo(prody.ParentCategory.Name);
            if (ix != 0)
                return ix;

            return prodx.Name.CompareTo(prody.Name);
        });

        string strCatName1 = string.Empty;
        string strParentCatName1 = string.Empty;

        foreach (Ideal.Commerce.OrderItem oi in lci)            
        {
            Product p = oi.Product as Product;
            if (strCatName1 != p.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td colspan='5'><div class='rasp'></div></td></tr>");
                sb.AppendFormat(@"<tr><td align='center' class='cat-name' colspan='5'><b>{0}</b></td></tr>", p.RootCategory.Name);
            }
            strCatName1 = p.RootCategory.Name;

            if (strParentCatName1 != p.ParentCategory.Name && p.ParentCategory.Name != p.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td align='center' class='cat-name middle-cat' colspan='5'><b>{0}</b></td></tr>", p.ParentCategory.Name);
            }
            strParentCatName1 = p.ParentCategory.Name;

            sb.Append(String.Format(@"<tr><td>{0}</td><td>{1}</td><td>{2} шт.</td><td>{3} руб.</td><td>{4} руб.</td></tr>", i.ToString(), p.Name, oi.Quantity.ToString(), p.Price.ToString("N2"), oi.Amount.ToString()));
            i++;
            itemsCount += oi.Quantity;
        }
        sb.Append(String.Format(@"<tr><td colspan='2'><b>Итого:</b></td><td><b>{0} шт.</b></td><td>&nbsp;</td><td><b>{1} руб.</b></td></tr>", itemsCount.ToString(), order.TotalAmount.ToString("N2")));
        sb.Append("</table>");                

        /*отправка сообщения администратору сайта*/
        SmtpPerson sp = new SmtpPerson("info@ramedia.ru", tbFIO.Text.Trim());
        SmtpPerson sa = null;
        SmtpMessage sm = null;

        bool choiceManager = false;
        string aboutManagerStr = String.Format(@"<br /><b>При оформлении заказа был выбран менеджер , {0}</b>", hfNameSend.Value);

        string managerLog = string.Empty;

        if (hfEmailAddressSend.Value != "0" && hfNameSend.Value != "0") // если выбран менеждер
        {
            managerLog = hfEmailAddressSend.Value;
            sa = new SmtpPerson(hfEmailAddressSend.Value, "Менеджер " + hfNameSend.Value);
            sm = new SmtpMessage(sp, sa, false);
            sm.Subject = @"Заказ на сайте Мир упаковки для менеджера: " + hfNameSend.Value;
            sm.Body = sb.ToString();
            sm.IsHtml = true;
            sm.AddAttachment(new SmtpAttachment(fileName, "Заказ " + order.Number.ToString() + ".xls", false));
            Mail.Send(sm);
            
            choiceManager = true;
        }

        sa = new SmtpPerson("150@mirupakovki.com", "Администратор");
        //sa = new SmtpPerson("d.novikov@ramedia.ru", "Администратор");
        sm = new SmtpMessage(sp, sa, false);
        sm.Subject = @"Заказ на сайте Мир упаковки";
        sm.Body = (choiceManager) ? sb.ToString() + aboutManagerStr : sb.ToString();
        sm.IsHtml = true;        
        sm.AddAttachment(new SmtpAttachment(fileName, "Заказ " + order.Number.ToString() + ".xls", false));
        Mail.Send(sm);
        sa = new SmtpPerson("elena_vinogradova@mirupakovki.com", "Администратор");
        //sa = new SmtpPerson("d.novikov@ramedia.ru", "Администратор");
        sm = new SmtpMessage(sp, sa, false);
        sm.Subject = @"Заказ на сайте Мир упаковки";
        sm.Body = (choiceManager) ? sb.ToString() + aboutManagerStr : sb.ToString();
        sm.IsHtml = true;
        sm.AddAttachment(new SmtpAttachment(fileName, "Заказ " + order.Number.ToString() + ".xls", false));
        Mail.Send(sm);

        /*foreach (string email in Variables.OrderEmails)
        {
            sa = new SmtpPerson(email, "Администратор");
            sm = new SmtpMessage(sp, sa, false);
            sm.Subject = @"Заказ на сайте Мир упаковки";
            sm.Body = sb.ToString();
            sm.IsHtml = true;
            Mail.Send(sm);
        }*/

        /*отправка сообщения заказчику*/
        string buyerLog = string.Empty;
        if (!string.IsNullOrEmpty(tbMail.Text.Trim()))
        {
            buyerLog = tbMail.Text.Trim();
            sb.Append("Наш менеджер свяжется с Вами в ближайшее время, чтобы уточнить вопросы по заказу и предложить оптимальный способ его выполнения.");
            sb.Insert(0, "Мы благодарим Вас за заказ на нашем сайте!");
            sa = new SmtpPerson("mail@mirupakovki.com", "Мир упаковки");
            sp = new SmtpPerson(tbMail.Text.Trim(), tbFIO.Text.Trim());
            sm = new SmtpMessage(sa, sp, false);
            sm.Subject = @"Заказ на сайте Мир упаковки";
            sm.Body = sb.ToString();
            sm.IsHtml = true;
            Mail.Send(sm);
        }

        //Mail.SendFromAdmin(new SmtpPerson("p.smirnova@ramedia.ru", "Полина"), "Запрос со СтройКомплектГрупп", sb.ToString());   

        WriteToFileLog(log(order, managerLog, buyerLog));
    }

    void WriteToFileLog(string str)
    {
        try
        {            
            using (StreamWriter sw = new StreamWriter(Env.Server.MapPath("~/log.txt"), true, System.Text.Encoding.Default))
            {
                sw.WriteLine(DateTime.Now.ToString());
                sw.WriteLine(str);
                sw.WriteLine("");
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
    }

    public string log(Ideal.Commerce.Order order, string managerLog, string buyerLog)
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat(@"Номер заказа: {0}. Отправлено на: 150@mirupakovki.com, elena_vinogradova@mirupakovki.com{1}{2}", order.Number.ToString(), (managerLog == string.Empty) ? "" : ", " + managerLog, (buyerLog == string.Empty) ? "" : ", " + buyerLog);

        return sb.ToString();
    }

    public void ExportToFile(string fileName, Ideal.Commerce.Order order)
    {
        Aspose.Excel.License licExcel = new Aspose.Excel.License();
        licExcel.SetLicense((System.IO.Stream)null);

        Excel file = new Excel();
        file.Open(Env.Server.MapPath("~/catalog/order.xls"));

        Worksheet ws = file.Worksheets[0];

        ws.Cells[0, 0].PutValue("Заказ товаров на " + order.DateCreated.ToShortDateString());
        ws.Cells[1, 0].PutValue("");
        ws.Cells[2, 0].PutValue("Артикул");
        ws.Cells[2, 1].PutValue("Код");
        ws.Cells[2, 2].PutValue("Номенклатура");
        ws.Cells[2, 3].PutValue("Остаток");
        ws.Cells[2, 4].PutValue("Количество для заказа");
        ws.Cells[2, 5].PutValue("Оптовая цена, руб. Включает НДС");        
        ws.Cells.InsertRows(12, order.Items.Count - 1);        
        int firstRow = 3;
        int startRow = firstRow;
        int i = 0;

        SetCellStyle(ws.Cells[0, 0]);
        SetCellStyle(ws.Cells[2, 0]);
        SetCellStyle(ws.Cells[2, 1]);
        SetCellStyle(ws.Cells[2, 2]);
        SetCellStyle(ws.Cells[2, 3]);
        SetCellStyle(ws.Cells[2, 4]);
        SetCellStyle(ws.Cells[2, 5]);

        Product p = new Product();
        for (int ii = 0; ii < order.Items.Count; ii++)
        {
            p = order.Items[ii].Product as Product;
            ws.Cells[firstRow + i, 0].PutValue(p.Articul);
            ws.Cells[firstRow + i, 1].PutValue(p.Code);
            ws.Cells[firstRow + i, 2].PutValue(p.Name);
            ws.Cells[firstRow + i, 3].PutValue("-");
            ws.Cells[firstRow + i, 4].PutValue((int)order.Items[ii].Quantity);
            ws.Cells[firstRow + i, 5].PutValue(p.Price);
            i++;           
        }

        file.Save(fileName);
    }

    #region private double GetColumnResult(Worksheet ws, int startRow, int endRow, column) - Get result sum in column

    private double GetColumnResult(Worksheet ws, int startRow, int endRow, int column)
    {
        double result = 0, value = 0;
        for (int i = startRow - 1; i <= endRow; i++)
        {
            if (!ws.Cells[i, column].IsFormula)
            {
                value = 0;
                Double.TryParse(ws.Cells[i, column].StringValue, System.Globalization.NumberStyles.Any, null, out value);
                result += value;
            }
        }
        return result;
    }

    #endregion

    #region private void SetCellStyle(Cell cell) - Set cell style

    private void SetCellStyle(Cell cell)
    {
        //cell.Style.ForegroundColor = System.Drawing.Color.FromArgb(192, 192, 192);
        cell.Style.HorizontalAlignment = TextAlignmentType.Left;
        cell.Style.Font.IsBold = true;        
    }

    #endregion

    #region private static int CompareOrderItemsByArticul(OrderItem x, OrderItem y) - product comparator by Articul

    private static int CompareOrderItemsByArticul(Ideal.Commerce.OrderItem x, Ideal.Commerce.OrderItem y)
    {
        Product xp = x.Product as Product;
        Product yp = y.Product as Product;
        /*if (x == null)
        {
            if (y == null)
                return 0;
            else
                return -1;
        }
        else
        {
            if (y == null)
                return 1;
            else
                return xp.Articul.CompareTo(yp.Articul);
        }*/
        if (xp == null && yp == null) return 0;
        if (xp == null) return 1;
        if (yp == null) return -1;

        string xart = xp.Articul;
        string xtype = String.Empty;
        if (xart.Contains("-"))
        {
            xtype = xart.Split('-')[0];
            xart = xart.Split('-')[1];
        }

        string yart = yp.Articul;
        string ytype = String.Empty;
        if (yart.Contains("-"))
        {
            ytype = xart.Split('-')[0];
            yart = yart.Split('-')[1];
        }

        if (yart.CompareTo(xart) == 0)
            return xtype.ToLower().CompareTo(ytype.ToLower());

        return yart.CompareTo(xart);
    }

    #endregion
}