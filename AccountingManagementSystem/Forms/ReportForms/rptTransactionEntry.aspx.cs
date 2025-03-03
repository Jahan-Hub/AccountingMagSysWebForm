using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace AccountingManagementSystem.Forms.ReportForms
{
    public partial class rptTransactionEntry : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();

                if (AppEnv.Current.p_rptSource != null)
                {
                    AppEnv.Current.p_rptSource.Close();
                    AppEnv.Current.p_rptSource.Dispose();
                }
                AppEnv.Current.p_rptSource = new ReportDocument();
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                if (cmReportType.SelectedValue == "CP")
                {
                    Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 1;
                }

                SqlDataAdapter Dap = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                Dap.Fill(dt);
                Cmd.Dispose();

                string tempPath = "";
                string reportName = "";

                if (cmReportType.SelectedValue == "CP")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/CashPayment.rpt";
                    reportName = "Cash Payment";
                }else if(cmReportType.SelectedValue == "BP")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/BankPayment.rpt";
                    reportName = "Bank Payment";
                }
                else if(cmReportType.SelectedValue == "BP")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/BankPayment.rpt";
                    reportName = "Bank Payment";
                }
                else if(cmReportType.SelectedValue == "CR")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/CashReceive.rpt";
                    reportName = "Cash Receive";
                }
                else if(cmReportType.SelectedValue == "BR")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/BankReceive.rpt";
                    reportName = "Bank Receive";
                }
                else if(cmReportType.SelectedValue == "JV")
                {
                    AppEnv.Current.p_rptObject = "~/Reports/JournalVoucher.rpt";
                    reportName = "Journal Voucher";
                }
                
                tempPath = @System.IO.Path.GetTempPath() + "Sales";
                AppEnv.Current.p_rptSource.Load(Server.MapPath(AppEnv.Current.p_rptObject.ToString()));
                AppEnv.Current.p_rptSource.SetDataSource(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    if (cmReportType.SelectedValue !="")
                    {
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtReportHeader"]).Text = cmReportType.Text;
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtCompanyName"]).Text = Session["Name"].ToString();
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtAddress"]).Text = Session["Address"].ToString();
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact1"].ToString();
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact2"].ToString();
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section5"].ReportObjects["txtUserName"]).Text = AppEnv.Current.p_UserName;
                    }
                    if (rbtnPdf.Checked == true)
                    {
                        ViewState["preview"] = "pdf";
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

                    if (rbtnExcel.Checked == true)
                    {
                        ViewState["preview"] = "word";
                        Response.Buffer = false;
                        Response.ClearContent();
                        Response.ClearHeaders();

                        ExportFormatType format = ExportFormatType.Excel;
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
                }
                else
                {
                    lblMessage.Text = "Data is not available.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}