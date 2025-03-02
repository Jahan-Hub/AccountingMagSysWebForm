using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace AccountingManagementSystem.Forms
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            Cmd = new SqlCommand("Sp_Dashboard", con);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 1;
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet ds = new DataSet();
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            DataTable dt3 = new DataTable();
            DataTable dt4 = new DataTable();
            DataTable dt5 = new DataTable();
            DataTable dt6 = new DataTable();
            DataTable dt7 = new DataTable();
            adapter.Fill(ds);
            dt1 = ds.Tables[0];
            rgCount.DataSource = dt1;
            rgCount.Rebind();

            //TopChart.PlotArea.Series.Clear();
            PieSeries curCol = new PieSeries();
            PieSeries OldCol = new PieSeries();

            OldCol.DataFieldY = dt1.Columns[0].Caption;

            //TopChart.PlotArea.Series.Add(curCol);
            //TopChart.PlotArea.Series.Add(OldCol);

            //TopChart.PlotArea.XAxis.DataLabelsField = dt1.Columns[0].Caption.ToString();
            //TopChart.PlotArea.XAxis.Visible = true;
            con.Close();
        }
    }
}