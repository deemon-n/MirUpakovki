using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Commerce.Admin;
using Ideal.Commerce;
using Ideal.Wision;
using Ideal.UI.Web;
using Ideal.Entity;
using Ideal.Core;
using MirUpak.Model;
using System.Web.UI.WebControls;

[AdminWintrol("2B50D62A-0E72-4a97-8EFE-7886BDEF83B5", typeof(MuAdminGroup), "Список заказов", "Управление заказами", "~/ii/ai/orders.gif")]
public sealed class Orders : OrderList
{
    public Orders()
        : base(Commerce.Engine)
    {
        this.Init += new EventHandler(Orders_Init);
    }

    void Orders_Init(object sender, EventArgs e)
    {
        this.CreateOrderInfoControls += new CreateOrderInfoControls(ol_CreateOrderInfoControls);

        if (!Env.CurrentPage.IsPostBack)
        {
            string og = Env.QueryString;
            if (null != og)
            {
                Guid g = Guid.Empty;
                try
                {
                    g = new Guid(og);
                }
                catch
                {
                }

                if (g != Guid.Empty)
                    this.SelectOrder(g);
            }
        }
    }

    protected override void UpdateList()
    {
        if (!String.IsNullOrEmpty(Page.Request.QueryString["id"]))
        {
            Guid id = new Guid(Page.Request.QueryString["id"]);
            OrderEditableList oel = new OrderEditableList(Ideal.Commerce.Engine.Current);
            oel.Orders = Ideal.Commerce.Engine.Current.GetOrders(id);
            this.List = oel;
        }
        else
            base.UpdateList();

    }

    void ol_CreateOrderInfoControls(System.Web.UI.Control parentControl, Ideal.Commerce.Order order)
    {

    }

    protected override string[] CustomOrderBeginHeaders
    {
        get
        {
            return new string[] { "Артикул", "Цена" };
        }
    }

    protected override string[] GetCustomOrderBeginColumnData(Ideal.Commerce.OrderItem orderItem)
    {
        Product p = (Product)orderItem.Product;
        return new string[] { p.Articul.ToString(), p.Price.ToString("n2") };
    }

    protected override List<System.Web.UI.Control> CreateListAdditionalColumns(Ideal.Commerce.Order rowEntity, int rowIndex)
    {
        List<System.Web.UI.Control> lac = base.CreateListAdditionalColumns(rowEntity, rowIndex);
        Literal lt = new Literal();
        lt.EnableViewState = false;
        lt.Text = String.Format(@"<a href='{0}'>Бланк заказа</a>", "/orders/" + rowEntity.Number.ToString() + ".xls");
        lac.Add(lt);

        return lac;
    }

    protected override List<string> GetListAdditionalColumnsHeaders()
    {
        List<string> las = base.GetListAdditionalColumnsHeaders();
        las.Add("Бланк заказа");

        return las;
    }
}

class OrderEditableList : IEditableList<int, Ideal.Commerce.Order>
{
    EntityList<int, Ideal.Commerce.Model.Order> borders;
    List<Ideal.Commerce.Order> orders;
    public List<Ideal.Commerce.Order> Orders
    {
        get { return orders; }
        set { orders = value; }
    }

    public OrderEditableList(Engine engine)
    {
        this.Orders = new List<Ideal.Commerce.Order>();
    }

    public OrderEditableList(Engine engine, EntityList<int, Ideal.Commerce.Model.Order> orders)
    {
        this.borders = orders;
        this.orders = new List<Ideal.Commerce.Order>();

        foreach (Ideal.Commerce.Model.Order mo in orders)
        {
            this.orders.Add(new Ideal.Commerce.Order(engine, mo));
        }
    }

    #region IEditableList<int,Ideal.Commerce.Order> Members

    public List<Ideal.Commerce.Order> GetItems()
    {
        return orders;
    }

    public string GetInstanceTitle(Ideal.Commerce.Order instance)
    {
        return "Заказ #" + instance.Number + " (" + instance.ID.ToString() + ")";
    }

    public int GetPrimaryKey(Ideal.Commerce.Order instance)
    {
        return instance.Number;
    }

    public Ideal.Commerce.Order GetInstance(int key)
    {
        foreach (Ideal.Commerce.Order o in orders)
        {
            if (o.Number == key)
                return o;
        }

        throw new CommerceException("Cannot find order for number {0:n0}", key);
    }

    public Ideal.Commerce.Order CreateNew()
    {
        throw new CommerceException("Cannot create new order");
    }

    public void ImplementUpdate(Ideal.Commerce.Order instance)
    {
        throw new CommerceException("Order cannot be updated");
    }

    public void ImplementDelete(Ideal.Commerce.Order instance)
    {
        if (CommerceSettings.Instance.EnableOrdersRemove)
            instance.Remove();
        else
            throw new CommerceException("Order cannot be deleted");
    }

    #endregion
}
