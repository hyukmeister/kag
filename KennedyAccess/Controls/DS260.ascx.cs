using KennedyAccess.Classes;
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
            if (!IsPostBack)
            {
                user = (User)Session["User"];
                DataTable dt = bd.GetDS260(user, "10000", "0", "0");
                DataRow dr = dt.Rows[0];

                txt1_Surname.Text = dr["1_Surname"].ToString();
                txt1_1_GivenName.Text = dr["1_1_GivenName"].ToString();
                txt1_2_FullNameInNative.Text = dr["1_2_FullNameInNative"].ToString();
                rbl2_AnotherName.SelectedValue = (dr["2_AnotherName"].ToString() == "True") ? "1" : "0";
                txt2_1_AnotherSurname.Text = dr["2_1_AnotherSurname"].ToString();
                txt2_2_AnotherGivenName.Text = dr["2_2_AnotherGivenName"].ToString();
                rbl3_Gender.SelectedValue = (dr["3_Gender"].ToString() == "True") ? "1" : "0";
                rbl4_MaritalStatus.SelectedValue = (dr["4_MaritalStatus"].ToString() == "True") ? "1" : "0";
                txt5_DateOfBirth.Text = DateTime.Parse(dr["5_DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                txt6_CityOfBirth.Text = dr["6_CityOfBirth"].ToString();
                txt7_StateOfBirth.Text = dr["7_StateOfBirth"].ToString();
                ddl8_CountryOfBirth.SelectedValue = dr["8_CountryOfBirth"].ToString();
                ddl9_Nationality.SelectedValue = dr["9_Nationality"].ToString();
                txt10_CurrPPNo.Text = dr["10_CurrPPNo"].ToString();
                ddl10_1_CountryPPIssued.SelectedValue = dr["10_1_CountryPPIssued"].ToString();
                txt10_2_DatePPIssued.Text = DateTime.Parse(dr["10_2_DatePPIssued"].ToString()).ToString("yyyy-MM-dd");
                txt10_3_DatePPExpires.Text = DateTime.Parse(dr["10_3_DatePPExpires"].ToString()).ToString("yyyy-MM-dd");
                rbl11_HavePrevNationalities.SelectedValue = (dr["11_HavePrevNationalities"].ToString() == "True") ? "1" : "0";
                txt14_PrimaryPhone.Text = dr["14_PrimaryPhone"].ToString();
                txt15_SecondaryPhone.Text = dr["15_SecondaryPhone"].ToString();
                txt16_WorkPhone.Text = dr["16_WorkPhone"].ToString();
                rbl16_1_AnyUsedPhone.SelectedValue = (dr["16_1_AnyUsedPhone"].ToString() == "True") ? "1" : "0";
                txt16_2_UsedPrevPhone.Text = dr["16_2_UsedPrevPhone"].ToString();
                txt17_PrimaryEmail.Text = dr["17_PrimaryEmail"].ToString();
                rbl17_1_AnyUsedEmail.SelectedValue = (dr["17_1_AnyUsedEmail"].ToString() == "True") ? "1" : "0";
                txt17_2_UsedPrevEmail.Text = dr["17_2_UsedPrevEmail"].ToString();
                txt18_SocialMediasUserID.Text = dr["18_SocialMediasUserID"].ToString();
                rbl18_1_ShareInfoSocialMedia.SelectedValue = (dr["18_1_ShareInfoSocialMedia"].ToString() == "True") ? "1" : "0";
                txt18_2_OtherSocialMedias.Text = dr["18_2_OtherSocialMedias"].ToString();
                txt18_3_OtherUserID.Text = dr["18_3_OtherUserID"].ToString();
                rbl19_CurrAddSameMailingAdd.SelectedValue = (dr["19_CurrAddSameMailingAdd"].ToString() == "True") ? "1" : "0";
                rbl20_HaveAddInUS.SelectedValue = (dr["20_HaveAddInUS"].ToString() == "True") ? "1" : "0";
                rbl20_1_UseKAGAddress.SelectedValue = (dr["20_1_UseKAGAddress"].ToString() == "True") ? "1" : "0";
                rbl21_MailingAddSame.SelectedValue = (dr["21_MailingAddSame"].ToString() == "True") ? "1" : "0";
            }
        }
    }
}