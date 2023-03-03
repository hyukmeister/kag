﻿using KennedyAccess.Classes;
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
    public partial class CampaignInfo : System.Web.UI.UserControl
    {
        private User user;
        private int employerid = 0;
        private int campaignid;
        BaseData bd = new BaseData();
        public string sCampaignStartDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            user = (User)Session["User"];
            campaignid = int.Parse(Session["CampaignID"].ToString());

            if (!Page.IsPostBack)
            {
                if (campaignid == -1)
                {
                    Page.Title = "New Campaign";
                    // new employer; enable edit
                    SetEditVisibilityCampaignInfo(false);

                    txtCampaignDesc.Focus();
                    labEmployerID.Text = user.ObjectID.ToString();
                    labCampaignID.Text = "0";
                }
                else
                {
                    // load campaigns for employer
                    DataTable dtCampaign = bd.GetCampaign(user, employerid.ToString(), campaignid.ToString(), "");

                    if (dtCampaign.Rows.Count == 1)
                    {
                        DataRow dr = dtCampaign.Rows[0];

                        Page.Title = dr["Description"].ToString();
                        trEmployerList.Visible = user.UserType != "Employer";

                        // populate campaign fields
                        labEmployerID.Text = dr["EmployerID"].ToString();
                        txtEmployerName.Text = dr["EmployerName"].ToString();
                        labCampaignID.Text = dr["CampaignID"].ToString();
                        txtCampaignDesc.Text = dr["Description"].ToString();
                        txtCampaignStartDate.Text = DateTime.Parse(dr["DateFrom"].ToString()).ToString("yyyy-MM-dd");
                        txtCampaignEndDate.Text = DateTime.Parse(dr["DateThru"].ToString()).ToString("yyyy-MM-dd");
                        txtOfferWageFrom.Text = dr["G_1A_OfferedWageFrom"].ToString();
                        txtOfferWageTo.Text = dr["G_1B_OfferedWageTo"].ToString();
                        rblOfferWagePeriod.SelectedValue = dr["G_1C_Per"].ToString();
                       
                    }

                    SetEditVisibilityCampaignInfo(true);
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

            }
        }

        public int SaveCampaignInfo()
        {
            int iCampaignInfoID = 0;
            if (cbkCampaignInfoChanged.Checked)
            {

                int iCampaignID = (labCampaignID.Text == "") ? 0 : int.Parse(labCampaignID.Text);
                int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Campaign");

                string sCampaignInfoID = bd.InsertUpdateCampaign(user,
                        int.Parse(labEmployerID.Text), iCampaignID, -1, iRecordTypeID,
                        bd.EmptyToNull(txtCampaignStartDate.Text), txtCampaignEndDate.Text,
                        txtCampaignDesc.Text, //int.Parse(ddlPrevailingWages.SelectedValue),
                        bd.StringToDouble(txtOfferWageFrom.Text), bd.StringToDouble(txtOfferWageTo.Text),
                        rblOfferWagePeriod.SelectedValue
                    );
                iCampaignInfoID = int.Parse (sCampaignInfoID);
                sCampaignStartDate = txtCampaignStartDate.Text;
                cbkCampaignInfoChanged.Checked = false;
            }
            SetEditVisibilityCampaignInfo(true);

            return iCampaignInfoID;
        }

        public void SetEditVisibilityCampaignInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            txtCampaignDesc.ReadOnly = bLock;
            txtCampaignDesc.BorderStyle = sBorder;
            txtCampaignStartDate.ReadOnly = bLock;
            txtCampaignStartDate.BorderStyle = sBorder;
            txtCampaignEndDate.ReadOnly = bLock;
            txtCampaignEndDate.BorderStyle = sBorder;
            txtOfferWageFrom.ReadOnly = bLock;
            txtOfferWageFrom.BorderStyle = sBorder;
            txtOfferWageTo.ReadOnly = bLock;
            txtOfferWageTo.BorderStyle = sBorder;
            rblOfferWagePeriod.Enabled = !bLock;
            rblOfferWagePeriod.BorderStyle = sBorder;
        }

        protected void CampaignInfoChanged(object sender, EventArgs e)
        {
            cbkCampaignInfoChanged.Checked = true;
        }

        protected void txtCampaignStartDate_TextChanged(object sender, EventArgs e)
        {
            CampaignInfoChanged(sender, e);
        }

        protected void ddlEmployerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEmployerName.Text = ddlEmployerList.SelectedItem.Text;

            Session["EmployerID"] = labEmployerID.Text = ddlEmployerList.SelectedValue;

        }
    }
}