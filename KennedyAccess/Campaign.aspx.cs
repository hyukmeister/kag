using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Diagnostics;
using KennedyAccess.Classes;
using KennedyAccess.users;
using Microsoft.Ajax.Utilities;
using Org.BouncyCastle.Ocsp;

namespace KennedyAccess
{
    public partial class Campaign : System.Web.UI.Page
    {
        private User user;
        private int employerid=0;
        private int campaignid;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            user = (User)Session["User"];
            if (user == null || !user.HasRole("Campaign"))
                Response.Redirect("Default.aspx");

            //employerid = (Session["EmployerID"] == null || Session["EmployerID"].ToString() == "-1") ? 0 : int.Parse(Session["EmployerID"].ToString());
            campaignid = int.Parse(Session["CampaignID"].ToString());

            if (!Page.IsPostBack)
            {
                ddlWorkState.DataSource = (DataTable)Application["State"];
                ddlWorkState.DataValueField = "StateID";
                ddlWorkState.DataTextField = "StateFull";
                ddlWorkState.DataBind();

                if (campaignid == -1)
                {
                    labTitle.Text = Page.Title = "New Campaign";

                    // new employer; enable edit
                    SetEditVisibilityCampaign(false);
                    SetEditVisibilityJobOpportunity(false);

                    txtCampaignDesc.Focus();
                    labEmployerID.Text = user.ObjectID.ToString();
                    labCampaignID.Text = "0";
                    //rblI_34_ListJob.SelectedValue = "0";
                    cbkI_34_ListJob.Checked = false;

                    PopulatePrevailingWageDDL("");

                    // set visibilities
                    //panStep2.Visible = false;
                    divOL.Visible = accordionFlushCampaign.Visible = false;
                }
                else
                {
                    // load campaigns for employer
                    DataTable dtCampaign = bd.GetCampaign(user, employerid.ToString(), campaignid.ToString(),"");

                    if (dtCampaign.Rows.Count == 1)
                    {
                        DataRow dr = dtCampaign.Rows[0];

                        labTitle.Text = Page.Title = dr["Description"].ToString();
                        trEmployerList.Visible = user.UserType != "Employer";
                        divOL.Visible = true;

                        // populate campaign fields
                        labEmployerID.Text = dr["EmployerID"].ToString();
                        txtEmployerName.Text = dr["EmployerName"].ToString();
                        labCampaignID.Text = dr["CampaignID"].ToString();
                        txtCampaignDesc.Text = dr["Description"].ToString();
                        txtCampaignStartDate.Text = DateTime.Parse(dr["DateFrom"].ToString()).ToString("yyyy-MM-dd");
                        txtCampaignEndDate.Text = DateTime.Parse(dr["DateThru"].ToString()).ToString("yyyy-MM-dd");
                        // offer letter
                        txtOfferLetter.Text = dr["OfferLetter"].ToString();

                        PopulatePrevailingWageDDL(dr["PrevailingwageID"].ToString());
                       // ddlPrevailingWages.SelectedItem.Text = txtWageTrackingNum.Text;
                        contPrevWage.PrevailingWageID = dr["PrevailingwageID"].ToString();

                        txtOfferWageFrom.Text = dr["G_1A_OfferedWageFrom"].ToString();
                        txtOfferWageTo.Text = dr["G_1B_OfferedWageTo"].ToString();
                        rblOfferWagePeriod.SelectedValue = dr["G_1C_Per"].ToString(); 

                        // load Job Listing for employer
                        DataTable dtJob = bd.GetJoblisting(user, labCampaignID.Text, "0", "0");
                        if(dtJob != null && dtJob.Rows.Count > 0)
                        {
                            DataRow drJob = dtJob.Rows[0];
                            // populate wage info
                            lblJobListingID.Text = drJob["JobListingID"].ToString();
                            cbActive.Checked = drJob["Active"].ToString()=="True";
                            txtWorkAddress1.Text = drJob["H_1_Address1"].ToString();
                            txtWorkAddress2.Text = drJob["H_1A_Address2"].ToString();
                            txtWorkCity.Text = drJob["H_2A_City"].ToString();
                            ddlWorkState.SelectedValue = drJob["H_2B_State"].ToString();
                            txtWorkPostalCode.Text= drJob["H_2C_Postalcode"].ToString();
                            txtI_6_StartDateForSWA.Text = (drJob["I_6_StartDateForSWA"].ToString() == "") ? "" : DateTime.Parse(drJob["I_6_StartDateForSWA"].ToString()).ToString("yyyy-MM-dd");
                            txtI_7_EndDateForSWA.Text = (drJob["I_7_EndDateForSWA"].ToString() == "") ? "" : DateTime.Parse(drJob["I_7_EndDateForSWA"].ToString()).ToString("yyyy-MM-dd");
                            txtFilingDatePosted.Text= (drJob["FilingDatePosted"].ToString() == "") ? "" : DateTime.Parse(drJob["FilingDatePosted"].ToString()).ToString("yyyy-MM-dd");
                            txtFilingDateRemoved.Text = (drJob["FilingDateRemoved"].ToString() == "") ? "" : DateTime.Parse(drJob["FilingDateRemoved"].ToString()).ToString("yyyy-MM-dd");
                            rblI_8_SundayNewspaper.SelectedValue = (drJob["I_8_SundayNewspaper"].ToString() == "True") ? "1" : "0";
                            txtI_9_NameOfNewspaper.Text = drJob["I_9_NameOfNewspaper"].ToString();
                            txtI_10_FirstAdvertisementDate.Text = (drJob["I_10_FirstAdvertisementDate"].ToString() == "") ? "" : DateTime.Parse(drJob["I_10_FirstAdvertisementDate"].ToString()).ToString("yyyy-MM-dd");
                            rblI_11_SecondAdvertisement.SelectedValue = (drJob["I_11_SecondAdvertisement"].ToString() == "True") ? "1" : "0";
                            txtI_12_DateOfSecondAdvertisement.Text = (drJob["I_12_DateOfSecondAdvertisement"].ToString() == "") ? "" : DateTime.Parse(drJob["I_12_DateOfSecondAdvertisement"].ToString()).ToString("yyyy-MM-dd");
                            txtI_27_NameOfSecondNewspaper.Text = drJob["I_27_NameOfSecondNewspaper"].ToString();
                            rblI_28_SaturdayNewspaper.SelectedValue = (drJob["I_28_SaturdayNewspaper"].ToString() == "True") ? "1" : "0";
                            txtI_29_NameOfSaturdayNewspaper.Text = drJob["I_29_NameOfSaturdayNewspaper"].ToString();
                            txtI_30_SaturdayAdvertisementDate.Text = (drJob["I_30_SaturdayAdvertisementDate"].ToString() == "") ? "" : DateTime.Parse(drJob["I_30_SaturdayAdvertisementDate"].ToString()).ToString("yyyy-MM-dd");
                            rblI_31_SecondSatAdvertisement.SelectedValue = (drJob["I_31_SecondSatAdvertisement"].ToString() == "True") ? "1" : "0";
                            txtI_33_NameOfSecondSatNewspaper.Text = (drJob["I_33_NameOfSecondSatNewspaper"].ToString());
                            txtI_32_DateOfSecondSatAdvertisement.Text = (drJob["I_32_DateOfSecondSatAdvertisement"].ToString() == "") ? "" : DateTime.Parse(drJob["I_32_DateOfSecondSatAdvertisement"].ToString()).ToString("yyyy-MM-dd");
                            //rblI_34_ListJob.SelectedValue = (drJob["I_34_ListJob"].ToString() == "True") ? "1" : "0";
                            cbkI_34_ListJob.Checked = drJob["I_34_ListJob"].ToString() == "True";

                            DataTable dtApplicants = bd.GetApplication(user, "0", lblJobListingID.Text, "0");
                            if (dtApplicants != null && dtApplicants.Rows.Count > 0)
                            {
                                btnApplications.Text = "  Applications (" + dtApplicants.Rows.Count.ToString() + ")";
                            }
                            else
                            {
                                btnApplications.Text = "  Applications (0)";
                            }

                            cbkPostJobValue.Checked = cbkI_34_ListJob.Checked;
                        }
                        else
                        {
                            lblJobListingID.Text = "0";
                            //rblI_34_ListJob.SelectedValue = "0";
                        }
                    }

                    SetEditVisibilityCampaign(true);
                    SetEditVisibilityJobOpportunity(true);
                }

                if (user.HasRole("PrevailingWageCreate") && user.UserType != "Employer" && labCampaignID.Text == "0")
                {
                    trEmployerList.Visible = true;
                    DataTable dt = bd.GetEmployerList(user);
                    DataRow dr = dt.NewRow();
                    dr[0] = 0;
                    dr[1] = "-- Select an Employer --";
                    dt.Rows.InsertAt(dr, 0);

                    ddlEmployerList.DataSource = dt;
                    ddlEmployerList.DataValueField = "EmployerID";
                    ddlEmployerList.DataTextField = "EmployerName";
                    ddlEmployerList.DataBind();
                }
                else
                {
                    trEmployerList.Visible = false;
                }

                // campaign level questionnaire
                Questionnaire.bGeneral = false;
                Questionnaire.iEmployerID = -1;
                Questionnaire.iCampaignID = int.Parse(labCampaignID.Text);

            }
            // to pass ApplicantID to controls: attachment 
            contAttachments.RecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Campaign").ToString();
            contAttachments.ReferenceID = Session["CampaignID"].ToString();
        }
        private void PopulatePrevailingWageDDL(string PrevailingwageID)
        {
            if(txtCampaignStartDate.Text!=String.Empty && labEmployerID.Text!="0")
            {
                DataTable dtPrevWage = bd.GetPrevailingwage(user, "0", labEmployerID.Text, txtCampaignStartDate.Text);
                DataRow drPrevWage = dtPrevWage.NewRow();
                drPrevWage["PrevailingwageID"] = 0;
                drPrevWage["F_1_WageTracking"] = "--";
                dtPrevWage.Rows.InsertAt(drPrevWage,0);

                ddlPrevailingWages.DataSource = dtPrevWage;
                ddlPrevailingWages.DataValueField = "PrevailingwageID";
                ddlPrevailingWages.DataTextField = "F_1_WageTracking";
                ddlPrevailingWages.DataBind();
                ddlPrevailingWages.SelectedValue = PrevailingwageID;
                
                contPrevWage.PopulatePrevailingWageInfo(user, PrevailingwageID);
           }
        }

