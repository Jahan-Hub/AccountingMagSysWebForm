using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace AccountingManagementSystem.Forms
{
    public partial class CompanyInfo : System.Web.UI.Page
    {
        AccountingManagementSystemEntities db = new AccountingManagementSystemEntities();
        SqlConnection con;
        SqlCommand cmd;
        public string GetAutoNumber(string fieldName, string tableName, string WhereCondition, string ControlName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                string ss = "Select  convert(int,Max(" + fieldName + ")) from " + tableName + " where " + WhereCondition + "=" + ControlName + "";
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                int x = (int)cmd.ExecuteScalar() + 1;
                return x.ToString();
            }
            catch (Exception)
            {
                string prefix = "001";
                return prefix;
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
                ReloadMainGrid();
                EnableControl(false);
                ClearControl();

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select * from tblCompany", con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader Dr;
                Dr = cmd.ExecuteReader();
                while (Dr.Read())
                {
                    txtId.Text = Dr["ComId"].ToString();
                    Session["Name"] = Dr["Name"].ToString();
                    txtName.Text =  Dr["Name"].ToString();
                    Session["Address"] = Dr["Address"].ToString();
                    txtAddress.Text = Dr["Address"].ToString();
                    Session["Contact1"] = Dr["Contact1"].ToString();
                    txtContactNo1.Text = Dr["Contact1"].ToString();
                    Session["Contact2"] = Dr["Contact2"].ToString();
                    txtContactNo2.Text = Dr["Contact2"].ToString();
                    Session["Fax"] = Dr["Fax"].ToString();
                    txtFax.Text = Dr["Fax"].ToString();
                    //Session["CompanyLogo"] = Dr["CompanyLogo"].ToString();
                    //Image1.ImageUrl= Dr["CompanyLogo"].ToString();
                    Session["CompanyMoto"] = Dr["CompanyMoto"].ToString();
                    txtMoto.Text = Dr["CompanyMoto"].ToString();
                    Session["Email"] = Dr["Email"].ToString();
                    txtEmail.Text = Dr["Email"].ToString();
                    Session["Website"] = Dr["Website"].ToString();
                    txtWebsite.Text = Dr["Website"].ToString();
                    if (!Convert.IsDBNull(Dr["CompanyLogo"]))
                    {
                        byte[] bytes = (byte[])Dr["CompanyLogo"];
                        ViewState["CompanyLogo"] = (byte[])Dr["CompanyLogo"];
                        if (bytes.Length > 0)
                        {
                            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                            Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
                            Image1.DataBind();
                        }
                        ViewState["CompanyLogo"] = (byte[])Dr["CompanyLogo"];
                    }
                    Page.Title = Dr["Name"].ToString().ToUpper();
                }
                con.Close();
            }
        }

        public void EnableControl(bool ec)
        {
            
        }
        public void ClearControl()
        {
           
            Image1.ImageUrl = null;
        }

        private void ReloadMainGrid()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_ItemInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adpt.Fill(ds);
            dt = ds.Tables[0];
            //rgMain.DataSource = dt;
            //rgMain.DataBind();
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            con.Open();
            try   
            {
                cmd = new SqlCommand("Sp_CompanyInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtName.Text;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@Contact1", SqlDbType.NVarChar).Value = txtContactNo1.Text;
                cmd.Parameters.Add("@Contact2", SqlDbType.NVarChar).Value = txtContactNo2.Text;
                cmd.Parameters.Add("@Fax", SqlDbType.NVarChar).Value = txtFax.Text;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                cmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = txtWebsite.Text;
                cmd.Parameters.Add("@Moto", SqlDbType.NVarChar).Value = txtMoto.Text;

                int imglength = FileUpload2.PostedFile.ContentLength;
                byte[] bytearray = new byte[imglength];
                HttpPostedFile image = FileUpload2.PostedFile;
                image.InputStream.Read(bytearray, 0, imglength);
                if (FileUpload2.HasFile)
                {
                    cmd.Parameters.Add("@Logo", SqlDbType.Image).Value = bytearray;
                }
                else
                {
                    cmd.Parameters.Add("@Logo", SqlDbType.Image).Value = ViewState["CompanyLogo"];
                }
                cmd.Parameters.Add("@ComId", SqlDbType.NVarChar).Value = txtId.Text;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }

            //Response.Redirect("~/Home.aspx");
        }
        private void DataRefillForGrid()
        {
            //GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
            //ViewState["ItemCode"] = selectedItem["ItemCode"].Text;
            //ViewState["rowid"] = selectedItem["rowid"].Text;

            //con = new SqlConnection(ConfigurationManager.ConnectionStrings["AccountingManagementSystemConnectionString"].ConnectionString);
            //con.Open();
            //cmd = new SqlCommand("Sp_ItemInfo", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 6;
            //cmd.Parameters.Add("@ItemCode", SqlDbType.VarChar).Value = selectedItem["ItemCode"].Text;
            //SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //DataTable dt1 = new DataTable();
            //adpt.Fill(ds);
            //dt1 = ds.Tables[0];

            //txtItemCode.Text = dt1.Rows[0]["ItemCode"].ToString();
            //txtItemName.Text = dt1.Rows[0]["ItemName"].ToString();
            //txtItemSize.Text = dt1.Rows[0]["ItemSize"].ToString();
            //txtPurchaseRate.Text = dt1.Rows[0]["PurRate"].ToString();
            //txtSalesRate.Text = dt1.Rows[0]["SalesRate"].ToString();
            //txtUsedFor.Text = dt1.Rows[0]["UsedFor"].ToString();
            //cmCategory.SelectedValue = dt1.Rows[0]["ItemCatId"].ToString();
            //cmItemUnit.SelectedValue = dt1.Rows[0]["ItemUnit"].ToString();
            //txtMinQty.Text = dt1.Rows[0]["MinQty"].ToString();
            //txtMaxQty.Text = dt1.Rows[0]["MaxQty"].ToString();
            //txtUsedFor.Text = dt1.Rows[0]["UsedFor"].ToString();
            //txtNotes.Text = dt1.Rows[0]["Notes"].ToString();
            //if (dt1.Rows[0]["Photo"].ToString() != "" || dt1.Rows[0]["Photo"] != null)
            //{
            //    byte[] bytes = (byte[])dt1.Rows[0]["Photo"];
            //    ViewState["Photo"] = (byte[])dt1.Rows[0]["Photo"];
            //    if (bytes.Length > 0)
            //    {
            //        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //        Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
            //        Image1.DataBind();
            //    }
            //}
        }
        public static byte[] GetPhoto(string imageloc)
        {

            FileStream stream = new FileStream(imageloc, FileMode.Open, FileAccess.Read);
            BinaryReader reader = new BinaryReader(stream);
            byte[] photo = reader.ReadBytes((int)stream.Length);

            reader.Close();
            stream.Close();

            return photo;
        }
        public static byte[] MakeThumbnail(byte[] myImage, int thumbWidth, int thumbHeight)
        {
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            using (System.Drawing.Image thumbnail = System.Drawing.Image.FromStream(new MemoryStream(myImage)).GetThumbnailImage(thumbWidth, thumbHeight, null, new IntPtr()))
            {
                thumbnail.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                return ms.ToArray();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
          
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData();
                ReloadMainGrid();
                ClearControl();
                ReloadMainGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
           
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            EnableControl(true);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControl();
            EnableControl(false);
        }
        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                DataRefillForGrid();
                EnableControl(true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void FileUpload2_DataBinding(object sender, EventArgs e)
        {
            try
            {
                byte[] bytes = (byte[])(FileUpload2.FileBytes);
                Image1.ImageUrl = (System.IO.Path.GetFileName(FileUpload2.FileName)).ToString();
                Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}