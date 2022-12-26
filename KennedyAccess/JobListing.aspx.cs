using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;
using static System.Net.Mime.MediaTypeNames;
using System.Diagnostics;
using System.Runtime.Remoting.Lifetime;
using System.Text.RegularExpressions;
using System.Web.Services.Description;
using System.Xml.Linq;

namespace KennedyAccess
{
    public partial class JobListing : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            user = (User)Session["User"];
            if (user == null || !user.HasRole("JobListing"))
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                if (Session["JobListingID"] != null && Session["JobListingID"].ToString() == "-1")
                {
                    lblJobListing.Text = Page.Title = "New JobListing";
                }
                else
                {
                    lblJobListingID.Text = Session["JobListingID"].ToString();

                    DataTable dtJobListing = bd.GetJoblisting(user, "0", lblJobListingID.Text, user.ObjectID.ToString());

                    if (dtJobListing != null && dtJobListing.Rows.Count == 1)
                    {
                        DataRow dr = dtJobListing.Rows[0];
                        lblJobListing.Text = Page.Title = dr["EmployerName"].ToString();

                        txtG_1A_OfferedWageFrom.Text = dr["G_1A_OfferedWageFrom"].ToString();
                        txtG_1B_OfferedWageTo.Text = dr["G_1B_OfferedWageTo"].ToString();
                        rblRatePeriod.SelectedValue = dr["G_1C_Per"].ToString();
                        txtH_1_Address1.Text = dr["H_1_Address1"].ToString();
                        txtH_1A_Address2.Text = dr["H_1A_Address2"].ToString();
                        txtH_2A_City.Text = dr["H_2A_City"].ToString();

                        ddlState.DataSource = (DataTable)Application["State"];
                        ddlState.DataValueField = "StateID";
                        ddlState.DataTextField = "StateFull";
                        ddlState.DataBind();
                        ddlState.SelectedValue = dr["H_2B_State"].ToString();

                        txtH_2C_Postalcode.Text = dr["H_2C_Postalcode"].ToString();
                        txtH_3_JobTitle.Text = dr["H_3_JobTitle"].ToString();
                        txtH_11_JobDuties.Text = dr["H_11_JobDuties"].ToString();

                        ProfilePicture.sObject = "Employer";
                        ProfilePicture.sObjectID= dr["EmployerID"].ToString();
                        ProfilePicture.bShowButtons= false;

                        // apply button
                        btnApply.Visible = (user.AppliedJobidID == 0 || user.AppliedJobidID == null);

                        // offer letter
                        string sStatusText = dr["StatusText"].ToString();
                        btnOfferLetter.Visible = sStatusText.Contains("Employer Approved");

                        // withdraw button
                        btnWithdraw.Visible = (sStatusText.Contains("Employer Approved") || sStatusText.Contains("Job Applied"));

                        DataRow drOfferLetter = bd.GetOfferLetter(user, dr["ApplicationID"].ToString());
                        if (drOfferLetter != null)
                        {
                            labOfferLetter.Text = drOfferLetter["OfferLetter"].ToString();
                            labApplicationID.Text = dr["ApplicationID"].ToString();
                        }
                    }

                    // populat questionnaire
                    DataTable dt = bd.GetQuestionnaireResponse(user, lblJobListingID.Text, user.ObjectID.ToString());

                    gvQuestionnaire.DataSource = dt;
                    gvQuestionnaire.DataBind();
                }
            }

            labJobTitle_QR.Text = txtH_3_JobTitle.Text;
        }

        protected void gvQuestionnaire_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label labQuestionType = (Label)e.Row.FindControl("labQuestionType");

                if (labQuestionType.Text == "0")
                {
                    RadioButtonList rblResponse = (RadioButtonList)e.Row.FindControl("rblResponse");
                    rblResponse.Visible = true;
                    RequiredFieldValidator rfvrblResponse = (RequiredFieldValidator)e.Row.FindControl("rfvrblResponse");
                    rfvrblResponse.Enabled = true;
                }
                else
                {
                    TextBox labQuestion = (TextBox)e.Row.FindControl("txtResponse");
                    labQuestion.Visible = true;
                    RequiredFieldValidator rfvtxtResponse = (RequiredFieldValidator)e.Row.FindControl("rfvtxtResponse");
                    rfvtxtResponse.Enabled = true;
                }
            }
        }

        protected void btnSubmitQuestionnaire_Click(object sender, EventArgs e)
        {
            string sApplicantID = user.ObjectID.ToString();
            string sJobListingID = lblJobListingID.Text;

            for (int i = 0; i < gvQuestionnaire.Rows.Count; i++)
            {
                GridViewRow gvr = gvQuestionnaire.Rows[i];

                string sQuestionnaireID = ((Label)gvr.FindControl("labQuestionnaireID")).Text;
                string sQuestionnaireResponseID = ((Label)gvr.FindControl("labQuestionnaireResponseID")).Text;
                if (sQuestionnaireResponseID == "") sQuestionnaireResponseID = "0";

                string sResponseText = ((TextBox)gvr.FindControl("txtResponse")).Text;
                bool bResponseBool = (((RadioButtonList)gvr.FindControl("rblResponse")).SelectedValue == "1") ? true : false;

                bd.InsertUpdateQuestionnaireResponse(user, sQuestionnaireResponseID,
                    sQuestionnaireID, sApplicantID, sJobListingID, sResponseText, bResponseBool);
            }

            // save applicaton info
            int iRecType = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", "Applicant");
            int iStatusID = bd.GetStatusID((DataTable)Application["Status"], user.FranchiseID, iRecType, "Job Applied");

            string ApplicationID = bd.InsertUpdateApplication(user, bd.StringToInt(labApplicationID.Text).ToString(), sJobListingID, iStatusID, sApplicantID, "n", true, "Job Applied");
            user.AppliedJobidID = int.Parse(ApplicationID);

            btnApply.Visible = false;
            btnWithdraw.Visible = true;

            // send an email to applicant on behalf of employer
            EmailServer email = new EmailServer();

            string emailText = "Dear " + user.FirstName + ",<br />";
            emailText += "Thank you for your interest in " + lblJobListing.Text + "! We have received your application.<br />";
            emailText += "We will reach out to you if there is interest in proceeding with our next process.<br />";
            emailText += "Again, we thank you for your interest in " + lblJobListing.Text + "!<br /><br />";
            emailText += "Sincerely, " + lblJobListing.Text + " HR Manager<br /><br />";
            emailText += "Replies to this message are undeliverable and will not reach Global Talent Acquisition at Kennedy Access Group.";
            
            email.ToEmail = user.Email;
            email.Subject = "Job Application Update";
            email.Body= emailText;
            email.SendEmail();
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int sRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", "Applicant");
            int sApplicationStatusID = bd.GetStatusID((DataTable)Application["Status"], user.FranchiseID, sRecordTypeID, "Job Offer Accepted");

            bd.InsertUpdateApplication(user, labApplicationID.Text, "0", sApplicationStatusID, "0", "u", true, txtAcceptance.Text);
        }

        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            // set application status to withdrawn
            int sRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", "Applicant");
            int sApplicationStatusID = bd.GetStatusID((DataTable)Application["Status"], user.FranchiseID, sRecordTypeID, "Applicant Withdrawn");

            bd.InsertUpdateApplication(user, labApplicationID.Text, "0", sApplicationStatusID, user.ObjectID.ToString(), "u", true, "Withdrawn by user");

            // clear user.appliedjobid
            user.AppliedJobidID = 0;
            labApplicationID.Text = "";

            // send a withdrawal email to applicant on behalf of employer
            EmailServer email = new EmailServer();

            string emailText = "Dear " + user.FirstName + ",<br />";
            emailText += "We have received your request for cancel job application, and it was processed successfully.";
            emailText += "We will, however, retain your details in our database and will match you with suitable opportunities. If a suitable role arises we will contact you.<br /><br />";
            emailText += "Sincerely, " + lblJobListing.Text + " HR Manager<br /><br />";
            emailText += "Replies to this message are undeliverable and will not reach Global Talent Acquisition at Kennedy Access Group.";

            email.ToEmail = user.Email;
            email.Subject = "Job Application Update";
            email.Body = emailText;
            email.SendEmail();

            btnWithdraw.Visible = false;
            btnApply.Visible = true;

        }
    }
}