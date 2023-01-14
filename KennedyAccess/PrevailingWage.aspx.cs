using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class PrevailingWage : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            string sPrevailingWageID = Session["PrevailingWageID"].ToString();
            user = (User)Session["User"];

            if (user == null || !user.HasRole("PrevailingWage"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                if (user.HasRole("PrevailingWageCreate") && user.UserType != "Employer")
                {
                    labEmpList.Visible = ddlEmployerList.Visible = true;
                    ddlEmployerList.DataSource = bd.GetEmployerList(user);
                    ddlEmployerList.DataValueField = "EmployerID";
                    ddlEmployerList.DataTextField = "EmployerName";
                    ddlEmployerList.DataBind();

                    contPrevWage.EmployerID = "0";
                }
                else
                {
                    labEmpList.Visible = ddlEmployerList.Visible = false;
                    contPrevWage.EmployerID = user.ObjectID.ToString();
                }

                btnEditPrevailingWage.Visible = user.HasRole("PrevailingWageEdit");

                if (sPrevailingWageID != null && sPrevailingWageID == "-1")
                {
                    labTitle.Text = Page.Title = "New Prevailing Wage";
                    contPrevWage.PrevailingWageID = "0";

                    btnEditPrevailingWage_Click(sender, e);

                    trAttachementControl.Visible = trAttachementHeader.Visible = false;
                }
                else
                {
                    labTitle.Text = Page.Title = "Prevailing Wage";

                    DataTable dtPrevWage = bd.GetPrevailingwage(user, sPrevailingWageID, "0", "1800-01-01");
                    DataRow drPrevailingWage = dtPrevWage.Rows[0];

                    contPrevWage.PrevailingWageID = sPrevailingWageID;
                    ddlEmployerList.SelectedValue = contPrevWage.EmployerID = drPrevailingWage["EmployerID"].ToString();

                    // E & A
                    btnEditPrevailingWage.Visible = user.HasRole("PrevailingWageEdit");
                }
            }

            // to pass ApplicantID to controls: attachment 
            contAttachments.RecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "PrevailingWage").ToString();
            contAttachments.ReferenceID = sPrevailingWageID;

        }

        protected void btnEditPrevailingWage_Click(object sender, EventArgs e)
        {
            //ddlEmployerList.Enabled = true;
            contPrevWage.SetEditVisibility(false);
            btnEditPrevailingWage.Visible=false;
            ddlEmployerList.Enabled = btnSavePrevailingWage.Visible = btnCancel.Visible = true;
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrevailingWages.aspx");
            btnEditPrevailingWage.Visible = true;
            ddlEmployerList.Enabled = btnSavePrevailingWage.Visible = btnCancel.Visible = false;
        }
        protected void btnSavePrevailingWage_Click(object sender, EventArgs e)
        {
            if(user.UserType == "Employer")
            {
                contPrevWage.EmployerID = user.ObjectID.ToString();
            }
            else
            {
                contPrevWage.EmployerID = ddlEmployerList.SelectedValue;
            }
            contPrevWage.btnSavePrevailingWage_Click(sender, e);

            Session["PrevailingWageID"] = contAttachments.ReferenceID = contPrevWage.PrevailingWageID;
            trAttachementControl.Visible = trAttachementHeader.Visible = true;

            btnEditPrevailingWage.Visible = true;
            ddlEmployerList.Enabled = btnSavePrevailingWage.Visible = btnCancel.Visible = false;
        }

        protected void ddlEmployerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //contPrevWage. = ddlEmployerList.SelectedValue;
        }
    }
}
 