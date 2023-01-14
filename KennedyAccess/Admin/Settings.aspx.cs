using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Admin;
using KennedyAccess.Classes;

namespace KennedyAccess
{
    public partial class SystemSettings : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            user = (User)Session["User"];
            if (user == null)
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                LoadSystemSettings(true);

                gvSettings.Columns[6].Visible = user.HasRole("SettingEdit");
            }
        }

        private void LoadSystemSettings(bool bFromDB)
        {
            DataTable dt = null;
            if (bFromDB)
            {
                dt = bd.GetSystemSettings(user, "-1");
                ViewState["dtSystemSettings"] = dt;
            }
            else
            {
                dt = (DataTable)ViewState["dtSystemSettings"];
            }

            gvSettings.DataSource = dt;
            gvSettings.DataBind();
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

        protected void gvSettings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSettings.EditIndex = e.NewEditIndex;
            LoadSystemSettings(false);
        }
        protected void gvSettings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSettings.EditIndex = -1;
            LoadSystemSettings(false);
        }
        protected void gvSettings_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //gvSettings.EditIndex = e.NewEditIndex;
        }
        protected void gvSettings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TableCellCollection cells = gvSettings.Rows[gvSettings.EditIndex].Cells;
            string SettingID = ((Label)(cells[0].Controls[1])).Text;
            string SettingName = ((Label)(cells[0].Controls[1])).Text;
            string SettingDate = ((Label)(cells[0].Controls[1])).Text;
            string SettingValue = ((Label)(cells[0].Controls[1])).Text;
            string SettingString = ((Label)(cells[0].Controls[1])).Text;

            bd.UpdateSystemSettings(user, true, SettingID, SettingName, SettingDate, SettingValue, SettingString);

            gvSettings.EditIndex = -1;
            LoadSystemSettings(false);
        }

        protected void gvSettings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}