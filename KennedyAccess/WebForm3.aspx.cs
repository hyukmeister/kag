using KennedyAccess.Admin;
using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private User user;
        Label HQContactID;
        Label EmployerContactID;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            labTime.Text = DateTime.Now.ToString();
            user = (User)Session["User"];

            if (!IsPostBack)
            {
                try
                {
                    DataTable dtRoleSet = (DataTable)Application["RoleSet"];
                    
                    ddlUserType.DataSource = dtRoleSet;
                    ddlUserType.DataValueField = "RoleSetID";
                    ddlUserType.DataTextField = "RoleSetName";
                    ddlUserType.DataBind();

                    {
                        string UserID = "10000";
                        
                        DataTable dtUsr = bd.GetUsrMain(user, UserID, "");

                        if (dtUsr.Rows.Count == 1)
                        {
                            DataRow drUser = dtUsr.Rows[0];

                            labUser.Text = Page.Title = drUser["UserName"].ToString();
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
                            rblAuthenticated.SelectedValue = drUser["Authenticated"].ToString();
                            txtCreateDate.Text = DateTime.Parse(drUser["CreateDate"].ToString()).ToString("yyyy-MM-dd");
                            txtModifiedDate.Text = DateTime.Parse(drUser["ModifiedDate"].ToString()).ToString("yyyy-MM-dd");
                            txtNote.Text = drUser["Note"].ToString();

                            SetEditVisibility(true);
                        }

                    }
                }
                catch (Exception ex)
                {
                    //Console.WriteLine(ex.Message);
                    SqlHelperv2.ExecuteNonQuery(Global.dbcnn, "WriteAuditTrail",
                        user.FranchiseID,
                        user.UserID,
                        ex.Message);
                }
            }

        }

        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            // User
            SetEditVisibility(false);
        }


        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditUser.Visible = bLock && user.HasRole("UserEdit");
            btnCancel.Visible = btnSaveUser.Visible = !bLock;

            //cbkActive.Enabled = !bLock;
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
            rblAuthenticated.Enabled = !bLock;
            rblAuthenticated.BorderStyle = sBorder;
            txtCreateDate.ReadOnly = bLock;
            txtCreateDate.BorderStyle = sBorder;
            txtModifiedDate.ReadOnly = bLock;
            txtModifiedDate.BorderStyle = sBorder;
            txtNote.ReadOnly = bLock;
            txtNote.BorderStyle = sBorder;

            btnCancel.Visible = btnSaveUser.Visible = !bLock;
            btnEditUser.Visible = bLock && user.HasRole("UserEdit");
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            try
            {
                string sRoleSetID;
                // get rolesetid from ddlusertype
                DataTable dtRoleSet = (DataTable)Application["RoleSet"];
                DataRow[] drRoleSet = dtRoleSet.Select("RoleSetName='" + ddlUserType.SelectedItem.Text + "'");
                if (drRoleSet.Length == 1)
                {
                    sRoleSetID = drRoleSet[0]["RoleSetID"].ToString();
                    lblUserID.Text = bd.InserUpdatetUser(user.FranchiseID, user.UserID, int.Parse(lblUserID.Text), txtUserName.Text, "",
                        txtFirstName.Text, txtLastName.Text, txtEmail.Text, ddlUserType.SelectedValue,
                        sRoleSetID, cbkActive.Checked, txtValidFrom.Text, txtValidThru.Text,
                        rblAuthenticated.SelectedValue == "True", txtMobilephone.Text, txtNote.Text);

                    bd.ResetUserRoleSets(user, lblUserID.Text);

                    ajaxTime.Text= DateTime.Now.ToString();
                }
            }
            catch (Exception ex)
            {
                txtError.Text = "Invalid or ducplicate data entered. Please correct and try again.<br/>" + ex.Message;
                txtError.Visible = true;
                return;
            }

            SetEditVisibility(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditVisibility(true);
        }

    }
}