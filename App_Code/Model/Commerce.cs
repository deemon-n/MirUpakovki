using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Commerce;
using Ideal.Entity;

namespace MirUpak.Model
{
    public class Commerce
    {
        static Engine engine;
        public static Engine Engine
        {
            get
            {
                MirUpak.Model.Schema.Ping();
                return Commerce.engine;
            }
        }

        public static void Initialize()
        {
            if (null != Ideal.Wision.Core.WisionApplication.DefaultBackendAdapter)
                Initialize(Ideal.Wision.Core.WisionApplication.DefaultBackendAdapter);
        }

        public static void Initialize(Adapter adapter)
        {
            engine = new Engine(adapter, TorgConnector.Instance);
            engine.CurrencyCode = "руб";
        }
    }

    public class TorgConnector : Connector
    {
        static TorgConnector instance = new TorgConnector();
        static public TorgConnector Instance
        {
            get { return instance; }
        }

        private TorgConnector()
        {

        }

        public override Ideal.Wision.Identity.IPerson GetPerson(Guid personGuid)
        {
            return Ideal.Wision.Identity.Manager.GetPerson(personGuid);
        }

        public override IProduct GetProduct(Guid productGuid)
        {
            return MirUpak.Model.Schema.Products.SelectSingle("GID = @1", productGuid);
        }

        public override Guid GetCurrentPersonGuid()
        {
            return Ideal.Wision.Identity.Manager.CurrentPersonGuid;
        }
    }
}
