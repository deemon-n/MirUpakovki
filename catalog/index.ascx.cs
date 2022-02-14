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
using System.Collections.Generic;
using Ideal.Wision;
using Ideal.Wision.Identity;
using Ideal.Wision.Controls;
using Ideal.Commerce;
using MirUpak.Model;
using Ideal.Core.Imaging;

public partial class catalog_index : UserWintrol, INavigable
{
    ProductCategory cat;
    List<Product> lpsAll = new List<Product>();

    protected void Page_Init(object sender, EventArgs e)
    {
        int id = 0;
        string sid = Env.WisionContext.GetRxKeyValue("cid");
        string cname = "Категории товаров";
        List<ProductCategory> lpcs = null;
        if (sid != null)
        {
            if (!int.TryParse(sid, out id))
                Env.PageNotFound();
            cat = MirUpak.Model.Schema.Categories[id];
            if (null == cat)
                Env.PageNotFound();
            cname = cat.Name;

            List<Product> lpsItem = new List<Product>();
            List<Product> _lpsItem = new List<Product>();
            if (cat.ChildCategories.Count > 0)
            {
                /*Закомментировать для вывода подкатегорий*/
                lpcs = cat.ChildCategories;
                foreach (ProductCategory pcat in lpcs)
                {
                    lpsItem = pcat.Products;
                    foreach (Product product in lpsItem)
                    {
                        lpsAll.Add(product);
                    }
                    if (pcat.ChildCategories.Count > 0)
                    {
                        foreach (ProductCategory _pcat in pcat.ChildCategories)
                        {
                            _lpsItem = _pcat.Products;
                            foreach (Product _product in _lpsItem)
                            {
                                lpsAll.Add(_product);
                            }
                        }
                    }
                }
                lpsAll.Sort(CompareByFavorite);//Сортировка по популярности                
                phSortProd.Visible = true;
                xpvProducts.Arguments.Add("categoryName", cat.Name);
                xpvProducts.CountPerPage = 16;
                xpvProducts.List = lpsAll.FindAll(delegate (Product _p) { return _p.Active; });
                xpvProducts.ShowPageRange = false;
                /*Закомментировать для вывода подкатегорий КОНЕЦ*/

                /*Раскомментировать для вывода подкатегорий xlvChildCategory.List = cat.ChildCategories;*/
            }
            else
            {
                lpsAll = cat.Products;

                lpsAll.Sort(CompareByFavorite);//Сортировка по популярности                

                phSortProd.Visible = true;
                xpvProducts.Arguments.Add("categoryName", cat.Name);
                xpvProducts.CountPerPage = 16;
                xpvProducts.List = lpsAll.FindAll(delegate (Product _p) { return _p.Active; });
                xpvProducts.ShowPageRange = false;
            }            
        }
        else
        {
            xlvChildCategory.List = ProductCategory.RootCategories;
        }

        Env.CurrentLayout.ContentTitle = cname;

        foreach (ProductCategory pc in ProductCategory.RootCategories)
        { 
            ddlCat.Items.Add(new ListItem(pc.Name,pc.ID.ToString()));
        }
        //AddDllChildItemCategory();

        //AddItemCategory();
        //AddItemCategoryChild();

        Add_new();

        //xlvChildCategory.List = lpcs;
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {        
        string spid = Env.Request["search"];
        if (!string.IsNullOrEmpty(spid))
        {
            while (spid.Contains("  "))
            { 
                spid = spid.Replace("  ", " ");
            }

            spid = spid.Trim();

            List<Product> lp = MirUpak.Model.Schema.Products.SelectAll().Items;
            List<Product> lpf = new List<Product>();

            foreach (Product p in lp)
            {
                if (p.Name.ToLower().Contains(spid.ToLower()) && p.Active)
                {
                    lpf.Add(p);
                }
            }

            string[] spids = spid.Split(' ');
            if (spids.Length >= 1)
            {               
                if (lpf.Count == 0)
                {
                    foreach (Product p in lp)
                    {
                        if (p.Active)
                        {
                            for (int i = 0; i < spids.Length; i++)
                            {                                
                                    bool found = false;
                                    if (p.Name.ToLower().Contains(spids[i].ToLower()))
                                    {
                                        found = true;
                                    }
                                    if (p.Articul.ToLower().Trim().Contains(spids[i].ToLower().Trim()))
                                    {
                                        found = true;
                                    }                                    

                                long lCode = 0;
                                long lCodeInput = 0;
                                if (long.TryParse(p.Code, out lCode) && long.TryParse(spids[i], out lCodeInput))
                                {
                                    if (lCode == lCodeInput)
                                        found = true;                                    
                                }

                                    if (found && !lpf.Contains(p))
                                        lpf.Add(p);                                
                            }
                        }
                    }
                }

            }

            //lpf = lpf.FindAll(delegate(Product _p) { return _p.Active; });

            xlvChildCategory.Visible = false;
            xpvProducts.NoItemsMessage = "Товаров не найдено";
            xpvProducts.List = lpf;
        }
    }

    protected void btnSearchProduct_Click(object sender, EventArgs e)
    {
        if (tbSearchProduct.Text.Trim() != "")
        {
            Env.Redirect(Env.AppPath + "/catalog/index.aspx?search=" + tbSearchProduct.Text.Trim());
        }
    }

    private static int CompareByPrice(Product x, Product y)
    {
        if (x == null)
        {
            if (y == null)
                return 0;
            else
                return -1;
        }
        else
        {
            if (y == null)
                return 1;
            else
            {
                return x.Price.CompareTo(y.Price);
            }
        }
    }

    private static int CompareByFavorite(Product x, Product y)
    {
        if (x == null)
        {
            if (y == null)
                return 0;
            else
                return -1;
        }
        else
        {
            if (y == null)
                return 1;
            else
            {
                return y.HasImage.CompareTo(x.HasImage);
            }
        }
    }

    private static int CompareByName(ProductCategory x, ProductCategory y)
    {
        if (x == null)
        {
            if (y == null)
                return 0;
            else
                return -1;
        }
        else
        {
            if (y == null)
                return 1;
            else
            {
                return x.Name.CompareTo(y.Name);
            }
        }
    }

    protected void ddlCat_Change(object sender, EventArgs e)
    {
        AddDllChildItemCategory();
    }

    void AddDllChildItemCategory()
    {
        ddlCatChild.Items.Clear();
        string cidDDLCat = ddlCat.SelectedValue;
        int cidDDLCatInt = 0;
        if (Int32.TryParse(cidDDLCat, out cidDDLCatInt))
        {
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                foreach (ProductCategory pcc in pcCurr.ChildCategories)
                {
                    ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
        else
        {
            ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
    }

    protected void ddlChildCat_Change(object sender, EventArgs e)
    {
        string cidDDLCat = ddlCatChild.SelectedValue;
        int cidDDLCatInt = 0;
        if (Int32.TryParse(cidDDLCat, out cidDDLCatInt))
        {
            Env.Redirect(Env.AppPath + "/catalog/" + cidDDLCatInt.ToString() + "/index.aspx");
        }
    }

    protected void ddlChildChildCat_Change(object sender, EventArgs e)
    {
        string cidDDLCat = ddlCatChildChild.SelectedValue;
        int cidDDLCatInt = 0;
        if (Int32.TryParse(cidDDLCat, out cidDDLCatInt))
        {
            Env.Redirect(Env.AppPath + "/catalog/" + cidDDLCatInt.ToString() + "/index.aspx");
        }
    }

    protected void ddlSort_Change(object sender, EventArgs e)
    {
        if (ddlSort.SelectedIndex == 1)
        {
            lpsAll.Sort(CompareByPrice);//Сортировка по цене                            
        }
        else if (ddlSort.SelectedIndex == 0)
        {
            lpsAll.Sort(CompareByFavorite);//Сортировка по популярности                
        }
        xpvProducts.Arguments.Add("categoryName", cat.Name);
        xpvProducts.CountPerPage = 16;
        xpvProducts.List = lpsAll;
        xpvProducts.ShowPageRange = false;
    }

    void AddItemCategory()
    {
        ddlCatChild.Items.Clear();        
        int cidDDLCatInt = 0;
        try
        {
            cidDDLCatInt = cat.ID;
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                List<ProductCategory> _lpc = pcCurr.ChildCategories;
                _lpc.Sort(CompareByName);
                foreach (ProductCategory pcc in _lpc)
                {
                    ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
        catch
        {
            ddlCatChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }
        }
    }

    void AddItemCategoryChild()
    {
        ddlCatChildChild.Items.Clear();
        int cidDDLCatInt = 0;
        try
        {
            cidDDLCatInt = cat.ID;
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                ddlCatChildChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                List<ProductCategory> _lpc = pcCurr.ChildCategories;
                _lpc.Sort(CompareByName);
                foreach (ProductCategory pcc in _lpc)
                {
                    ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChildChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
        catch
        {
            ddlCatChildChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }
        }
    }

    void Add()
    {
        ddlCatChild.Items.Clear();
        ddlCatChildChild.Items.Clear();
        int cidDDLCatInt = 0;
        try
        {
            cidDDLCatInt = cat.ID;
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                ddlCatChildChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                List<ProductCategory> _lpc = pcCurr.ChildCategories;
                _lpc.Sort(CompareByName);
                foreach (ProductCategory pcc in _lpc)
                {
                    ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChildChild.Items.Add(new ListItem("нет подкатегорий", "-1"));


            cidDDLCatInt = cat.ParentCategory.ID;
            pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            if (pcCurr.ChildCategories.Count > 0)
            {
                ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                List<ProductCategory> _lpc = pcCurr.ChildCategories;
                _lpc.Sort(CompareByName);
                foreach (ProductCategory pcc in _lpc)
                {
                    ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                }
            }
            else
                ddlCatChild.Items.Add(new ListItem("нет подкатегорий", "-1"));
        }
        catch
        {
            ddlCatChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }
            /*ddlCatChildChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }*/
        }
    }

    void Add_new()
    {
        ddlCatChild.Items.Clear();
        ddlCatChildChild.Items.Clear();
        int cidDDLCatInt = 0;
        List<ProductCategory> _lpc = new List<ProductCategory>();
        try
        {
            cidDDLCatInt = cat.ID;
            ProductCategory pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
            pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);

            int k = 1;
            ProductCategory __cat = new ProductCategory();
            __cat = cat;
            while (__cat.ParentCategoryID > 0)
            {
                k++;
                __cat = __cat.ParentCategory;
            }
            //Env.RegisterStartupMessage("111", k.ToString());
            int activeDll = 0;
            int activeCategory = cat.ID;
            switch (k)
            {
                case 1:
                    ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                    _lpc = pcCurr.ChildCategories;
                    _lpc.Sort(CompareByName);
                    foreach (ProductCategory pcc in _lpc)
                    {
                        ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                    }
                    ddlCatChildChild.Items.Add(new ListItem("нет подкатегорий раздела", "-1"));
                    break;

                case 2:
                    ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                    _lpc = pcCurr.ParentCategory.ChildCategories;
                    _lpc.Sort(CompareByName);
                    foreach (ProductCategory pcc in _lpc)
                    {
                        ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                    }

                    cidDDLCatInt = cat.ID;
                    pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
                    _lpc = pcCurr.ChildCategories;
                    if (_lpc.Count == 0)
                        ddlCatChildChild.Items.Add(new ListItem("нет подкатегорий раздела", "-1"));
                    else
                        ddlCatChildChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                    _lpc.Sort(CompareByName);
                    foreach (ProductCategory pcc in _lpc)
                    {
                        ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                    }

                    for (int i = 0; i < ddlCatChild.Items.Count; i++)
                    {
                        if (int.TryParse(ddlCatChild.Items[i].Value, out activeDll))
                        {
                            if (activeCategory == activeDll)
                                ddlCatChild.Items[i].Selected = true;
                        }
                    }
                    break;

                case 3:
                    ddlCatChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                    _lpc = pcCurr.ParentCategory.ParentCategory.ChildCategories;
                    _lpc.Sort(CompareByName);
                    foreach (ProductCategory pcc in _lpc)
                    {
                        ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                    }
                    activeCategory = cat.ParentCategory.ID;
                    for (int i = 0; i < ddlCatChild.Items.Count; i++)
                    {
                        if (int.TryParse(ddlCatChild.Items[i].Value, out activeDll))
                        {
                            if (activeCategory == activeDll)
                                ddlCatChild.Items[i].Selected = true;
                        }
                    }

                    cidDDLCatInt = cat.ParentCategoryID;
                    pcCurr = MirUpak.Model.Schema.Categories.SelectKey(cidDDLCatInt);
                    _lpc = pcCurr.ChildCategories;
                    if (_lpc.Count == 0)
                        ddlCatChildChild.Items.Add(new ListItem("нет подкатегорий раздела", "-1"));
                    else
                        ddlCatChildChild.Items.Add(new ListItem("Выберите подкатегорию раздела", "Выберите подкатегорию раздела"));
                    _lpc.Sort(CompareByName);
                    foreach (ProductCategory pcc in _lpc)
                    {
                        ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
                    }
                    activeCategory = cat.ID;
                    for (int i = 0; i < ddlCatChildChild.Items.Count; i++)
                    {
                        if (int.TryParse(ddlCatChildChild.Items[i].Value, out activeDll))
                        {
                            if (activeCategory == activeDll)
                                ddlCatChildChild.Items[i].Selected = true;
                        }
                    }

                    break;
                default:
                    Console.WriteLine("Default case");
                    break;
            }
        }
        catch
        {
            ddlCatChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }
            /*ddlCatChildChild.Items.Add(new ListItem("Выберите раздел", "Выберите раздел"));
            foreach (ProductCategory pcc in ProductCategory.RootCategories)
            {
                ddlCatChildChild.Items.Add(new ListItem(pcc.Name, pcc.ID.ToString()));
            }*/
        }
    }

    #region INavigable Members

    public INavigator GetNavigator()
    {
        if (null == cat) return new RootProductCategoryNavigator();
        return new ProductCategoryNavigator(cat);
    }

    #endregion

}