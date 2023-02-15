using KennedyAccess.Classes;
using KennedyAccess.users;
using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class DS260 : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Application"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {

                DataTable dtDS260 = bd.GetDS260(user, "10000", "10000", "10001");
                DataRow dr;
                if (dtDS260 != null && dtDS260.Rows.Count == 1)
                {
                    dr = dtDS260.Rows[0];
                }
                else
                {
                    dr = dtDS260.NewRow();
                }

                labApplicantID.Text = dr["ApplicantID"].ToString();
                labRelationshipID.Text = dr["FamilyRelationID"].ToString();
                labReferenceID.Text = dr["ReferenceID"].ToString();
              
                ddl8_CountryOfBirth.DataSource = (DataTable)Application["Country"];
                ddl8_CountryOfBirth.DataValueField = "CountryID";
                ddl8_CountryOfBirth.DataTextField = "CountryName";
                ddl8_CountryOfBirth.DataBind();

                ddl9_Nationality.DataSource = (DataTable)Application["Country"];
                ddl9_Nationality.DataValueField = "CountryID";
                ddl9_Nationality.DataTextField = "CountryName";
                ddl9_Nationality.DataBind();

                ddl10_1_CountryPPIssued.DataSource = (DataTable)Application["Country"];
                ddl10_1_CountryPPIssued.DataValueField = "CountryID";
                ddl10_1_CountryPPIssued.DataTextField = "CountryName";
                ddl10_1_CountryPPIssued.DataBind();


                txt1_Surname.Text = dr["1_Surname"].ToString();
                txt1_1_GivenName.Text = dr["1_1_GivenName"].ToString();
                txt1_2_FullNameInNative.Text = dr["1_2_FullNameInNative"].ToString();
                rbl2_AnotherName.SelectedValue = BaseData.BoolToDefault(dr["2_AnotherName"], null);
                txt2_1_AnotherSurname.Text = dr["2_1_AnotherSurname"].ToString();
                txt2_2_AnotherGivenName.Text = dr["2_2_AnotherGivenName"].ToString();
                rbl3_Gender.SelectedValue = BaseData.BoolToDefault(dr["3_Gender"], null);
                rbl4_MaritalStatus.SelectedValue = BaseData.StringToDefault(dr["4_MaritalStatus"], null);
                txt5_DateOfBirth.Text = BaseData.StringToDateFormat(dr["10_2_DatePPIssued"]);
                txt6_CityOfBirth.Text = dr["6_CityOfBirth"].ToString();
                txt7_StateOfBirth.Text = dr["7_StateOfBirth"].ToString();
                ddl8_CountryOfBirth.SelectedValue = dr["8_CountryOfBirth"].ToString() == "" ? "0" : dr["8_CountryOfBirth"].ToString();
                ddl9_Nationality.SelectedValue = dr["9_Nationality"].ToString() == "" ? "0" : dr["9_Nationality"].ToString();
                txt10_CurrPPNo.Text = dr["10_CurrPPNo"].ToString();
                ddl10_1_CountryPPIssued.SelectedValue = dr["10_1_CountryPPIssued"].ToString() == "" ? "0" : dr["10_1_CountryPPIssued"].ToString();
                txt10_2_DatePPIssued.Text = BaseData.StringToDateFormat(dr["10_2_DatePPIssued"]);
                txt10_3_DatePPExpires.Text = BaseData.StringToDateFormat(dr["10_3_DatePPExpires"]);
                rbl11_HavePrevNationalities.SelectedValue = BaseData.BoolToDefault(dr["11_HavePrevNationalities"], null);
                txt14_PrimaryPhone.Text = dr["14_PrimaryPhone"].ToString();
                txt15_SecondaryPhone.Text = dr["15_SecondaryPhone"].ToString();
                txt16_WorkPhone.Text = dr["16_WorkPhone"].ToString();
                rbl16_1_AnyUsedPhone.SelectedValue = BaseData.BoolToDefault(dr["16_1_AnyUsedPhone"], null);
                txt16_2_UsedPrevPhone.Text = dr["16_2_UsedPrevPhone"].ToString();
                txt17_PrimaryEmail.Text = dr["17_PrimaryEmail"].ToString();
                rbl17_1_AnyUsedEmail.SelectedValue = BaseData.BoolToDefault(dr["17_1_AnyUsedEmail"], null);
                txt17_2_UsedPrevEmail.Text = dr["17_2_UsedPrevEmail"].ToString();
                txt18_SocialMediasUserID.Text = dr["18_SocialMediasUserID"].ToString();
                rbl18_1_ShareInfoSocialMedia.SelectedValue = BaseData.BoolToDefault(dr["18_1_ShareInfoSocialMedia"], null);
                txt18_2_OtherSocialMedias.Text = dr["18_2_OtherSocialMedias"].ToString();
                txt18_3_OtherUserID.Text = dr["18_3_OtherUserID"].ToString();
                rbl19_CurrAddSameMailingAdd.SelectedValue = BaseData.BoolToDefault(dr["19_CurrAddSameMailingAdd"], null);
                rbl20_HaveAddInUS.SelectedValue = BaseData.BoolToDefault(dr["20_HaveAddInUS"], null);
                rbl20_1_UseKAGAddress.SelectedValue = BaseData.BoolToDefault(dr["20_1_UseKAGAddress"], null);
                rbl21_MailingAddSame.SelectedValue = BaseData.BoolToDefault(dr["21_MailingAddSame"], null);

                SetEditVisibility(true);
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            SetEditVisibility(false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cbkDS260Changed.Checked == true)
            {
                //save DS260 info to db
                labDS260ID.Text = bd.InsertUpdateDS260(user, "n", true, labDS260ID.Text = "10000", labApplicantID.Text, labRelationshipID.Text, labReferenceID.Text,
                    txt1_Surname.Text, txt1_1_GivenName.Text, txt1_2_FullNameInNative.Text, rbl2_AnotherName.SelectedValue == "1", txt2_1_AnotherSurname.Text,
                    txt2_2_AnotherGivenName.Text, rbl3_Gender.SelectedValue == "1",
                    rbl4_MaritalStatus.SelectedValue, txt5_DateOfBirth.Text, txt6_CityOfBirth.Text, txt7_StateOfBirth.Text, int.Parse(ddl8_CountryOfBirth.SelectedValue),
                    int.Parse(ddl9_Nationality.SelectedValue), txt10_CurrPPNo.Text, int.Parse(ddl10_1_CountryPPIssued.SelectedValue), txt10_2_DatePPIssued.Text,
                    txt10_3_DatePPExpires.Text, rbl11_HavePrevNationalities.SelectedValue == "1", txt14_PrimaryPhone.Text, txt15_SecondaryPhone.Text,
                    txt16_WorkPhone.Text, rbl16_1_AnyUsedPhone.SelectedValue == "1", txt16_2_UsedPrevPhone.Text, txt17_PrimaryEmail.Text, rbl17_1_AnyUsedEmail.SelectedValue == "1",
                    txt17_2_UsedPrevEmail.Text, txt18_SocialMediasUserID.Text, rbl18_1_ShareInfoSocialMedia.SelectedValue == "1", txt18_2_OtherSocialMedias.Text,
                    txt18_3_OtherUserID.Text, rbl19_CurrAddSameMailingAdd.SelectedValue == "1", rbl20_HaveAddInUS.SelectedValue == "1",
                    rbl20_1_UseKAGAddress.SelectedValue == "1", rbl21_MailingAddSame.SelectedValue == "1"
                   );
                cbkDS260Changed.Checked = false;
            }
            SetEditVisibility(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditVisibility(true);
        }

        protected void DS260_Changed(object sender, EventArgs e)
        {
            cbkDS260Changed.Checked = true;
        }

        protected void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit1.Visible = bLock;
            btnCancel1.Visible = btnSave1.Visible = !bLock;

            txt1_Surname.ReadOnly = bLock; txt1_Surname.BorderStyle = sBorder;
            txt1_1_GivenName.ReadOnly = bLock; txt1_1_GivenName.BorderStyle = sBorder;
            txt1_2_FullNameInNative.ReadOnly = bLock; txt1_2_FullNameInNative.BorderStyle = sBorder;
            rbl2_AnotherName.Enabled = !bLock; rbl2_AnotherName.BorderStyle = sBorder;
            txt2_1_AnotherSurname.ReadOnly = bLock; txt2_1_AnotherSurname.BorderStyle = sBorder;
            txt2_2_AnotherGivenName.ReadOnly = bLock; txt2_2_AnotherGivenName.BorderStyle = sBorder;
            rbl3_Gender.Enabled = !bLock; rbl3_Gender.BorderStyle = sBorder;
            rbl4_MaritalStatus.Enabled = !bLock; rbl4_MaritalStatus.BorderStyle = sBorder;
            txt5_DateOfBirth.ReadOnly = bLock; txt5_DateOfBirth.BorderStyle = sBorder;
            txt6_CityOfBirth.ReadOnly = bLock; txt6_CityOfBirth.BorderStyle = sBorder;
            txt7_StateOfBirth.ReadOnly = bLock; txt7_StateOfBirth.BorderStyle = sBorder;
            ddl8_CountryOfBirth.Enabled = !bLock; ddl8_CountryOfBirth.BorderStyle = sBorder;
            ddl9_Nationality.Enabled = !bLock; ddl9_Nationality.BorderStyle = sBorder;
            txt10_CurrPPNo.ReadOnly = bLock; txt10_CurrPPNo.BorderStyle = sBorder;
            ddl10_1_CountryPPIssued.Enabled = !bLock; ddl10_1_CountryPPIssued.BorderStyle = sBorder;
            txt10_2_DatePPIssued.ReadOnly = bLock; txt10_2_DatePPIssued.BorderStyle = sBorder;
            txt10_3_DatePPExpires.ReadOnly = bLock; txt10_3_DatePPExpires.BorderStyle = sBorder;
            rbl11_HavePrevNationalities.Enabled = !bLock; rbl11_HavePrevNationalities.BorderStyle = sBorder;
            txt14_PrimaryPhone.ReadOnly = bLock; txt14_PrimaryPhone.BorderStyle = sBorder;
            txt15_SecondaryPhone.ReadOnly = bLock; txt15_SecondaryPhone.BorderStyle = sBorder;
            txt16_WorkPhone.ReadOnly = bLock; txt16_WorkPhone.BorderStyle = sBorder;
            rbl16_1_AnyUsedPhone.Enabled = !bLock; rbl16_1_AnyUsedPhone.BorderStyle = sBorder;
            txt16_2_UsedPrevPhone.ReadOnly = bLock; txt16_2_UsedPrevPhone.BorderStyle = sBorder;
            txt17_PrimaryEmail.ReadOnly = bLock; txt17_PrimaryEmail.BorderStyle = sBorder;
            rbl17_1_AnyUsedEmail.Enabled = !bLock; rbl17_1_AnyUsedEmail.BorderStyle = sBorder;
            txt17_2_UsedPrevEmail.ReadOnly = bLock; txt17_2_UsedPrevEmail.BorderStyle = sBorder;
            txt18_SocialMediasUserID.ReadOnly = bLock; txt18_SocialMediasUserID.BorderStyle = sBorder;
            rbl18_1_ShareInfoSocialMedia.Enabled = !bLock; rbl18_1_ShareInfoSocialMedia.BorderStyle = sBorder;
            txt18_2_OtherSocialMedias.ReadOnly = bLock; txt18_2_OtherSocialMedias.BorderStyle = sBorder;
            txt18_3_OtherUserID.ReadOnly = bLock; txt18_3_OtherUserID.BorderStyle = sBorder;
            rbl19_CurrAddSameMailingAdd.Enabled = !bLock; rbl19_CurrAddSameMailingAdd.BorderStyle = sBorder;
            rbl20_HaveAddInUS.Enabled = !bLock; rbl20_HaveAddInUS.BorderStyle = sBorder;
            rbl20_1_UseKAGAddress.Enabled = !bLock; rbl20_1_UseKAGAddress.BorderStyle = sBorder;
            rbl21_MailingAddSame.Enabled = !bLock; rbl21_MailingAddSame.BorderStyle = sBorder;
        }
    }
}