using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.Entity;
using Ideal.UI;
using Ideal.Core.Xml;
using Ideal.UI.Builders;
using Ideal.Core.Imaging;
using System.Collections.Generic;
using Ideal.Wision;
using Ideal.Wision.Schema;
using MirUpak.Model;

[RelationBackendName("ProductCategories2"), CacheMode(RelationCacheMode.Super)]
public class ProductCategory : Entity<int, ProductCategory>, INavigable
{
    #region DAL

    [Member("ID"), UiTitle("Код"), UiLocation(Location.Editor), PrimaryKey, AutoIncrement]
    protected int id;
    public int ID
    {
        get { return id; }
    }

    [Member("Name"), MaximumLength(256), UiTitle("Название"), UiLocation(Location.Both)]
    protected string name = String.Empty;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    [Member("Active"), UiTitle("Активен"), UiLocation(Location.Both)]
    protected bool active = true;
    public bool Active
    {
        get { return active; }
        set { active = value; }
    }

    [Member("ShowInMenu"), UiTitle("Показывать в главном меню"), UiLocation(Location.Both)]
    protected bool showInMenu = true;
    public bool ShowInMenu
    {
        get { return showInMenu; }
        set { showInMenu = value; }
    }

    [Member("Own"), UiTitle("Собственная ТМ"), UiLocation(Location.Both)]
    protected bool own = false;
    public bool Own
    {
        get { return own; }
        set { own = value; }
    }

    [Member("UpShadedText"), MaximumLength(2048), UiTitle("Текст на верхнее фото")]
    public string UpShadedText = string.Empty;

    [Member("PricePerGramm"), UiTitle("Цена за грамм"), UiLocation(Location.None)]
    public int PricePerGramm = 0;

    [Member("Description", typeof(EntityProperties), typeof(XmlProperties)), MaximumLength(1048576)]
    protected string description = String.Empty;
    [UiMember("Description"), UiTitle("Описание"), UiLocation(Location.Editor)]
    public HtmlText Description
    {
        get { return new HtmlText(description); }
        set { description = value.Html; }
    }

    [Member("DescriptionRight", typeof(EntityProperties), typeof(XmlProperties)), MaximumLength(1048576)]
    protected string descriptionRight = String.Empty;
    [UiMember("DescriptionRight"), UiTitle("Описание - справа"), UiLocation(Location.Editor)]
    public HtmlText DescriptionRight
    {
        get { return new HtmlText(descriptionRight); }
        set { descriptionRight = value.Html; }
    }

    [EntityMember("Photo"), MaximumLength(1024)]
    protected string photo = string.Empty;
    [UiMember, UiTitle("Фото"), ImageLocation("~/i/pc/"), ImageResize(220, 220), XmlMember]
    public ImageInfo Photo
    {
        get { return new ImageInfo(this.photo); }
        set { this.photo = value.State; }
    }

    [EntityMember("PhotoSubHeader"), MaximumLength(1024)]
    protected string photoSubHeader = string.Empty;
    [UiMember, UiTitle("Фото в шапке категории"), ImageLocation("~/i/pc/"), ImageResize(1140, 290), XmlMember]
    public ImageInfo PhotoSubHeader
    {
        get { return new ImageInfo(this.photoSubHeader); }
        set { this.photoSubHeader = value.State; }
    }

    [EntityMember("Photos"), MaximumLength(8192)]
    protected string photos = string.Empty;
    [UiMember, UiTitle("Доп. фотографии"), ImageLocation("~/i/pc/"), XmlMember]
    public ImagesInfo Photos
    {
        get { return new ImagesInfo(this.photos); }
        set { this.photos = value.State; }
    }

    [EntityMember("PhotosRight"), MaximumLength(8192)]
    protected string photosRight = string.Empty;
    [UiMember, UiTitle("Фотографии справа"), ImageLocation("~/i/pc/"), XmlMember]
    public ImagesInfo PhotosRight
    {
        get { return new ImagesInfo(this.photosRight); }
        set { this.photosRight = value.State; }
    }

    [EntityMember("PhotoRight"), MaximumLength(8192)]
    protected string photoRight = string.Empty;
    [UiMember, UiTitle("Фотография справа (своя)"), ImageLocation("~/i/pc/"), XmlMember]
    public ImageInfo PhotoRight
    {
        get { return new ImageInfo(this.photoRight); }
        set { this.photoRight = value.State; }
    }

