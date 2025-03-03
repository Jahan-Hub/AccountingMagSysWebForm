using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

namespace AccountingManagementSystem
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime date = DateTime.Today;
                DateTime vdate = Convert.ToDateTime("2025-10-15 17:16:00");
                if (date > vdate)
                {
                    Response.Redirect("~/Validation.aspx");
                }
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_CompanyInfo", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "1";
                SqlDataReader Dr;
                Dr = Cmd.ExecuteReader();
                while (Dr.Read())
                {
                    lblCompanyName.Text = Dr["Name"].ToString();
                    Session["Name"] = Dr["Name"].ToString();
                    Session["Address"] = Dr["Address"].ToString();
                    Session["Contact1"] = Dr["Contact1"].ToString();
                    Session["Contact2"] = Dr["Contact2"].ToString();
                    Session["Fax"] = Dr["Fax"].ToString();
                    Session["CompanyLogo"] = Dr["CompanyLogo"].ToString();
                    Session["CompanyMoto"] = Dr["CompanyMoto"].ToString();
                    Session["Email"] = Dr["Email"].ToString();
                    Session["Website"] = Dr["Website"].ToString();
                    Page.Title = Dr["Name"].ToString();
                }
                Dr.Dispose();
                Dr.Close();
                Cmd.Dispose();
            }
            DateTime dt = DateTime.Now;
            string Day = dt.Day.ToString();
            string Month = dt.ToString("MMMM");
            string Year = dt.ToString("yyyy");

            string Hour = dt.Hour.ToString();
            string Minute = dt.ToString("mm");
            string Seconds = dt.ToString("ss");
            lblDateTime.Text = Day + " " + Month + "   " + Year + ",   " + Hour + ":" + Minute + ":" + Seconds;
            lblDayName.Text = System.DateTime.Now.DayOfWeek.ToString();
            LoadIFrame("Forms/Dashboard.aspx");
        }

        private void LoadIFrame(string src)
        {
            if (RadPane2.FindControl("frame") != null)
            {
                ((HtmlGenericControl)RadPane2.FindControl("frame")).Attributes.Remove("src");
                ((HtmlGenericControl)RadPane2.FindControl("frame")).Attributes.Add("src", src);
            }
            else
            {
                HtmlGenericControl iFrame = new HtmlGenericControl("iframe");
                iFrame.ID = "frame";
                iFrame.Attributes.Add("frameborder", "0");
                iFrame.Attributes.Add("class", "module");
                iFrame.Attributes.Add("style", "width:100%;height:100%;padding:0;");
                iFrame.Attributes.Add("src", src);

                RadPane2.Controls.Add(iFrame);
            }
        }
        protected void MainMenu_ItemClick1(object sender, Telerik.Web.UI.RadPanelBarEventArgs e)
        {
            RadPanelItem ItemClicked = e.Item;
            string s = ItemClicked.Text;

            if (s == "Company Info")
            {
                LoadIFrame("Forms/CompanyInfo.aspx");
            }
            if (s == "Dashboard")
            {
                LoadIFrame("Forms/Dashboard.aspx");
            }
            if (s == "DB Backup")
            {
                LoadIFrame("Forms/DBBackup.aspx");
            }
            if (s == "Account Group")
            {
                LoadIFrame("Forms/AccountGroup.aspx");
            }
            if (s == "Chart Of Accounts")
            {
                LoadIFrame("Forms/ChartOfAccounts.aspx");
            }
            if (s == "Debit Voucher")
            {
                LoadIFrame("Forms/DebitVoucher.aspx");
            }
            if (s == "Credit Voucher")
            {
                LoadIFrame("Forms/CreditVoucher.aspx");
            }
            if (s == "Journal Voucher")
            {
                LoadIFrame("Forms/JournalVoucher.aspx");
            }
            if (s == "Opening Balance")
            {
                LoadIFrame("Forms/OpeningBalance.aspx");
            }
            if (s == "Transaction Entry")
            {
                LoadIFrame("Forms/TransactionEntry.aspx");
            }

            ///////////////Reports////////////////
            if (s == "Report Manager")
            {
                LoadIFrame("Forms/ReportForms/ReportManager.aspx");
            }
            if (s == "Chart Of Account")
            {
                LoadIFrame("Forms/ReportForms/rptChartOfAccount.aspx");
            }
            if (s == "Transaction Entry")
            {
                LoadIFrame("Forms/ReportForms/rptTransactionEntry.aspx");
            }
        }
    }
}