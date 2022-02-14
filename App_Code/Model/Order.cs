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

namespace MirUpak.Model
{
    [RelationBackendName("Orders")]
    public class Order : Entity<int, Order>
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member, UiTitle("Наш ИНН"), MaximumLength(64)]
        public long OurINN;

        [Member, UiTitle("ИНН клиента"), MaximumLength(64), UiLocation(Location.Both), Indexed]
        public long INN;

        [Member, Indexed, XmlCustomFormat("{0:d}")]
        public DateTime Date;

        [Member, Indexed]
        public DateTime DeliveryDate;

        [Member, MaximumLength(128)]
        public string Number;

        [Member, MaximumLength(128)]
        public string Bill;

        [Member]
        public double Amount;

        [Member]
        public double Debt;

        [Member]
        public int OutdatedDays;

        [Member]
        public double OutdatedDebt;

        [Member, MaximumLength(128)]
        public string State;

        [Member, MaximumLength(128)]
        public string DeliveryAdress;

        [Member]
        public DateTime DateCreated;

        #endregion

        protected override void AfterCreation()
        {
            base.AfterCreation();
            this.DateCreated = DateTime.Now;
        }

        public List<OrderItem> Items
        {
            get
            {
                return Schema.OrderItems.Select("OrderID = @1", this.id).Items;
            }
        }
    }
}