        protected void btnEditCampaign_Click(object sender, EventArgs e)
        {
            // edit campaign
            SetEditVisibilityCampaign(false);
        }
        protected void btnSaveCampaign_Click(object sender, EventArgs e)
        {
            if (cbkCampaignChanged.Checked)
            {

                    int iCampaignID = (labCampaignID.Text == "") ? 0 : int.Parse(labCampaignID.Text);
                int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Campaign");

                string sCampaignID = bd.InsertUpdateCampaign(user,
                        int.Parse(labEmployerID.Text), iCampaignID, -1, iRecordTypeID, 
                        bd.EmptyToNull(txtCampaignStartDate.Text), txtCampaignEndDate.Text, 
                        txtCampaignDesc.Text, int.Parse(ddlPrevailingWages.SelectedValue),
                        bd.StringToDouble(txtOfferWageFrom.Text), bd.StringToDouble(txtOfferWageTo.Text),
                        rblOfferWagePeriod.SelectedValue
                    );
                Session["CampaignID"] = contAttachments.ReferenceID = labCampaignID.Text = sCampaignID;
                Questionnaire.iCampaignID = int.Parse(sCampaignID);
                ((Label)Questionnaire.FindControl("labCampaignID")).Text = sCampaignID;
                Questionnaire.PopulateQuestionnaireGrid();

                SetEditVisibilityCampaign(true);
                contPrevWage.SetEditVisibility(true);

                //panStep2.Visible = true;
                divOL.Visible = accordionFlushCampaign.Visible = true;
                cbkCampaignChanged.Checked = false;
            }
            SetEditVisibilityCampaign(true);

        }
        protected void CampaignChanged(object sender, EventArgs e)
        {
            cbkCampaignChanged.Checked = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if(labCampaignID.Text == "0")
            {
                Response.Redirect("Campaigns.aspx");
            }
            else
            {
                SetEditVisibilityCampaign(true);
            }
        }
        protected void ddlPrevailingWages_Change(object sender, EventArgs e)
        {
            int iPrevWage = Convert.ToInt32(ddlPrevailingWages.SelectedValue);

            //PopulatePrevailingWageInfo(iPrevWage.ToString());
            contPrevWage.PrevailingWageID = ddlPrevailingWages.SelectedValue;
            contPrevWage.PopulatePrevailingWageInfo(user, ddlPrevailingWages.SelectedValue);

            CampaignChanged(sender, e);
        }
        private void SetEditVisibilityCampaign(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditCampaign.Visible = bLock && user.HasRole("CampaignEdit");
            btnCancel.Visible = btnSaveCampaign.Visible = !bLock;

            txtCampaignDesc.ReadOnly = bLock;
            txtCampaignDesc.BorderStyle = sBorder;
            txtCampaignStartDate.ReadOnly = bLock;
            txtCampaignStartDate.BorderStyle = sBorder;
            txtCampaignEndDate.ReadOnly = bLock;
            txtCampaignEndDate.BorderStyle = sBorder;
            cbActive.Enabled = !bLock;
            cbActive.BorderStyle = sBorder;

            ddlPrevailingWages.Enabled = !bLock;
            ddlPrevailingWages.BorderStyle = sBorder;
            txtOfferWageFrom.ReadOnly = bLock;
            txtOfferWageFrom.BorderStyle = sBorder;
            txtOfferWageTo.ReadOnly = bLock;
            txtOfferWageTo.BorderStyle = sBorder;
            rblOfferWagePeriod.Enabled = !bLock;
            rblOfferWagePeriod.BorderStyle = sBorder;
        }

