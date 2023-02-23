using KennedyAccess.Admin;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;
using KennedyAccess.Classes;
using Org.BouncyCastle.Ocsp;
using Newtonsoft.Json.Linq;

namespace KennedyAccess.Controls
{
    public partial class EmployerInfo : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            
            if (!IsPostBack)
            {
                if (Session["EmployerID"] != null && Session["EmployerID"].ToString() == "-1")
                {
                    hidEmployerInfoID.Value = "0";

                    // new employer; enable edit
                    SetEditVisibility(false);
                }
                else
                {
                    hidEmployerInfoID.Value = Session["EmployerID"].ToString();
                    int employerid = bd.StringToInt(hidEmployerInfoID.Value);

                    DataTable dtEmp = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", employerid))).Tables[0];

                    if (dtEmp.Rows.Count == 1)
                    {
                        DataRow dr = dtEmp.Rows[0];
                        txtNumEmployee.Text = dr["NumEmployees"].ToString();
                        txtYearBusiness.Text = dr["YearBusiness"].ToString();
                        txtFEIN.Text = dr["FEIN"].ToString();
                        txtNAICSCode.Text = dr["NAICSCode"].ToString();
                        rblAlienOwnership.SelectedValue = "0";
                        txtEmployerDesc.Text = dr["Description"].ToString();
                        txtWebsiteInfo.Text = dr["WebsiteInfo"].ToString();

                        // populate user name ddl
                        ddlUserName.DataSource = bd.GetEmpUserList(user, dr["UserId"].ToString());
                        ddlUserName.DataTextField = "UserName";
                        ddlUserName.DataValueField = "UserID";
                        ddlUserName.DataBind();
                        ddlUserName.SelectedValue = dr["UserId"].ToString();
                    }

                    // employer
                    SetEditVisibility(true);

                    // profile picture control
                    ProfilePicture.sObject = "Employer";
                    ProfilePicture.sObjectID = hidEmployerInfoID.Value;
                    ProfilePicture.bShowButtons = true;

                    //// profile picture control
                    //ProfilePhoto.sObject = "Employer";
                    //ProfilePhoto.sObjectID = hidEmployerInfoID.Value;
                    //ProfilePhoto.bShowButtons = true;
                    //ProfilePhoto.UploadPhotoVisible(false);
                }
            }
        }

        public void SaveEmployerInfo(object sender, EventArgs e)
        {
            if (cbkEmployerInfoChanged.Checked)
            {
                int empID;
                empID = (hidEmployerInfoID.Value == "") ? 0 : int.Parse(hidEmployerInfoID.Value);

                bool bAlienOwnership = (rblAlienOwnership.SelectedValue == "1") ? true : false;
                int nubEmp = int.Parse(txtNumEmployee.Text);
                int yearBusiness = int.Parse(txtYearBusiness.Text);

                if (empID == 0)
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader(
                        Global.dbcnn, "InsertEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@NumEmployees", nubEmp),
                        new SqlParameter("@YearBusiness", yearBusiness),
                        new SqlParameter("@FEIN", txtFEIN.Text),
                        new SqlParameter("@NAICSCode", txtNAICSCode.Text),
                        new SqlParameter("@AlienOwnership", bAlienOwnership),
                        new SqlParameter("@Description", txtEmployerDesc.Text),
                        new SqlParameter("@WebsiteInfo", txtWebsiteInfo.Text)
                        );
                    dr.Read();
                    empID = int.Parse(dr[0].ToString());
                    dr.Close();

                    Session["EmployerID"] = hidEmployerInfoID.Value = empID.ToString();
                    user.ObjectID = bd.StringToInt(hidEmployerInfoID.Value);
                }

                else
                {
                    SqlHelper.ExecuteNonQuery(
                        Global.dbcnn, "UpdateEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", empID),
                        new SqlParameter("@NumEmployees", nubEmp),
                        new SqlParameter("@YearBusiness", yearBusiness),
                        new SqlParameter("@FEIN", txtFEIN.Text),
                        new SqlParameter("@NAICSCode", txtNAICSCode.Text),
                        new SqlParameter("@ManualUserID", int.Parse(ddlUserName.SelectedValue)),
                        new SqlParameter("@AlienOwnership", bAlienOwnership),
                        new SqlParameter("@Description", txtEmployerDesc.Text),
                        new SqlParameter("@WebsiteInfo", txtWebsiteInfo.Text));
                }
                cbkEmployerInfoChanged.Checked = false;
            }

            // employer form
            SetEditVisibility(true);
        }
        public void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            txtNumEmployee.ReadOnly = bLock;
            txtNumEmployee.BorderStyle = sBorder;
            txtYearBusiness.ReadOnly = bLock;
            txtYearBusiness.BorderStyle = sBorder;
            txtFEIN.ReadOnly = bLock;
            txtFEIN.BorderStyle = sBorder;
            txtNAICSCode.ReadOnly = bLock;
            txtNAICSCode.BorderStyle = sBorder;
            rblAlienOwnership.Enabled = !bLock;
            rblAlienOwnership.BorderStyle = sBorder;
            txtEmployerDesc.ReadOnly = bLock;
            txtEmployerDesc.BorderStyle = sBorder;
            txtWebsiteInfo.ReadOnly = bLock;
            txtWebsiteInfo.BorderStyle = sBorder;
            ddlUserName.Enabled = !bLock && user.HasRole("SystemAdmin");
        }

        public void EmployerInfo_Changed(object sender, EventArgs e)
        {
            cbkEmployerInfoChanged.Checked = true;
        }

        public void EnablePhotoUpload(bool bShow)
        {
            //ProfilePhoto.UploadPhotoVisible(bShow);
        }
    }
}