//using System;
//using System.Collections;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI.WebControls;

///// <summary>
///// Summary description for Utility
///// </summary>
//public class Utility
//{
//    SqlConnection con;
//    public Utility()
//    {
//        string sCon = ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString;
//        con = new SqlConnection(sCon);
//    }

//    public string RunQuery(string s)
//    {
//        try
//        {
//            SqlCommand cmd = new SqlCommand(s, con);
//            con.Open();
//            int x = cmd.ExecuteNonQuery();
//            if (x > 0)
//                return "Success.....";
//            else
//                return "Fail......";
//        }
//        catch (Exception ex1)
//        {
//            return ex1.Message;
//        }

//        finally
//        {
//            con.Close();
//        }
//    }

//    public ArrayList SearchData(string s)
//    {
//        ArrayList list = new ArrayList();

//        try
//        {
//            SqlCommand cmd = new SqlCommand(s, con);
//            con.Open();
//            SqlDataReader dr = cmd.ExecuteReader();
//            if (dr.Read())
//            {
//                for (int i = 0; i < dr.FieldCount; i++)
//                    list.Add(dr.GetValue(i).ToString());
//                return list;
//            }
//        }
//        catch (Exception)
//        {
//        }

//        finally
//        {
//            con.Close();
//        }
//        return list;
//    }

//    public string GetAutoNumber(string fieldName, string tableName)
//    {
//        try
//        {
//            SqlCommand cmd = new SqlCommand("SELECT MAX(" + fieldName + ") FROM " + tableName, con);
//            con.Open();
//            int n = (int)cmd.ExecuteScalar() + 1;
//            return n.ToString();
//        }
//        catch (Exception ex1)
//        {
//            return ex1.Message;
//        }

//        finally
//        {
//            con.Close();
//        }
//    }

//    public void FillDropDownList(string tableName, int displayMemnber, int valueMember, DropDownList drp)
//    {
//        SqlDataAdapter adpt = new SqlDataAdapter(" SELECT * FROM " + tableName, con);
//        DataSet ds = new DataSet();
//        adpt.Fill(ds);

//        drp.DataSource = ds.Tables[0];
//        drp.DataTextField = ds.Tables[0].Columns[displayMemnber].ToString();
//        drp.DataValueField = ds.Tables[0].Columns[valueMember].ToString();
//        drp.DataBind();
//    }

//    public DataTable GetDataTable(string s)
//    {
//        SqlDataAdapter adpt = new SqlDataAdapter(s, con);
//        DataSet ds = new DataSet();
//        adpt.Fill(ds);

//        return ds.Tables[0];
//    }

//    public DataTable getReservation(int cid, DateTime indate, DateTime outDate)
//    {
//        string s = "exec spReservation " + cid + ",'" + indate + "','" + outDate + "'";
//        SqlDataAdapter adpt = new SqlDataAdapter(s, con);
//        DataSet ds = new DataSet();
//        adpt.Fill(ds);

//        return ds.Tables[0];
//    }
//}