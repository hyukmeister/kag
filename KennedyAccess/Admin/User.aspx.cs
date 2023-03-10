using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using Antlr.Runtime.Misc;
using KennedyAccess.Classes;
using AjaxControlToolkit;
using TextMagicClient.Model;
using KennedyAccess.Controls;

namespace KennedyAccess
{
    public partial class User1 : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.MaintainScrollPositionOnPostBack = true;

            user = (User)Session["User"];
            if (user == null)
                Response.Redirect("../Default.aspx");

            if (!IsPostBack)
            {
                try
                {
                    DataTable dtRoleSet = (DataTable)Application["RoleSet"];

                    ddlUserType.DataSource = dtRoleSet;
                    ddlUserType.DataValueField = "RoleSetID";
                    ddlUserType.DataTextField = "RoleSetName";
                    ddlUserType.DataBind();

                    if (Session["UserID"] != null && Session["UserID"].ToString() == "-1")
                    {
                        labUser.Text = Page.Title = "New User";

                        // new user; enable edit
                        SetEditVisibility(false);
                    }
                    else
                    {
                        string UserID = Session["UserID"].ToString();
                        LoadUserInfo(UserID, true);

                        LoadUserRoleSetRoles(true);

                        // info section
                        TabContainer tcContainer = (TabContainer)Master.FindControl("tcContainer");
                        tcContainer.Visible = user.UserType == "System Admin";

                        // tab 1 : login history
                        tcContainer.Tabs[1].HeaderText = "Logins";
                        GridView gv1 = new GridView();
                        gv1.ID = "gvHistory";
                        gv1.CssClass = "table table-hover";
                        gv1.GridLines = GridLines.None;
                        gv1.HeaderStyle.ForeColor = System.Drawing.Color.DimGray;
                        gv1.HeaderStyle.BackColor = System.Drawing.Color.Silver;
                        gv1.DataSource = bd.GetLoginHistory(user.FranchiseID.ToString(), lblUserID.Text);
                        gv1.DataBind();
                        tcContainer.Tabs[1].Controls.Add(gv1);
                        tcContainer.Tabs[1].Visible = true;

                        SetEditVisibility(true);
                    }
                }
                catch (Exception ex)
                {
                    int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "AuditTrail");
                    //Console.WriteLine(ex.Message);
                    SqlHelperv2.ExecuteNonQuery(Global.dbcnn, "WriteAuditTrail",
                        user.FranchiseID,
                        user.UserID,
                        iRecordTypeID,
                        ex.Message);
                }
            }
        }

        private void LoadUserInfo(string UserID, bool fromDB)
        {
            DataTable dtUsr;
            if(fromDB)
            {
                dtUsr = bd.GetUsrMain(user, UserID, "");
                ViewState["UserInfo"] = dtUsr;
            }
            else
            {
                dtUsr = (DataTable)ViewState["UserInfo"];
            }
            if (dtUsr.Rows.Count == 1)
            {
                DataRow drUser = dtUsr.Rows[0];

                labUser.Text = Page.Title = drUser["FirstName"].ToString() + " " + drUser["LastName"].ToString() + " (" + drUser["UserName"].ToString() + ")";
                lblUserID.Text = drUser["UserID"].ToString();
                cbkActive.Checked = drUser["Active"].ToString() == "True";

                lblRecordType.Text = drUser["RecordTypeID"].ToString();
                lblFranchise.Text = drUser["FranchiseID"].ToString();
                txtUserName.Text = drUser["UserName"].ToString();
                txtAuthenticationCode.Text = drUser["ValidationCode"].ToString();
                txtFirstName.Text = drUser["FirstName"].ToString();
                txtLastName.Text = drUser["LastName"].ToString();
                txtEmail.Text = drUser["Email"].ToString();
                txtMobilephone.Text = drUser["Mobilephone"].ToString();
                txtValidFrom.Text = DateTime.Parse(drUser["ValidFrom"].ToString()).ToString("yyyy-MM-dd");
                txtValidThru.Text = DateTime.Parse(drUser["ValidThru"].ToString()).ToString("yyyy-MM-dd");
                ddlUserType.SelectedValue = drUser["RoleSetID"].ToString();
                cbkAuthenticated.Checked = drUser["Authenticated"].ToString() == "True";
                txtCreateDate.Text = DateTime.Parse(drUser["CreateDate"].ToString()).ToString("yyyy-MM-dd");
                txtModifiedDate.Text = DateTime.Parse(drUser["ModifiedDate"].ToString()).ToString("yyyy-MM-dd");
                cbkAgreeToTextMsg.Checked = drUser["AgreeToTextMsg"].ToString() == "True";
                txtNote.Text = drUser["Note"].ToString();                
            }
        }

        private void LoadUserRoleSetRoles(bool bFromDB)
        {
            DataTable dt = null;
            if (bFromDB)
            {
                dt = bd.GetUserRoleSets(user, lblUserID.Text);
                ViewState["dtUserRolesetRoles"] = dt;
            }
            else
            {
                dt = (DataTable)ViewState["dtUserRolesetRoles"];
            }

            if(dt.Rows.Count > 0)
            {
                gvRoleSets.DataSource = dt;
                gvRoleSets.DataBind();

                DropDownList fRoleName = (DropDownList)gvRoleSets.FooterRow.FindControl("fRoleName");
                fRoleName.DataSource = GetRoles();
                fRoleName.DataTextField = "RoleName";
                fRoleName.DataValueField = "RoleID";
                fRoleName.DataBind();

                gvRoleSets.Columns[6].Visible = btnEditUser.Visible = user.HasRole("UserEdit");
            }

        }

        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            // User
            SetEditVisibility(false);
        }

        private DataTable GetRoles()
        {
            DataTable dt = null;
            if(ViewState["dtRoles"] is null)
            {
                ViewState["dtRoles"] = dt = bd.GetRole(user, "0", "");
            }
            else
            {
                dt = (DataTable)ViewState["dtRoles"];
            }

            return dt;
        }

        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            cbkActive.ControlLabel = "Active";
            cbkActive.CheckedText = "Active";
            cbkActive.UncheckedText = "Inactive";
            cbkActive.Disable = bLock;

            //cbkActive.BorderStyle = sBorder;
            lblRecordType.Enabled = bLock;
            lblRecordType.BorderStyle = sBorder;
            lblFranchise.Enabled = bLock;
            lblFranchise.BorderStyle = sBorder;
            txtUserName.ReadOnly = bLock;
            txtUserName.BorderStyle = sBorder;
            //txtPassword.ReadOnly = bLock;
            //txtPassword.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;
            txtFirstName.BorderStyle = sBorder;
            txtLastName.ReadOnly = bLock;
            txtLastName.BorderStyle = sBorder;
            txtEmail.ReadOnly = bLock;
            txtEmail.BorderStyle = sBorder;
            txtMobilephone.ReadOnly = bLock;
            txtMobilephone.BorderStyle = sBorder;
            txtValidFrom.ReadOnly = bLock;
            txtValidFrom.BorderStyle = sBorder;
            txtValidThru.ReadOnly = bLock;
            txtValidThru.BorderStyle = sBorder;
            ddlUserType.Enabled = !bLock;
            ddlUserType.BorderStyle = sBorder;
            cbkAuthenticated.ControlLabel = "Authenticated";
            cbkAuthenticated.CheckedText = "Yes";
            cbkAuthenticated.UncheckedText = "No";
            cbkAuthenticated.Disable = bLock;
            txtCreateDate.ReadOnly = bLock;
            txtCreateDate.BorderStyle = sBorder;
            txtModifiedDate.ReadOnly = bLock;
            txtModifiedDate.BorderStyle = sBorder;
            cbkAgreeToTextMsg.Disable= bLock;
            txtNote.ReadOnly = bLock;
            txtNote.BorderStyle = sBorder;

            btnCancel.Visible = btnSaveUser.Visible = !bLock;
            btnEditUser.Visible = bLock && user.HasRole("UserEdit");
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            try
            {
                string sRoleSetID = ddlUserType.SelectedValue;
                // get recordtypeid from sRoleSetID
                string sRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", ddlUserType.SelectedItem.Text).ToString();
                lblUserID.Text = bd.InserUpdatetUser(user.FranchiseID, user.UserID, int.Parse(lblUserID.Text), txtUserName.Text, "",
                    txtFirstName.Text, txtLastName.Text, txtEmail.Text, sRecordTypeID,
                    sRoleSetID, cbkActive.Checked, txtValidFrom.Text, txtValidThru.Text,
                    cbkAuthenticated.Checked, txtMobilephone.Text, txtNote.Text, cbkAgreeToTextMsg.Checked);

                LoadUserInfo(lblUserID.Text, true);

                LoadUserRoleSetRoles(true);
            }
            catch (Exception ex)
            {
                txtError.Text = "Invalid or ducplicate data entered. Please correct and try again.<br/>"+ex.Message;
                txtError.Visible = true;
                return;
            }

            SetEditVisibility(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadUserInfo(lblUserID.Text, false);
            SetEditVisibility(true);
        }

        protected void gvRoleSets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoleSets.EditIndex = e.NewEditIndex;
            LoadUserRoleSetRoles(false);

            DataTable dt = (DataTable)ViewState["dtUserRolesetRoles"];
            DataRow row = (DataRow)dt.Rows[e.NewEditIndex];

            GridViewRow grow = gvRoleSets.Rows[e.NewEditIndex];
            //Toggle chkActive = (Toggle)grow.Cells[0].Controls[7];
            //chkActive.ControlLabel = chkActive.ClientID;
            //chkActive.CheckedText = "Active";
            //chkActive.UncheckedText = "Inactive";
            //chkActive.Checked = BaseData.BoolToDefault(row["Active"],"0") == "1";
            ((TextBox)grow.Cells[4].Controls[1]).Text = DateTime.Parse(row["ValidFrom"].ToString()).ToString("yyyy-MM-dd");
            ((TextBox)grow.Cells[5].Controls[1]).Text = DateTime.Parse(row["ValidThru"].ToString()).ToString("yyyy-MM-dd");
        }

        protected void gvRoleSets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoleSets.EditIndex = -1;

            LoadUserRoleSetRoles(false);
        }

        protected void gvRoleSets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idx = gvRoleSets.EditIndex;
            string RoleRelID = ((Label)(gvRoleSets.Rows[idx].Cells[0].Controls[3])).Text;
            Label LabRoleID = (Label)gvRoleSets.Rows[idx].Cells[0].Controls[1];
            Toggle cbkActive = (Toggle)gvRoleSets.Rows[idx].Cells[0].Controls[7];
            TextBox txtValidFrom = (TextBox)gvRoleSets.Rows[idx].Cells[4].Controls[1];
            TextBox txtValidThru = (TextBox)gvRoleSets.Rows[idx].Cells[5].Controls[1];
            RoleRelID = bd.InsertUpdateUserRoleSets(user, lblUserID.Text, RoleRelID, 
                LabRoleID.Text, cbkActive.Checked, txtValidFrom.Text, txtValidThru.Text);

            gvRoleSets.EditIndex = -1;

            LoadUserRoleSetRoles(true);
        }

        protected void NewRole_Click(object sender, EventArgs e)
        {
            GridViewRow fRow = gvRoleSets.FooterRow;

            try
            {
                Toggle cbkActive = (Toggle)fRow.Cells[0].Controls[1];
                DropDownList ddlRole = (DropDownList)fRow.Cells[2].Controls[1];
                TextBox txtValidFrom = (TextBox)fRow.Cells[4].Controls[1];
                TextBox txtValidThru = (TextBox)fRow.Cells[5].Controls[1];
                bd.InsertUpdateUserRoleSets(user, lblUserID.Text, "0",
                    ddlRole.SelectedValue, cbkActive.Checked, txtValidFrom.Text, txtValidThru.Text);

                LoadUserRoleSetRoles(true);
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