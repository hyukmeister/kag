using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class ProfilePhoto : System.Web.UI.UserControl
    {
        BaseData bd = new BaseData();
        private User user;

        // Obecject name ie Employer, Applicant
        public string sObject { get; set; }
        // Parent ID ie EmployerID, ApplicantID
        public string sObjectID { get; set; }
        public bool bShowButtons { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            if (!Page.IsPostBack)
            {
                labObject.Text = sObject;
                labObjectID.Text = sObjectID;
                LoadProfilePhoto();

                dZUpload.Visible = sObjectID != String.Empty;
            }
            else
            {
                if (Request.Files.Count ==1)
                {
                    foreach (string s in Request.Files)
                    {
                        HttpPostedFile ofile = Request.Files[s];
                        byte[] fileData = new byte[ofile.ContentLength];
                        ofile.InputStream.Read(fileData, 0, ofile.ContentLength);
                        bd.UpdateProfilePicture(user, labObject.Text, labObjectID.Text, fileData);

                        if (fileData != null)
                            imgProfilePhoto.ImageUrl = "data:image;base64," + System.Convert.ToBase64String(fileData);
                        imgProfilePhoto.Visible = true;
                    }
                }
            }
        }

        private void LoadProfilePhoto()
        {
            if (sObject == null || sObjectID == null)
            {
                imgProfilePhoto.ImageUrl = "";
            }
            else
            {
                byte[] img = bd.GetProfilePicture(user, labObject.Text, labObjectID.Text);
                if (img != null)
                    imgProfilePhoto.ImageUrl = "data:image;base64," + System.Convert.ToBase64String(img);
            }
        }
        public void UploadPhotoVisible(bool bVisible)
        {
            dZUpload.Visible = bVisible;
        }
    }
}