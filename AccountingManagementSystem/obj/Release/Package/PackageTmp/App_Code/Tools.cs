using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Tools
/// </summary>
public class Tools
{
	SqlConnection con;
    SqlCommand cmd;
    //SqlDataAdapter adpt;
    //DataSet ds;
    string scon = ConfigurationManager.ConnectionStrings["SalesMSConnectionString"].ConnectionString;

    public Tools()
	{
        string scon = ConfigurationManager.ConnectionStrings["SalesMSConnectionString"].ConnectionString;

         con = new SqlConnection(scon);
	}
    public string GetAutoNumber(string fieldName, string tableName)
    {
        try
        {
            con = new SqlConnection(scon);
            string ss = "Select Max(" + fieldName + ") from " + tableName;
            SqlCommand cmd = new SqlCommand(ss, con);

            con.Open();
            int x = (int)cmd.ExecuteScalar() + 1;
            return x.ToString();
        }
        catch (Exception)
        {
            return "1";
        }
        finally
        {
            con.Close();
        }
    }
}