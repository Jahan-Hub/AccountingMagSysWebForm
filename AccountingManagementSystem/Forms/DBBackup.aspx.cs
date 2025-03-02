using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace AccountingManagementSystem.Forms
{
    public partial class DBBackup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBackup_Click(object sender, EventArgs e)
        {
            string filepath = @"D:\AccountingMSDB-" + DateTime.Now.ToString("dd/MM/yyyy") + ".bak";
            if (File.Exists(filepath))
            {
                File.Delete(filepath);
            }
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            //string sql = "backup database " + txtDatabaseName.Text + " to disk='" + txtLocationName.Text.Trim() + txtDatabaseName.Text + "-" + ".bak " + "'";
            string sql = @"backup database AccountingMSDB to disk='D:\AccountingMSDB-" + DateTime.Now.ToString("dd/MM/yyyy") + ".bak '"; //19052019
            /*backup database TestDB to disk = 'D:\TestDB-.bak*/
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            lblMessage.Text = @"File Backed up Successfully to File Path: D: & Save it to Online Store(Ex-Google Drive).";
        }
    }
}