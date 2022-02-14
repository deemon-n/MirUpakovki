using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Controls;
using Ideal.Entity;
using System.Web.UI.WebControls;
using MirUpak.Model;

[AdminWintrol("46BC4747-836B-4125-9122-901297E31233", typeof(MuAdminGroup), "”правление нашими юрлицами", "—писок юрлиц с которыми работают заказчики")]
class CompanyManager : ListEditorWintrol<int, Company>
{
    public CompanyManager()
    {
        this.Init += new EventHandler(CategoryManager_Init);
        this.ID = "cm";
    }

    void CategoryManager_Init(object sender, EventArgs e)
    {
        UpdateList();
        this.CanRemoveItems = false;
    }

    protected override void UpdateList()
    {
        base.UpdateList();

        this.List = Schema.Companies.SelectAll();
    }   
}