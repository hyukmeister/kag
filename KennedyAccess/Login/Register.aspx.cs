using Data.Encrypt;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;
//using TextMagicClient.Model;

namespace KennedyAccess.users
{
    public partial class Register11 : System.Web.UI.Page
    {
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dtFranchise = (DataTable)Application["Franchise"];
                ddlFranchise.DataSource = dtFranchise;
                ddlFranchise.DataValueField = "FranchiseID";
                ddlFranchise.DataTextField = "FranchiseName";
                ddlFranchise.DataBind();

                DataTable dtRecordType = (DataTable)Application["RecordType"];

                DataRow[] dr = dtRecordType.Select("Usage='User'");
                DataTable dtState = dr.CopyToDataTable();

                ddlUserType.DataSource = dtState;
                ddlUserType.DataValueField = "RecordTypeID";
                ddlUserType.DataTextField = "RecordType";
                ddlUserType.DataBind();

                DataTable dtCountry = (DataTable)Application["Country"];
                ddlCountry.DataSource = dtCountry;
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();
                ddlCountry.SelectedValue = "10230";
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string sUserID = "";
            string cnn = Global.dbcnn;

            string hashpass = HashGenerator.ComputeHash(txtPassword.Text, "SHA512", null);
            
            DataTable dtCountry = (DataTable)Application["Country"];
            DataRow[] drCountry = dtCountry.Select("CountryID=" + ddlCountry.SelectedValue);
            string sInternationalCode="";
            if (drCountry.Length == 1)
            {
                sInternationalCode = drCountry[0][2].ToString();
            }

            try
            {
                string sRoleSetID;
                bool bActive = ddlUserType.SelectedItem.Text != "System Admin";

                // get rolesetid from ddlusertype
                DataTable dtRoleSet = (DataTable)Application["RoleSet"];
                DataRow[] drRoleSet = dtRoleSet.Select("RoleSetName='" + ddlUserType.SelectedItem.Text + "'");
                if (drRoleSet.Length == 1)
                {
                    sRoleSetID = drRoleSet[0]["RoleSetID"].ToString();
                    sUserID = bd.InserUpdatetUser(1000, -1, -1, txtUserName.Text, hashpass,
                        txtFirstName.Text, txtLastName.Text, txtEmail.Text, ddlUserType.SelectedValue,
                        sRoleSetID, bActive, DateTime.Today.AddDays(-1).ToShortDateString(), "9999-12-31",
                        false, sInternationalCode + txtMobilephone.Text, "", cbkAgreeToTextMsg.Checked);
                }
            }
            catch (Exception ex)
            {
                txtError.Text = ex.Message;

                if (ex.GetBaseException().GetType() == typeof(SqlException))
                {
                    txtError.Text = "User Name or Email already registered. Please change and try again. If you forgot your password, you can reset <a href=\"ForgotPassword.aspx\">here</a>.";
                }
                else
                {
                    txtError.Text = "An error occured while saving. Please try again.";
                }
            }
            finally
            {
                if (sUserID!="")
                {
                    User user = new User();
                    user.UserID = int.Parse(sUserID);
                    user.FirstName = txtFirstName.Text;
                    user.LastName = txtLastName.Text;
                    user.Email = txtEmail.Text;
                    user.Authenticated = false;

                    //load user object into session
                    Session["User"] = user;

                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your account is created successfully')", true);

                    Response.Redirect("../Login/VerifyUser.aspx");
                }
            }
        }
    }
}