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
    [RelationBackendName("Managers")]
    public class MuManager : Entity<int, MuManager>
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member, UiTitle("Активен"), MaximumLength(128), UiLocation(Location.Both)]
        public bool Active;

        [Member, UiTitle("Фамилия"), MaximumLength(128), UiLocation(Location.Both)]
        public string LastName;

        [Member, UiTitle("Имя"), MaximumLength(128), UiLocation(Location.Both)]
        public string Name;

        [Member("SurName"), UiTitle("Отчество"), MaximumLength(128), UiLocation(Location.Both)]
        public string SurName;

        [Member, UiTitle("Телефон рабочий"), MaximumLength(128)]
        public string Phone;

        [Member, UiTitle("Телефон сотовый"), MaximumLength(128)]
        public string Mobile;

        [Member, UiTitle("Email"), MaximumLength(128), UiLocation(Location.Both)]
        public string Email;
        
        [EntityMember("Photo"), MaximumLength(1024)]
        protected string photo = string.Empty;
        [UiMember, UiTitle("Фото"), ImageLocation("~/i/mgr/"), ImagePreview(61,61), ImageResize(-500), XmlMember]
        public ImageInfo Photo
        {
            get { return new ImageInfo(this.photo); }
            set { this.photo = value.State; }
        }

        [Member, UiLocation(Location.None)]
        public DateTime DateCreated;

        #endregion

        public static List<MirUpak.Model.MuManager> ManagerListActive
        {
            get
            {
                return Schema.Managers.Select("Active = @1", new SelectOptions("LastName", SortOrder.Ascending), true).Items;
            }
        }

        protected override void AfterCreation()
        {
            base.AfterCreation();
            this.DateCreated = DateTime.Now;
        }
    }
}