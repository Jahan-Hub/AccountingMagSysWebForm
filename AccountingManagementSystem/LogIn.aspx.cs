﻿using AccountingManagementSystem;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace AccountingManagementSystem
{
    public partial class LogIn : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //cmd = new SqlCommand("pro_acct_AC", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
                //cmd.Parameters.Add("@acc_head", SqlDbType.VarChar).Value = cmMainLedger.SelectedValue;
                //SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                //DataSet ds = new DataSet();
                //DataTable dt = new DataTable();
                //adpt.Fill(ds);
                //dt = ds.Tables[0];

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_CompanyInfo", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "1";
                SqlDataReader Dr;
                Dr = Cmd.ExecuteReader();
                while (Dr.Read())
                {
                    lblHeading.Text = Dr["Name"].ToString();
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
                con.Close();
                AppEnv.Current.p_UserName = "Unauthorized";
            }
            Session["UserName"] = null;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(RadComboBox1.SelectedValue=="")
            {
                lblMessage.Text = "Select User Name";
            }
            else if(txtPassword.Text=="")
            {
                lblMessage.Text = "Enter Password.";
            }
            else
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_Login", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@p_OpMode", SqlDbType.VarChar).Value = 1;
                SqlDataReader dr = Cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (dr["UserName"].ToString() == RadComboBox1.Text && dr["Password"].ToString() == txtPassword.Text)
                    {
                        AppEnv.Current.p_UserName = RadComboBox1.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Username or Password.";
                    }
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            RadComboBox1.Text = "";
            RadComboBox1.SelectedValue = "";
            txtPassword.Text = "";
        }
    }
}