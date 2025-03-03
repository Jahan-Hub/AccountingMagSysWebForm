﻿using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
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
    public partial class accJournalVoucher : System.Web.UI.Page
    {
        MAANBDERPEntities db = new MAANBDERPEntities();
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
        public void EnableControl(bool ec)
        {

        }
        public void ButtonControl(string bc)
        {
            //// Which button you click control according by button
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = false;
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnSearch.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "Save Mode";
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
                btnEdit.Enabled = true;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
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
        public void ClearCredit()
        {
            cmCredit.Text = "";
            cmCredit.SelectedValue = "";
            txtCreditCode.Text = "";
            txtCreditAmount.Text = "0.00";
        }
        public void ClearControl()
        {
            txtCheckNo.Text = "";
            txtCreditAmount.Text = "0.00";
            //txtCreditCode.Text = "";
            txtDebitAmount.Text = "0.00";
            //txtDebitCodeParticular.Text = "";
            txtNarattion.Text = "";
            txtTotalCredit.Text = "";
            txtTotalDebit.Text = "";
            txtTrackingID.Value = "0";
            //txtVoucherNo.Text = "";
            //cmCredit.Text = "";
            //cmCredit.SelectedValue = "";
            //cmDebit.Text = "";
            //cmDebit.SelectedValue = "";
            cmDepartment.Text = "Head Office";
            cmDepartment.SelectedValue = "10";
            cmProjectName.Text = "Dhaka";
            cmProjectName.SelectedValue = "Dhaka";
            cmSalesMan.Text = "";
            cmSalesMan.SelectedValue = "";
            //dtDebitCredit.Clear();
            //RadGrid1.Rebind();
        }
        public void ClearControlAll()
        {
            txtCheckNo.Text = "";
            txtCreditAmount.Text = "0.00";
            txtCreditCode.Text = "";
            txtDebitAmount.Text = "0.00";
            txtDebitCodeParticular.Text = "";
            txtNarattion.Text = "";
            txtTotalCredit.Text = "";
            txtTotalDebit.Text = "";
            txtTrackingID.Value = "0";
            //txtVoucherNo.Text = "";
            cmCredit.Text = "";
            cmCredit.SelectedValue = "";
            cmDebit.Text = "";
            cmDebit.SelectedValue = "";
            cmDepartment.Text = "Head Office";
            cmDepartment.SelectedValue = "10";
            cmProjectName.Text = "Dhaka";
            cmProjectName.SelectedValue = "Dhaka";
            cmSalesMan.Text = AppEnv.Current.p_UserName.ToString();
            cmSalesMan.SelectedValue = AppEnv.Current.p_UserEmployeeID.ToString();
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
            //try
            //{
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            string ss = "Select  isnull(Max(convert(int," + fieldName + ")),0) from " + tableName + " where " + WhereCondition + " = '" + ControlName + "'";
            SqlCommand cmd = new SqlCommand(ss, con);

            con.Open();
            Int32 x = (Int32)cmd.ExecuteScalar();
            //Int32 r = Convert.ToInt32(x + 1);
            return x.ToString();
            //}
            //catch (Exception)
            //{
            //    return "1";
            //}
            //finally
            //{
            //    con.Close();
            //}
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtDebitCredit.Clear();
                RadGrid1.Rebind();
                txtCreditAmount.Text = "00.00";
                txtDebitAmount.Text = "00.00";
                cmVoucherType.SelectedValue = "JV";
                cmVoucherType.Text = "JV";
                int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                txtVoucherNo.Text = (max + 1).ToString();
                dpVouDate.SelectedDate = DateTime.Now;
                lblVoucherType.Text = "Journal Voucher";
                txtCheckNo.Enabled = false;
                dpVouDate.Focus();
                ButtonControl("N");
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
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
                else if (txtCreditAmount.Text == "")
                {
                    lblMessage.Text = "Credit Amount can not be Blank.";
                }
                else
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                    con.Open();

                    cmd = new SqlCommand("Pro_Save_TempVou_Acc", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
                    cmd.Parameters.Add("@vou_date", SqlDbType.DateTime).Value = dpVouDate.SelectedDate;
                    cmd.Parameters.Add("@vou_narr", SqlDbType.NVarChar).Value = txtNarattion.Text;
                    cmd.Parameters.Add("@particular", SqlDbType.NVarChar).Value = cmCredit.SelectedValue;
                    cmd.Parameters.Add("@acct_code", SqlDbType.NVarChar).Value = txtCreditCode.Text;
                    cmd.Parameters.Add("@acc_code", SqlDbType.NVarChar).Value = txtDebitCodeParticular.Text;
                    cmd.Parameters.Add("@dr_amt", SqlDbType.Decimal).Value = Convert.ToDecimal(txtDebitAmount.Text);
                    cmd.Parameters.Add("@cr_amt", SqlDbType.Decimal).Value = Convert.ToDecimal(txtCreditAmount.Text);
                    cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
                    cmd.Parameters.Add("@vou_chq", SqlDbType.NVarChar).Value = txtCheckNo.Text;
                    if (cmProjectName.Text != "")
                    {
                        cmd.Parameters.Add("@OfficeName", SqlDbType.NVarChar).Value = cmProjectName.Text;
                    }
                    else
                    {
                        cmd.Parameters.Add("@OfficeName", SqlDbType.NVarChar).Value = "Dhaka";
                    }
                    if (cmDepartment.SelectedValue != "")
                    {
                        cmd.Parameters.Add("@Department", SqlDbType.NVarChar).Value = cmDepartment.SelectedValue;
                    }
                    else
                    {
                        cmd.Parameters.Add("@Department", SqlDbType.NVarChar).Value = "10";
                    }
                    if (cmSalesMan.SelectedValue != "")
                    {
                        cmd.Parameters.Add("@salesmancode", SqlDbType.Int).Value = cmSalesMan.SelectedValue;
                    }
                    else
                    {
                        cmd.Parameters.Add("@salesmancode", SqlDbType.Int).Value = "1010001";
                    }
                    cmd.Parameters.Add("@track_id", SqlDbType.Int).Value = txtTrackingID.Value;
                    cmd.Parameters.Add("@uid", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName.ToString();
                    cmd.ExecuteNonQuery();
                    ClearControl();
                    ClearCredit();
                    ClearControlPartial();
                    ButtonControl("N");
                    lblMessage.Text = "Data Saved Successfully...";
                    con.Close();

                    GridReloadOnly();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        public void GridReloadOnly()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
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

                if (Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString()) > 0)
                {
                    cmCredit.SelectedValue = dt1.Rows[i]["acc_code"].ToString();
                    cmCredit.Text = dt1.Rows[i]["acc_nam"].ToString();
                    txtCreditCode.Text = dt1.Rows[i]["acc_code"].ToString();
                    txtCheckNo.Text = dt1.Rows[i]["vou_chq"].ToString();
                }
            }
            RadGrid1.Rebind();

            //dpVouDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["vou_date"].ToString());

            lblMessage.Text = "";
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControl();
            ClearControlAll();
            ClearControlPartial();
            dtDebitCredit.Clear();
            RadGrid1.Rebind();
            ButtonControl("N");
        }
        protected void cmVoucherType_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                txtVoucherNo.Text = (max + 1).ToString();
                dpVouDate.SelectedDate = DateTime.Now;
                ButtonControl("N");
                if (cmVoucherType.SelectedValue == "JV")
                {
                    lblVoucherType.Text = "Journal Voucher";
                    txtCheckNo.Enabled = false;
                }
                ClearControl();
                dtDebitCredit.Clear();
                RadGrid1.Rebind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnAddDebit_Click(object sender, EventArgs e)
        {

        }
        protected void cmProjectName_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
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
                    cmProjectName.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmDepartment_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select * from tblDepartmentGRL", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"];
                    item.Value = dataRow["Code"].ToString();
                    cmDepartment.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmSalesMan_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select EmployeeID,EmployeeName from EmployeeInfo", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["EmployeeName"];
                    item.Value = dataRow["EmployeeID"].ToString();
                    cmSalesMan.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
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

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
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

                    if (Convert.ToDecimal(dt1.Rows[i]["dr_amt"].ToString()) > 0) // for getting credit data
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
                //txtVoucherNo.Text = (Convert.ToInt32(txtVoucherNo.Text) - 1).ToString();
                lblMessage.Text = ex.Message;
            }


            //if (cmVoucherType.SelectedValue == "")
            //{
            //    lblMessage.Text = "Select Voucher Type.";
            //}
            //else
            //{
            //    GridReloadOnly();
            //    ButtonControl("E");
            //}
        }
        protected void rbtDeleteGrid_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = dtDebitCredit;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "GridDelete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                int RID = Convert.ToInt32(item["track_id"].Text);
                //DataRow[] Drow = this.dtDebitCredit.Select("track_id='" + RID + "'");
                //if (Drow.Length > 0)
                //{
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();

                cmd = new SqlCommand("[pro_delete_tempvou]", con);
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
                //}
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
            txtCreditAmount.Text = selectedItem["Credit"].Text;
            txtNarattion.Text = selectedItem["Narration"].Text;
            txtTrackingID.Value = selectedItem["track_id"].Text;

            //GridDataItem selectedItem = (GridDataItem)RadGrid1.SelectedItems[0];
            //string RowId = selectedItem["rowid"].Text;
            //ViewState["rowid"] = selectedItem["rowid"].Text;

            //cmDebit.Text = selectedItem["Particulars"].Text;
            //cmDebit.SelectedValue = selectedItem["ParticularCode"].Text;
            //txtDebitCodeParticular.Text = selectedItem["ParticularCode"].Text;
            //txtDebitAmount.Text = selectedItem["dr_amt"].Text;
            //txtNarattion.Text = selectedItem["Narration"].Text;
            //txtTrackingID.Value = selectedItem["track_id"].Text;
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
                    //sumCreditAmount += Convert.ToDecimal(dataItem["Debit"].Text);
                    ViewState["sumDebitAmount"] = sumDebitAmount;
                    txtTotalCredit.Text = sumDebitAmount.ToString();
                    txtTotalDebit.Text = sumDebitAmount.ToString();
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Debit"].Text = sumDebitAmount.ToString();
                    //footerItem["Credit"].Text = sumCreditAmount.ToString();
                    footerItem["Particulars"].Text = "Total : ";
                    footerItem.BackColor = System.Drawing.Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnPosting_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("PostingInLedger_AC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
                cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
                cmd.ExecuteNonQuery();
                con.Close();

                //int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                //txtVoucherNo.Text = (max + 1).ToString();
                ClearControlAll();
                GridReloadOnly();
                //dpVouDate.SelectedDate = DateTime.Now;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
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
                    int max = Convert.ToInt32(GetAutoNumber("vou_no", "vou", "vou_type", cmVoucherType.SelectedValue));
                    if (max == Convert.ToInt32(txtVoucherNo.Text))
                    {
                        ButtonControl("L");
                        lblMessage.Text = "This is the Last Voucher.";
                    }
                    else
                    {
                        dtDebitCredit.Clear();

                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                        con.Open();
                        cmd = new SqlCommand("flush_vou", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        Int32 next = Convert.ToInt32(txtVoucherNo.Text) + 1;
                        cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = next;
                        txtVoucherNo.Text = next.ToString();
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
                        cmProjectName.SelectedValue = dt1.Rows[0]["OfficeName"].ToString();
                        cmDepartment.SelectedValue = dt1.Rows[0]["Department"].ToString();
                        cmDepartment.Text = dt1.Rows[0]["DepartmentName"].ToString();
                        cmSalesMan.SelectedValue = dt1.Rows[0]["salesmancode"].ToString();
                        cmSalesMan.Text = dt1.Rows[0]["Emp_nam"].ToString();
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
                //txtVoucherNo.Text = (Convert.ToInt32(txtVoucherNo.Text) - 1).ToString();
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
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
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
                        cmProjectName.SelectedValue = dt1.Rows[0]["OfficeName"].ToString();
                        cmDepartment.SelectedValue = dt1.Rows[0]["Department"].ToString();
                        cmDepartment.Text = dt1.Rows[0]["DepartmentName"].ToString();
                        cmSalesMan.SelectedValue = dt1.Rows[0]["salesmancode"].ToString();
                        cmSalesMan.Text = dt1.Rows[0]["Emp_nam"].ToString();

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
                //txtVoucherNo.Text = (Convert.ToInt32(txtVoucherNo.Text) - 1).ToString();
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnPreview_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();
            if (MAANBDERP.AppEnv.Current.p_rptSource != null)
            {
                MAANBDERP.AppEnv.Current.p_rptSource.Close();
                MAANBDERP.AppEnv.Current.p_rptSource.Dispose();
            }
            MAANBDERP.AppEnv.Current.p_rptSource = new ReportDocument();
            cmd = new SqlCommand("ReportManager_AC", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 7;
            cmd.Parameters.Add("@vou_no", SqlDbType.VarChar).Value = txtVoucherNo.Text;
            cmd.Parameters.Add("@vou_type", SqlDbType.VarChar).Value = cmVoucherType.SelectedValue;
            //cmd.Parameters.Add("@var1", SqlDbType.VarChar).Value = txtVoucherNo.Text;
            //cmd.Parameters.Add("@var2", SqlDbType.VarChar).Value = cmVoucherType.SelectedValue;

            SqlDataAdapter Dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Dap.Fill(dt);
            cmd.Dispose();
            string tempPath = "";
            string reportName = "";
            reportName = "VoucherPrint";
            MAANBDERP.AppEnv.Current.p_rptObject = "~/Reports/Accounts/VoucherPrintJournal.rpt";
            tempPath = @System.IO.Path.GetTempPath() + "VoucherPrint";
            MAANBDERP.AppEnv.Current.p_rptSource.Load(Server.MapPath(MAANBDERP.AppEnv.Current.p_rptObject.ToString()));
            MAANBDERP.AppEnv.Current.p_rptSource.SetDataSource(dt);
            con.Close();

            if (dt.Rows.Count > 0)
            {
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();
                //((TextObject)MAANBDERP.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtReportType"]).Text = cmReportType.Text;
                //((TextObject)MAANBDERP.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtStartDate"]).Text = dpStartDate.SelectedDate.Value.ToShortDateString();
                //((TextObject)MAANBDERP.AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtEndDate"]).Text = dpEndDate.SelectedDate.Value.ToShortDateString();
                ExportFormatType format = ExportFormatType.PortableDocFormat;
                try
                {
                    MAANBDERP.AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                }
                finally
                {
                    MAANBDERP.AppEnv.Current.p_rptSource.Close();
                    MAANBDERP.AppEnv.Current.p_rptSource.Dispose();
                    GC.Collect();
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
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();

            cmd = new SqlCommand("[DeleteVou]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.NVarChar).Value = 2;
            cmd.Parameters.Add("@vou_no", SqlDbType.NVarChar).Value = txtVoucherNo.Text;
            cmd.Parameters.Add("@vou_type", SqlDbType.NVarChar).Value = cmVoucherType.SelectedValue;
            cmd.Parameters.Add("@track_id", SqlDbType.NVarChar).Value = txtTrackingID.Value;
            cmd.ExecuteNonQuery();
            //ClearControl();
            //ClearControlAll();
            ClearControlPartial();
            //ClearCredit();
            ButtonControl("N");
            lblMessage.Text = "Data Deleted Successfully...";
            con.Close();
            RadGrid1.Rebind();
        }
        protected void txtDebitAmount_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtDebitAmount.Text) > 0)
            {
                txtCreditAmount.Text = "0.00";
            }
        }
        protected void txtCreditAmount_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtCreditAmount.Text) > 0)
            {
                txtDebitAmount.Text = "0.00";
            }
        }
        protected void cmCredit_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("ComboLoadDataForAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 13;
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
        protected void cmCredit_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtCreditCode.Text = cmCredit.SelectedValue;
        }
        protected void cmDebit_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
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
        protected void cmDebit_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            txtDebitCodeParticular.Text = cmDebit.SelectedValue;
            txtCreditAmount.Text = "0.00";
            cmDepartment.Text = "Head Office";
            cmDepartment.SelectedValue = "10";
            cmProjectName.Text = "Dhaka";
            cmProjectName.SelectedValue = "Dhaka";
            cmSalesMan.Text = AppEnv.Current.p_UserName.ToString();
            cmSalesMan.SelectedValue = AppEnv.Current.p_UserEmployeeID.ToString();
            txtDebitAmount.Focus();
        }

        protected void cmCustCode_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MAANBDERPConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select Acc_code,Acc_Name from acct where Acc_head='1103'", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Acc_Name"];
                    item.Value = dataRow["Acc_code"].ToString();
                    cmCustCode.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void cmCustCode_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }


    }
}