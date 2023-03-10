using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using KennedyAccess.Classes;
using KennedyAccess.Controls;
using Microsoft.Ajax.Utilities;

namespace KennedyAccess
{
    public partial class Employer : System.Web.UI.Page
    {
        private User user;
        Label HQContactID;
        Label EmployerContactID;
        BaseData bd = new BaseData();
        int empID;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Employer"))
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                if (Session["EmployerID"] != null && Session["EmployerID"].ToString() == "-1")
                {
                    labEmployer.Text = Page.Title = "New Employer";

                    // new employer; enable edit
                    SetEditVisibility(false);
                    Headquarter.SetEditability(false);
                    EmployerContact.SetEditability(false);

                    // set visibilities
                    panStep2.Visible = false;
                }
                else
                {
                    int employerid = int.Parse(Session["EmployerID"].ToString());

                    HQContactID = ((Label)Headquarter.FindControl("labContactID"));
                    EmployerContactID = ((Label)EmployerContact.FindControl("labContactID"));

                    DataTable dtEmp = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", employerid))).Tables[0];

                    if (dtEmp.Rows.Count == 1)
                    {
                        DataRow[] aRow = ((DataTable)Application["RecordType"]).Select("Usage='User' and RecordType='Employer'");
                        if (aRow.Length == 1)
                        {
                            txtRecordType.Text = aRow[0]["RecordType"].ToString();
                        }

                        DataRow dr = dtEmp.Rows[0];

                        txtEmployerID.Text = dr["EmployerID"].ToString();
                        EmployerContact.intReferencerID = Headquarter.intReferencerID = int.Parse(txtEmployerID.Text);

                        txtFranchise.Text = dr["FranchiseName"].ToString();

                        //txtUser.Text = dr["UserID"].ToString();
                        labEmployer.Text = Page.Title = dr["EmployerName"].ToString();
                        
                        SetEditVisibility(true);

                        DataTable dt = bd.GetCampaign(user, employerid.ToString(), "0", "");
                        
                        gvCampaigns.DataSource = dt;
                        gvCampaigns.DataBind();

                        // number of campaigns
                        labNumCampaign.Text = " (" + dt.Rows.Count.ToString() + " Campaign";
                        if (dt.Rows.Count > 1)
                        {
                            labNumCampaign.Text += "s)";
                        }
                        else
                        {
                            labNumCampaign.Text += ")";
                        }

                        // employer level questionnaire
                        Questionnaire.bGeneral = false;
                        Questionnaire.iEmployerID = int.Parse(txtEmployerID.Text);
                        Questionnaire.iCampaignID = -1;

                        // prevailing wage grid
                        DataTable dtPrevWage = bd.GetPrevailingwage(user, "0", employerid.ToString(), "1800-01-01");
                        gvPrevailingWages.DataSource = dtPrevWage;
                        gvPrevailingWages.DataBind();

                        // number of Prevailing Wage
                        labPrevWage.Text = " (" + dtPrevWage.Rows.Count.ToString() + " Prevailing Wage";
                        if (dtPrevWage.Rows.Count > 1)
                        {
                            labPrevWage.Text += "s)";
                        }
                        else
                        {
                            labPrevWage.Text += ")";
                        }

                        panFiles.Visible = user.HasRole("EmployerFiles");

                        UserFiles.UserName = labEmployer.Text;
                        UserFiles.guid = dr["guid"].ToString();
                    }

                    // employer
                    SetEditVisibility(true);

                    // hq form
                    Headquarter.SetEditability(true);

                    // save Employer Contact Contact
                    EmployerContact.SetEditability(true);

                    btnEditEmployer.Visible = user.HasRole("EmployerEdit");
                }
            }
        }

        protected void btnEditEmployer_Click(object sender, EventArgs e)
        {
            // employer
            SetEditVisibility(false);

            // hq form
            Headquarter.SetEditability(false);

            // save Employer Contact Contact
            EmployerContact.SetEditability(false);

        }
        protected void btnSaveEmployer_Click(object sender, EventArgs e)
        {
            if (cbkEmployerChanged.Checked)
            {
                if (empID == 0)
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader(
                        Global.dbcnn, "InsertEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID));
                    dr.Read();
                    empID = int.Parse(dr[0].ToString());
                    dr.Close();

                    Session["EmployerID"] = txtEmployerID.Text = empID.ToString();
                    user.ObjectID = empID;

                    // set visibilities
                    panStep2.Visible = true;
                }

                else
                {
                    SqlHelper.ExecuteNonQuery(
                        Global.dbcnn, "UpdateEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", empID));
                }
                cbkEmployerChanged.Checked = false;
            }

            EmployerInfo.SaveEmployerInfo(sender, e);

            // set employerid to contact control
            EmployerContact.intReferencerID = Headquarter.intReferencerID = empID;

            // set employerid to questionnaire control
            Questionnaire.iEmployerID = empID;
            ((Label)Questionnaire.FindControl("labEmployerID")).Text = empID.ToString();

            // save HQ Contact
            Headquarter.btnSave_Click(sender, e);

            // save Employer Contact Contact
            EmployerContact.btnSave_Click(sender, e);

            // employer form
            SetEditVisibility(true);

            // hq form
            Headquarter.SetEditability(true);

            // save Employer Contact Contact
            EmployerContact.SetEditability(true);
        }
        protected void btnNewCampaign_Click(object sender, EventArgs e)
        {
            Session["CampaignID"] = -1;
            Response.Redirect("Campaign.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (txtEmployerID.Text == "")
            {
                Response.Redirect("employers.aspx");
            }
            else
            {
                // employer form
                SetEditVisibility(true);

                // hq form
                Headquarter.SetEditability(true);

                // save Employer Contact Contact
                EmployerContact.SetEditability(true);
            }
        }

        protected void gvCampaign_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvCampaigns.Rows[index];
                string sCampaignID = ((Label)selectedRow.Cells[3].Controls[1]).Text;

                Session["CampaignID"] = sCampaignID;
                Response.Redirect("Campaign.aspx");
            }
        }
        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditEmployer.Visible = bLock && user.HasRole("EmployerEdit");
            btnCancel.Visible = btnSaveEmployer.Visible = !bLock;

            EmployerInfo.SetEditVisibility(bLock);
            btnCancel.Visible = btnSaveEmployer.Visible = !bLock;
            btnEditEmployer.Visible = bLock;
        }
        protected void EmployerChanged(object sender, EventArgs e)
        {
            cbkEmployerChanged.Checked = true;
        }

        protected void btnNewPrevailingWage_Click(object sender, EventArgs e)
        {
            Session["PrevailingWageID"] = -1;
            Response.Redirect("PrevailingWage.aspx");
        }

        protected void gvPrevailingWages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvPrevailingWages.Rows[index];
                Session["PrevailingWageID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("PrevailingWage.aspx");

            }
        }
    }
}