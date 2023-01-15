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
            InsertUpdateSetting(gvSettings.Rows[gvSettings.EditIndex].Cells);

            gvSettings.EditIndex = -1;
            LoadSystemSettings(false);
        }

        protected void gvSettings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private void InsertUpdateSetting(TableCellCollection cells)
        {
            string SettingID;
            if (cells[0].Controls.Count > 0)
                SettingID = ((Label)(cells[0].Controls[1])).Text;
            else
                SettingID = "0";
            string SettingName = ((TextBox)(cells[1].Controls[1])).Text;
            string SettingDate = ((TextBox)(cells[2].Controls[1])).Text;
            string SettingValue = ((TextBox)(cells[3].Controls[1])).Text;
            string SettingString = ((TextBox)(cells[4].Controls[1])).Text;
            string SettingDesc = ((TextBox)(cells[5].Controls[1])).Text;

            if (SettingDate == string.Empty) SettingDate = "1900-01-01";

            bd.InsertUpdateSettings(user, true, SettingID, SettingName, SettingDate, SettingValue, SettingString, SettingDesc);

            LoadSystemSettings(true);
        }

        protected void lnkBtnSave_Click(object sender, ImageClickEventArgs e)
        {
            GridViewRow fRow = gvSettings.FooterRow;

            try
            {
                InsertUpdateSetting(fRow.Cells);
            }
            catch (Exception ex)
            {
                TextBox txtRoleError = (TextBox)fRow.Cells[2].Controls[3];
                txtRoleError.Text = "Invalid or ducplicate data entered. Please correct and try again.<br/>" + ex.Message;
                txtRoleError.Visible = true;
                return;
            }
        }
    }
}