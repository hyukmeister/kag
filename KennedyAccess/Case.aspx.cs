using KennedyAccess.Classes;
using KennedyAccess.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Case : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                ApplicantInfo.ApplicantID = labApplicantID.Text = Session["ApplicantID"].ToString();
                
                DataTable dtApplicant = bd.GetApplicant(user, bd.StringToInt(labApplicantID.Text), "");
                if (dtApplicant.Rows.Count == 1)
                {
                    DataRow drApplicant = dtApplicant.Rows[0];

                    UserFiles.guid = guid.Text = drApplicant["guid"].ToString();
                    Page.Title = UserFiles.UserName = labApplicant.Text = drApplicant["FirstName"].ToString() + " " + drApplicant["LastName"].ToString();
                    ApplicantInfo.EnablePhotoUpload(false);
                    ApplicantFamily.ApplicantID = "10000";
                    CampaignInfo.CampaignID = "10000";
                    I485.ApplicantID = labApplicantID.Text;
                }
            }
        }
    }
}