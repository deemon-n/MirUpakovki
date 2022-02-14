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
using System.Xml;
using System.IO;
using System.Drawing;
using Ideal.Commerce;
using Ideal.Wision.Identity;
using System.Web;

namespace MirUpak.Model
{
    [RelationBackendName("Customers")]
    public class Customer : Entity<long, Customer>
    {
        #region DAL

        [Member("ID"), UiTitle("ИНН Клиента"), MemberIndex(1), PrimaryKey, UiLocation(Location.Both), UiReadOnly]
        long id;
        public long ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member("Active"), UiTitle("Работает"), UiLocation(Location.Both)]
        public bool Active = true;

        [Member, UiLocation(Location.None)]
        public int OurManagerID = 0;

        [Member, UiLocation(Location.None)]
        public Guid ManagerID = Guid.Empty;

        [UiMember, UiTitle("Менеджер"), UiLocation(Location.List)]
        public string ManagerName
        {
            get
            {
                if (this.ManagerID == Guid.Empty)
                    return "";

                IPerson ip = Manager.GetPerson(this.ManagerID);
                if (null == ip)
                    return "";

                return ip.FullName;
            }
        }

        [Member, UiTitle("ИНН наш"), MaximumLength(64), UiLocation(Location.Both)]
        public long OurINN;

        [Member, UiTitle("Название"), MaximumLength(128), UiLocation(Location.Both)]
        public string Name;

        [Member, UiTitle("Email"), MaximumLength(128)]
        public string Email;

        [Member, UiTitle("Телефон"), MaximumLength(64)]
        public string Phone;

        [Member, UiTitle("Номер договора"), MaximumLength(64), UiLocation(Location.Both)]
        public string AgreementNumber;

        [Member, UiTitle("Дата договора")]
        public DateTime AgreementDate;

        [Member, UiTitle("Окончание договора")]
        public DateTime AgreementFinish;

        [Member, UiTitle("Юр. адрес"), MaximumLength(128)]
        public string LawAddress;

        [Member, UiTitle("Почтовый адрес"), MaximumLength(128)]
        public string PostAddress;

        [Member, UiTitle("БИК"), MaximumLength(32)]
        public string BankIK;

        [Member, UiTitle("Название банка"), MaximumLength(128)]
        public string BankName;

        [Member, UiTitle("Р/с"), MaximumLength(128)]
        public string BankRS;

        [Member, UiTitle("К/с"), MaximumLength(128)]
        public string BankKS;

        [Member, UiTitle("Номер счёта"), MaximumLength(128)]
        public string Number;

        [Member, UiTitle("Долг"), UiLocation(Location.Both)]
        public double Debt;

        [Member, UiTitle("Отсрочка, дней")]        
        public int Deferment;

        [EntityMember]
        public Guid AgreementID = Guid.Empty;

        [EntityMember]
        public bool AgreementUploaded = false;

        public string AgreementUrl
        {
            get
            {
                if (!AgreementUploaded || AgreementID == Guid.Empty)
                {
                    return string.Empty;
                }

                return _AgreementUrl;
            }
        }

        protected internal string _AgreementUrl
        {
            get
            {
                return string.Format("/agreements/{0:x2}/{1}.zip", this.AgreementID.ToByteArray()[0], this.AgreementID);
            }
        }

        [Member, UiTitle("Дата начала")]
        public DateTime DateCreated;

        #endregion

        public static Customer Current
        {
            get
            {
                if (Manager.IsAnonymous)
                    return null;

                string scuid = (string) HttpContext.Current.Session["cuid"];
                if (string.IsNullOrEmpty(scuid))
                {
                    Person p = Manager.CurrentGenericPerson;
                    scuid = p.PersonSettings["cuid"];
                }

                if (!string.IsNullOrEmpty(scuid))
                {
                    long cuid = -1;
                    if (!long.TryParse(scuid, out cuid))
                        return null;

                    Customer cust = Schema.Customers[cuid];
                    if (null != cust)
                        return cust;
                }

                List<Customer> ccs = CurrentCustomers;
                if (ccs.Count == 0)
                    return null;

                return ccs[0];
            }
        }

        public static List<Customer> CurrentCustomers
        {
            get
            {
                List<Customer> lcs = Schema.Customers.Select("ManagerID = @1", Manager.CurrentPersonGuid).Items;
                return lcs;
            }
        }

        public List<Tran> Trans
        {
            get
            {
                return Schema.Trans.Select("INN = @1", new SelectOptions("DateCreated", SortOrder.Descending), this.id).Items;
            }
        }

        public List<Tran> GetTrans(DateTime date1, DateTime date2)
        {
            return Schema.Trans.Select("INN = @1 AND Date BETWEEN @2 AND @3", 
                new SelectOptions("DateCreated", SortOrder.Descending), this.id, date1, date2.AddDays(1)).Items;
        }

        public List<Order> Orders
        {
            get
            {
                return Schema.Orders.Select("INN = @1", new SelectOptions("Date", SortOrder.Descending), this.id).Items;
            }
        }

        public List<Order> GetOrders(DateTime date1, DateTime date2)
        {
            return Schema.Orders.Select("INN = @1 AND Date BETWEEN @2 AND @3",
                new SelectOptions("Date", SortOrder.Descending), this.id, date1, date2.AddDays(1)).Items;
        }

        public List<Order> OutdatedOrders
        {
            get
            {
                return Schema.Orders.Select("INN = @1 AND OutdatedDays > @2", 
                    new SelectOptions("Date", SortOrder.Descending), this.id, 0).Items;
            }
        }

        protected override void AfterCreation()
        {
            base.AfterCreation();
            this.DateCreated = DateTime.Now;
        }

        internal static Customer GetByInn(long inn)
        {
            //return Schema.Customers.SelectSingle("INN = @1", inn);
            return Schema.Customers[inn];
        }        
    }
}