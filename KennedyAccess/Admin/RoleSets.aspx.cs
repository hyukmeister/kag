using KennedyAccess.Classes;
using KennedyAccess.Controls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Admin
{
    public partial class RoleSets : System.Web.UI.Page
    {

        private User user;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("RoleSets"))
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                LoadRoleSetRoles("", true);

                // populate new row ddls
                ddlRoleSet.DataSource = (DataTable)Application["RoleSet"];
                ddlRoleSet.DataTextField = "RoleSetName";
                ddlRoleSet.DataValueField = "RoleSetID";
                ddlRoleSet.DataBind();

                ddlRole.DataSource = bd.GetRole(user, "0","");
                ddlRole.DataTextField = "RoleName";
                ddlRole.DataValueField = "RoleID";
                ddlRole.DataBind();
            }
        }

        private void LoadRoleSetRoles(string sSearch, bool bFromDB)
        {
            DataTable dt = null;
            if (bFromDB)
            {
                dt = bd.GetRoleSets(user, "0", sSearch);
                ViewState["dtRolesetRoles"] = dt;
            }
            else
            {
                dt = (DataTable)ViewState["dtRolesetRoles"];
            }

            gvRoleSets.DataSource = dt;
            gvRoleSets.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRoleSetRoles(txtSearch.Text, true);
        }

        protected void btnSaveRoleSet_Click(object sender, EventArgs e)
        {
            string sRoleSetID = ddlRoleSet.SelectedValue;
            string sRoleID = ddlRole.SelectedValue;
            string sValidFrom = fTxtValidFrom.Text;
            string sValidThru = fTxtValidThru.Text;

            bd.InsertUpdateRoleSetRoleRel(user, "u", "0", sRoleSetID, sRoleID, true, sValidFrom, sValidThru);

            //reload rolesetroles data
            LoadRoleSetRoles("", true);
        }

        protected void gvRoleSets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoleSets.EditIndex = -1;
            LoadRoleSetRoles("", false);
        }

        protected void gvRoleSets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoleSets.EditIndex = e.NewEditIndex;
            LoadRoleSetRoles("", false);

            DataTable dt = (DataTable)ViewState["dtRolesetRoles"];
            DataRow row = (DataRow)dt.Rows[e.NewEditIndex];

            GridViewRow grow = gvRoleSets.Rows[e.NewEditIndex];
            ((TextBox)grow.Cells[4].Controls[1]).Text = DateTime.Parse(row["ValidFrom"].ToString()).ToString("yyyy-MM-dd");
            ((TextBox)grow.Cells[5].Controls[1]).Text = DateTime.Parse(row["ValidThru"].ToString()).ToString("yyyy-MM-dd");
        }

        protected void gvRoleSets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string sRoleSetRoleRelID = ((Label)(gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[0].Controls[1])).Text;
            CheckBox cbkActive = (CheckBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[0].Controls[3];
            TextBox txtValidFrom = (TextBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[4].Controls[1];
            TextBox txtValidThru = (TextBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[5].Controls[1];
            sRoleSetRoleRelID = bd.InsertUpdateRoleSetRoleRel(user, "u", sRoleSetRoleRelID,"0", "0",
                cbkActive.Checked, txtValidFrom.Text,txtValidThru.Text);

            //reload rolesetroles data
            LoadRoleSetRoles("", true);
            gvRoleSets.EditIndex = -1;
        }

        protected void gvRoleSets_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvRoleSets.Rows[e.RowIndex];
            string sRoleSetRoleRelID = ((Label)(row.Cells[0].Controls[1])).Text;
            CheckBox cbkActive = (CheckBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[0].Controls[3];
            TextBox txtValidFrom = (TextBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[4].Controls[1];
            TextBox txtValidThru = (TextBox)gvRoleSets.Rows[gvRoleSets.EditIndex].Cells[5].Controls[1];

            // delete row (status='d')
            sRoleSetRoleRelID = bd.InsertUpdateRoleSetRoleRel(user, "d", sRoleSetRoleRelID, "0", "0",
                cbkActive.Checked, txtValidFrom.Text, txtValidThru.Text);

            //reload rolesetroles data
            LoadRoleSetRoles("", true);
        }

        protected void gvRoleSets_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }
    }
}