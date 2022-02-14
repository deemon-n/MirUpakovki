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
using Ideal.Wision.Identity;
using MirUpak.Model;

namespace MirUpak
{
    [AdminWintrol("{0A8963FE-59A3-4ade-8CF4-0483B49EF477}", typeof(MuAdminGroup), "Товары", "Управление товарами", AdminWintrolState.Hidden)]
    public class ProductsManager : ListEditorWintrol<int, Product>, ICallbackEventHandler
    {
        TextBox tbFilter = new TextBox();
        Button btnFilter = new Button();

        DropDownList ddlCategories = new DropDownList();
        DropDownList ddlCategoriesToProducts = new DropDownList();
        Button btnMove = new Button();

        int count = 0;
        EntityList<int, Product> list = null;

        public ProductsManager()
        {
            this.Init += new EventHandler(ProductsManager_Init);
            this.Load += new EventHandler(ProductsManager_Load);
        }

        void ProductsManager_Init(object sender, EventArgs e)
        {
            //foreach (ProductCategory c in Schema.ProductCategories.SelectAll().Items)
            //{
            //    int i = 1;
            //    foreach (Product p in c.Products)
            //    {
            //        p.OrderIndex = i;
            //        p.Update();
            //        i++;
            //    }
            //}

            //foreach (Product p in Schema.Products.SelectAll().Items)
            //{
            //    if (p.ActualRestPricePerGramm > 0)
            //    {
            //        p.PricePerGramm = (int)Math.Round(((double)p.ActualRestPricePerGramm / (double)2));
            //        p.Update();
            //    }
            //}

            Env.CurrentLayout.AddLineToHeader(String.Format(@"<script language='ecmascript' type='text/ecmascript' src='{0}/js/admin/products/prototype.js'></script>", Env.AppPath));
            Env.CurrentLayout.AddLineToHeader(String.Format(@"<script language='ecmascript' type='text/ecmascript' src='{0}/js/admin/products/custom.js'></script>", Env.AppPath));
            this.ID = "ProductsManager";
            if (this.Page.Request.QueryString["uw"] == "true")
                Env.RegisterStartupScript("updateScript", "updateWindow(" + this.Page.Request.QueryString["addCategory"] + ");");

            UpdateList();

            if (this.Page.Request.QueryString["catId"] == null || this.Page.Request.QueryString["catId"] == "0")
                this.Visible = false;

            Env.RegisterScript("callback", "callback = function() { " + this.Page.ClientScript.GetCallbackEventReference(this, "code", "callBackEvent", "code", "callBackError", true) + "; }");
        }

        void ProductsManager_Load(object sender, EventArgs e)
        {
            UpdateList();
            ((AdminLayout)Env.CurrentLayout).HideUI();

            UpdateOrderIndex();
        }

        void btnFilter_Click(object sender, EventArgs e)
        {
        }

