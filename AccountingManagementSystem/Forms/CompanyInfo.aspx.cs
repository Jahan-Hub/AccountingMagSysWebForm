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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                    txtName.Text = Dr["Name"].ToString();
                    Session["Address"] = Dr["Address"].ToString();
                    txtAddress.Text = Dr["Address"].ToString();
                    Session["Contact1"] = Dr["Contact1"].ToString();
                    txtContactNo1.Text = Dr["Contact1"].ToString();
                    Session["Contact2"] = Dr["Contact2"].ToString();
                    txtContactNo2.Text = Dr["Contact2"].ToString();
                    Session["Fax"] = Dr["Fax"].ToString();
                    txtFax.Text = Dr["Fax"].ToString();
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
        public void ClearControl()
        {
            Image1.ImageUrl = null;
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData();
                ClearControl();
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