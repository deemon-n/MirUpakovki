using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Entity;
using Ideal.Wision.Core;

namespace MirUpak.Model
{
    [RelationBackendNamePrefix("inv")]
    public sealed class Schema : RelationalSchema
    {
        Relation<long, Customer> customers;
        public static Relation<long, Customer> Customers
        {
            get { return Instance.customers; }
        }

        Relation<int, Tran> trans;
        public static Relation<int, Tran> Trans
        {
            get { return Instance.trans; }
        }

        Relation<int, Product> products;
        public static Relation<int, Product> Products
        {
            get { return Instance.products; }
        }

        Relation<int, ProductCategory> categories;
        public static Relation<int, ProductCategory> Categories
        {
            get { return Instance.categories; }
        }

        Relation<int, Order> orders;
        public static Relation<int, Order> Orders
        {
            get { return Instance.orders; }
        }

        Relation<int, OrderItem> orderItems;
        public static Relation<int, OrderItem> OrderItems
        {
            get { return Instance.orderItems; }
        }

        Relation<int, MuManager> managers;
        public static Relation<int, MuManager> Managers
        {
            get { return Instance.managers; }
        }

        Relation<int, Company> companies;
        public static Relation<int, Company> Companies
        {
            get { return Instance.companies; }
        }

        Relation<int, Ad> ads;
        public static Relation<int, Ad> Ads
        {
            get { return Instance.ads; }
        }
        
        static Schema instance = null;
        static Schema Instance
        {
            get
            {
                if (null == instance)
                    instance = new Schema(WisionApplication.DefaultBackendAdapter);
                return instance;
            }
        }

        static Schema()
        {
            if (null == instance)
                instance = new Schema(WisionApplication.DefaultBackendAdapter);
        }

        public Schema(Adapter adapter)
            : base(adapter)
        { }

        public override List<EntityProperties> CreateRelations()
        {
            customers = new Relation<long, Customer>(adapter, this);
            trans = new Relation<int, Tran>(adapter, this);
            products = new Relation<int, Product>(adapter, this);
            categories = new Relation<int, ProductCategory>(adapter, this);
            orders = new Relation<int, Order>(adapter, this);
            orderItems = new Relation<int, OrderItem>(adapter, this);
            managers = new Relation<int, MuManager>(adapter, this);
            companies = new Relation<int, Company>(adapter, this);
            ads = new Relation<int, Ad>(adapter, this);
            
            List<EntityProperties> lp = new List<EntityProperties>();
            lp.Add(customers.EntityProperties);
            lp.Add(trans.EntityProperties);
            lp.Add(products.EntityProperties);
            lp.Add(categories.EntityProperties);
            lp.Add(orders.EntityProperties);
            lp.Add(orderItems.EntityProperties);
            lp.Add(managers.EntityProperties);
            lp.Add(companies.EntityProperties);
            lp.Add(ads.EntityProperties);
            
            return lp;
        }

        internal static void Ping()
        {
            ;
        }
    }
}