using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace AccountingManagementSystem.Forms
{
    public partial class ChartOfAccounts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        public void EnableControl(bool ec)
        {
            txtAccountsHead.Enabled = ec;
        }
        public void ClearControl()
        {
            txtAccountsHead.Text = "";
        }
        public DataTable dtChartOfAccount
        {
            get
            {
                object obj = this.Session["dtChartOfAccount"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();

                dt1.Columns.Add("rowid", typeof(Int16));
                dt1.Columns.Add("Acc_Code", typeof(string));
                dt1.Columns.Add("Acc_Name", typeof(string));
                dt1.Columns.Add("Acc_Head", typeof(string));
                dt1.Columns.Add("Acc_Status", typeof(string));
                dt1.Columns.Add("Acc_Budg", typeof(decimal));
                dt1.Columns.Add("Acc_Group", typeof(Int16));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };

                this.Session["dtChartOfAccount"] = dt1;
                return dtChartOfAccount;
            }
        }
        private void ReloadMainGrid()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("pro_acct_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
            cmd.Parameters.Add("@acc_head", SqlDbType.VarChar).Value = cmMainLedger.SelectedValue;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adpt.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count > 0)
            {
                rgMain.DataSource = dt;
                rgMain.Rebind();
            }

            try
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataRow newRow = this.dtChartOfAccount.NewRow();
                        newRow["rowid"] = this.dtChartOfAccount.Rows.Count + 1;
                        newRow["Acc_Code"] = dt.Rows[i]["Acc_Code"].ToString();
                        newRow["Acc_Name"] = dt.Rows[i]["Acc_Name"].ToString();
                        newRow["Acc_Head"] = dt.Rows[i]["Acc_Head"].ToString();
                        newRow["Acc_Status"] = dt.Rows[i]["Acc_Status"].ToString();
                        newRow["Acc_Budg"] = dt.Rows[i]["Acc_Budg"].ToString();
                        newRow["Acc_Group"] = dt.Rows[i]["Acc_Group"].ToString();
                        this.dtChartOfAccount.Rows.Add(newRow);
                        this.dtChartOfAccount.AcceptChanges();
                    }
                    rgMain.Rebind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        public string GetAutoNumber(string fieldName, string tableName, string WhereCondition, string ControlName)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            string ss = "Select  isnull(Max(" + fieldName + "),0) from " + tableName + " where " + WhereCondition + " = '" + ControlName + "'";
            SqlCommand cmd = new SqlCommand(ss, con);

            con.Open();
            string x = (string)cmd.ExecuteScalar();
            return x.ToString();

        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("pro_acct_AC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "1";
                cmd.Parameters.Add("@acc_code", SqlDbType.NVarChar).Value = txtAccountHeadCode.Text;
                cmd.Parameters.Add("@acc_name", SqlDbType.NVarChar).Value = txtAccountsHead.Text.ToUpper();
                cmd.Parameters.Add("@acc_head", SqlDbType.NVarChar).Value = cmMainLedger.SelectedValue;
                cmd.Parameters.Add("@uid", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName.ToString();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.dtChartOfAccount.Clear();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cmAccType.SelectedValue == "")
            {
                lblMessage.Text = "Select Acc Type.";
            }
            else if (cmSubType.SelectedValue == "")
            {
                lblMessage.Text = "Select Acc Sub Type.";
            }
            else if (cmMainLedger.SelectedValue == "")
            {
                lblMessage.Text = "Select Main Ledger.";
            }
            else if (txtAccountHeadCode.Text == "")
            {
                lblMessage.Text = "Account Head Code can not be Blank.";
            }
            else
            {
                SaveData();
                ReloadMainGrid();
                ClearControl();
                int max = Convert.ToInt32(GetAutoNumber("acc_code", "acct", "acc_head", cmMainLedger.SelectedValue));
                txtAccountHeadCode.Text = (max + 1).ToString();
            }
        }

        protected void cmAccType_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmSubType.Text = "";
            cmSubType.SelectedValue = "";
        }

        protected void cmSubType_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmMainLedger.Text = "";
            cmMainLedger.SelectedValue = "";
        }

        protected void cmMainLedger_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtAccountsHead.Text = "";
            this.rgMain.DataSource = null;

            int max = Convert.ToInt32(GetAutoNumber("acc_code", "acct", "acc_head", cmMainLedger.SelectedValue));
            txtAccountHeadCode.Text = (max + 1).ToString();
            ReloadMainGrid();
            txtAccountHeadCode.Focus();

        }
        private void DataRefill()
        {
            GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("pro_acct_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "6";
            cmd.Parameters.Add("@acc_code", SqlDbType.VarChar).Value = selectedItem["acc_code"].Text;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt1 = new DataTable();
            adpt.Fill(ds);
            dt1 = ds.Tables[0];

            txtAccountHeadCode.Text = dt1.Rows[0]["Acc_Code"].ToString();
            txtAccountsHead.Text = dt1.Rows[0]["Acc_Name"].ToString();
        }
        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRefill();
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            if (AppEnv.Current.p_rptSource != null)
            {
                AppEnv.Current.p_rptSource.Close();
                AppEnv.Current.p_rptSource.Dispose();
            }
            AppEnv.Current.p_rptSource = new ReportDocument();
            cmd = new SqlCommand("ReportManager_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "21";
            cmd.Parameters.Add("@AccountHead", SqlDbType.VarChar).Value = cmMainLedger.SelectedValue;

            SqlDataAdapter Dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Dap.Fill(dt);
            cmd.Dispose();
            string reportName = "";
            AppEnv.Current.p_rptObject = "~/Reports/ChartOfAccounts.rpt";
            reportName = "ChartOfAccounts";
            reportName = "ChartOfAccounts";
            AppEnv.Current.p_rptSource.Load(Server.MapPath(AppEnv.Current.p_rptObject.ToString()));
            AppEnv.Current.p_rptSource.SetDataSource(dt);
            con.Close();

            if (dt.Rows.Count > 0)
            {
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();
                ExportFormatType format = ExportFormatType.PortableDocFormat;
                try
                {
                    AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                }
                finally
                {
                    AppEnv.Current.p_rptSource.Close();
                    AppEnv.Current.p_rptSource.Dispose();
                    GC.Collect();
                }
            }
            else
            {
                lblMessage.Text = "Data is not available.";
            }
        }

        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtChartOfAccount;
        }

        protected void txtAccountHeadCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                cmd = new SqlCommand("pro_acct_AC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "6";
                cmd.Parameters.Add("@Offerid", SqlDbType.VarChar).Value = txtAccountHeadCode.Text;
                SqlDataReader Dr = cmd.ExecuteReader();
                while (Dr.Read())
                {
                    //txtAccountHeadCode.Text = dt1.Rows[0]["Acc_Code"].ToString();
                    //txtAccountsHead.Text = dt1.Rows[0]["Acc_Name"].ToString();
                    //txtBudget.Text = dt1.Rows[0]["Acc_Budg"].ToString();
                    //txtDepRate.Text = dt1.Rows[0]["Pl_Rate"].ToString();
                    //cmAccType.SelectedValue = dt1.Rows[0]["Acc_Status"].ToString();
                }
                con.Close();
                Dr.Dispose();
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}