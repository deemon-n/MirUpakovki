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
using Ideal.Wision.Identity;
using Ideal.Wision.Schema;
using Ideal.Wision;
using Ideal.UI.Web;
using MirUpak.Model;

public partial class cart_profile : UserWintrol
{
    void Page_Init(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Мой профиль";

        if (!IsPostBack)
        {
            IPerson person = Ideal.Wision.Identity.Manager.CurrentPerson;

            tbName.Text = person.FirstName;
            tbLastName.Text = person.LastName;
            tbPhone.Text = person.Phone;
            tbEmail.Text = person.Email;
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            IPerson person = Ideal.Wision.Identity.Manager.CurrentPerson;

            person.FirstName = tbName.Text;
            person.LastName = tbLastName.Text;
            person.Phone = tbPhone.Text;
            person.Update();

            Env.RegisterStartupMessage("saved", "Информация сохранена");
            //Response.Redirect("~/index.aspx");
        }
    }

    protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tbPassword.Text != tbCPassword.Text)
        {
            args.IsValid = false;
            cvPassword.Text = "Введённые пароли не совпадают!";
            return;
        }

        args.IsValid = true;
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        /*Customer.Current.ApplyDiscountCard(tbDiscount.Text.Trim(), tbDiscountName.Text.Trim());*/

        Env.RegisterStartupMessage("dscok", "Информация отправлена");
    }

    protected void btnApplyPass_Click(object sender, EventArgs e)
    {
        Person person = (Person)Ideal.Wision.Identity.Manager.CurrentPerson;

        if (person.ValidatePassword(tbPasswordCurrent.Text))
        {
            if (tbPassword.Text.Length > 0)
            {
                person.Password = tbPassword.Text;
                person.Update();
                Env.RegisterStartupMessage("ok", "Пароль изменён!");
            }
        }
        else
        {
            Env.RegisterStartupMessage("errp", "Укажите правильный текущий пароль!");
        }
    }
}