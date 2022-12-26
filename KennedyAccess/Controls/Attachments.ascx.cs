using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using KennedyAccess.Classes;
using iTextSharp.text.pdf;
using static System.Net.WebRequestMethods;

namespace KennedyAccess.Controls
{
    public partial class Attachments : System.Web.UI.UserControl
    {
        BaseData bd = new BaseData();
        private User user;
        public string ReferenceID { get; set; }
        public string RecordTypeID { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
             user = (User)Session["User"];
            if (user == null)
                Response.Redirect("Default.aspx");

            labRecordTypeID.Text = RecordTypeID;
            LabReferenceID.Text = ReferenceID;

            if (!Page.IsPostBack)
            {
                LoadAttachmentGrid();
            }
        }

        private void LoadAttachmentGrid()
        {
            DataTable dt = bd.GetAttachment(user, labRecordTypeID.Text, LabReferenceID.Text);
            
            gvAttachments.DataSource = dt;
            gvAttachments.DataBind();
        }

        public void gvAttachment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvAttachments.Rows[index];
                string sAttachmentID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                DataRow drFile = bd.GetAttachmentFile(user, sAttachmentID);


                if (drFile != null)
                {
                    string sContentType = string.Empty;
                    string sFileName = drFile["FileName"].ToString();
                    byte[] byteFile = (byte[])drFile["FileData"];

                    if (sFileName.Contains(".pdf"))
                        sContentType = "application/pdf";
                    else if(sFileName.Contains(".png"))
                    {
                        sContentType = "image/png";
                    }
                    else if (sFileName.Contains(".JPEG"))
                    {
                        sContentType = "image/JPEG";
                    }
                    else if (sFileName.Contains(".GIF"))
                    {
                        sContentType = "image/GIF";
                    }

                    Response.ContentType = sContentType;
                    Response.AddHeader("content-length", byteFile.Length.ToString());
                    Response.BinaryWrite(byteFile);
                }
            }
        }
        protected void Upload_Click(object sender, EventArgs e)
        {
            string fileName = fileUpload.FileName;

            if ((fileUpload.PostedFile != null) && (fileUpload.PostedFile.ContentLength > 0))
            {
                //fileUpload.PostedFile.SaveAs(Server.MapPath(".") + fileName);
                int len = fileUpload.PostedFile.ContentLength;

                double sizelimit = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "Attachment_Size");

                sizelimit = sizelimit * 1048576;
                if (len > sizelimit)
                {
                    // file size exceeds the max limit
                    
                }
                else
                {
                    byte[] imagefile = new byte[len];
                    fileUpload.PostedFile.InputStream.Read(imagefile, 0, len);

                    bd.InsertAttachment(user, labRecordTypeID.Text, LabReferenceID.Text, fileName, imagefile);
                    LoadAttachmentGrid();
                }
            }
        }
    }
}