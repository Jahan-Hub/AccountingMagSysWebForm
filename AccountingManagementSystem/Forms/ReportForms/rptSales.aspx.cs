using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Telerik.Web.UI;

namespace AccountingManagementSystem.Forms.ReportForms
{
    public partial class rptSales : System.Web.UI.Page
    {
        AccountingManagementSystemEntities db = new AccountingManagementSystemEntities();
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpStartDate.SelectedDate = DateTime.Now;
                dpEndDate.SelectedDate = DateTime.Now;

                var myDate = DateTime.Now;
                var startOfMonth = new DateTime(myDate.Year, myDate.Month, 1);
                var endOfMonth = startOfMonth.AddMonths(1).AddDays(-1);
            }
        }
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();

                if (AccountingManagementSystem.AppEnv.Current.p_rptSource != null)
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptSource.Close();
                    AccountingManagementSystem.AppEnv.Current.p_rptSource.Dispose();
                }
                AccountingManagementSystem.AppEnv.Current.p_rptSource = new ReportDocument();
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                if (cmReportFormat.SelectedValue == "Customer Wise Sales Report" || cmReportFormat.SelectedValue == "Customer Wise")
                {
                    Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 122;
                }
                else if (cmReportFormat.SelectedValue == "Details" || cmReportFormat.SelectedValue == "Item Wise" || cmReportFormat.SelectedValue == "Product Sales by Customer" || cmReportFormat.SelectedValue == "Excel Aid (Item Wise)")
                {
                    Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 12;
                }
                if (cmCategory.SelectedValue != "")
                    Cmd.Parameters.Add("@ItemCatId", SqlDbType.VarChar).Value = cmCategory.SelectedValue;

                if (cmCustomer.SelectedValue != "")
                    Cmd.Parameters.Add("@CustomerId", SqlDbType.VarChar).Value = cmCustomer.SelectedValue;
                if (cmItemName.SelectedValue != "")
                    Cmd.Parameters.Add("@Itemcode", SqlDbType.VarChar).Value = cmItemName.SelectedValue;
                if (txtTerritoryCode.Text != "")
                    Cmd.Parameters.Add("@TerritoryCode", SqlDbType.VarChar).Value = txtTerritoryCode.Text;
                Cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = dpStartDate.SelectedDate;
                Cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = dpEndDate.SelectedDate;

                SqlDataAdapter Dap = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                Dap.Fill(dt);
                Cmd.Dispose();

                string tempPath = "";
                string reportName = "";
                if (cmReportFormat.SelectedValue == "Customer Wise")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesSummary.rpt";
                    reportName = "SalesSummary";
                }
                else if (cmReportFormat.SelectedValue == "Details")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesDetails.rpt";
                    reportName = "SalesDetails";
                }
                else if (cmReportFormat.SelectedValue == "Item Wise")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesDetailsItemWise.rpt";
                    reportName = "SalesDetailsItemWise";
                }
                ////////////////////////////////////
                if (cmReportFormat.SelectedValue == "Product Sales by Customer")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesDetailsExcel.rpt";
                    reportName = "Product Sales by Customer";
                }
                else if (cmReportFormat.SelectedValue == "Excel Aid (Item Wise)")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesDetailsItemWiseExcel.rpt";
                    reportName = "ExcelAid(ItemWise)";
                }
                else if (cmReportFormat.SelectedValue == "Customer Wise Sales Report")
                {
                    AccountingManagementSystem.AppEnv.Current.p_rptObject = "~/Reports/SalesSummaryExcel.rpt";
                    reportName = "Customer Wise Sales Report";
                }
                tempPath = @System.IO.Path.GetTempPath() + "Sales";
                AccountingManagementSystem.AppEnv.Current.p_rptSource.Load(Server.MapPath(AccountingManagementSystem.AppEnv.Current.p_rptObject.ToString()));
                AccountingManagementSystem.AppEnv.Current.p_rptSource.SetDataSource(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    if (cmReportFormat.SelectedValue == "Details" || cmReportFormat.SelectedValue == "Item Wise" || cmReportFormat.SelectedValue == "Customer Wise")
                    {
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtReportHeader"]).Text = "Sales(" + cmReportFormat.Text + ")";
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtCompanyName"]).Text = Session["Name"].ToString();
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtAddress"]).Text = Session["Address"].ToString();
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact1"].ToString();
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact2"].ToString();
                        ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section5"].ReportObjects["txtUserName"]).Text = AppEnv.Current.p_UserName;
                        if (cmReportFormat.SelectedValue == "As on Date")
                        {
                            ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtDatePeriod"]).Text = "As on Date : " + Convert.ToDateTime(dpEndDate.SelectedDate).ToString("dd-MMM-yyyy");
                        }
                        else
                        {
                            ((TextObject)AccountingManagementSystem.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtDatePeriod"]).Text = "Date Period : " + Convert.ToDateTime(dpStartDate.SelectedDate).ToString("dd-MMM-yyyy") + " To " + Convert.ToDateTime(dpEndDate.SelectedDate).ToString("dd-MMM-yyyy");
                        }
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
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Close();
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Dispose();
                            GC.Collect();
                        }
                    }
                    if (rbtnWord.Checked == true)
                    {
                        ViewState["preview"] = "word";
                        Response.Buffer = false;
                        Response.ClearContent();
                        Response.ClearHeaders();

                        ExportFormatType format = ExportFormatType.WordForWindows;
                        //ExportFormatType format = ExportFormatType.ExcelRecord;
                        try
                        {
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Close();
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Dispose();
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
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Close();
                            AccountingManagementSystem.AppEnv.Current.p_rptSource.Dispose();
                            GC.Collect();
                        }
                    }

                    if (rbtnCrystal.Checked == true)
                    {
                        string URL = "~/CRpreview.aspx";
                        URL = Page.ResolveClientUrl(URL);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "javascript:window.open('" + URL + "','_blank','height=700,width=1200,toolbar=no,location=no, directories=no,status=no,menubar=no,scrollbars=no,resizable=no');", true);
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "javascript:window.open('" + URL + "','_blank','height=700,width=1200,toolbar=yes,location=yes, directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes');", true);  //all yes
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
        protected void cmCategory_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmItemName.Items.Clear();
            cmItemName.Text = "";
            cmItemName.SelectedValue = "";
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                Cmd.Parameters.Add("@ItemCatId", SqlDbType.Int).Value = cmCategory.SelectedValue;
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["ItemName"];
                    item.Value = dataRow["ItemCode"].ToString();

                    string ItemCode = (string)dataRow["ItemCode"].ToString();
                    item.Attributes.Add("ItemCode", ItemCode.ToString());

                    string ItemAlias = (string)dataRow["ItemAlias"].ToString();
                    item.Attributes.Add("ItemAlias", ItemAlias.ToString());

                    cmItemName.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmCustomer_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
        protected void cmCustomer_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 1;
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"].ToString();
                    item.Value = dataRow["CustId"].ToString();

                    string Id = (string)dataRow["CustId"].ToString();
                    item.Attributes.Add("CustId", Id.ToString());

                    cmCustomer.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmReportFormat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (cmReportFormat.SelectedValue == "Summary")
            {
                cmCategory.Enabled = false;
                cmItemName.Enabled = false;
            }
            else
            {
                cmCategory.Enabled = true;
                cmItemName.Enabled = true;
            }
        }
    }
}