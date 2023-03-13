using KennedyAccess.Classes;
using Microsoft.Ajax.Utilities;
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

                DataTable dt = (DataTable)ViewState["FamilyMember"];
                DataRow dr;
                if (dt.Rows.Count > 0 )
                {
                    dr = dt.Rows[0];
                }
                else
                {
                    dr = dt.NewRow();
                }

                PopulateFamilyData(dr);
                SetEditVisibility(true);
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

        private void PopulateFamilyData(DataRow drMember)
        {
            if (drMember["RelationshipID"].ToString() == "")
                ddlRelationship.SelectedValue = null;
            else
                ddlRelationship.SelectedValue = drMember["RelationshipID"].ToString();

            txtFirstName.Text = drMember["FirstName"].ToString();
            txtLastName.Text = drMember["LastName"].ToString();
            txtFirstName.Text = drMember["FirstName"].ToString();
            txtMI.Text = drMember["MI"].ToString();

            if (drMember["Gender"].ToString() == "")
                rblGender.SelectedValue = null;
            else
                rblGender.SelectedValue = drMember["Gender"].ToString();

            txtDateOfBirth.Text = drMember["DateOfBirth"].ToString();

            if (drMember["CitizenshipCountry"].ToString() == "")
                ddlCitizenshipCountry.SelectedValue = null;
            else
                ddlCitizenshipCountry.SelectedValue = drMember["CitizenshipCountry"].ToString();

            if (drMember["BirthCountry"].ToString() == "")
                ddlBirthCountry.SelectedValue = null;
            else
                ddlBirthCountry.SelectedValue = drMember["BirthCountry"].ToString();

            txtAddress1.Text = drMember["CurrentAddress1"].ToString();
            txtAddress2.Text = drMember["CurrentAddress2"].ToString();
            txtCity.Text = drMember["CurrentCity"].ToString();
            txtStateProvince.Text = drMember["CurrentState"].ToString();
            txtPostalCode.Text = drMember["CurrentPostalCode"].ToString();

            if (drMember["CurrentCountry"].ToString() == "")
                ddlCountry.SelectedValue = null;
            else
                ddlCountry.SelectedValue = drMember["CurrentCountry"].ToString();

            if (drMember["ApplyWith"].ToString() == "")
                rblApplyingWith.SelectedValue = null;
            else
                rblApplyingWith.SelectedValue = drMember["ApplyWith"].ToString();

            if (drMember["CurrentRegidence"].ToString() == "")
                rblCurrentRegidence.SelectedValue = null;
            else
                rblCurrentRegidence.SelectedValue = drMember["CurrentRegidence"].ToString();

            txtForeignAddress1.Text = drMember["ForeignAddress1"].ToString();
            txtForeignAddress2.Text = drMember["ForeignAddress1"].ToString();
            txtForeignCity.Text = drMember["ForeignCity"].ToString();
            txtForeignState.Text = drMember["ForeignState"].ToString();
            txtForeignPostalCode.Text = drMember["ForeignPostalCode"].ToString();

            if (drMember["ForeignCountry"].ToString() == "")
                ddlForeignCountry.SelectedValue = null;
            else
                ddlForeignCountry.SelectedValue = drMember["ForeignCountry"].ToString();
            txtPassportNumber.Text = drMember["PassportNumber"].ToString();

            if (drMember["PassportCountry"].ToString() == "")
                ddlPassportCountry.SelectedValue = null;
            else
                ddlPassportCountry.SelectedValue = drMember["PassportCountry"].ToString();
            txtDateIssued.Text = drMember["PassportIssuedDate"].ToString();
            txtDateExpiry.Text = drMember["PassportExireDate"].ToString();
        }


        protected void btnNewFamilyMember_Click(object sender, EventArgs e)
        {



            DataTable dt = (DataTable)ViewState["FamilyMember"];
            DataRow dr = dt.NewRow();
            dr["ApplicantFamilyID"] = "0";
            dr["FirstName"] = "";
            dt.Rows.Add(dr);

            ddlFamilyMember.DataSource = dt;
            ddlFamilyMember.DataValueField = "ApplicantFamilyID";
            ddlFamilyMember.DataTextField = "FirstName";
            ddlFamilyMember.DataBind();
            ddlFamilyMember.SelectedValue = "0";

            PopulateFamilyData(dr);

            SetEditVisibility(false);

        }
        private void SetEditVisibility(bool bLock)
        {

            btnNewFamilyMember.Visible = btnEditMember.Visible = bLock && user.HasRole("ApplicantEdit");
            btnCancel.Visible = btnSaveMember.Visible = !bLock;
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            ddlRelationship.Enabled = !bLock;
            ddlRelationship.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;
            txtFirstName.BorderStyle = sBorder;
            txtLastName.ReadOnly = bLock;
            txtLastName.BorderStyle = sBorder;
            txtMI.ReadOnly = bLock;
            txtMI.BorderStyle = sBorder;
            rblGender.Enabled = !bLock;
            rblGender.BorderStyle = sBorder;
            txtDateOfBirth.ReadOnly = bLock;
            txtDateOfBirth.BorderStyle = sBorder;
            ddlCitizenshipCountry.Enabled = !bLock;
            ddlCitizenshipCountry.BorderStyle = sBorder;
            ddlBirthCountry.Enabled = !bLock;
            ddlBirthCountry.BorderStyle = sBorder;
            txtAddress1.ReadOnly = bLock;
            txtAddress1.BorderStyle = sBorder;
            txtAddress2.ReadOnly = bLock;
            txtAddress2.BorderStyle = sBorder;
            txtCity.ReadOnly = bLock;
            txtCity.BorderStyle = sBorder;
            txtStateProvince.ReadOnly = bLock;
            txtStateProvince.BorderStyle = sBorder;
            txtPostalCode.ReadOnly = bLock;
            txtPostalCode.BorderStyle = sBorder;
            ddlCountry.Enabled = !bLock;
            ddlCountry.BorderStyle = sBorder;
            rblApplyingWith.Enabled = !bLock;
            rblApplyingWith.BorderStyle = sBorder;
            rblCurrentRegidence.Enabled = !bLock;
            rblCurrentRegidence.BorderStyle = sBorder;
            txtForeignAddress1.ReadOnly = bLock;
            txtForeignAddress1.BorderStyle = sBorder;
            txtForeignAddress2.ReadOnly = bLock;
            txtForeignAddress2.BorderStyle = sBorder;
            txtForeignCity.ReadOnly = bLock;
            txtForeignCity.BorderStyle = sBorder;
            txtForeignState.ReadOnly = bLock;
            txtForeignState.BorderStyle = sBorder;
            txtForeignPostalCode.ReadOnly = bLock;
            txtForeignPostalCode.BorderStyle = sBorder;
            ddlForeignCountry.Enabled = !bLock;
            ddlForeignCountry.BorderStyle = sBorder;
            txtPassportNumber.ReadOnly = bLock;
            txtPassportNumber.BorderStyle = sBorder;
            ddlPassportCountry.Enabled = !bLock;
            ddlPassportCountry.BorderStyle = sBorder;
            txtDateIssued.ReadOnly = bLock;
            txtDateIssued.BorderStyle = sBorder;
            txtDateExpiry.ReadOnly = bLock;
            txtDateExpiry.BorderStyle = sBorder;
        }

        protected void btnSaveMember_Click(object sender, EventArgs e)
        {
            if(cbkApplicantFamilyChanged.Checked)
            {
                string ApplicantFamilyID = bd.InsertUpdateFamilyMember(user, ddlFamilyMember.SelectedValue, ddlRelationship.SelectedValue, "u", true,
                hidApplicantID.Value, bd.EmptyToNull(txtDateOfBirth.Text), txtFirstName.Text, txtLastName.Text, txtMI.Text, rblGender.SelectedValue,
                ddlCitizenshipCountry.SelectedValue, ddlBirthCountry.SelectedValue, (rblApplyingWith.SelectedValue == "1") ? true : false,
                (rblCurrentRegidence.SelectedValue == "1") ? true : false, txtAddress1.Text, txtAddress2.Text, txtCity.Text, txtStateProvince.Text,
                txtPostalCode.Text, ddlCountry.SelectedValue, txtForeignAddress1.Text, txtForeignAddress2.Text, txtForeignCity.Text, txtForeignState.Text,
                txtForeignPostalCode.Text, ddlForeignCountry.SelectedValue, txtPassportNumber.Text, ddlPassportCountry.SelectedValue, txtDateIssued.Text,
                txtDateExpiry.Text);

                cbkApplicantFamilyChanged.Checked = false;
            }
           
            SetEditVisibility(true);
        }


         protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditVisibility(true);
        }

        protected void btnEditMember_Click(object sender, EventArgs e)
        {
            SetEditVisibility(false);
            btnNewFamilyMember.Visible = (false);
        }

        protected void ddlFamilyMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow drMember;
            DataTable dt = (DataTable)ViewState["FamilyMember"];
            DataRow[] dr = dt.Select("ApplicantFamilyID = " + ddlFamilyMember.SelectedValue);

            if (dr.Length == 1)
            {
                drMember = dr[0];
                PopulateFamilyData(drMember);
            }
        }

        protected void ApplicantFamilyChanged(object sender, EventArgs e)
        {
            cbkApplicantFamilyChanged.Checked = true;
        }

       
    }
}