        private void SetEditVisibilityJobOpportunity(bool bLock)
        {
            btnEditJobOpportunity.Visible = bLock;
            btnCancelJobOpportunity.Visible = btnSaveJobOpportunity.Visible = !bLock;

            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;
            txtWorkAddress1.ReadOnly = bLock;
            txtWorkAddress1.BorderStyle = sBorder;
            txtWorkAddress2.ReadOnly = bLock;
            txtWorkAddress2.BorderStyle = sBorder;
            txtWorkCity.ReadOnly = bLock;
            txtWorkCity.BorderStyle = sBorder;
            txtWorkPostalCode.ReadOnly = bLock;
            txtWorkPostalCode.BorderStyle = sBorder;
            ddlWorkState.Enabled = !bLock;
            ddlWorkState.BorderStyle = sBorder;

            txtI_6_StartDateForSWA.ReadOnly = bLock;
            txtI_6_StartDateForSWA.BorderStyle = sBorder;

            txtFilingDatePosted.ReadOnly = bLock;
            txtFilingDatePosted.BorderStyle = sBorder;
            txtFilingDateRemoved.ReadOnly = bLock;
            txtFilingDateRemoved.BorderStyle = sBorder;

            txtI_7_EndDateForSWA.ReadOnly = bLock;
            txtI_7_EndDateForSWA.BorderStyle = sBorder;
            rblI_8_SundayNewspaper.Enabled = !bLock;
            rblI_8_SundayNewspaper.BorderStyle = sBorder;
            txtI_9_NameOfNewspaper.ReadOnly = bLock;
            txtI_9_NameOfNewspaper.BorderStyle = sBorder;
            txtI_10_FirstAdvertisementDate.ReadOnly = bLock;
            txtI_10_FirstAdvertisementDate.BorderStyle = sBorder;
            rblI_11_SecondAdvertisement.Enabled = !bLock;
            rblI_11_SecondAdvertisement.BorderStyle = sBorder;
            txtI_12_DateOfSecondAdvertisement.ReadOnly = bLock;
            txtI_12_DateOfSecondAdvertisement.BorderStyle = sBorder;
            txtI_27_NameOfSecondNewspaper.ReadOnly = bLock;
            txtI_27_NameOfSecondNewspaper.BorderStyle = sBorder;
            rblI_28_SaturdayNewspaper.Enabled = !bLock;
            rblI_28_SaturdayNewspaper.BorderStyle = sBorder;
            txtI_29_NameOfSaturdayNewspaper.ReadOnly = bLock;
            txtI_29_NameOfSaturdayNewspaper.BorderStyle = sBorder;
            txtI_30_SaturdayAdvertisementDate.ReadOnly = bLock;
            txtI_30_SaturdayAdvertisementDate.BorderStyle = sBorder;
            rblI_31_SecondSatAdvertisement.Enabled = !bLock;
            rblI_31_SecondSatAdvertisement.BorderStyle = sBorder;
            txtI_32_DateOfSecondSatAdvertisement.ReadOnly = bLock;
            txtI_32_DateOfSecondSatAdvertisement.BorderStyle = sBorder;
            txtI_33_NameOfSecondSatNewspaper.ReadOnly = bLock;
            txtI_33_NameOfSecondSatNewspaper.BorderStyle = sBorder;

            if(user.HasRole("ListJobOpportunity"))
            {
                //rblI_34_ListJob.Enabled = !bLock;
                //rblI_34_ListJob.BorderStyle = sBorder;
                cbkI_34_ListJob.Disabled= bLock;
            }
        }

