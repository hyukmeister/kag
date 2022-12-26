using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class SystemSettings : System.Web.UI.Page
    {
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null)
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetSystemSettings",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@SystemSettingID", -1))).Tables[0];
                gvSettings.DataSource = dt;
                
                gvSettings.DataBind();
            }
        }
        protected void btnSearchSetting_Click(object sender, EventArgs e)
        {
            DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetSystemSettings",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@SettingID", 0),
                        new SqlParameter("@Search", txtSearch.Text))).Tables[0];
            gvSettings.DataSource = dt;
            gvSettings.DataBind();
        }

        protected void btnNewSetting_Click(object sender, EventArgs e)
        {
            int settingid = -1;
            Session["SettingID"] = settingid;
            //Response.Redirect("Setting.aspx");
        }

        protected void gvSettings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSettings.EditIndex = e.NewEditIndex;
        }
        protected void gvSettings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSettings.EditIndex = -1;
        }
        protected void gvSettings_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //gvSettings.EditIndex = e.NewEditIndex;
        }
        protected void gvSettings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int iSettingID = int.Parse(((Label)(gvSettings.Rows[gvSettings.EditIndex].Cells[0].Controls[1])).Text);

            //SqlHelper.ExecuteNonQuery(cnn, "UpdateTrainingHist",
            //    new SqlParameter("@MemberTrainingID", memberTrainingID),
            //    new SqlParameter("@TrainingID", TrainingID),
            //    new SqlParameter("@TrainingDate", TrainingDate),
            //    new SqlParameter("@TrainingNote", TrainingNote));

            //DataSet ds = SqlHelper.ExecuteDataset(cnn, "GetMemberByID", new SqlParameter("@MemberID ", hdnMemberID.Value));
            //gvSettings.EditIndex = -1;
            //gvSettings.DataBind();
        }

    }
}