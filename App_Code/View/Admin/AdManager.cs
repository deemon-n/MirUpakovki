using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Schema;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using DynaControlslLibrary;
using System.Web.UI;
using Ideal.UI.Web;
using Ideal.Wision.Controls;
using Ideal.Entity;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using MirUpak.Model;

[AdminWintrol("EF488E8B-0C6A-4283-85EE-D46558111555", typeof(MuAdminGroup), "Слайдер", "Управление изображениями в слайдере на главной странице сайта")]
public class AdManager : ListEditorWintrol<int, Ad>
{

    int count = 0;
    EntityList<int, Ad> list = null;
    public AdManager()
    {
        this.Init += new EventHandler(AdManager_Init);        
        this.Load += new EventHandler(AdManager_Load);

    }

    void AdManager_Init(object sender, EventArgs e)
    {
        this.ID = "pm";
        UpdateList();

    }

    void AdManager_Load(object sender, EventArgs e)
    {
        //UpdateList();
    }


    protected override void UpdateList()
    {
        base.UpdateList();

        list = Schema.Ads.SelectAll(new SelectOptions("OrderIndex", SortOrder.Ascending));

        this.count = this.list.Count;
        this.List = this.list;
    }

    protected override List<System.Web.UI.Control> CreateListAdditionalColumns(Ad rowEntity, int rowIndex)
    {
        List<System.Web.UI.Control> lac = base.CreateListAdditionalColumns(rowEntity, rowIndex);

        DropDownList ddl = new DropDownList();
        ddl.ID = "ddlIndex" + rowIndex.ToString();
        ddl.AutoPostBack = true;
        ddl.SelectedIndexChanged += new EventHandler(ddl_SelectedIndexChanged);
        int selectedIndex = 0;
        for (int i = 1; i <= count; i++)
        {
            ListItem li = new ListItem(i.ToString());
            if (rowEntity.ID == list[i - 1].ID)
                selectedIndex = i - 1;
            ddl.Items.Add(li);
        }
        ddl.SelectedIndex = selectedIndex;
        lac.Add(ddl);
        return lac;
    }

    void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        int bindex = int.Parse(ddl.ID.Remove(0, 8));
        int tindex = int.Parse(ddl.SelectedValue);

        if (bindex != tindex)
        {
            Ad sdj = list[bindex - 1];
            Ad tdj = list[tindex - 1];

            int soi = sdj.OrderIndex;
            sdj.OrderIndex = tdj.OrderIndex;
            tdj.OrderIndex = soi;

            sdj.Update();
            tdj.Update();

            this.UpdateList();
        }
    }

    protected override List<string> GetListAdditionalColumnsHeaders()
    {
        List<string> las = base.GetListAdditionalColumnsHeaders();
        las.Add("Позиция");
        return las;
    }

    protected override string GetEditorTitle()
    {
        return IsEditableEntityIsNew
            ? "Добавить новый баннер"
            : CurrentEditableInstance.Name;
    }

    protected override string GetListTitle()
    {
        return "Управление баннерами на главной";
    }


    protected override void AssignEditorTitle()
    {
        EditorTitle = IsEditableEntityIsNew
            ? "Добавить новый баннер"
            : CurrentEditableInstance.Name;
    }
}