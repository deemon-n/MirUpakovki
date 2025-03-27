using Ideal.Commerce;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JSONProduct
{
    public class Detail
    {
        public List<Product> products { get; set; }
    }

    public class Add
    {
        public List<ProductAdd> products { get; set; }
    }

    public class Remove
    {
        public List<ProductRemove> products { get; set; }
    }

    public class Ecommerce
    {
        public string currencyCode { get; set; }
        public Detail detail { get; set; }
    }

    public class EcommerceAdd
    {
        public string currencyCode { get; set; }
        public Add add { get; set; }
    }

    public class EcommerceRemove
    {
        public string currencyCode { get; set; }
        public Remove remove { get; set; }
    }

    public class Product
    {
        public string id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public string category { get; set; }
        public string variant { get; set; }
    }

    public class ProductAdd
    {
        public string id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
    }

    public class ProductRemove
    {
        public string id { get; set; }
        public string name { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
    }

    public class Root
    {
        public Ecommerce ecommerce { get; set; }
    }

    public class RootAdd
    {
        public EcommerceAdd ecommerce { get; set; }
    }

    public class RootRemove
    {
        public EcommerceRemove ecommerce { get; set; }
    }

    public class View
    {
        public static string GetJSON(MirUpak.Model.Product product)
        {
            try
            {
                JSONProduct.Product _product = new JSONProduct.Product();
                _product.id = product.ID.ToString();
                _product.name = product.Name;
                _product.price = product.ListingPrice;
                _product.category = product.Category.Name;
                _product.variant = string.Empty;

                Ecommerce ecommerce = new Ecommerce();
                ecommerce.currencyCode = "RUB";

                Detail detail = new Detail();
                List<Product> lp = new List<Product>();
                lp.Add(_product);
                detail.products = lp;
                ecommerce.detail = detail;

                JSONProduct.Root root = new JSONProduct.Root();
                root.ecommerce = ecommerce;


                return JavaScriptConvert.SerializeObject(root);
            }
            catch { return string.Empty; }
        }
    }

    public class ActionField
    {
        public string id { get; set; }
    }

    public class EcommercePurchase
    {
        public string currencyCode { get; set; }
        public Purchase purchase { get; set; }
    }

    public class ProductPurchase
    {
        public string id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public string category { get; set; }
        public string variant { get; set; }
        public double quantity { get; set; }
    }

    public class Purchase
    {
        public ActionField actionField { get; set; }
        public List<ProductPurchase> products { get; set; }
    }

    public class RootPurchase
    {
        public EcommercePurchase ecommerce { get; set; }
    }

    public class AddProducts
    {
        public static string GetJSON(MirUpak.Model.Product product, int qty)
        {
            try
            {
                JSONProduct.ProductAdd _product = new JSONProduct.ProductAdd();
                _product.id = product.ID.ToString();
                _product.name = product.Name;
                _product.price = product.ListingPrice;
                _product.category = product.Category.Name;
                _product.quantity = qty;

                EcommerceAdd ecommerce = new EcommerceAdd();
                ecommerce.currencyCode = "RUB";

                Add add = new Add();
                List<ProductAdd> lp = new List<ProductAdd>();
                lp.Add(_product);
                add.products = lp;
                ecommerce.add = add;

                JSONProduct.RootAdd root = new JSONProduct.RootAdd();
                root.ecommerce = ecommerce;

                return JavaScriptConvert.SerializeObject(root);
            }
            catch { return string.Empty; }
        }
    }

    public class RemoveProducts
    {
        public static string GetJSON(MirUpak.Model.Product product, int qty)
        {
            try
            {
                JSONProduct.ProductRemove _product = new JSONProduct.ProductRemove();
                _product.id = product.ID.ToString();
                _product.name = product.Name;
                _product.category = product.Category.Name;
                _product.quantity = qty;

                EcommerceRemove ecommerce = new EcommerceRemove();
                ecommerce.currencyCode = "RUB";

                Remove remove = new Remove();
                List<ProductRemove> lp = new List<ProductRemove>();
                lp.Add(_product);
                remove.products = lp;
                ecommerce.remove = remove;

                JSONProduct.RootRemove root = new JSONProduct.RootRemove();
                root.ecommerce = ecommerce;

                return JavaScriptConvert.SerializeObject(root);
            }
            catch { return string.Empty; }
        }
    }

    public class PurchaseProducts
    {
        public static string GetJSON(Order o)
        {
            try
            {
                EcommercePurchase ecommerce = new EcommercePurchase();
                ecommerce.currencyCode = "RUB";

                Purchase purchase = new Purchase();
                ActionField actionField = new ActionField();
                actionField.id = o.Number.ToString();
                purchase.actionField = actionField;
                List<ProductPurchase> lp = new List<ProductPurchase>();

                JSONProduct.ProductPurchase _product = new JSONProduct.ProductPurchase();
                foreach (OrderItem oi in o.Items)
                {
                    MirUpak.Model.Product product = (MirUpak.Model.Product)oi.Product;
                    _product = new JSONProduct.ProductPurchase();
                    _product.id = product.ID.ToString();
                    _product.name = product.Name;
                    _product.price = product.ListingPrice;
                    _product.category = product.Category.Name;
                    _product.quantity = oi.Quantity;
                    lp.Add(_product);
                }

                purchase.products = lp;
                ecommerce.purchase = purchase;

                JSONProduct.RootPurchase root = new JSONProduct.RootPurchase();
                root.ecommerce = ecommerce;

                return JavaScriptConvert.SerializeObject(root);
            }
            catch { return string.Empty; }
        }
    }

}