        private void InsertUpdateJobOpportunity()
        {
            int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Job Listing");
            string sJobOpportunityID = bd.InsertUpdateJobOpportunity(user,
                labCampaignID.Text, lblJobListingID.Text, iRecordTypeID.ToString(), "u", true,
                txtWorkAddress1.Text, txtWorkAddress2.Text, txtWorkCity.Text, 
                ddlWorkState.SelectedValue, txtWorkPostalCode.Text,
                bd.EmptyToNull(txtI_6_StartDateForSWA.Text),
                bd.EmptyToNull(txtI_7_EndDateForSWA.Text),

                bd.EmptyToNull(txtFilingDatePosted.Text),
                bd.EmptyToNull(txtFilingDateRemoved.Text),

                (rblI_8_SundayNewspaper.SelectedValue == "1") ? true : false,
                txtI_9_NameOfNewspaper.Text,
                bd.EmptyToNull(txtI_10_FirstAdvertisementDate.Text),
                (rblI_11_SecondAdvertisement.SelectedValue == "1") ? true : false,
                bd.EmptyToNull(txtI_12_DateOfSecondAdvertisement.Text),
                txtI_27_NameOfSecondNewspaper.Text,
                (rblI_28_SaturdayNewspaper.SelectedValue == "1") ? true : false,
                txtI_29_NameOfSaturdayNewspaper.Text,
                bd.EmptyToNull(txtI_30_SaturdayAdvertisementDate.Text),
                (rblI_31_SecondSatAdvertisement.SelectedValue == "1") ? true : false,
                bd.EmptyToNull(txtI_32_DateOfSecondSatAdvertisement.Text),
                txtI_33_NameOfSecondSatNewspaper.Text,
                //(rblI_34_ListJob.SelectedValue == "1") ? true : false
                cbkI_34_ListJob.Checked
                );
            cbkJobOpportunityChanged.Checked = false;
            Session["JobListingID"] = lblJobListingID.Text = sJobOpportunityID;
        }
       
