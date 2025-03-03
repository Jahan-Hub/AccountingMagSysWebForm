using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace MAANBDERP.Forms
{
    public partial class AccOpeningBalance : System.Web.UI.Page
    {
        MAANBDERPEntities db = new MAANBDERPEntities();
        SqlConnection con;
        SqlCommand cmd;
        public DataTable dtOpeningBalance
        {
            get
            {
                object obj = this.Session["dtOpeningBalance"];
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

                this.Session["dtOpeningBalance"] = dt1;
                return dtOpeningBalance;
            }
        }
        public void ClearControl()
        {
            txtAcctCode.Text ="";
            txtCreditAmt.Text = "";
            txtDebitAmt.Text="";
            cmAcctCode.Text = "";
            cmAcctCode.SelectedValue = "";
            txtAcctCode.Text = "";
            cmOfficeName.Text = "Dhaka";
            cmOfficeName.SelectedValue = "Dhaka";
            //dpOPDate.SelectedDate = DateTime.Now;
        }
        public void EnableControl(bool b)
        {
            txtAcctCode.Enabled = b;
            txtCreditAmt.Enabled = b;
            txtDebitAmt.Enabled = b;
            cmAcctCode.Enabled = b;
            txtAcctCode.Enabled = b;
            cmOfficeName.Enabled = b;
            cmOfficeName.Enabled = b;
            dpOPDate.Enabled = b;
        }
        public void ButtonControl(string bc)
        {
            //// Which button you click control according by button
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnCancel.Enabled = false;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnSearch.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
            }
            //else if (bc == "S")
            //{
            //    btnNew.Enabled = false;
            //    btnSave.Enabled = false;
            //    btnEdit.Enabled = false;
            //    btnCancel.Enabled = false;
            //    lblOperationMode.Text = "";
            //    lblMessage.Text = "";

            //}
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Edit Mode";
                lblMessage.Text = "";
            }

            //else if (bc == "C")
            //{
            //    btnNew.Enabled = true;
            //    btnSave.Enabled = false;
            //    btnEdit.Enabled = false;
            //    btnCancel.Enabled = false;
            //    lblOperationMode.Text = "";
            //    lblMessage.Text = "";
            //}
        }
        private void ReloadMainGrid()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("post_open_bal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "3";
            cmd.Parameters.Add("@acc_code", SqlDbType.VarChar).Value = cmAcctCode.SelectedValue;
            cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = "";
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adpt.Fill(ds);
            dt = ds.Tables[0];
            rgMain.DataSource = dt;
            rgMain.DataBind();
        }
        private void DataRefillForGrid()
        {
            GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("post_open_bal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "4";
            cmd.Parameters.Add("@acc_code", SqlDbType.VarChar).Value = selectedItem["acc_code"].Text;
            //cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = selectedItem["vou_no"].Text;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt1 = new DataTable();
            adpt.Fill(ds);
            dt1 = ds.Tables[0];

            txtAcctCode.Text= dt1.Rows[0]["acc_code"].ToString();
            txtCreditAmt.Text=dt1.Rows[0]["cr_amt"].ToString();
            txtDebitAmt.Text=dt1.Rows[0]["dr_amt"].ToString();
            dpOPDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["vou_date"].ToString());
            cmAcctCode.Text = dt1.Rows[0]["acc_name"].ToString();
            cmAcctCode.SelectedValue = dt1.Rows[0]["acc_code"].ToString();
            cmOfficeName.Text = dt1.Rows[0]["OfficeName"].ToString();
            cmOfficeName.SelectedValue = dt1.Rows[0]["OfficeName"].ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //ReloadMainGrid();
                //cmOfficeName.Text = "Dhaka";
                //cmOfficeName.SelectedValue = "Dhaka";
                dpOPDate.SelectedDate = DateTime.Now;
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearControl();
            EnableControl(true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cmOfficeName.SelectedValue == "")
            {
                lblMessage.Text = "Select Cost Center.";
            }
            else if (txtAcctCode.Text == "")
            {
                lblMessage.Text = "Account Code can not be blank.";
            }
            else if (txtCreditAmt.Text == "" || txtDebitAmt.Text == "")
            {
                lblMessage.Text = "Credit/Debit Amount can not be blank.";
            }
            else
            {
                try
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                    con.Open();
                    try
                    {
                        //@vou_date,@acc_code,@dr_amt,@cr_amt,@prj_code,'op',@uid
                        /// vou_no,vou_date,vou_Narr, acc_code,Particular, dr_amt,cr_amt,vou_type, OfficeName,uid
                        cmd = new SqlCommand("post_open_bal", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@status", SqlDbType.Char).Value = 1;
                        cmd.Parameters.Add("@vou_date", SqlDbType.DateTime).Value = dpOPDate.SelectedDate;
                        cmd.Parameters.Add("@vou_narr", SqlDbType.NVarChar).Value = "Opening Balance";
                        cmd.Parameters.Add("@acc_code", SqlDbType.NVarChar).Value = txtAcctCode.Text;
                        cmd.Parameters.Add("@Particular", SqlDbType.NVarChar).Value = txtAcctCode.Text;
                        cmd.Parameters.Add("@dr_amt", SqlDbType.Decimal).Value = txtDebitAmt.Text;
                        cmd.Parameters.Add("@cr_amt", SqlDbType.Decimal).Value = txtCreditAmt.Text;
                        cmd.Parameters.Add("@OfficeName", SqlDbType.NVarChar).Value = cmOfficeName.Text;
                        cmd.Parameters.Add("@uid", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName.ToString();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ReloadMainGrid();
                        ClearControl();
                        EnableControl(false);
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message.ToString();
                    }

                    ClearControl();
                    lblMessage.Text = "Data Saved Successfully.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
                //ReloadMainGrid();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void txtDebitAmt_TextChanged(object sender, EventArgs e)
        {
            if(Convert.ToDecimal(txtDebitAmt.Text)>0)
            {
                txtCreditAmt.Text = "0.00";
            }
        }
        protected void txtCreditAmt_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtCreditAmt.Text) > 0)
            {
                txtDebitAmt.Text = "0.00";
            }
        }




        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                DataRefillForGrid();
                EnableControl(true);
                cmAcctCode.Enabled = false;
                txtAcctCode.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void cmAcctCode_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("ComboLoadDataForAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 12;
            cmd.Parameters.Add("@SearchText", SqlDbType.VarChar).Value = e.Text;
            cmd.Parameters.Add("@OrderByFld", SqlDbType.VarChar).Value = cmAcctCode.Text;
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

                cmAcctCode.Items.Add(item);
                item.DataBind();
            }
        }

        protected void cmAcctCode_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtAcctCode.Text = cmAcctCode.SelectedValue;
        }

        protected void cmOfficeName_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //txtAcctCode.Text = cmAcctCode.SelectedValue;
        }

        protected void cmOfficeName_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select distinct OfficeName from AreaInfo", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["OfficeName"];
                    item.Value = dataRow["OfficeName"].ToString();
                    cmOfficeName.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtOpeningBalance;
        }
    }
}