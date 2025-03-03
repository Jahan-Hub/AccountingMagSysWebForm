using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace AccountingManagementSystem.Forms.ReportForms
{
    public partial class ReportMgrAcc : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            dpStartDate.SelectedDate = DateTime.Now.AddYears(-2);
            dpEndDate.SelectedDate = DateTime.Now;
        }

        protected void cmReportFormat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
        protected void btnPreview_Click(object sender, EventArgs e)
        {
            //try
            //{
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                //if (cmReportFormat.SelectedValue == "Profit & Loss Accounts")
                //{
                //    cmd = new SqlCommand("ProcessPL", con);
                //    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "1";
                //    if (dpStartDate.SelectedDate != null && dpEndDate.SelectedDate != null)
                //        cmd.Parameters.Add("@st_dt", SqlDbType.DateTime).Value = dpStartDate.SelectedDate;
                //    if (dpStartDate.SelectedDate != null && dpEndDate.SelectedDate != null)
                //        cmd.Parameters.Add("@ed_dt", SqlDbType.DateTime).Value = dpEndDate.SelectedDate;
                //    cmd.Dispose();
                //}

                if (AppEnv.Current.p_rptSource != null)
                {
                    AppEnv.Current.p_rptSource.Close();
                    AppEnv.Current.p_rptSource.Dispose();
                }
                AppEnv.Current.p_rptSource = new ReportDocument();
                string YN = "N";

                cmd = new SqlCommand("ReportManager_AC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                if (cmReportFormat.SelectedValue == "Chart of Accounts")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "21";
                }
                else if (cmReportFormat.SelectedValue == "Voucher Register")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "22";
                }
                else if (cmReportFormat.SelectedValue == "Income Statement")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "28";
                }
                else if (cmReportFormat.SelectedValue == "General Ledger")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "30";
                }
                else if (cmReportFormat.SelectedValue == "Trial Balance")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "32";
                }
                else if (cmReportFormat.SelectedValue == "Balance Sheet")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "33";
                }

                //if (cmAccountHead.SelectedValue != "")
                //    cmd.Parameters.Add("@Acc_Code", SqlDbType.Int).Value = cmAccountHead.SelectedValue;
                if (cmACC_Name.SelectedValue != "")
                    cmd.Parameters.Add("@Acc_Code", SqlDbType.Int).Value = cmACC_Name.SelectedValue;

                if (cmVoucherType.SelectedValue != "")
                    cmd.Parameters.Add("@vou_type", SqlDbType.VarChar).Value = cmVoucherType.SelectedValue;
                if (txtVoucherNo.Text != "")
                    cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = txtVoucherNo.Text;

                if (dpStartDate.SelectedDate != null && dpEndDate.SelectedDate != null)
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = dpStartDate.SelectedDate;
                if (dpStartDate.SelectedDate != null && dpEndDate.SelectedDate != null)
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = dpEndDate.SelectedDate;
                //if (ckSummary.Checked == true)
                //    cmd.Parameters.Add("@ShowSummaryYN", SqlDbType.VarChar).Value = "Y";
                SqlDataAdapter Dap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Dap.Fill(dt);
                cmd.Dispose();
                string tempPath = "";
                string reportName = "";

                if (cmReportFormat.SelectedValue == "Chart of Accounts")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/ChartOfAccounts.rpt";
                    reportName = "ChartOfAccounts";
                }
                else if (cmReportFormat.SelectedValue == "Voucher Register")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/VoucherRegister.rpt";
                    reportName = "VoucherRegister";
                }
                else if (cmReportFormat.SelectedValue == "Income Statement")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/IncomeStatement.rpt";
                    reportName = "IncomeStatement";
                }
                else if (cmReportFormat.SelectedValue == "General Ledger")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/GeneralLedger.rpt";
                    reportName = "GeneralLedger";
                }
                else if (cmReportFormat.SelectedValue == "Trial Balance")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/TrialBalance.rpt";
                    reportName = "TrialBalance";
                }
                else if (cmReportFormat.SelectedValue == "Balance Sheet")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/BalanceSheet.rpt";
                    reportName = "BalanceSheet";
                }

                tempPath = @System.IO.Path.GetTempPath() + "";
                AppEnv.Current.p_rptSource.Load(Server.MapPath(AppEnv.Current.p_rptObject.ToString()));
                AppEnv.Current.p_rptSource.SetDataSource(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtCompanyName"]).Text = Session["Name"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtAddress"]).Text = Session["Address"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact1"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact2"]).Text = Session["Contact2"].ToString();
                    string reportFormateName = " ";
                    if (dpStartDate.SelectedDate != null && dpEndDate.SelectedDate != null)
                    {
                        reportFormateName = reportFormateName + " : " + " Period " + Convert.ToDateTime(dpStartDate.SelectedDate).ToString("dd/MM/yyyy") + " To " + Convert.ToDateTime(dpEndDate.SelectedDate).ToString("dd/MM/yyyy");
                    }

                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtReportHeader"]).Text = cmReportFormat.Text;
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtSubReportHeader"]).Text = reportFormateName;

                    Response.Buffer = false;
                    Response.ClearContent();
                    Response.ClearHeaders();

                    if (rbtnPdf.Checked == true)
                    {
                        ExportFormatType format = ExportFormatType.PortableDocFormat;
                        AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                    }
                    else if (rbtnExcel.Checked == true)
                    {
                        ExportFormatType format = ExportFormatType.Excel;
                        AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                    }
                }
                else
                {
                    lblMessage.Text = "Data is not available.";
                }
            //}
            //catch (Exception ex)
            //{
            //    lblMessage.Text = ex.Message;
            //}
            //finally
            //{
            //    AppEnv.Current.p_rptSource.Close();
            //    AppEnv.Current.p_rptSource.Dispose();
            //    GC.Collect();
            //}         
        }

        protected void cmAccType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
        protected void cmSubType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //cmAccountHead.Text = "";
            //cmAccountHead.SelectedValue = "";
        }
        protected void cmAccountHead_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //txtCreditCode.Text = cmCredit.SelectedValue;
        }

        protected void cmAccountHead_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            //    con.Open();
            //    cmd = new SqlCommand("select * from acct ", con);
            //    cmd.CommandType = CommandType.Text;
            //    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    adapter.Fill(dt);
            //    foreach (DataRow dataRow in dt.Rows)
            //    {
            //        RadComboBoxItem item = new RadComboBoxItem();
            //        item.Text = (string)dataRow["Acc_Name"];
            //        item.Value = dataRow["Acc_Code"].ToString();
            //        cmAccountHead.Items.Add(item);
            //        item.DataBind();
            //    }
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
            //    lblMessage.Text = ex.Message;
            //}
        }

        protected void cmACC_Name_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("ComboLoadDataForAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 13;
            cmd.Parameters.Add("@SearchText", SqlDbType.VarChar).Value = e.Text;
            cmd.Parameters.Add("@OrderByFld", SqlDbType.VarChar).Value = cmACC_Name.Text;
            cmd.Parameters.Add("@StartNo", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@EndNo", SqlDbType.Int).Value = 20;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adapter.Fill(ds);
            dt = ds.Tables[1];
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["acc_name"].ToString();
                item.Value = dataRow["acc_code"].ToString();

                string code = (string)dataRow["acc_code"].ToString();
                string descr = (string)dataRow["acc_name"].ToString();

                item.Attributes.Add("acc_code", code.ToString());
                item.Attributes.Add("acc_name", descr.ToString());

                cmACC_Name.Items.Add(item);
                item.DataBind();
            }
        }

        protected void cmACC_Name_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtACC_Code.Text = cmACC_Name.SelectedValue;
        }


    }
}