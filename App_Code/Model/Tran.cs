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
    [RelationBackendName("Trans")]
    public class Tran : Entity<int, Tran>
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

        [Member, Indexed]
        public DateTime Date;

        [Member, MaximumLength(128)]
        public string Doc;

        [Member]
        public double Amount;

        [Member]
        public bool Debt;

        [Member, UiTitle("Дата начала")]
        public DateTime DateCreated;

        #endregion

        protected override void AfterCreation()
        {
            base.AfterCreation();
            this.DateCreated = DateTime.Now;
        }
    }
}