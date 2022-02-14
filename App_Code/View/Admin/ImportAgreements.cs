using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using System.Web.UI.WebControls;
using Ideal.Wision.Schema;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using System.Text.RegularExpressions;
using MirUpak.Model;
using Ideal.UI.Web;
using Ideal.Wision.Identity;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;


[AdminWintrol("14788E8B-0C6A-4283-2967-D46538EE988B", typeof(MuAdminGroup), "Импорт договоров", "Загрузка текстов договоров")]
public class ImportAgreements : Wintrol
{
    Button btnStart = null;
    Literal lt = null;

    public ImportAgreements()
    {
        this.Init += new EventHandler(ImportAgreements_Init);
    }

    void ImportAgreements_Init(object sender, EventArgs e)
    {
        this.ID = "ia";

        btnStart = new Button();
        btnStart.Text = "Запустить";
        btnStart.Click += new EventHandler(btnStart_Click);
        this.Controls.Add(btnStart);

        lt = new Literal();
        lt.EnableViewState = false;
        this.Controls.Add(lt);
    }

    void btnStart_Click(object sender, EventArgs e)
    {
        int added = 0, updtd = 0;
        DirectoryInfo dir = new DirectoryInfo(Env.Server.MapPath("~/uploadagrs/"));
        foreach (Customer cust in Schema.Customers.SelectAll())
        {
            FileInfo[] fis = dir.GetFiles(cust.AgreementID + "_*.*");
            if (fis.Length > 0)
            {
                string sdir = Env.Server.MapPath(string.Format("~/agreements/{0:x2}/", cust.AgreementID.ToByteArray()[0]));
                if (!Directory.Exists(sdir))
                    Directory.CreateDirectory(sdir);
                string zipFileName = Env.Server.MapPath("~" + cust._AgreementUrl);
                FileStream fsOut = File.Create(zipFileName);
                ZipOutputStream zipStream = new ZipOutputStream(fsOut);
                zipStream.SetLevel(5); //0-9, 9 being the highest level of compression

                for (int ix = 0; ix < fis.Length; ix++)
                {
                    string filename = fis[ix].FullName;
                    string name = fis[ix].Name;

                    FileInfo fi = new FileInfo(filename);
                    ZipEntry newEntry = new ZipEntry(name);
                    newEntry.DateTime = fi.LastWriteTime; // Note the zip format stores 2 second granularity
                    newEntry.Size = fi.Length;
                    zipStream.PutNextEntry(newEntry);

                    // Zip the file in buffered chunks
                    // the "using" will close the stream even if an exception occurs
                    byte[] buffer = new byte[4096];
                    using (FileStream streamReader = File.OpenRead(filename))
                    {
                        while (true)
                        {
                            int count = streamReader.Read(buffer, 0, 4096);
                            if (count == 0) break;
                            zipStream.Write(buffer, 0, count);
                        }
                    }
                    zipStream.CloseEntry();
                }

                zipStream.IsStreamOwner = true; // Makes the Close also Close the underlying stream
                zipStream.Close();
                
                if (cust.AgreementUploaded) updtd++; else added++;

                cust.AgreementUploaded = true;
                cust.Update();
            }            
        }

        lt.Text = "<br/><br/>Добавлено " + added + " обновлено " + updtd;
    }
}