    [Member("PhotoRightLink"), MaximumLength(512), UiTitle("Ссылка на фото справа")]
    public string PhotoRightLink = string.Empty;

    [Member("ParentCategoryID"), UiLocation(Location.None)]
    protected int parentCategoryID = 0;
    public int ParentCategoryID
    {
        get { return parentCategoryID; }
        set { parentCategoryID = value; }
    }

    [Member("OrderIndex"), UiTitle("Позиция"), UiLocation(Location.None)]
    protected int orderIndex = 0;
    public int OrderIndex
    {
        get { return orderIndex; }
        set { orderIndex = value; }
    }

    [Member("SizesTitle"), MaximumLength(256), UiTitle("Название параметра"), UiLocation(Location.None)]
    protected string sizesTitle = String.Empty;
    public string SizesTitle
    {
        get { return sizesTitle; }
        set { sizesTitle = value; }
    }

    [Member("SizeString"), MaximumLength(1024), UiTitle("Значения параметра"), UiLocation(Location.None)]
    protected string sizeString = String.Empty;
    public string SizeString
    {
        get { return sizeString; }
        set { sizeString = value; }
    }

    [Member("CategoryInsertions"), MaximumLength(1024), UiTitle("Вставки для товаров"), UiLocation(Location.None)]
    protected string сategoryInsertions = String.Empty;
    public string CategoryInsertions
    {
        get { return сategoryInsertions; }
        set { сategoryInsertions = value; }
    }

    [Member("CategoryMetals"), MaximumLength(1024), UiTitle("Металлы для товаров"), UiLocation(Location.None)]
    protected string categoryMetals = String.Empty;
    public string CategoryMetals
    {
        get { return categoryMetals; }
        set { categoryMetals = value; }
    }

    [Member("CategorySizes"), MaximumLength(1024), UiTitle("Размеры для товаров"), UiLocation(Location.None)]
    protected string categorySizes = String.Empty;
    public string CategorySizes
    {
        get { return categorySizes; }
        set { categorySizes = value; }
    }

    #endregion

    [Member(typeof(XmlProperties))]
    public string ImageUrl
    {
        get
        {
            if (this.Photo.Exists)
                return String.Format(@"{0}/i/pc/{1}", Env.AppPath, this.Photo.LargeName);
            
            return String.Format("{0}/ii/t.gif", Env.AppPath);
        }
    }

    public string UrlPath
    {
        get
        {
            return String.Format("{0}/catalog/{1}/", Env.AppPath, this.ID);
        }
    }

    public ProductCategory ParentCategory
    {
        get
        {
            return Schema.Categories.SelectKey(this.ParentCategoryID);
        }
    }

