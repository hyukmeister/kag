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
using KennedyAccess.Controls;

namespace KennedyAccess
{
    public partial class Campaign : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            user = (User)Session["User"];
            if (user == null || !user.HasRole("Campaign"))
                Response.Redirect("Default.aspx");

            //employerid = (Session["EmployerID"] == null || Session["EmployerID"].ToString() == "-1") ? 0 : int.Parse(Session["EmployerID"].ToString());
            labCampaignID.Text = Session["CampaignID"].ToString();

            if (!Page.IsPostBack)
            {              
                if (labCampaignID.Text == "-1")
                {
                    divOL.Visible = accordionFlushCampaign.Visible = false;
                }
                else
                {
                    // load campaigns for employer
                    DataTable dtCampaign = bd.GetCampaign(user, labEmployerID.Text, labCampaignID.Text, "");

                    if (dtCampaign.Rows.Count == 1)
                    {
                        DataRow dr = dtCampaign.Rows[0];
                        labEmployerID.Text = dr["EmployerID"].ToString();
                        txtOfferLetter.Text = dr["OfferLetter"].ToString();

                        PopulatePrevailingWageDDL(dr["PrevailingwageID"].ToString());
                        contPrevWage.PrevailingWageID = dr["PrevailingwageID"].ToString();

                        CampaignInfo.CampaignID = JobOpportunityInfo.CampaignID = labCampaignID.Text;
                        CampaignInfo.sCampaignStartDate = dr["DateFrom"].ToString();
                        divOL.Visible = accordionFlushCampaign.Visible = true;
                    }
                }

                // campaign level questionnaire
                Questionnaire.bGeneral = false;
                Questionnaire.iEmployerID = -1;
                Questionnaire.iCampaignID = bd.StringToInt(labCampaignID.Text);

            }
            // to pass ApplicantID to controls: attachment 
            contAttachments.RecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Campaign").ToString();
            contAttachments.ReferenceID = Session["CampaignID"].ToString();
        }
        private void PopulatePrevailingWageDDL(string PrevailingwageID)
        {
            if(CampaignInfo.sCampaignStartDate != String.Empty && labEmployerID.Text!="0")
            {
                DataTable dtPrevWage = bd.GetPrevailingwage(user, "0", labEmployerID.Text, bd.EmptyToNull(CampaignInfo.sCampaignStartDate));
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

        public void btnSaveCampaign_Click(object sender, EventArgs e)
        {
            Session["CampaignID"] = contAttachments.ReferenceID = labCampaignID.Text;
            Questionnaire.iCampaignID = int.Parse(labCampaignID.Text);
            ((Label)Questionnaire.FindControl("labCampaignID")).Text = labCampaignID.Text;
            Questionnaire.PopulateQuestionnaireGrid();

            //SetEditVisibilityCampaign(true);
            contPrevWage.SetEditVisibility(true);

            //panStep2.Visible = true;
            divOL.Visible = accordionFlushCampaign.Visible = true;
            cbkCampaignChanged.Checked = false;
        }

        protected void ddlPrevailingWages_Change(object sender, EventArgs e)
        {
            int iPrevWage = Convert.ToInt32(ddlPrevailingWages.SelectedValue);

            //PopulatePrevailingWageInfo(iPrevWage.ToString());
            contPrevWage.PrevailingWageID = ddlPrevailingWages.SelectedValue;
            contPrevWage.PopulatePrevailingWageInfo(user, ddlPrevailingWages.SelectedValue);

            CampaignInfo.CampaignInfoChanged(sender, e);
        }


        protected void txtCampaignStartDate_TextChanged(object sender, EventArgs e)
        {
            PopulatePrevailingWageDDL("0");

            CampaignInfo.CampaignInfoChanged(sender, e);
        }

        protected void ddlEmployerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulatePrevailingWageDDL("0");
        }

        protected void btnSaveOfferLetter_Click(object sender, EventArgs e)
        {
            bd.UpdateOfferLetter(user, labCampaignID.Text, txtOfferLetter.Text);
        }

        protected void btnApplications_Click(object sender, EventArgs e)
        {
            Session["JobListingID"] = lblJobListingID.Text;
            Response.Redirect("Applications.aspx");
        }

        protected void btnSavePrevWage_Click(object sender, EventArgs e)
        {
            //CampaignInfo.btnSaveCampaign_Click(sender,e);
            //update prev wage 
            bd.UpdatePrevailiningWage(user, labCampaignID.Text, ddlPrevailingWages.SelectedValue);
            btnCancelPrevWage.Visible = btnSavePrevWage.Visible = false;
            btnEditPrevWage.Visible = true;
            ddlPrevailingWages.Enabled = false;

        }

        protected void btnEditPrevWage_Click(object sender, EventArgs e)
        {
            //CampaignInfo.btnEditCampaign_Click(sender, e);
            ddlPrevailingWages.Enabled = true;
            btnEditPrevWage.Visible = false;
            btnCancelPrevWage.Visible = btnSavePrevWage.Visible = true;
        }

        protected void btnCancelPrevWage_Click(object sender, EventArgs e)
        {
            btnEditPrevWage.Visible = true;
            btnCancelPrevWage.Visible = btnSavePrevWage.Visible = false;
            ddlPrevailingWages.Enabled = false;

        }
    }
}