        protected void btnEditJobOpportunity_Click(object sender, EventArgs e)
        {
            SetEditVisibilityJobOpportunity(false);
        }
        protected void btnSaveJobOpportunity_Click(object sender, EventArgs e)
        {
            if (cbkJobOpportunityChanged.Checked || cbkPostJobValue.Checked != cbkI_34_ListJob.Checked)
            {
                // save job listing : Opportunity
                InsertUpdateJobOpportunity();

                // save job listing : Recruitment Information
                //UpdateRecruitmentInfo();
            }

            SetEditVisibilityJobOpportunity(true);
        }
        protected void JobOpportunityChanged(object sender, EventArgs e)
        {
            cbkJobOpportunityChanged.Checked = true;
        }
        protected void btnCancelJobOpportunity_Click(object sender, EventArgs e)
        {
            SetEditVisibilityJobOpportunity(true);
        }

        protected void txtCampaignStartDate_TextChanged(object sender, EventArgs e)
        {
            PopulatePrevailingWageDDL("0");

            JobOpportunityChanged(sender, e);

            CampaignChanged(sender, e);
        }

        protected void ddlEmployerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEmployerName.Text = ddlEmployerList.SelectedItem.Text;

            Session["EmployerID"] = labEmployerID.Text = ddlEmployerList.SelectedValue;

            PopulatePrevailingWageDDL("0");
        }

        protected void btnSaveOfferLetter_Click(object sender, EventArgs e)
        {
            bd.UpdateOfferLetter(user, labCampaignID.Text, txtOfferLetter.Text);

            btnCancelOfferLetter_Click(sender, e);
        }

        protected void btnCancelOfferLetter_Click(object sender, EventArgs e)
        {
            //txtOfferLetter.ReadOnly = btnEditOfferLetter.Visible = true;

            ////HtmlEditorExtender.Enabled = 
            //    btnSaveOfferLetter.Visible = btnCancelOfferLetter.Visible = false;
        }

        protected void btnEditOfferLetter_Click(object sender, EventArgs e)
        {
            //txtOfferLetter.ReadOnly = btnEditOfferLetter.Visible = false;

            ////HtmlEditorExtender.Enabled = 
            //    btnSaveOfferLetter.Visible = btnCancelOfferLetter.Visible = true;
        }

        protected void btnApplications_Click(object sender, EventArgs e)
        {
            Session["JobListingID"] = lblJobListingID.Text;
            Response.Redirect("Applications.aspx");
        }

        protected void btnSavePrevWage_Click(object sender, EventArgs e)
        {
            btnSaveCampaign_Click(sender,e);
            btnSavePrevWage.Visible = false;
            btnEditPrevWage.Visible = true;
        }

        protected void btnEditPrevWage_Click(object sender, EventArgs e)
        {
            btnEditCampaign_Click(sender, e);
            btnEditPrevWage.Visible = false;
            btnSavePrevWage.Visible = true;
        }
    }
}