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
using Newtonsoft.Json;
using Ideal.Wision.Identity;
using MirUpak.Model;

namespace MirUpak.View.Admin
{
    [AdminWintrol("{ABF8D54E-2326-4c28-9EC3-4E4D2CD3005E}", typeof(MuAdminGroup), "Товары", "Управление товарами")]
    public class ProductsCategoriesManager : Wintrol, ICallbackEventHandler
    {
        public ProductsCategoriesManager()
        {
            this.Init += new EventHandler(ProductsCategoriesManager_Init);
        }

        void ProductsCategoriesManager_Init(object sender, EventArgs e)
        {
            /*if (!((Person)Manager.CurrentPerson).IsInGroup(Manager.GetPersonGroup("Управление товарами")))
                Env.ResourceAccessDenied();*/

            Env.CurrentLayout.AddLineToHeader(String.Format(@"<script language='ecmascript' type='text/ecmascript' src='{0}/js/admin/products/prototype.js'></script>", Env.AppPath));
            Env.CurrentLayout.AddLineToHeader(String.Format(@"<script language='ecmascript' type='text/ecmascript' src='{0}/js/admin/products/treeview.js'></script>", Env.AppPath));
            Env.CurrentLayout.AddLineToHeader(String.Format(@"<script language='ecmascript' type='text/ecmascript' src='{0}/js/admin/products/custom.js'></script>", Env.AppPath));
            Env.CurrentLayout.AddLineToHeader(String.Format(@"<link href='{0}/css/admin.css' rel='stylesheet' type='text/css' />", Env.AppPath));

            this.ID = "ProductsCategoriesManager";

            HtmlTable table = new HtmlTable();
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();

            table.Attributes.Add("style", "width: 100%;");
            cell.Attributes.Add("colspan", "2");
            row.Controls.Add(cell);
            table.Controls.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "leftCell");
            cell.Controls.Add(CreateInnerTable());
            row.Controls.Add(cell);

            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "rightCell");
            cell.Attributes.Add("style", "border: solid 1px rgb(204, 204, 204)");
            LiteralControl lc = new LiteralControl(String.Format(@"<iframe id='ifContent' class='ifContent' src='{0}/admin/0A8963FE-59A3-4ade-8CF4-0483B49EF477.aspx'></iframe>", Env.AppPath));
            cell.Controls.Add(lc);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            this.Controls.Add(table);

