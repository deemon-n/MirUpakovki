using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Entity;
using Ideal.UI;
using Ideal.Core.Xml;
using Ideal.UI.Builders;
using Ideal.Core.Imaging;
using Ideal.Wision.Schema;
using Ideal.Wision;
using Ideal.Commerce;
using System.Xml;
using System.IO;
using System.Drawing;
using Ideal.Core;
using System.Web.UI.WebControls;
using System.Globalization;
using Ideal.Wision.IO;
using Ideal.Wision.Identity;
using Ideal.Core.Net;

namespace MirUpak.Model
{
    [RelationBackendName("Products2")/*, CacheMode(RelationCacheMode.Super)*/]
    public class Product : Entity<int, Product>, IProduct, IComplexProduct
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        internal int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member("GID"), UiTitle("GID"), UiLocation(Location.None)]
        Guid gid;
        public Guid GID
        {
            get { return gid; }
            set { gid = value; }
        }

        [Member, UiLocation(Location.None), XmlCustomFormat("{0:d}")]
        protected DateTime dateCreated = DateTime.Now;
        public DateTime DateCreated
        {
            get { return this.dateCreated; }
        }

        [Member, UiTitle("Активен")]
        public bool Active = true;

        [Member("Articul"), MaximumLength(64), UiTitle("Код продукта"), UiLocation(Location.Both)]
        internal string articul = String.Empty;
        public string Articul
        {
            get { return articul; }
            set { articul = value; }
        }

        [Member("Code"), MaximumLength(64), UiTitle("Код"), UiLocation(Location.Both)]
        internal string code = String.Empty;
        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        [Member("NewProd"), UiTitle("Новинка"), UiLocation(Location.AbsolutelyNone)]
        protected bool newProd = false;
        public bool NewProd
        {
            get { return newProd; }
            set { newProd = value; }
        }

        [Member("Special"), UiTitle("Специальное предложение"), UiLocation(Location.Both)]
        protected bool special = false;
        public bool Special
        {
            get { return special; }
            set { special = value; }
        }

        [Member("TopProducts"), UiTitle("Топ продаж"), UiLocation(Location.Both)]
        protected bool topProducts = false;
        public bool TopProducts
        {
            get { return topProducts; }
            set { topProducts = value; }
        }

        [Member("SaleProducts"), UiTitle("Распродажа"), UiLocation(Location.Both)]
        protected bool saleProducts = false;
        public bool SaleProducts
        {
            get { return saleProducts; }
            set { saleProducts = value; }
        }

        [Member("Name"), MaximumLength(128), UiTitle("Название"), UiLocation(Location.Both)]
        string name = String.Empty;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        //[Member("About"), MaximumLength(1024), UiTitle("Краткое описание"), UiLocation(Location.Editor)]
        //string about = String.Empty;
        //public string About
        //{
        //    get { return about; }
        //    set { about = value; }
        //}

        [Member("Weight"), UiTitle("Вес"), UiLocation(Location.AbsolutelyNone)]
        protected double weight = 0;
        public double Weight
        {
            get { return weight; }
            set { weight = value; }
        }

        [Member, UiLocation(Location.None)]
        public int OrderIndex;

        [EntityMember("Price"), UiMember("BasePrice"), XmlMember, UiTitle("Розничная цена"), UiLocation(Location.Both)]
        internal double basePrice = 0;
        public double BasePrice
        {
            get { return basePrice; }
            set { basePrice = value; }
        }

        [EntityMember("SpecPrice"), UiMember("SpecPrice"), XmlMember, UiTitle("Специальная цена"), UiLocation(Location.Both)]
        internal double specPrice = 0;
        public double SpecPrice
        {
            get { return specPrice; }
            set { specPrice = value; }
        }

        [Member("Count"), UiTitle("Количество, шт."), UiLocation(Location.Both)]
        int count = 0;
        public int Count
        {
            get { return count; }
            set { count = value; }
        }

        [XmlMember]
        public bool IsNew
        {
            get
            {
                return this.dateCreated > DateTime.Now.AddDays(-30);
            }
        }

        //[Member, UiTitle("Гарнитуры"), MaximumLength(256)]
        //public string Garnitures = string.Empty;

        //[Member("Enabled"), UiTitle("Наличие на складе"), UiLocation(Location.List)]
        //bool enabled = true;
        //public bool Enabled
        //{
        //    get { return enabled; }
        //    set { enabled = value; }
        //}

        [Member("CategoryID"), UiTitle("Категория"), UiLocation(Location.None), XmlCustomFormat("{0:d}"), Indexed]
        protected int categoryID;
        public int CategoryID
        {
            get { return categoryID; }
            set
            {
                /*if (categoryID != value)
                    this.RebuildIndex(IxCatID, categoryID, value);*/
                categoryID = value;
            }
        }

        /*static int ixCatID = -1;
        static int IxCatID
        {
            get
            {
                if (ixCatID == -1)
                    ixCatID = Schema.Products.Cache.GetIndexNumber("CategoryID");
                return ixCatID;
            }
        }*/

        /*[Member, UiTitle("Вставки"), MaximumLength(512)]
        public string Insertions = string.Empty;

        [Member, UiTitle("Металлы"), MaximumLength(512)]
        public string Metals = string.Empty;

        [Member, UiTitle("Проба")]
        public int Probe;*/

        [Member("Description", typeof(EntityProperties), typeof(XmlProperties)), MaximumLength(1048576)]
        protected string description = String.Empty;
        [UiMember("Description"), UiTitle("Описание"), UiLocation(Location.Editor)]
        public HtmlText Description
        {
            get { return new HtmlText(description); }
            set { description = value.Html; }
        }

        //[Member]
        //public bool HasImage = false;

        [EntityMember("Photo"), MaximumLength(1024)]
        protected string photo = string.Empty;
        [UiMember, UiTitle("Фото"), ImageLocation("~/i/p/"), ImageResize(-1200), ImagePreview(360, 360), XmlMember]
        public ImageInfo Photo
        {
            get { return new ImageInfo(this.photo); }
            set { this.photo = value.State; }
        }

        [EntityMember("PhotoSpec"), MaximumLength(1024)]
        protected string photoSpec = string.Empty;
        [UiMember, UiTitle("Фото(спецпредложение)"), ImageLocation("~/i/p/"), ImageResize(-1200), ImagePreview(360, 360), XmlMember]
        public ImageInfo PhotoSpec
        {
            get { return new ImageInfo(this.photoSpec); }
            set { this.photoSpec = value.State; }
        }

        [EntityMember("Photos"), MaximumLength(8192)]
        protected string photos = string.Empty;
        [UiMember, UiTitle("Доп. фотографии"), ImageLocation("~/i/p/"), ImagePreview(80, 80), XmlMember]
        public ImagesInfo Photos
        {
            get { return new ImagesInfo(this.photos); }
            set { this.photos = value.State; }
        }

        #endregion

        [UiMember("CutColumn"), UiTitle("&nbsp;"), UiLocation(Location.List), MemberIndex(1000)]
        public string CutColumn
        {
            get
            {
                return String.Format("<div style='text-align: center'><input id='cb_{0}' type='checkbox' class='checkbox' /></div>", this.ID.ToString());
            }
        }

        [Member]
        public bool HasImage = false;

        [Member]
        public int PictureSize = 0;

        public string ImagePath
        {
            get
            {
                string folderCode = (Math.Abs(this.articul.GetHashCode()) % 256).ToString();
                return Env.Server.MapPath(string.Format("~/i/p/{0}/{1}l.jpg", folderCode, this.id));
            }
        }

        public string PreviewPath
        {
            get
            {
                string folderCode = (Math.Abs(this.articul.GetHashCode()) % 256).ToString();
                return Env.Server.MapPath(string.Format("~/i/p/{0}/{1}s.jpg", folderCode, this.id));
            }
        }

        [Member(typeof(XmlProperties))]
        public string ImageUrl
        {
            get
            {
                if (this.HasImage)
                {                    
                    if (!this.Special)
                    {
                        if (this.Photo.Exists)
                        {
                            return string.Format("{1}/i/p/{0}", this.Photo.PreviewName, Env.AppPath);
                        }
                        else
                        {
                            string folderCode = (Math.Abs(this.articul.GetHashCode()) % 256).ToString();
                            return string.Format("/i/p/{0}/{1}l.jpg", folderCode, this.id);
                        }
                    }
                    else
                    {
                        return string.Format("{1}/i/p/{0}", this.PhotoSpec.PreviewName, Env.AppPath);
                    }
                }

                return String.Format("{0}/ii/t.gif", Env.AppPath);
            }
        }

        [Member(typeof(XmlProperties))]
        public string PreviewUrl
        {
            get
            {
                //if (!this.HasImage)
                //    return string.Empty;

                /*if (this.Photo.PreviewName != String.Empty)
                    return String.Format(@"{0}/i/p/{1}", Env.AppPath, this.Photo.PreviewName);
                else
                    return String.Format("{0}/ii/no-image.jpg", Env.AppPath);*/

                if (this.HasImage)
                {
                    if (!this.Special)
                    {
                        if (this.Photo.Exists)
                        {
                            return string.Format("{1}/i/p/{0}", this.Photo.PreviewName, Env.AppPath);
                        }
                        else
                        {
                            string folderCode = (Math.Abs(this.articul.GetHashCode()) % 256).ToString();
                            return string.Format("/i/p/{0}/{1}s.jpg", folderCode, this.id);
                        }
                    }
                    else
                    {
                        return string.Format("{1}/i/p/{0}", this.PhotoSpec.PreviewName, Env.AppPath);
                    }
                }

                return String.Format("{0}/ii/t.gif", Env.AppPath);
            }
        }        

        public void CreateImageFromFile(string fileName)
        {
            string destDir = Env.Server.MapPath("~/i/p/");
            int folderCode = Math.Abs(this.articul.GetHashCode()) % 256;
            if (!Directory.Exists(destDir + folderCode.ToString()))
                Directory.CreateDirectory(destDir + folderCode.ToString());
            destDir = destDir + folderCode.ToString() + "\\";
            string largePath = string.Concat(destDir, ID.ToString(), "l.jpg");
            string previewPath = string.Concat(destDir, ID.ToString(), "s.jpg");

            try
            {
                File.Delete(largePath);
            }
            catch { }

            try
            {
                File.Delete(previewPath);
            }
            catch { }

            File.Copy(fileName, largePath, true);

            Editor editor = new Editor(largePath);
            Size largeSize = editor.Bitmap.Size;
            /*if (largeSize.Width > 1500 || largeSize.Width > 1500)
            {
                editor.Resize(500, 500, true);
                editor.Save(largePath, new JpegSaver(90));
                largeSize = new Size(500, 500);
            }*/

            Size previewSize = new Size(180, 180);
            editor.Resize(previewSize.Width, previewSize.Height, true);
            editor.Save(previewPath, new JpegSaver(95));

            if (!this.HasImage || this.PictureSize != largeSize.Width)
            {
                this.PictureSize = largeSize.Width;
                this.HasImage = true;
                this.Update();
            }
        }


        #region XML

        [Member(typeof(XmlProperties))]
        public string UrlPath
        {
            get
            {
                return String.Format("{0}/catalog/{1}/{2}.aspx", Env.AppPath, this.CategoryID, this.ID);
            }
        }

        [UiMember, UiLocation(Location.List), UiTitle("Двиг")]
        public string MoveLink
        {
            get
            {
                return String.Format("<a href='AA4C6E16-6722-4ae3-A96B-803D4664F531.aspx?pid={0}' target='_blank'>...</a>", this.ID);
            }
        }

        public double Price
        {
            get
            {
                //return 0;
                return (this.Special) ? this.SpecPrice : this.BasePrice;
            }
        }

        [XmlMember]
        public string PriceString
        {
            get
            {
                string str = String.Empty;

                int k = (int)(this.Price / 1000);
                if (k > 0)
                    str = k.ToString() + " ";
                if (this.Price - k * 1000 != 0)
                    str += (this.Price - k * 1000).ToString() + " руб.";
                else
                    str += "000 руб.";

                //return str;
                return this.Price.ToString("N2") + " руб.";
            }
        }

        [XmlMember]
        public bool Favorite
        {
            get
            {
                foreach (Product p in LastViewed.List)
                {
                    if (p.ID == this.ID)
                        return true;
                }
                return false;
            }
        }

        #endregion

        /*static int ixVNum = -1;
        static int IxVNum
        {
            get
            {
                if (ixVNum == -1)
                    ixVNum = Schema.Products.Cache.GetIndexNumber("IsNew");
                return ixVNum;
            }
        }*/

        public ProductCategory RootCategory
        {
            get
            {

                ProductCategory pc = new ProductCategory();
                pc = this.Category;
                while (pc.ParentCategory != null)
                {
                    pc = pc.ParentCategory;
                }

                return pc;
            }
        }

        public ProductCategory ParentCategory
        {
            get
            {
                ProductCategory pc = new ProductCategory();
                pc = this.Category;
                //pc = this.Category.ParentCategory;            
                return pc;
            }
        }

        public ProductCategory Category
        {
            get { return Schema.Categories[this.CategoryID]; }
        }

        public string CategoryName
        {
            get
            {
                if (this.Category != null)
                    return Category.Name;

                return String.Empty;
            }
        }

        public static EntityList<int, Product> TopProductsList
        {
            get
            {
                return Schema.Products.Select("TopProducts = @1 AND Active = @1", true);
            }
        }

        public static EntityList<int, Product> SpecialProductsList
        {
            get
            {
                return Schema.Products.Select("Special = @1 AND Active = @1", true);
            }
        }

        public static EntityList<int, Product> SaleProductsList
        {
            get
            {
                return Schema.Products.Select("SaleProducts = @1 AND Active = @1", true);
            }
        }

        public static List<Product> SaleProductsListIndex
        {
            get
            {
                List<Product> lp = Schema.Products.Select("SaleProducts = @1 AND Active = @1", true).Items;
                if (lp.Count > 8)
                    lp = lp.GetRange(0, 8);                
                return lp;
            }
        }

        public static EntityList<int, Product> LatestProducts
        {
            get
            {
                SelectOptions so = new SelectOptions("DateCreated", SortOrder.Descending);
                so.LastItem = 4;
                return Schema.Products.SelectAll(so);
            }
        }

        public static Product GetProductByArticle(string article)
        {
            //return Schema.Products.SelectSingle("Articul = @1", article);
            foreach (Product p in Schema.Products.Cache.CachedEntities)
            {
                if (p.Articul == article)
                    return p;
            }
            return null;
        }

        public bool IsInBranch(int catID)
        {
            if (catID == 0)
                return true;
            if (catID == this.CategoryID)
                return true;

            ProductCategory currentCat = this.Category;
            if (currentCat.ParentCategoryID != 0)
                while (currentCat.ID > 0)
                {
                    currentCat = currentCat.ParentCategory;
                    if (currentCat.ID == catID)
                        return true;
                }

            return false;
        }

        bool _isJustCreated = false;
        protected override void BeforeInsert()
        {
            /*int moi = 0;
            if (this.Category != null)
            {
                foreach (Product p in this.Category.Products)
                    if (p.OrderIndex > moi)
                        moi = p.OrderIndex;
                this.OrderIndex = moi + 1;
            }

            this.gid = Guid.NewGuid();*/
            this.dateCreated = DateTime.Now;
            //if (this.Photo.LargeName != String.Empty)
            //    this.HasImage = true;
            base.BeforeInsert();

            _isJustCreated = this.IsJustCreated;
        }

        #region IProduct Members

        ProductAttributes IProduct.Attributes
        {
            get { return null; }
        }

        string IProduct.Attrs
        {
            get
            {
                return string.Empty;
            }
            set
            {
                
            }
        }

        string IProduct.BrandName
        {
            get { return String.Empty; }
        }

        string IProduct.Code
        {
            get { return this.Code; }
        }

        public static Product GetByArt(string art)
        {
            foreach (Product p in Schema.Products.Cache.CachedEntities)
            {
                if (p.articul.Equals(art, StringComparison.CurrentCultureIgnoreCase))
                    return p;
            }

            return null;
        }

        Guid IProduct.ID
        {
            get { return this.GID; }
        }

        public double ListingPrice
        {
            //get { return this.Price; }
            get { return (this.Special) ? this.SpecPrice : this.BasePrice; }
            //get { return 0; }
        }

        double IProduct.Price
        {
            get { return (this.Special) ? this.SpecPrice : this.BasePrice; }
            //get { return 0; }
        }

        public string Title
        {
            get { return this.Articul; }
        }

        #endregion
        
        #region IComplexProduct Members

        string IComplexProduct.Code(SpecificItem ci)
        {
            return this.articul;
        }

        double IComplexProduct.ListingPrice(SpecificItem ci)
        {
            //return GetComplexPrice(ci);
            return (this.Special) ? this.SpecPrice : this.BasePrice;
            //return 0;
        }

        double IComplexProduct.Price(SpecificItem ci)
        {
            //return GetComplexPrice(ci);
            return (this.Special) ? this.SpecPrice : this.BasePrice;
            //return 0;
        }

        string IComplexProduct.Title(SpecificItem ci)
        {
            return this.name;
        }

        #endregion


        public static Product GetByCode(string code)
        {
            return Schema.Products.SelectSingle("Code = @1", code);
        }
    }

    public sealed class InsertionsInfo
    {
        public string insertions;
        public double price;
    }
    public sealed class SizeInfo
    {
        public double size;
        public double price;
    }
    public sealed class MetalsInfo
    {
        public string metals;
        public double price;
    }

}