using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Telerik.Web.UI;

namespace AccountingManagementSystem.Forms
{
    public partial class DebitVoucher : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        public DataTable dtDebitCredit
        {
            get
            {
                object obj = this.Session["dtDebitCredit"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int16));
                dt1.Columns.Add("track_id", typeof(string));
                dt1.Columns.Add("acc_code", typeof(string));
                dt1.Columns.Add("ParticularCode", typeof(string));
                dt1.Columns.Add("Particulars", typeof(string));
                dt1.Columns.Add("Department", typeof(string));
                dt1.Columns.Add("Salsman", typeof(string));
                dt1.Columns.Add("Narration", typeof(string));
                dt1.Columns.Add("Debit", typeof(decimal));
                dt1.Columns.Add("Credit", typeof(decimal));
                dt1.Columns.Add("post_state", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtDebitCredit"] = dt1;
                return dtDebitCredit;
            }
        }
        public void ButtonControl(string bc)
        {
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = false;
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "Save Mode";
            }

            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "Edit Mode";
            }
        }
        public void ClearCredit()
        {
            cmDebit.Text = "";
            cmDebit.SelectedValue = "";
            txtDebitCodeParticular.Text = "";
            txtDebitAmount.Text = "0.00";
        }
        public void ClearControl()
        {
            txtCheckNo.Text = "";
            txtCreditAmount.Text = "0.00";
            txtDebitAmount.Text = "0.00";
            txtDebitCodeParticular.Text = "";
            txtNarattion.Text = "";
            txtTotalCredit.Text = "";
            txtTotalDebit.Text = "";
            txtTrackingID.Value = "0";
            cmDebit.Text = "";
            cmDebit.SelectedValue = "";
        }
        public void ClearControlAll()
        {
            txtCheckNo.Text = "";
            txtCreditAmount.Text = "0.00";
            txtDebitAmount.Text = "0.00";
            txtDebitCodeParticular.Text = "";
            txtNarattion.Text = "";
            txtTotalCredit.Text = "";
            txtTotalDebit.Text = "";
            txtTrackingID.Value = "0";
            cmDebit.Text = "";
            cmDebit.SelectedValue = "";
            dtDebitCredit.Clear();
            RadGrid1.Rebind();
        }
        public void ClearControlPartial()
        {
            cmDebit.Text = "";
            cmDebit.SelectedValue = "";
            txtDebitAmount.Text = "0.00";
            txtNarattion.Text = "";
            txtDebitCodeParticular.Text = "";
        }

        public string GetAutoNumber(string fieldName, string tableName, string WhereCondition, string ControlName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                string ss = "Select  isnull(Max(convert(int," + fieldName + ")),0) from " + tableName + " where " + WhereCondition + " = '" + ControlName + "'";
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                Int32 x = (Int32)cmd.ExecuteScalar();
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtDebitCredit.Clear();
                RadGrid1.Rebind();
                txtCreditAmount.Text = "00.00";
                txtDebitAmount.Text = "00.00";
                ButtonControl("L");
                cmVoucherType.SelectedValue = "CP";
                cmVoucherType.Text = "CP";
                dpVouDate.SelectedDate = DateTime.Now;
                lblVoucherType.Text = "Cash Payment Voucher";
                cmCredit.Text = "Cash in Hand";
                cmCredit.SelectedValue = "1101";
                txtCreditCode.Text = "1101";
                txtCheckNo.Enabled = false;
                ButtonControl("N");

                int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                txtVoucherNo.Text = (max + 1).ToString();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (cmVoucherType.SelectedValue == "")
            {
                lblMessage.Text = "Select Voucher Type";
            }
            else
            {
                try
                {
                    int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                    txtVoucherNo.Text = (max + 1).ToString();
                    ClearControl();
                    dpVouDate.SelectedDate = DateTime.Now;
                    dtDebitCredit.Clear();
                    RadGrid1.Rebind();
                    ButtonControl("N");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
            }
            dpVouDate.Focus();
        }
        public void GridReloadOnly()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("flush_vou", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = txtVoucherNo.Text;
            cmd.Parameters.Add("@var2", SqlDbType.Char).Value = cmVoucherType.SelectedValue;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt1 = new DataTable();
            adpt.Fill(ds);
            dt1 = ds.Tables[0];

            dtDebitCredit.Clear();
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                DataRow newRow = this.dtDebitCredit.NewRow();
                newRow["rowid"] = this.dtDebitCredit.Rows.Count + 1;

                newRow["track_id"] = dt1.Rows[i]["track_id"].ToString();
                newRow["acc_code"] = dt1.Rows[i]["acc_code"].ToString();
                newRow["ParticularCode"] = dt1.Rows[i]["acc_code"].ToString();
                newRow["Particulars"] = dt1.Rows[i]["acc_nam"].ToString();
                newRow["Debit"] = Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString());
                newRow["Credit"] = Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString());
                newRow["Narration"] = dt1.Rows[i]["vou_narr"].ToString();
                newRow["post_state"] = dt1.Rows[i]["post_state"].ToString();

                this.dtDebitCredit.Rows.Add(newRow);
                this.dtDebitCredit.AcceptChanges();

                if (Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString()) > 0) // for getting credit data
                {
                    cmDebit.SelectedValue = dt1.Rows[i]["acc_code"].ToString();
                    cmDebit.Text = dt1.Rows[i]["acc_nam"].ToString();
                    txtDebitCodeParticular.Text = dt1.Rows[i]["acc_code"].ToString();
                }
            }
            RadGrid1.Rebind();
            lblMessage.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            try
            {
                if (txtVoucherNo.Text == "")
                {
                    lblMessage.Text = "Voucher No can not be Blank.";
                }
                else if (txtCreditCode.Text == "")
                {
                    lblMessage.Text = "Credit Code can not be Blank.";
                }
                else if (cmDebit.SelectedValue == "")
                {
                    lblMessage.Text = "Select Debit.";
                }
                else if (txtDebitCodeParticular.Text == "")
                {
                    lblMessage.Text = "Debit Code can not be Blank.";
                }
                else if (txtDebitAmount.Text == "")
                {
                    lblMessage.Text = "Debit Amount can not be Blank.";
                }
                else if (Convert.ToDecimal(txtDebitAmount.Text) <= 0)
                {
                    lblMessage.Text = "Debit Amount can not be Zero.";
                }
                else
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    con.Open();

                    cmd = new SqlCommand("Pro_Save_TempVou_Acc", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
                    cmd.Parameters.Add("@vou_date", SqlDbType.DateTime).Value = dpVouDate.SelectedDate;
                    cmd.Parameters.Add("@vou_narr", SqlDbType.NVarChar).Value = txtNarattion.Text;
                    cmd.Parameters.Add("@particular", SqlDbType.NVarChar).Value = cmDebit.SelectedValue;
                    cmd.Parameters.Add("@acct_code", SqlDbType.NVarChar).Value = txtCreditCode.Text;
                    cmd.Parameters.Add("@acc_code", SqlDbType.NVarChar).Value = txtDebitCodeParticular.Text;
                    cmd.Parameters.Add("@dr_amt", SqlDbType.Decimal).Value = Convert.ToDecimal(txtDebitAmount.Text);
                    cmd.Parameters.Add("@cr_amt", SqlDbType.Decimal).Value = Convert.ToDecimal(txtCreditAmount.Text);
                    cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
                    cmd.Parameters.Add("@vou_chq", SqlDbType.NVarChar).Value = txtCheckNo.Text;

                    cmd.Parameters.Add("@track_id", SqlDbType.Int).Value = txtTrackingID.Value;
                    cmd.Parameters.Add("@uid", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName.ToString();
                    cmd.ExecuteNonQuery();
                    ButtonControl("N");
                    lblMessage.Text = "Data Saved Successfully...";
                    con.Close();

                    GridReloadOnly();

                    ClearControl();
                    ClearCredit();
                    ClearControlPartial();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
            btnSave.Focus();
        }
        protected void btnPosting_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("PostingInLedger_AC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
                cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
                cmd.ExecuteNonQuery();
                con.Close();

                ClearControlAll();
                GridReloadOnly();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            btnPosting.Focus();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            ButtonControl("E");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ButtonControl("L");
            ClearControl();
            ClearControlAll();
            ClearControlPartial();
        }

        protected void cmCredit_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("ComboLoadDataForAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 12;
            cmd.Parameters.Add("@SearchText", SqlDbType.VarChar).Value = e.Text;
            cmd.Parameters.Add("@OrderByFld", SqlDbType.VarChar).Value = cmCredit.Text;
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

                cmCredit.Items.Add(item);
                item.DataBind();
            }
        }
        protected void cmDebit_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("ComboLoadDataForAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 13;
            cmd.Parameters.Add("@SearchText", SqlDbType.VarChar).Value = e.Text;
            cmd.Parameters.Add("@OrderByFld", SqlDbType.VarChar).Value = cmDebit.Text;
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

                cmDebit.Items.Add(item);
                item.DataBind();
            }
        }
        protected void cmCredit_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtCreditCode.Text = cmCredit.SelectedValue;
            if (cmVoucherType.SelectedValue == "CP")
            {
                cmDebit.Focus();
            }
            else
            {
                txtCheckNo.Focus();
            }
        }
        protected void cmDebit_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtDebitCodeParticular.Text = cmDebit.SelectedValue;
            txtNarattion.Text = "Amount Paid for " + cmDebit.Text + " by";
            txtDebitAmount.Focus();
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = dtDebitCredit;
        }
        decimal sumDebitAmount = 0;
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    sumDebitAmount += Convert.ToDecimal(dataItem["Debit"].Text);
                    ViewState["sumDebitAmount"] = sumDebitAmount;
                    txtTotalCredit.Text = sumDebitAmount.ToString();
                    txtTotalDebit.Text = sumDebitAmount.ToString();
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Debit"].Text = sumDebitAmount.ToString();
                    footerItem["Particulars"].Text = "Total : ";
                    footerItem.BackColor = System.Drawing.Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmVoucherType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                txtVoucherNo.Text = (max + 1).ToString();
                dpVouDate.SelectedDate = DateTime.Now;
                ClearControlAll();
                ButtonControl("N");
                if (cmVoucherType.SelectedValue == "CP")
                {
                    lblVoucherType.Text = "Cash Payment Voucher";
                    cmCredit.Text = "Cash in Hand";
                    cmCredit.SelectedValue = "1101";
                    txtCreditCode.Text = "1101";
                    txtCheckNo.Enabled = false;
                }
                else
                {
                    lblVoucherType.Text = "Bank Payment Voucher";
                    cmCredit.Text = "";
                    cmCredit.SelectedValue = "";
                    txtCreditCode.Text = "";
                    txtCheckNo.Enabled = true;
                }

                dtDebitCredit.Clear();
                RadGrid1.Rebind();
                txtVoucherNo.Focus();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void txtVoucherNo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("flush_vou", con);
                cmd.CommandType = CommandType.StoredProcedure;
                Int32 previous = Convert.ToInt32(txtVoucherNo.Text);
                cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = previous;
                txtVoucherNo.Text = previous.ToString();
                cmd.Parameters.Add("@var2", SqlDbType.Char).Value = cmVoucherType.SelectedValue;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt1 = new DataTable();
                adpt.Fill(ds);
                dt1 = ds.Tables[0];

                dtDebitCredit.Clear();
                RadGrid1.Rebind();
                ClearControlPartial();
                dpVouDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["vou_date"].ToString());


                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    DataRow newRow = this.dtDebitCredit.NewRow();
                    newRow["rowid"] = this.dtDebitCredit.Rows.Count + 1;

                    newRow["track_id"] = dt1.Rows[i]["track_id"].ToString();
                    newRow["acc_code"] = dt1.Rows[i]["acc_code"].ToString();
                    newRow["ParticularCode"] = dt1.Rows[i]["acc_code"].ToString();
                    newRow["Particulars"] = dt1.Rows[i]["acc_nam"].ToString();
                    newRow["Debit"] = Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString());
                    newRow["Credit"] = Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString());
                    newRow["Narration"] = dt1.Rows[i]["vou_narr"].ToString();
                    newRow["post_state"] = dt1.Rows[i]["post_state"].ToString();
                    this.dtDebitCredit.Rows.Add(newRow);
                    this.dtDebitCredit.AcceptChanges();

                    if (Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString()) > 0) // for getting credit data
                    {
                        cmCredit.SelectedValue = dt1.Rows[i]["acc_code"].ToString();
                        cmCredit.Text = dt1.Rows[i]["acc_nam"].ToString();
                        txtCreditCode.Text = dt1.Rows[i]["acc_code"].ToString();
                        txtCheckNo.Text = dt1.Rows[i]["vou_chq"].ToString();
                    }
                }
                RadGrid1.Rebind();
                lblMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            dpVouDate.Focus();
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "GridDelete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                int RID = Convert.ToInt32(item["track_id"].Text);

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                con.Open();

                cmd = new SqlCommand("[DeleteVou]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.NVarChar).Value = 1;
                cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
                cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
                cmd.Parameters.Add("@track_id", SqlDbType.Int).Value = RID;
                cmd.ExecuteNonQuery();
                ClearControl();
                ClearCredit();
                ButtonControl("N");
                lblMessage.Text = "Data Saved Successfully...";
                con.Close();

                GridReloadOnly();
            }
        }
        protected void rbtDeleteGrid_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmVoucherType.SelectedValue == "")
                {
                    lblMessage.Text = "Select Voucher Type.";
                }
                else
                {
                    if (txtVoucherNo.Text == "1")
                    {
                        lblMessage.Text = "This is the first Voucher.";
                    }
                    else
                    {
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                        con.Open();
                        cmd = new SqlCommand("flush_vou", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        Int32 previous = Convert.ToInt32(txtVoucherNo.Text) + 1;
                        cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = previous;
                        txtVoucherNo.Text = previous.ToString();
                        cmd.Parameters.Add("@var2", SqlDbType.Char).Value = cmVoucherType.SelectedValue;
                        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        DataTable dt1 = new DataTable();
                        adpt.Fill(ds);
                        dt1 = ds.Tables[0];

                        dtDebitCredit.Clear();
                        RadGrid1.Rebind();
                        ClearControlPartial();
                        dpVouDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["vou_date"].ToString());

                        for (int i = 0; i < dt1.Rows.Count; i++)
                        {
                            DataRow newRow = this.dtDebitCredit.NewRow();
                            newRow["rowid"] = this.dtDebitCredit.Rows.Count + 1;

                            newRow["track_id"] = dt1.Rows[i]["track_id"].ToString();
                            newRow["acc_code"] = dt1.Rows[i]["acc_code"].ToString();
                            newRow["ParticularCode"] = dt1.Rows[i]["acc_code"].ToString();
                            newRow["Particulars"] = dt1.Rows[i]["acc_nam"].ToString();
                            newRow["Debit"] = Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString());
                            newRow["Credit"] = Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString());
                            newRow["Narration"] = dt1.Rows[i]["vou_narr"].ToString();
                            newRow["post_state"] = dt1.Rows[i]["post_state"].ToString();
                            this.dtDebitCredit.Rows.Add(newRow);
                            this.dtDebitCredit.AcceptChanges();

                            if (Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString()) > 0) // for getting credit data
                            {
                                cmCredit.SelectedValue = dt1.Rows[i]["acc_code"].ToString();
                                cmCredit.Text = dt1.Rows[i]["acc_nam"].ToString();
                                txtCreditCode.Text = dt1.Rows[i]["acc_code"].ToString();
                                txtCheckNo.Text = dt1.Rows[i]["vou_chq"].ToString();
                            }
                        }
                        RadGrid1.Rebind();
                        lblMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmVoucherType.SelectedValue == "")
                {
                    lblMessage.Text = "Select Voucher Type.";
                }
                else
                {
                    if (txtVoucherNo.Text == "1")
                    {
                        lblMessage.Text = "This is the first Voucher.";
                    }
                    else
                    {
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                        con.Open();
                        cmd = new SqlCommand("flush_vou", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        Int32 previous = Convert.ToInt32(txtVoucherNo.Text) - 1;
                        cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = previous;
                        txtVoucherNo.Text = previous.ToString();
                        cmd.Parameters.Add("@var2", SqlDbType.Char).Value = cmVoucherType.SelectedValue;
                        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        DataTable dt1 = new DataTable();
                        adpt.Fill(ds);
                        dt1 = ds.Tables[0];

                        dtDebitCredit.Clear();
                        RadGrid1.Rebind();
                        ClearControlPartial();
                        dpVouDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["vou_date"].ToString());

                        for (int i = 0; i < dt1.Rows.Count; i++)
                        {
                            DataRow newRow = this.dtDebitCredit.NewRow();
                            newRow["rowid"] = this.dtDebitCredit.Rows.Count + 1;

                            newRow["track_id"] = dt1.Rows[i]["track_id"].ToString();
                            newRow["acc_code"] = dt1.Rows[i]["acc_code"].ToString();
                            newRow["ParticularCode"] = dt1.Rows[i]["acc_code"].ToString();
                            newRow["Particulars"] = dt1.Rows[i]["acc_nam"].ToString();
                            newRow["Debit"] = Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString());
                            newRow["Credit"] = Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString());
                            newRow["Narration"] = dt1.Rows[i]["vou_narr"].ToString();
                            newRow["post_state"] = dt1.Rows[i]["post_state"].ToString();
                            this.dtDebitCredit.Rows.Add(newRow);
                            this.dtDebitCredit.AcceptChanges();

                            if (Convert.ToDecimal(dt1.Rows[i]["cr_amt"].ToString()) > 0) // for getting credit data
                            {
                                cmCredit.SelectedValue = dt1.Rows[i]["acc_code"].ToString();
                                cmCredit.Text = dt1.Rows[i]["acc_nam"].ToString();
                                txtCreditCode.Text = dt1.Rows[i]["acc_code"].ToString();
                                txtCheckNo.Text = dt1.Rows[i]["vou_chq"].ToString();
                            }
                        }
                        RadGrid1.Rebind();
                        lblMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmVoucherType_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                txtVoucherNo.Text = (max + 1).ToString();
                dpVouDate.SelectedDate = DateTime.Now;
                if (cmVoucherType.SelectedValue == "CP")
                {
                    lblVoucherType.Text = "Cash Payment Voucher";
                }
                else
                {
                    lblVoucherType.Text = "Bank Payment Voucher";
                }

                ClearControl();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataRefill();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        private void DataRefill()
        {
            GridDataItem selectedItem = (GridDataItem)RadGrid1.SelectedItems[0];
            string RowId = selectedItem["rowid"].Text;
            ViewState["rowid"] = selectedItem["rowid"].Text;

            cmDebit.Text = selectedItem["Particulars"].Text;
            cmDebit.SelectedValue = selectedItem["ParticularCode"].Text;
            txtDebitCodeParticular.Text = selectedItem["ParticularCode"].Text;
            txtDebitAmount.Text = selectedItem["Debit"].Text;
            txtNarattion.Text = selectedItem["Narration"].Text;
            txtTrackingID.Value = selectedItem["track_id"].Text;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();

            cmd = new SqlCommand("[DeleteVou]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.NVarChar).Value = 2;
            cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
            cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
            cmd.Parameters.Add("@track_id", SqlDbType.NVarChar).Value = txtTrackingID.Value;
            cmd.ExecuteNonQuery();
            ClearControlAll();
            ButtonControl("N");
            lblMessage.Text = "Data Deleted Successfully...";
            con.Close();
            RadGrid1.Rebind();
        }

        protected void txtDebitAmount_TextChanged(object sender, EventArgs e)
        {
            txtNarattion.Focus();
        }
        protected void txtNarattion_TextChanged(object sender, EventArgs e)
        {
            btnSave.Focus();
        }
        protected void btnPreview_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            if (AppEnv.Current.p_rptSource != null)
            {
                AppEnv.Current.p_rptSource.Close();
                AppEnv.Current.p_rptSource.Dispose();
            }
            AppEnv.Current.p_rptSource = new ReportDocument();
            cmd = new SqlCommand("ReportManager_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
            if (txtVoucherNo.Text != "")
                cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = txtVoucherNo.Text;
            cmd.Parameters.Add("@vou_type", SqlDbType.VarChar).Value = cmVoucherType.SelectedValue;

            SqlDataAdapter Dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Dap.Fill(dt);
            cmd.Dispose();
            string tempPath = "";
            string reportName = "";
            reportName = "VoucherPrintDebit";
            AppEnv.Current.p_rptObject = "~/Reports/VoucherPrintDebit.rpt";
            tempPath = @System.IO.Path.GetTempPath() + "VoucherPrintDebit";
            AppEnv.Current.p_rptSource.Load(Server.MapPath(AccountingManagementSystem.AppEnv.Current.p_rptObject.ToString()));
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
        protected void btnPreviewAll_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            con.Open();
            if (AppEnv.Current.p_rptSource != null)
            {
                AppEnv.Current.p_rptSource.Close();
                AppEnv.Current.p_rptSource.Dispose();
            }

            AppEnv.Current.p_rptSource = new ReportDocument();
            cmd = new SqlCommand("ReportManager_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
            if (txtVoucherNo.Text != "")
                cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = txtVoucherNo.Text;
            if (dpVouDate.SelectedDate != null)
                cmd.Parameters.Add("@StartDate", SqlDbType.VarChar).Value = dpVouDate.SelectedDate;
            cmd.Parameters.Add("@vou_type", SqlDbType.VarChar).Value = cmVoucherType.SelectedValue;

            SqlDataAdapter Dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Dap.Fill(dt);
            cmd.Dispose();
            string tempPath = "";
            string reportName = "";
            reportName = "VoucherPrintDebit";
            AppEnv.Current.p_rptObject = "~/Reports/VoucherPrintDebit.rpt";
            tempPath = @System.IO.Path.GetTempPath() + "VoucherPrintDebit";
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

    }
}