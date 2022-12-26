using KennedyAccess.Classes;
using KennedyAccess.Controls;
using KennedyAccess.users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace KennedyAccess
{
    public partial class Application : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Application"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                if (Session["ApplicationID"] != null && Session["ApplicationID"].ToString() != "")
                {

                    labApplicationID.Text = Session["ApplicationID"].ToString();
                    DataTable dtApplication = bd.GetApplication(user, labApplicationID.Text, "0", user.ObjectID.ToString());

                    if (dtApplication != null && dtApplication.Rows.Count > 0)
                    {
                        labApplicantID.Text = dtApplication.Rows[0]["ApplicantID"].ToString();
                        labJobListingID.Text = dtApplication.Rows[0]["JobListingID"].ToString();

                        DataTable dtJobListing = bd.GetJoblisting(user, "0", labJobListingID.Text, "0");

                        // do not show approve button if already approved
                        btnApprove.Visible = !(dtApplication.Rows[0]["StatusText"].ToString()).Contains("Approved");

                        if (dtJobListing != null && dtJobListing.Rows.Count == 1)
                        {
                            DataRow dr = dtJobListing.Rows[0];

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
                        }

                        // application info
                        DataTable dtApplicant = bd.GetApplicant(user, int.Parse(labApplicantID.Text));
                        if (dtApplicant != null && dtApplicant.Rows.Count > 0)
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

                            // to pass ApplicantID to controls: attachment and contacts
                            contApplicantContact.intReferencerID = contApplicantOversea.intReferencerID = int.Parse(labApplicantID.Text);

                            WorkExperience.iApplicantID = int.Parse(labApplicantID.Text);
                        }
                    }

                    // Current Address
                    contApplicantContact.SetEditability(true);

                    // Foreign Address
                    contApplicantOversea.SetEditability(true);
                }
                else
                {
                    // something went wrong
                    Response.Redirect("default.aspx");
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {

            int sRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Application");
            int sApplicationStatusID = bd.GetStatusID((DataTable)Application["Status"], user.FranchiseID, sRecordTypeID, "Approved");

            bd.InsertUpdateApplication(user, labApplicationID.Text, "0", sApplicationStatusID, "0", "u", true,"");

            // send offer letter to applicant
            DataRow drOfferLetter = bd.GetOfferLetter(user, labApplicationID.Text);

            bd.SendEmail(drOfferLetter["Email"].ToString(), 
                "Offer Letter from " + drOfferLetter["EmployerName"].ToString(),
                drOfferLetter["OfferLetter"].ToString());
        }
    }
}