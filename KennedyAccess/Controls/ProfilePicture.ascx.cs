using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class ProfilePicture : System.Web.UI.UserControl
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
                LoadProfilePicture();

                btnUpload.Visible = sObjectID != String.Empty;

                pictureUpload.Visible = btnUpload.Visible = bShowButtons;
            }
        }

        private void LoadProfilePicture()
        {
            if(sObject==null || sObjectID==null)
            {
                imgProfilePicture.ImageUrl = "";
            }
            else
            {
                byte[] img = bd.GetProfilePicture(user, labObject.Text, labObjectID.Text);
                if(img!=null)
                    imgProfilePicture.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string fileName = pictureUpload.FileName;

            if ((pictureUpload.PostedFile != null) && (pictureUpload.PostedFile.ContentLength > 0))
            {
                int len = pictureUpload.PostedFile.ContentLength;

                byte[] imagefile = new byte[len];
                pictureUpload.PostedFile.InputStream.Read(imagefile, 0, len);

                bd.UpdateProfilePicture(user, labObject.Text, labObjectID.Text, imagefile);

                if (imagefile != null)
                    imgProfilePicture.ImageUrl = "data:image;base64," + Convert.ToBase64String(imagefile);
            }
        }
    }
}