            lc = new LiteralControl(String.Format(@"<script type='text/javascript'  language='ecmascript'>
                appPath='{0}';
                var selectedNode = new DynaTreeNode();
                CallbackRequest = function(args, context) {2} {1}; {3};
            </script>", Env.AppPath, Page.ClientScript.GetCallbackEventReference(this, "params", "processCallbackRequest", "context", "processCallbackError", true), "{", "}"));
            this.Controls.Add(lc);

            Env.RegisterStartupScript("setTableHeight", "$('ifContent').setStyle({ height: screen.availHeight - 250 + 'px' });");
        }

        private HtmlTable CreateInnerTable()
        {
            HtmlTable table = new HtmlTable();
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();
            HtmlButton btnNewCategory = new HtmlButton();
            HtmlButton btnDeleteCategory = new HtmlButton();
            HtmlButton btnIndexUp = new HtmlButton();
            HtmlButton btnIndexDown = new HtmlButton();

            HtmlImage img = new HtmlImage();
            img.ID = "imgLoader";
            img.Src = Env.AppPath + "/ii/load.gif";
            img.Alt = "Загрузка...";
            img.Style.Add(HtmlTextWriterStyle.Margin, "5px 0px 0px 0px");
            img.Style.Add(HtmlTextWriterStyle.Left, "240px");
            img.Style.Add(HtmlTextWriterStyle.Position, "absolute");
            img.Style.Add("float", "right");
            cell.Controls.Add(img);

            table.Attributes.Add("style", "width: 100%");
            cell.Attributes.Add("style", "text-align: center");
            btnNewCategory.ID = "btnNewCategory";
            btnNewCategory.Attributes.Add("type", "button");
            btnNewCategory.InnerText = "Создать категорию";
            btnNewCategory.Attributes.Add("onclick", "addCategory()");
            cell.Controls.Add(btnNewCategory);
            cell.Controls.Add(Factory.CreateLiteralViewstatelessBr());
            btnDeleteCategory.ID = "btnDeleteCategory";
            btnDeleteCategory.Attributes.Add("type", "button");
            btnDeleteCategory.InnerText = "Удалить категорию";
            btnDeleteCategory.Attributes.Add("onclick", "deleteCategory()");
            cell.Controls.Add(btnDeleteCategory);
            cell.Controls.Add(Factory.CreateLiteralViewstatelessBr());

            btnIndexUp.ID = "btnIndexUp";
            btnIndexUp.InnerText = "Вверх";
            btnIndexUp.Attributes.Add("type", "button");
            btnIndexUp.Attributes.CssStyle.Add(HtmlTextWriterStyle.Width, "71px");
            btnIndexUp.Attributes.Add("onclick", "upCategory()");
            cell.Controls.Add(btnIndexUp);
            cell.Controls.Add(Factory.CreateLiteralViewstatelessNbsp());
            btnIndexDown.ID = "btnIndexDown";
            btnIndexDown.InnerText = "Вниз";
            btnIndexDown.Attributes.Add("type", "button");
            btnIndexDown.Attributes.CssStyle.Add(HtmlTextWriterStyle.Width, "71px");
            btnIndexDown.Attributes.Add("onclick", "downCategory()");
            cell.Controls.Add(btnIndexDown);
            cell.Controls.Add(Factory.CreateLiteralViewstatelessBr());

            row.Controls.Add(cell);
            table.Controls.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();

            DynaTreeView dtv = new DynaTreeView("dtvCategories");
            dtv.CssClass = "dtv";
            dtv.CssClassBase = "dtv_i_normal";
            dtv.CssClassHover = "dtv_i_hover";
            dtv.CssClassSelected = "dtv_i_selected";
            dtv.ClientEvent = "clientSelectNode";
            DynaTreeViewNode dtvn = new DynaTreeViewNode("Категории", "0", "Существующие категории");
            dtvn.Expanded = true;
            dtv.Nodes.Add(dtvn);
            CreateCategoryTree(dtv.Nodes[0].Nodes);
            cell.Controls.Add(dtv);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            return table;
        }

        private void CreateCategoryTree(DynaTreeViewNodeCollection rootCollection)
        {
            AddNodesFromList(ProductCategory.RootCategories, rootCollection);
            CreateTreeNode(rootCollection);
        }

        private void CreateTreeNode(DynaTreeViewNodeCollection rootCollection)
        {
            foreach (DynaTreeViewNode li in rootCollection)
            {
                List<ProductCategory> tmp = ProductCategory.SelectCategoryByID(int.Parse(li.Value)).ChildCategories;
                if (tmp.Count > 0)
                {
                    AddNodesFromList(tmp, li.Nodes);
                    CreateTreeNode(li.Nodes);
                }
            }
        }

        private void AddNodesFromList(List<ProductCategory> list, DynaTreeViewNodeCollection parentCollection)
        {
            foreach (ProductCategory c in list)
            {
                DynaTreeViewNode node = new DynaTreeViewNode(c.Name, c.ID.ToString(), c.Name);
                parentCollection.Add(node);
            }
        }

        #region ICallbackEventHandler Members

        string callbackResult = String.Empty;

        public string GetCallbackResult()
        {
            return callbackResult;
        }

        public void RaiseCallbackEvent(string eventArgument)
        {
            try
            {
                CallbackParams prms = (CallbackParams)JavaScriptConvert.DeserializeObject(eventArgument, typeof(CallbackParams));
                callbackResult = "Ok";
                ProductCategory cat = Schema.Categories.SelectKey(prms.ID);
                if (cat == null)
                {
                    callbackResult = "Категория не найдена!";
                    return;
                }

                if (prms.Action == "delete")
                {
                    List<ProductCategory> list = cat.NestedCategories;
                    List<Product> plist;
                    foreach (ProductCategory c in list)
                    {
                        plist = c.Products;
                        foreach (Product p in plist)
                            p.Delete();
                        c.Delete();
                    }
                    plist = cat.Products;
                    foreach (Product p in plist)
                        p.Delete();
                    cat.Delete();
                }

                if (prms.Action == "up")
                {
                    List<ProductCategory> list = (cat.ParentCategory != null) ? cat.ParentCategory.ChildCategories : ProductCategory.RootCategories;
                    ProductCategory prevCat = null;
                    for (int i = 0; i < list.Count; i++)
                        if (list[i].ID == cat.ID && i > 0)
                        {
                            prevCat = list[i - 1];
                            break;
                        }
                    if (prevCat != null)
                    {
                        int index = cat.OrderIndex;
                        cat.OrderIndex = prevCat.OrderIndex;
                        cat.Update();
                        prevCat.OrderIndex = index;
                        prevCat.Update();
                    }
                }

                if (prms.Action == "down")
                {
                    List<ProductCategory> list = (cat.ParentCategory != null) ? cat.ParentCategory.ChildCategories : ProductCategory.RootCategories;
                    ProductCategory nextCat = null;
                    for (int i = 0; i < list.Count; i++)
                        if (list[i].ID == cat.ID && i < list.Count - 1)
                        {
                            nextCat = list[i + 1];
                            break;
                        }
                    if (nextCat != null)
                    {
                        int index = cat.OrderIndex;
                        cat.OrderIndex = nextCat.OrderIndex;
                        cat.Update();
                        nextCat.OrderIndex = index;
                        nextCat.Update();
                    }
                }
            }
            catch (Exception ex)
            {
                callbackResult = ex.Message;
            }
        }

        #endregion
    }

    public class CallbackParams
    {
        string action = String.Empty;
        public string Action
        {
            get { return action; }
            set { action = value; }
        }

        int id = 0;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public CallbackParams() { }
    }
}