    public List<ProductCategory> ChildCategories
    {
        get
        {
            return Schema.Categories.Select("ParentCategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), this.ID).Items;
        }
    }

    public List<ProductCategory> NestedCategories
    {
        get
        {
            List<ProductCategory> list = this.ChildCategories;
            list = this.GetChilds(list);
            return list;
        }
    }

    public List<Product> Products
    {
        get
        {
            return Schema.Products.Select("CategoryID = @1 AND Active = @2", new SelectOptions("OrderIndex", SortOrder.Ascending), this.ID, true).Items;
        }
    }

    public List<Product> AllProducts
    {
        get
        {
            return Schema.Products.Select("CategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), this.ID).Items;
        }
    }

    /*public List<Product> PricedProducts
    {
        get
        {
            List<Product> lps = this.Products;
            return lps.FindAll(delegate(Product p) { return p.Price > 0; });
        }
    }

    public List<Product> Rests
    {
        get
        {
            List<Product> lps = this.Products;
            return lps.FindAll(delegate(Product p) { return p.AvailableRestsCount > 0; });
        }
    }

    public int RestCount
    {
        get
        {
            return Schema.Products.Cache.CachedEntities.FindAll(delegate(Product p) { return (p.CategoryID == this.ID && p.AvailableRestsCount > 0); }).Count;
        }
    }*/

    public List<string> Parameters
    {
        get
        {
            List<string> list = new List<string>();

            string[] values = this.SizeString.Split(';');

            for (int i = 0; i < values.Length; i++)
            {
                /*double value = 0;
                if (double.TryParse(values[i], out value))*/
                string vl = values[i].Trim();
                if (vl.Length > 0)
                    list.Add(vl);
            }

            list.Sort();

            return list;
        }
    }

    public List<string> ActualParameters
    {
        get
        {
            List<string> list = this.Parameters;

            if (list.Count == 0)
            {
                ProductCategory c = this.ParentCategory;
                while (c != null)
                {
                    if (c.Parameters.Count > 0)
                    {
                        list = c.Parameters;
                        break;
                    }
                    c = c.ParentCategory;
                }
            }

            return list;
        }
    }

    public string ActualSizesTitle
    {
        get
        {
            string str = this.SizesTitle;

            if (str == String.Empty)
            {
                ProductCategory c = this.ParentCategory;
                while (c != null)
                {
                    if (c.Parameters.Count > 0)
                    {
                        str = c.SizesTitle;
                        break;
                    }
                    c = c.ParentCategory;
                }
            }

            return str;
        }
    }

    public static List<ProductCategory> RootCategories
    {
        get
        {
            return Schema.Categories.Select("ParentCategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), 0).Items;
        }
    }

    public static List<ProductCategory> OwnCategories
    {
        get
        {
            return Schema.Categories.Select("OWN = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), true).Items;
        }
    }

    public static ProductCategory SelectCategoryByID(int ID)
    {
        return Schema.Categories.SelectKey(ID);
    }

    List<ProductCategory> GetChilds(List<ProductCategory> result)
    {
        List<ProductCategory> list = this.ChildCategories;
        foreach (ProductCategory c in list)
        {
            result.AddRange(c.ChildCategories);
            c.GetChilds(result);
        }
        return result;
    }


    protected override void AfterInsert()
    {
        base.AfterInsert();

        this.OrderIndex = this.ID;
        this.Update();
    }

    #region INavigable Members

    INavigator INavigable.GetNavigator()
    {
        return new ProductCategoryNavigator(this);
    }

    #endregion

    internal static ProductCategory GetByName(string name)
    {
        foreach (ProductCategory cat in Schema.Categories.Cache.CachedEntities)
        {
            if (cat.name.Equals(name, StringComparison.CurrentCultureIgnoreCase))
            {
                return cat;
            }
        }

        ProductCategory cat2 = Schema.Categories.CreateNew();
        cat2.name = name;
        cat2.Update();

        return cat2;
    }

    internal static ProductCategory GetByName(ProductCategory parentCategory, string name)
    {
        foreach (ProductCategory cat2 in parentCategory.ChildCategories)
        {
            if (cat2.name.Equals(name, StringComparison.CurrentCultureIgnoreCase))
            {
                return cat2;
            }
        }

        ProductCategory cat3 = Schema.Categories.CreateNew();
        cat3.parentCategoryID = parentCategory.id;
        cat3.name = name;
        cat3.Update();

        return cat3;
    }
}

public sealed class ProductCategoryNavigator : INavigator
{
    ProductCategory category;

    public ProductCategoryNavigator(ProductCategory category)
    {
        this.category = category;
    }

    #region INavigator Members

    string INavigator.ContentTitle
    {
        get { return category.Name; }
    }

    INavigator INavigator.Parent
    {
        get 
        {
            if (category.ParentCategoryID == 0)
                //return new RootProductCategoryNavigator();
                return null;
            return new ProductCategoryNavigator(category.ParentCategory); 
        }
    }

    string INavigator.Title
    {
        get { return category.Name; }
    }

    UrlPath INavigator.Url
    {
        get { return new UrlPath(category.UrlPath); }
    }

    #endregion
}

public sealed class RootProductCategoryNavigator : INavigator
{
    #region INavigator Members

    string INavigator.ContentTitle
    {
        get { return "Продукция"; }
    }

    INavigator INavigator.Parent
    {
        get { return null; }
    }

    string INavigator.Title
    {
        get { return "Продукция"; }
    }

    UrlPath INavigator.Url
    {
        get { return new UrlPath("/catalog/"); }
    }

    #endregion
}