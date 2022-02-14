using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Controls;
using Ideal.Entity;
using System.Web.UI.WebControls;
using MirUpak.Model;

[AdminWintrol("46BC4747-836B-2938-9122-901297E31233", typeof(MuAdminGroup), "Управление менеджерами", "Список менеджеров с которыми работают заказчики")]
class ManagersManager : ListEditorWintrol<int, MuManager>
{
    public ManagersManager()
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

        this.List = Schema.Managers.SelectAll();
    }   
}