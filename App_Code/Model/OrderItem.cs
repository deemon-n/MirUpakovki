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
    [RelationBackendName("OrderItems")]
    public class OrderItem : Entity<int, OrderItem>
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member, Indexed]
        public int OrderID;

        [Member, MaximumLength(128)]
        public string Code;

        [Member, MaximumLength(128)]
        public string Name;

        [Member]
        public double Price;

        [Member]
        public double Qty;

        [Member]
        public double Amount;
        
        [Member]
        public DateTime DateCreated;

        #endregion

        protected override void AfterCreation()
        {
            base.AfterCreation();
            this.DateCreated = DateTime.Now;
        }
    }
}