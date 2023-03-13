using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class FIleAttachment : System.Web.UI.UserControl
    {
        BaseData bd = new BaseData();
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            string fileName = fileUpload.FileName;

            if ((fileUpload.PostedFile != null) && (fileUpload.PostedFile.ContentLength > 0))
            {
                int len = fileUpload.PostedFile.ContentLength;

                byte[] imagefile = new byte[len];
                fileUpload.PostedFile.InputStream.Seek(0, SeekOrigin.Begin);
                fileUpload.PostedFile.InputStream.Read(imagefile, 0, Convert.ToInt32(len));

                fileUpload.PostedFile.InputStream.Read(imagefile, 0, len);

                //bd.UpdateProfilePicture(user, labObject.Text, labObjectID.Text, imagefile);
            }
        }
    }
}