using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class ApplicantFamily : System.Web.UI.UserControl
    {
        public string ApplicantID;
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!IsPostBack)
            {
                hidApplicantID.Value = ApplicantID;

                ddlCitizenshipCountry.DataSource = (DataTable)Application["Country"];
                ddlCitizenshipCountry.DataValueField = "CountryID";
                ddlCitizenshipCountry.DataTextField = "CountryName";
                ddlCitizenshipCountry.DataBind();

                ddlBirthCountry.DataSource = (DataTable)Application["Country"];
                ddlBirthCountry.DataValueField = "CountryID";
                ddlBirthCountry.DataTextField = "CountryName";
                ddlBirthCountry.DataBind();

                ddlCountry.DataSource = (DataTable)Application["Country"];
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();

                ddlForeignCountry.DataSource = (DataTable)Application["Country"];
                ddlForeignCountry.DataValueField = "CountryID";
                ddlForeignCountry.DataTextField = "CountryName";
                ddlForeignCountry.DataBind();

                ddlPassportCountry.DataSource = (DataTable)Application["Country"];
                ddlPassportCountry.DataValueField = "CountryID";
                ddlPassportCountry.DataTextField = "CountryName";
                ddlPassportCountry.DataBind();

                ddlRelationship.DataSource = (DataTable)Application["Relationship"];
                ddlRelationship.DataTextField = "Relationship";
                ddlRelationship.DataValueField = "RelationshipID";
                ddlRelationship.DataBind();

                LoadFamilyData(true);

                PopulateFamilyData();
            }            
        }

        private void LoadFamilyData(bool FromDB)
        {
            DataTable dt;
            if(FromDB)
            {
                dt = bd.GetFamilyMember(user, hidApplicantID.Value);
                ViewState["FamilyMember"] = dt;
            }
            else
            {
                dt = (DataTable)ViewState["FamilyMember"];
            }

            ddlFamilyMember.DataSource = dt;
            ddlFamilyMember.DataValueField = "ApplicantFamilyID";
            ddlFamilyMember.DataTextField = "FirstName";
            ddlFamilyMember.DataBind();
            ddlFamilyMember.SelectedIndex = 0;
        }

        private void PopulateFamilyData()
        {
            DataTable dt = (DataTable)ViewState["FamilyMember"];
            DataRow[] dr = dt.Select("ApplicantFamilyID = " + ddlFamilyMember.SelectedValue);

            if(dr.Length == 1)
            {
                DataRow drMember = dr[0];
                ddlRelationship.SelectedValue = drMember["RelationshipID"].ToString();
                txtFirstName.Text = drMember["FirstName"].ToString();
                txtLastName.Text = drMember["LastName"].ToString();
                txtFirstName.Text = drMember["FirstName"].ToString();
                txtMI.Text = drMember["MI"].ToString();
                rblGender.SelectedValue = drMember["Gender"].ToString();
                txtDateOfBirth.Text = drMember["DateOfBirth"].ToString();
                ddlCitizenshipCountry.SelectedValue = drMember["CitizenshipCountry"].ToString();
                ddlBirthCountry.SelectedValue = drMember["BirthCountry"].ToString();
                txtAddress1.Text = drMember["CurrentAddress1"].ToString();
                txtAddress2.Text = drMember["CurrentAddress2"].ToString();
                txtCity.Text = drMember["CurrentCity"].ToString();
                txtStateProvince.Text = drMember["CurrentState"].ToString();
                txtPostalCode.Text = drMember["CurrentPostalCode"].ToString();
                ddlCountry.SelectedValue = drMember["CurrentCountry"].ToString();
                rblApplyingWith.Text = drMember["ApplyWith"].ToString();
                rblCurrentRegidence.Text = drMember["CurrentRegidence"].ToString();
                txtForeignAddress1.Text = drMember["ForeignAddress1"].ToString();
                txtForeignAddress2.Text = drMember["ForeignAddress1"].ToString();
                txtForeignCity.Text = drMember["ForeignCity"].ToString();
                txtForeignState.Text = drMember["ForeignState"].ToString();
                txtForeignPostalCode.Text = drMember["ForeignPostalCode"].ToString();
                ddlForeignCountry.SelectedValue = drMember["ForeignCountry"].ToString();
                txtPassportNumber.Text = drMember["PassportNumber"].ToString();
                ddlPassportCountry.SelectedValue = drMember["PassportCountry"].ToString();
                txtDateIssued.Text = drMember["PassportIssuedDate"].ToString();
                txtDateExpiry.Text = drMember["PassportExireDate"].ToString();
            }
        }

        protected void btnNewFamilyMember_Click(object sender, EventArgs e)
        {

        }
    }
}