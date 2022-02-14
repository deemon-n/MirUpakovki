using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using Ideal.ImpexLib;
using System.Collections.Generic;
using Ideal.ImpexLib.Compression;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using Ideal.Wision.Identity;

/// <summary>
/// Summary description for Receive
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Receive : System.Web.Services.WebService
{

	public Receive()
	{
		//Uncomment the following line if using designed components 
		//InitializeComponent(); 
	}

	[WebMethod]
	public string[] GetData(int password, string fileName, int compression, byte[] data, out int status)
	{
		status = (int)Status.OK;

		Wse30TransferHelper th = new Wse30TransferHelper(password, fileName, data, (CompressionType)compression);
		ReportMessage[] rm = th.HandleData();

		List<string> result = new List<string>();
		for (int i = 0; i < rm.Length; i++)
		{
			result.Add(rm[i].ToString());
		}
		return result.ToArray();
	}

	[WebMethod]
	public byte[] TransferData(int password, string fileName, out int compression, out string[] reports, out int status, out string key)
	{
		//проверка пароля
		//Wse30TransferHelper th = new Wse30TransferHelper(password, fileName, data, (CompressionType)compression);
		byte[] data = null, compressedData = null;
		List<string> result = new List<string>();

		string _key = string.Empty;
        DateTime dateEnd = DateTime.Now;

		/*switch (fileName.ToLower())
		{
			case "imp-orders.csv":
				data = ImportOrders(result, EuroParts.Model.Settings.LastOrdersImportDate, dateEnd);
				_key = dateEnd.ToString();
				break;
            
		}*/

		Compressor compressor = Compressor.CreateCompressor(CompressionType.GZip);
		compressedData = compressor.Compress(data);
		if (compressedData.Length > data.Length)
		{
			compressedData = data;
			compression = (int)CompressionType.None;
		}
		else
		{
			compression = (int)CompressionType.GZip;
		}
		status = 0;
		
		reports = result.ToArray();
		key = _key;
		return compressedData;
	}

    /*byte[] ImportStatistics(List<string> result, DateTime dateBegin, DateTime dateEnd)
    {
        return System.Text.Encoding.GetEncoding(1251).GetBytes(
            EuroParts.Model.Inventory.ProductView.GetStatisticsCsv(dateBegin, dateEnd));
    } */   
}