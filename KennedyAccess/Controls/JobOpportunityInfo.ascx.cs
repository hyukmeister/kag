using KennedyAccess.Classes;
using KennedyAccess.users;
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
    public partial class JobOpportunityInfo : System.Web.UI.UserControl
    {
        private User user;
        public string CampaignID;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            //JobListingID = int.Parse(Session["JobListingID"].ToString());
            if (!Page.IsPostBack)
            {
                ddlWorkState.DataSource = (DataTable)Application["State"];
                ddlWorkState.DataValueField = "StateID";
                ddlWorkState.DataTextField = "StateFull";
                ddlWorkState.DataBind();

                if (CampaignID == "0")
                {
                    Page.Title = "New Job Opportunity";

                    SetEditVisibilityJobOpportunityInfo(false);

                    cbkI_34_ListJob.Checked = false;

                }
                else
                {
                    // load Job Listing for employer
                    DataTable dtJob = bd.GetJoblisting(user, CampaignID, "0", "0");
                    if (dtJob != null && dtJob.Rows.Count > 0)
                    {
                        DataRow drJob = dtJob.Rows[0];
                        // populate wage info
                        lblJobListingInfoID.Text = drJob["JobListingID"].ToString();
                        cbActive.Checked = drJob["Active"].ToString() == "True";
                        txtWorkAddress1.Text = drJob["H_1_Address1"].ToString();
                        txtWorkAddress2.Text = drJob["H_1A_Address2"].ToString();
                        txtWorkCity.Text = drJob["H_2A_City"].ToString();
                        ddlWorkState.SelectedValue = drJob["H_2B_State"].ToString();
                        txtWorkPostalCode.Text = drJob["H_2C_Postalcode"].ToString();
                        txtI_6_StartDateForSWA.Text = (drJob["I_6_StartDateForSWA"].ToString() == "") ? "" : DateTime.Parse(drJob["I_6_StartDateForSWA"].ToString()).ToString("yyyy-MM-dd");
                        txtI_7_EndDateForSWA.Text = (drJob["I_7_EndDateForSWA"].ToString() == "") ? "" : DateTime.Parse(drJob["I_7_EndDateForSWA"].ToString()).ToString("yyyy-MM-dd");
                        txtFilingDatePosted.Text = (drJob["FilingDatePosted"].ToString() == "") ? "" : DateTime.Parse(drJob["FilingDatePosted"].ToString()).ToString("yyyy-MM-dd");
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
                        cbkI_34_ListJob.Checked = drJob["I_34_ListJob"].ToString() == "True";
                   
                    }
                    else
                    {
                        lblJobListingInfoID.Text = "0";
                    }
                }
                SetEditVisibilityJobOpportunityInfo(true);
            }
        }

        public void SaveJobOpportunityInfo()
        {
           if (cbkJobOpportunityInfoChanged.Checked)
            {
                int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Job Listing");
                string sJobOpportunityID = bd.InsertUpdateJobOpportunity(user,
                    labCampaignID.Text, lblJobListingInfoID.Text, iRecordTypeID.ToString(), "u", true,
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
                    cbkI_34_ListJob.Checked
                    );
                cbkJobOpportunityInfoChanged.Checked = false;
                Session["JobListingID"] = lblJobListingInfoID.Text = sJobOpportunityID;

            }
            SetEditVisibilityJobOpportunityInfo(true);
        }

        public void SetEditVisibilityJobOpportunityInfo(bool bLock)
        {
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

            if (user.HasRole("ListJobOpportunity"))
            {
                //rblI_34_ListJob.Enabled = !bLock;
                //rblI_34_ListJob.BorderStyle = sBorder;
                cbkI_34_ListJob.Disable = bLock;
            }
        }

        protected void JobOpportunityInfoChanged(object sender, EventArgs e)
        {
            cbkJobOpportunityInfoChanged.Checked = true;
        }
    }
}
