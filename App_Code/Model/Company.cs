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
    [RelationBackendName("Companies")]
    public sealed class Company : Ramedia.UI.Dal.RussianCompany<int, Company>
    {
        public static Company Get(long inn)
        {
            return Schema.Companies.SelectSingle("Inn = @1", inn.ToString());
        }
    }
}