        protected override void UpdateList()
        {
            base.UpdateList();

            int id = 0;
            if (int.TryParse(this.Page.Request.QueryString["catId"], out id))
            {
                List<Product> plist = new List<Product>();

                this.Visible = true;
                if (tbFilter.Text != String.Empty)
                {
                    //foreach (Product li in Schema.Products.Select("CategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), id).Items)
                    foreach (Product li in Schema.Products.SelectAll(new SelectOptions("OrderIndex", SortOrder.Ascending)).Items)
                        if (li.Name.ToLower().IndexOf(tbFilter.Text.ToLower()) >= 0 || li.Articul.ToLower().IndexOf(tbFilter.Text.ToLower()) >= 0)
                            plist.Add(li);
                }
                else
                    plist = Schema.Products.Select("CategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), id).Items;

                list = new EntityList<int, Product>(Schema.Products, plist);

                count = this.list.Count;
                this.List = this.list;

                this.Visible = (id > 0);
            }
            else
            {
                this.list = Schema.Products.SelectAll(new SelectOptions("OrderIndex", SortOrder.Ascending));
                this.count = this.list.Count;
                this.List = this.list;

                this.Visible = false;
            }
        }

        protected override void CreateListTopExtension(Control parentControl)
        {
            base.CreateEditorTopExtension(parentControl);

            HtmlTable table = new HtmlTable();
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();

            table.Attributes.Add("style", "width: 100%");

            tbFilter.ID = "tbFilter";
            tbFilter.Columns = 20;
            tbFilter.BorderWidth = 1;
            cell.Controls.Add(tbFilter);
            cell.Controls.Add(Factory.CreateLiteralViewstateless("&nbsp;"));
            btnFilter = new Button();
            btnFilter.ID = "btnFilter";
            btnFilter.BorderWidth = 1;
            btnFilter.Text = "Фильтровать";
            btnFilter.Click += new EventHandler(btnFilter_Click);
            cell.Controls.Add(btnFilter);
            row.Controls.Add(cell);

            cell = new HtmlTableCell();
            cell.Attributes.Add("style", "text-align: right");
            HtmlButton btnEditCategory = new HtmlButton();
            btnEditCategory.ID = "btnEditCategory";
            btnEditCategory.Attributes.Add("type", "button");
            btnEditCategory.InnerText = "Редактировать категорию";
            btnEditCategory.Attributes.Add("onclick", "editCategory()");
            cell.Controls.Add(btnEditCategory);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.ColSpan = 2;
            cell.Attributes.Add("style", "text-align: right");

            ddlCategories.ID = "ddlCategories";
            List<ListItem> list = GetCategories(ProductCategory.RootCategories, 0);
            foreach (ListItem li in list)
                ddlCategories.Items.Add(li);
            cell.Controls.Add(ddlCategories);

            cell.Controls.Add(Factory.CreateLiteralViewstateless("&nbsp;"));

            btnMove.ID = "btnMove";
            btnMove.Text = "Перенести категорию";
            btnMove.Width = Unit.Pixel(200);
            btnMove.Click += new EventHandler(btnMove_Click);
            cell.Controls.Add(btnMove);

            row.Controls.Add(cell);
            table.Controls.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.ColSpan = 2;

            cell.Controls.Add(Factory.CreateLiteralViewstateless(@"<input id='btnSelectAll' type='button' style='border: 1px' value='+' title='Выделить все' width='35px' onclick='selectAll();' />&nbsp;<input id='btnDeselectAll' type='button' style='border: 1px' value='-' title='Отменить все' width='35px' onclick='deselectAll();' />&nbsp;&nbsp;&nbsp;Переместить услуги в: "));

            ddlCategoriesToProducts.ID = "ddlCategoriesToProducts";
            list = GetCategories(ProductCategory.RootCategories, 0);
            foreach (ListItem li in list)
                ddlCategoriesToProducts.Items.Add(li);
            cell.Controls.Add(ddlCategoriesToProducts);
            cell.Controls.Add(Factory.CreateLiteralViewstateless(@"&nbsp;<input id='btnMove' type='button' value='Переместить' onclick='moveProducts();' />"));
            cell.Controls.Add(Factory.CreateLiteralViewstateless(@"&nbsp;<input id='btnMove' type='button' value='Копировать' onclick='copyProducts();' />"));

            row.Controls.Add(cell);
            table.Controls.Add(row);

            parentControl.Controls.Add(table);
        }

        void btnMove_Click(object sender, EventArgs e)
        {
            int id = 0;
            int.TryParse(this.Page.Request.QueryString["catId"], out id);

            ProductCategory category = Schema.Categories.SelectKey(id);
            if (category != null && int.TryParse(ddlCategories.SelectedValue, out id))
            {
                if (category.ID == id)
                {
                    this.Controls.Add(Factory.CreateLiteralViewstateless(@"
<script type='text/javascript'>
    alert('Переносимая категория совпадает с выбранной категорией!');
</script>
                "));
                    return;
                }

                category.ParentCategoryID = id;
                category.Update();

                this.Page.Response.Redirect(String.Format(@"{0}/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx?uw=true", Env.AppPath));
            }
            else
            {
                this.Controls.Add(Factory.CreateLiteralViewstateless(@"
<script type='text/javascript'>
    alert('Категория не найдена!');
</script>
                "));
            }
        }

        protected override List<System.Web.UI.Control> CreateListAdditionalColumns(Product rowEntity, int rowIndex)
        {
            List<System.Web.UI.Control> lac = base.CreateListAdditionalColumns(rowEntity, rowIndex);

            DropDownList ddl = new DropDownList();
            ddl.ID = "ddlIndex" + rowEntity.ID.ToString();
            ddl.AutoPostBack = true;
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

        protected override List<string> GetListAdditionalColumnsHeaders()
        {
            List<string> las = base.GetListAdditionalColumnsHeaders();
            las.Add("Позиция");
            return las;
        }

        protected override void BeforeApply(Product instance)
        {
            base.BeforeApply(instance);
            int id;

            if (int.TryParse(this.Page.Request.QueryString["catId"], out id))
                instance.CategoryID = id;
        }

        protected override string GetEditorTitle()
        {
            return IsEditableEntityIsNew
                ? "Добавить новый товар"
                : CurrentEditableInstance.Name;
        }

        protected override string GetListTitle()
        {
            return "Управление товарами";
        }

        protected override void AssignEditorTitle()
        {
            EditorTitle = IsEditableEntityIsNew
                ? "Добавить новый товар"
                : CurrentEditableInstance.Name;
        }

        List<ListItem> GetCategories(List<ProductCategory> categories, int level)
        {
            List<ListItem> list = new List<ListItem>();
            foreach (ProductCategory c in categories)
            {
                string str = String.Empty;
                for (int i = 0; i < level; i++)
                    str += "--";
                if (level > 0)
                    str += " ";

                list.Add(new ListItem(str + c.Name, c.ID.ToString()));

                foreach (ListItem li in GetCategories(c.ChildCategories, level + 1))
                    list.Add(li);
            }
            return list;
        }

        void UpdateOrderIndex()
        {
            if (this.Page.Request.Params["__EVENTTARGET"] == null || !this.Page.Request.Params["__EVENTTARGET"].Contains("ProductsManager$ddlIndex"))
                return;

            int id = int.Parse(this.Page.Request.Params["__EVENTTARGET"].Remove(0, 24));

            Product product = Schema.Products.SelectKey(id);

            int index = int.Parse(this.Page.Request.Params[this.Page.Request.Params["__EVENTTARGET"]]);

            if (product.OrderIndex > index)
            {
                List<Product> list = Schema.Products.Select("OrderIndex >= @1 AND OrderIndex < @2 AND CategoryID = @3", index, product.OrderIndex, this.Page.Request.QueryString["catId"]).Items;
                foreach (Product p in list)
                {
                    p.OrderIndex++;
                    p.Update();
                }

                product.OrderIndex = index;
                product.Update();
            }
            else if (product.OrderIndex < index)
            {
                List<Product> list = Schema.Products.Select("OrderIndex > @1 AND OrderIndex <= @2 AND CategoryID = @3", product.OrderIndex, index, this.Page.Request.QueryString["catId"]).Items;
                foreach (Product p in list)
                {
                    p.OrderIndex--;
                    p.Update();
                }

                product.OrderIndex = index;
                product.Update();
            }

            UpdateList();
        }

        #region ICallbackEventHandler Members

        string callbackResult = String.Empty;

        public string GetCallbackResult()
        {
            return callbackResult;
        }

        public void RaiseCallbackEvent(string eventArgument)
        {
            JavaScriptObject prms = (JavaScriptObject)Newtonsoft.Json.JavaScriptConvert.DeserializeObject(eventArgument);

            JavaScriptArray values = (JavaScriptArray)prms["values"];

            for (int i = 0; i < values.Count; i++)
            {
                int id = 0;
                if (int.TryParse(((string)values[i]).Replace("cb_", ""), out id))
                {
                    Product product = Schema.Products.SelectKey(id);
                    if (product != null)
                    {
                        if ((string)prms["method"] == "move")
                        {
                            product.CategoryID = int.Parse((string)prms["category"]);
                            product.Update();
                        }

                        if ((string)prms["method"] == "copy")
                        {
                            /*Product newProduct = Schema.Products.CreateNew();
                            newProduct.Active = product.Active;
                            newProduct.Articul = product.Articul;
                            newProduct.CategoryID = int.Parse((string)prms["category"]);
                            newProduct.Description = product.Description;
                            newProduct.GID = Guid.NewGuid();
                            newProduct.Important = product.Important;
                            newProduct.Name = product.Name;
                            newProduct.Photo = product.Photo;
                            newProduct.Photos = product.Photos;
                            newProduct.PricePerGramm = product.PricePerGramm;
                            newProduct.PricePerUnit = product.PricePerUnit;
                            newProduct.ShortDescription = product.ShortDescription;
                            newProduct.Weight = product.Weight;
                            newProduct.Update();

                            newProduct.CreateImageFromFile(Env.Server.MapPath(product.ImageUrl),
                                Env.Server.MapPath(product.PreviewUrl));*/

                            throw new NotImplementedException();
                        }
                    }
                }
            }
        }

        #endregion
    }
}