using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Controls;
using Ideal.Entity;
using System.Web.UI.WebControls;
using MirUpak.Model;

[AdminWintrol("{46BC4747-836B-4125-9122-901B12E31233}", typeof(MuAdminGroup), "Управление заказчиками", "")]
class CustomerManager : ListEditorWintrol<long, Customer>
{
    CheckBox cbAll;

    public CustomerManager()
    {
        this.Init += new EventHandler(CategoryManager_Init);
        this.ID = "cm";
    }

    void CategoryManager_Init(object sender, EventArgs e)
    {
        UpdateList();
        this.CanAddItems = false;
        this.CanRemoveItems = false;
        this.PreRender += new EventHandler(CustomerManager_PreRender);
    }

    void CustomerManager_PreRender(object sender, EventArgs e)
    {
        UpdateList();
    }

    protected override void CreateListTopExtension(System.Web.UI.Control parentControl)
    {
        base.CreateListTopExtension(parentControl);

        cbAll = new CheckBox();
        cbAll.ID = "cbAll";
        cbAll.Text = "Показать клиентов с кабинетом";
        cbAll.AutoPostBack = true;
        parentControl.Controls.Add(cbAll);
    }

    protected override void UpdateList()
    {
        base.UpdateList();

        if (null == cbAll)
        {
            this.List = Schema.Customers.SelectAll();
        }
        else
        {
            this.List = cbAll.Checked ?
                Schema.Customers.Select("OurManagerID > @1", 0) :
                Schema.Customers.SelectAll();
        }
    }
}