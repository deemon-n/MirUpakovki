using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using System.Web.UI.WebControls;
using Ideal.Wision.Schema;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using System.Text.RegularExpressions;
using MirUpak.Model;
using Ideal.UI.Web;
using Ideal.Wision.Identity;


[AdminWintrol("14788E8B-0C6A-4283-85EE-D46538EE988B", typeof(MuAdminGroup), "Создание клиента", "Формирование личного кабинета")]
public class CreateCustomer : Wintrol
{
    Button btnSave = null;
    TextBox tbINN = null;
    TextBox tbEmail = null;
    TextBox tbName = null;
    TextBox tbLastName = null;
    TextBox tbPass = null;
    DropDownList ddlMgrs = null;

    public CreateCustomer()
    {
        this.Init += new EventHandler(Settings_Init);
    }

    void Settings_Init(object sender, EventArgs e)
    {
        this.ID = "cc";

        btnSave = new Button();
        btnSave.Text = "Создать";
        btnSave.Click += new EventHandler(btnSave_Click);

        tbINN = Factory.CreateTextBox(12, 12, "tbINN");
        tbEmail = Factory.CreateTextBox(64, 64, "tbEmail");
        tbName = Factory.CreateTextBox(64, 64, "tbName");
        tbLastName = Factory.CreateTextBox(64, 64, "tbLastName");
        tbPass = Factory.CreateTextBox(64, 64, "tbPass");
        ddlMgrs = Factory.CreateDropDownList("ddlMgrs");
        foreach (MuManager mm in Schema.Managers.SelectAll())
        {
            ddlMgrs.Items.Add(new ListItem(mm.LastName + " " + mm.Name, mm.ID.ToString()));
        }

        HtmlTable table = new HtmlTable();

        HtmlTableRow row = new HtmlTableRow();
        HtmlTableCell cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "ИНН клиента";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbINN);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Email представителя";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbEmail);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Имя представителя";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbName);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Фамилия представителя";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbLastName);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Пароль для доступа";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbPass);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Наш менеджер";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(ddlMgrs);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        this.Controls.Add(table);
        this.Controls.Add(btnSave);
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        string sinn = tbINN.Text.Trim();
        long inn = long.Parse(sinn);
        string email = tbEmail.Text.Trim();
        string name = tbName.Text.Trim();
        string lname = tbLastName.Text.Trim();
        string pass = tbPass.Text.Trim();
        if (string.IsNullOrEmpty(sinn) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(name) ||
            string.IsNullOrEmpty(lname) || string.IsNullOrEmpty(pass))
        {
            Env.RegisterStartupMessage("err", "Заполните все поля!");
            return;
        }
        
        Customer cust = Customer.GetByInn(inn);
        if (null == cust)
        {
            Env.RegisterStartupMessage("err", "Не найдено юрлица с таким ИНН!");
            return;
        }

        if (cust.OurManagerID > 0)
        {
            Env.RegisterStartupMessage("err", "Для этого клиента уже был создан кабинет!");
            return;
        }

        /*if (Manager.GetPerson(email, false) != null)
        {
            Env.RegisterStartupMessage("err", "Пользователь с таким email уже существует!");
            return;
        }*/
        bool created = false;
        Person p = Manager.GetPerson(email, false) as Person;
        if (null == p)
        {
            p = Manager.CreateNewPerson(email) as Person;
            p.FirstName = name;
            p.LastName = lname;
            p.Password = pass;
            p.PersonSettings["cuid"] = cust.ID.ToString();
            p.Update();
            created = true;
        }

        cust.ManagerID = p.ID;
        cust.OurManagerID = int.Parse(ddlMgrs.SelectedValue);
        cust.Update();

        Env.RegisterStartupMessage("ok", "Учётная запись " + (created ? "создана" : "привязана"));
    }
}