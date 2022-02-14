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
using MirUpak.Model;
using Ideal.Wision.Identity;
using System.Collections.Generic;

public partial class my_index : UserWintrol
{
    protected Customer Customer;

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Ћичный кабинет";

        Customer = Customer.Current;
        /*ltName.Text = Manager.CurrentPerson.FullName;
        ltEmail.Text = Manager.CurrentPerson.Email;
        ltCompany.Text = cust.Name;
        ltLawAddr.Text = cust.LawAddress;
        ltFactAddr.Text = cust.PostAddress;
        ltBank.Text = cust.BankName + ", Ѕ»  " + cust.BankIK + " к/с " + cust.BankKS + " р/с " + cust.BankRS;
        ltAgreement.Text = "є" + cust.AgreementNumber + " от " + cust.AgreementDate.ToShortDateString();
        if (cust.AgreementFinish.Year > 2000)
            ltAgreement.Text = " ( до " + cust.AgreementFinish.ToShortDateString() + ")";
        if (cust.Debt > 0)
            ltDebt.Text = "<span style='color:red'>" + cust.Debt.ToString("n2") + " руб.</span>";
        else
            ltDebt.Text = cust.Debt.ToString("n2") + " руб.";*/

        if (!Page.IsPostBack)
        {
            List<Customer> lcs = Customer.CurrentCustomers;
            if (lcs.Count < 2)
            {
                phCurrent.Visible = false;
            }
            else
            {
                phCurrent.Visible = true;
                foreach (Customer c in lcs)
                {
                    ListItem li = new ListItem(c.Name + " (" + c.ID + ")", c.ID.ToString());
                    if (c.ID == Customer.ID)
                        li.Selected = true;
                    ddlCustomer.Items.Add(li);
                }
            }
        }
    }

    protected void btnLofoff_Click(object sender, EventArgs e)
    {
        Manager.TryLogoff(false);
        Env.Redirect("~/index.aspx");
    }
    
    protected void btnApply_Click(object sender, EventArgs e)
    {
        Session["cuid"] = ddlCustomer.SelectedValue;
        Env.RedirectToItself();
    }
}