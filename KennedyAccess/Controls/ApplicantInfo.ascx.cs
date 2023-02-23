using AjaxControlToolkit;
using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class ApplicantInfo : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();
        public string ApplicantID;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            if (!Page.IsPostBack)
            {
                ddlCitizenshipCountry.DataSource = (DataTable)Application["Country"];
                ddlCitizenshipCountry.DataValueField = "CountryID";
                ddlCitizenshipCountry.DataTextField = "CountryName";
                ddlCitizenshipCountry.DataBind();

                ddlBirthCountry.DataSource = (DataTable)Application["Country"];
                ddlBirthCountry.DataValueField = "CountryID";
                ddlBirthCountry.DataTextField = "CountryName";
                ddlBirthCountry.DataBind();

                if (Session["ApplicantID"].ToString() == "-1")
                {
                    labApplicantID.Text = "0";
                    // new applicant; enable edit
                    SetEditVisibility(false);
                }
                else
                {
                    labApplicantID.Text = ApplicantID;

                    DataTable dtApplicant = bd.GetApplicant(user, bd.StringToInt(labApplicantID.Text), "");

                    if (dtApplicant.Rows.Count == 1)
                    {
                        DataRow drApplicant = dtApplicant.Rows[0];
                        labApplicantID.Text = drApplicant["ApplicantID"].ToString();
                        labAgentName.Text = drApplicant["AgentName"].ToString();

                        ddlCitizenshipCountry.SelectedValue = drApplicant["CitizenshipCountryID"].ToString();
                        ddlBirthCountry.SelectedValue = drApplicant["BirthCountryID"].ToString();
                        ddlCitizenshipCountry.Enabled = ddlBirthCountry.Enabled = true;

                        txtDateOfBirth.Text = DateTime.Parse(drApplicant["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");

                        txtAdmissionClass.Text = drApplicant["AdmissionClass"].ToString();
                        txtAlienRegistration.Text = drApplicant["AlienRegistration"].ToString();
                        txtAlienAdmission.Text = drApplicant["AlienAdmission"].ToString();
                        cbkProfileCompleted.Checked = (drApplicant["ProfileCompleted"].ToString() == "True") ? true : false;
                        labWebForm.Text = drApplicant["WID"].ToString();
                    }

                    // read only
                    SetEditVisibility(true);

                    // profile picture control
                    ProfilePicture.sObject = "Applicant";
                    ProfilePicture.sObjectID = labApplicantID.Text;
                    ProfilePicture.bShowButtons = true;
                }
            }
            else
            {
                // use labApplicantID and labRelationshipID
            }
        }

        public void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            txtDateOfBirth.ReadOnly = bLock;
            txtDateOfBirth.BorderStyle = sBorder;
            txtAdmissionClass.ReadOnly = bLock;
            txtAdmissionClass.BorderStyle = sBorder;
            txtAlienRegistration.ReadOnly = bLock;
            txtAlienRegistration.BorderStyle = sBorder;
            txtAlienAdmission.ReadOnly = bLock;
            txtAlienAdmission.BorderStyle = sBorder;
            txtDateOfBirth.ReadOnly = bLock;
            txtDateOfBirth.BorderStyle = sBorder;

            ddlCitizenshipCountry.Enabled = !bLock;
            ddlCitizenshipCountry.BorderStyle = sBorder;
            ddlBirthCountry.Enabled = !bLock;
            ddlBirthCountry.BorderStyle = sBorder;
        }
        protected void ApplicantChanged(object sender, EventArgs e)
        {
            cbkApplicantChanged.Checked = true;
        }
        public void EnablePhotoUpload(bool bShow)
        {
            ProfilePicture.UploadButtonVisible(bShow);
        }


        public int SaveApplicant()
        {
            int iApplicantID = 0;
            if (cbkApplicantChanged.Checked)
            {
                int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Contact", "Applicant");
                iApplicantID = bd.InsertUpdateApplicant(user, bd.StringToInt(labApplicantID.Text), iRecordTypeID, "u", true,
                    int.Parse(ddlCitizenshipCountry.SelectedValue), int.Parse(ddlBirthCountry.SelectedValue), txtDateOfBirth.Text, txtAdmissionClass.Text,
                    txtAlienRegistration.Text, txtAlienAdmission.Text, true);
            }
            return iApplicantID;
        }
    }
}