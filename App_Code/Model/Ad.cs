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
using Ideal.Wision.Identity;
using Ideal.Core.Reflection.Validators;

namespace MirUpak.Model
{
    [RelationBackendName("Ads")]
    public class Ad : Entity<int, Ad>
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member("Active"), UiTitle("Работает"), UiLocation(Location.Both)]
        public bool Active = true;

        [Member("Title"), MaximumLength(128), UiTitle("Подсказка"), UiLocation(Location.Both)]
        string name = String.Empty;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        [Member("Brief"), MaximumLength(512), UiTitle("Текст баннера"), UiLocation(Location.None)]
        string brief = String.Empty;
        public string Brief
        {
            get { return brief; }
            set { brief = value; }
        }

        [Member("OrderIndex"), UiTitle("Позиция"), UiLocation(Location.None), DefaultSort]
        protected int orderIndex = 0;
        public int OrderIndex
        {
            get { return orderIndex; }
            set { orderIndex = value; }
        }


        [Member("Url"), MaximumLength(128), UiTitle("Ссылка для перехода при клике"), UiLocation(Location.Both), UiDescription("Переход на главную, если не заполнено")]
        string url = String.Empty;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }

        [EntityMember("Image"), MaximumLength(2048)]
        protected string image = String.Empty;
        [UiMember, UiTitle("Изображение"), ImageLocation("~/i/p/"), ImageResize(1140, 400), XmlMember]
        public ImageInfo Image
        {
            get { return new ImageInfo(this.image); }
            set { this.image = value.State; }
        }

        [EntityMember]
        public int ProductID;

        [EntityMember]
        public DateTime DateCreated;

        [EntityMember]
        public Guid CreatedBy;

        [Member, UiTitle("Дата начала"), UiLocation(Location.None)]
        public DateTime DateStart;

        [Member, UiTitle("Дата завершения"), UiLocation(Location.None)]
        public DateTime DateFinish;

        #endregion

        protected override void AfterCreation()
        {
            base.AfterCreation();

            this.DateCreated = DateTime.Now;
            this.CreatedBy = Manager.CurrentPersonGuid;
            this.DateStart = DateTime.Now.Date.AddDays(1);
            this.DateFinish = DateStart.AddMonths(3);
        }

        protected override void AfterInsert()
        {
            base.AfterInsert();

            int i = 0;
            foreach (Ad s in Schema.Ads.SelectAll().Items)
                if (s.OrderIndex > i)
                    i = s.OrderIndex;

            this.OrderIndex = i + 1;
            this.Update();
        }

        public static List<Ad> GetList()
        {
            List<Ad> lads = Schema.Ads.Select("Active = @1",
                new SelectOptions("OrderIndex", SortOrder.Ascending),
                true).Items.FindAll(delegate(Ad ad) { return ad.Image.Exists; });

            return lads;
        }
    }

}