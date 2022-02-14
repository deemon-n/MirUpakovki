using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Controls;
using Ideal.UI.Web;
using Ideal.Wision;
using System.Web.UI.WebControls;
using MirUpak.Model;

namespace MirUpak.View.Admin
{
    [AdminWintrol("{F276793B-762E-42b0-997F-974D5907BC34}", typeof(MuAdminGroup), "Категории", "", AdminWintrolState.Hidden)]
    class ProductCategoryEditor : EditorWintrol<ProductCategory>
    {
        public ProductCategoryEditor()
        {
            this.Init += new EventHandler(ProductCategoryEditor_Init);
            this.Load += new EventHandler(ProductCategoryEditor_Load);
        }

        void ProductCategoryEditor_Init(object sender, EventArgs e)
        {
            this.Apply += new EditorEvent<ProductCategory>(ProductCategoryEditor_Apply);
        }

        void ProductCategoryEditor_Apply(Editor<ProductCategory> sender)
        {
            int id = 0;
            ProductCategory cat;
            string editParam = String.Empty;
            int.TryParse(this.Page.Request.QueryString["id"], out id);
            if (this.Page.Request.QueryString["f"] == "e")
            {
                cat = Schema.Categories.SelectKey(id);
                if (cat == null)
                    Env.PageNotFound();

                editParam = "&addCategory=false";
            }
            else
            {
                cat = Schema.Categories.CreateNew();
                cat.ParentCategoryID = id;
                editParam = "&addCategory=true";
            }
            if (sender.GetCurrentValue(cat, true))
            {
                cat.Update();
                this.Page.Response.Redirect(String.Format(@"{0}/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx?uw=true{1}", Env.AppPath, editParam));
            }
        }

        void ProductCategoryEditor_Load(object sender, EventArgs e)
        {
            ((AdminLayout)Env.CurrentLayout).HideUI();

            int id = 0;
            if (this.Page.Request.QueryString["id"] == null || this.Page.Request.QueryString["f"] == null)
                Env.PageNotFound();
            if (!int.TryParse(this.Page.Request.QueryString["id"], out id))
                Env.PageNotFound();
            if (this.Page.Request.QueryString["f"] == "a" || this.Page.Request.QueryString["f"] == "e") { }
            else
                Env.PageNotFound();

            ProductCategory cat;
            if (this.Page.Request.QueryString["f"] == "e")
            {
                cat = Schema.Categories.SelectKey(id);
                if (cat == null)
                    Env.PageNotFound();
            }
            else
            {
                cat = Schema.Categories.CreateNew();
                cat.ParentCategoryID = id;
            }
            if (!this.Page.IsPostBack)
                this.SetInitialValue(cat);
        }
    }
}

