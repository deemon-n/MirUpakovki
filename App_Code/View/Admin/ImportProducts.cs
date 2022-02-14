using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Schema;
using Ideal.UI.Web;
using Ideal.Wision;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using Ideal.ImpexLib;
using System.Text;
using Ideal.Wision.Identity;

[AdminWintrol("14788E8B-0C6A-65d7-2967-D46538EE988B", typeof(MuAdminGroup), "Импорт товаров", "Загрузка товаров")]
public class ImportProducts : Wintrol
{
    FileUpload fu;
    Literal lt;

    public ImportProducts()
    {
        this.Init += new EventHandler(ImportProducts_Init);
    }

    void ImportProducts_Init(object sender, EventArgs e)
    {
        this.Controls.Add(Factory.CreateLiteralViewstateless("Выберите файл: "));

        fu = new FileUpload();
        fu.ID = "fu";
        this.Controls.Add(fu);

        this.Controls.Add(Factory.CreateLiteralViewstatelessNbsp());

        Button btn = new Button();
        btn.ID = "btn";
        btn.Text = "Импортировать";
        btn.Click += new EventHandler(btn_Click);
        this.Controls.Add(btn);

        this.Controls.Add(Factory.CreateLiteralViewstatelessBr());
        this.Controls.Add(Factory.CreateLiteralViewstatelessBr());

        lt = new Literal();
        lt.ID = "lt";
        lt.EnableViewState = false;
        this.Controls.Add(lt);
    }

    void btn_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(fu.FileName))
            lt.Text = "Не выбран файл";

        DateTime dt1 = DateTime.Now;
        
        string path = Env.Server.MapPath("~/temp/products.json");
        fu.SaveAs(path);
        byte[] data = File.ReadAllBytes(path);
        Wse30TransferHelper wse30 = new Wse30TransferHelper(0, "products.json", data, Ideal.ImpexLib.Compression.CompressionType.None);
        ReportMessage[] msgs = wse30.HandleData();
        wse30 = null;

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < msgs.Length; i++)
        {
            sb.Append(msgs[i].Text + "<br/>");
        }

        TimeSpan ts = DateTime.Now - dt1;
        sb.AppendFormat("Время обработки: {0:n3} сек.", ts.TotalSeconds);
        lt.Text = sb.ToString();
    }
}