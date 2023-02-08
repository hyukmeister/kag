using KennedyAccess.Classes;
using KennedyAccess.users;
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
    public partial class I485 : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();
        public string ApplicantID;
        public string RelationshipID;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Application"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                //if (Session["ApplicationID"] != null && Session["ApplicationID"].ToString() !="")
                //{
                //labI485ID.Text = Session["I485ID"].ToString();
                DataTable dt = bd.GetI485(user, "10001", "10039", "100", "10000");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtLastName.Text = dr["LastName"].ToString();
                    txtFirstName.Text = dr["FirstName"].ToString();
                    txtMiddleName.Text = dr["MiddleName"].ToString();
                    txtMaidenName.Text = dr["MaidenName"].ToString();
                    txtDateOfBirth.Text = DateTime.Parse(dr["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                    txtCityOfBirth.Text = dr["CityOfBirth"].ToString();
                    ddlCountryOfBirth.SelectedValue = dr["CountryOfBirth"].ToString();
                    ddlCitizenship.SelectedValue = dr["Citizenship"].ToString();
                    txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                    txtEmailAddress.Text = dr["EmailAddress"].ToString();
                    txtPassportNumber.Text = dr["PassportNumber"].ToString();
                    txtIssuingCountry.Text = dr["IssuingCountry"].ToString();
                    txtDateOfIssue.Text = DateTime.Parse(dr["DateOfIssue"].ToString()).ToString("yyyy-MM-dd");
                    txtDateOfExpiry.Text = DateTime.Parse(dr["DateOfExpiry"].ToString()).ToString("yyyy-MM-dd");
                    txtAlienNumber.Text = dr["AlienNumber"].ToString();
                    txtSSN.Text = dr["SSN"].ToString();
                    txtCurrLegalStatus.Text = dr["CurrLegalStatus"].ToString();
                    txtCurrVisaIssued.Text = DateTime.Parse(dr["CurrVisaIssued"].ToString()).ToString("yyyy-MM-dd");
                    txtCurrVisaExpires.Text = DateTime.Parse(dr["CurrVisaExpires"].ToString()).ToString("yyyy-MM-dd");
                    txtVisaNumber.Text = dr["VisaNumber"].ToString();
                    txtConsulateVisaIssued.Text = dr["ConsulateVisaIssued"].ToString();
                    txtI94Number.Text = dr["I94Number"].ToString();
                    txtExactNameOnI94.Text = dr["ExactNameOnI94"].ToString();
                    txtMostRecentEntry.Text = DateTime.Parse(dr["MostRecentEntry"].ToString()).ToString("yyyy-MM-dd");
                    txtPortOfEntry.Text = dr["PortOfEntry"].ToString();
                    txtStatusOfEntry.Text = dr["StatusOfEntry"].ToString();
                    txtNameOfMilitary.Text = dr["NameOfMilitary"].ToString();
                    txtCityOfMil.Text = dr["CityOfMil"].ToString();
                    txtStateOfMil.Text = dr["StateOfMil"].ToString();
                    ddlCountryOfMil.SelectedValue = dr["CountryOfMil"].ToString();
                    txtNatureOfGroup.Text = dr["NatureOfGroup"].ToString();
                    txtInvolvementFrom.Text = DateTime.Parse(dr["InvolvementFrom"].ToString()).ToString("yyyy-MM-dd");
                    txtInvolvementTo.Text = DateTime.Parse(dr["InvolvementTo"].ToString()).ToString("yyyy-MM-dd");
                    rblAppliedVisa.SelectedValue = (dr["HaveAppliedVisa"].ToString() == "True") ? "1" : "0";
                    txtCityOfConsulate.Text = dr["CityOfConsulate"].ToString();
                    ddlCountryOfConsulate.SelectedValue = dr["CountryOfConsulate"].ToString();
                    rblVisaDecision.SelectedValue = dr["VisaDecision"].ToString();
                    txtDecisionDate.Text = DateTime.Parse(dr["DecisionDate"].ToString()).ToString("yyyy-MM-dd");
                    rblHaveAppliedEAD.SelectedValue = (dr["HaveAppliedEAD"].ToString() == "True") ? "1" : "0";
                    txtUSCISOffice.Text = dr["USCISOffice"].ToString();
                    txtEADDecision.Text = dr["EADDecision"].ToString();

                    //Interprer's information
                    rblUnderstandEngOnI_485.SelectedValue = (dr["UnderstandEngOnI_485"].ToString() == "True") ? "1" : "0";
                    txtLastNameOfInterp.Text = dr["LastNameOfInterp"].ToString();
                    txtGivenNameOfInterp.Text = dr["GivenNameOfInterp"].ToString();
                    txtBusinessOfInterp.Text = dr["BusinessOfInterp"].ToString();
                    txtStreetOfInterp.Text = dr["StreetOfInterp"].ToString();
                    txtCityInterp.Text = dr["CityInterp"].ToString();
                    txtStateOfInterp.Text = dr["StateOfInterp"].ToString();
                    txtZipCodeOfInterp.Text = dr["ZipCodeOfInterp"].ToString();
                    ddlCountryOfInterp.SelectedValue = dr["CountryOfInterp"].ToString();
                    txtPhoneOfInterp.Text = dr["PhoneOfInterp"].ToString();
                    txtEmailOfInterp.Text = dr["EmailOfInterp"].ToString();

                    //Biographic Information
                    rblEthnicity.SelectedValue = (dr["Ethnicity"].ToString() == "True") ? "1" : "0";
                    rblRace.SelectedValue = dr["Race"].ToString();
                    txtHeightFt.Text = dr["HeightFt"].ToString();
                    txtHeightIn.Text = dr["HeightIn"].ToString();
                    txtHeightCm.Text = dr["HeightCm"].ToString();
                    txtWeightLbs.Text = dr["WeightLbs"].ToString();
                    txtWeightKg.Text = dr["WeightKg"].ToString();
                    rblEyeColor.SelectedValue = dr["EyeColor"].ToString();
                    rblHairColor.SelectedValue = dr["HairColor"].ToString();

                    ////Documentation
                    cbxFilingFee14over.Text = (dr["FilingFee14over"].ToString() == "True") ? "1" : "0";
                    cbxFilingFeeUnder14.Text = (dr["FilingFeeUnder14"].ToString() == "True") ? "1" : "0";
                    cbxSixPassportPhotos.Text = (dr["SixPassportPhotos"].ToString() == "True") ? "1" : "0";
                    cbxI693MedicalExam.Text = (dr["I693MedicalExam"].ToString() == "True") ? "1" : "0";
                    cbxFamilyRelCert_Original.Text = (dr["familyrelcert_original"].ToString() == "True") ? "1" : "0";
                    cbxFamilyRelCert_Translated.Text = (dr["familyrelcert_translated"].ToString() == "True") ? "1" : "0";
                    cbxMarriageCert_Original.Text = (dr["marriagecert_original"].ToString() == "True") ? "1" : "0";
                    cbxMarriageCert_Translated.Text = (dr["marriagecert_translated"].ToString() == "True") ? "1" : "0";
                    cbxBackgroundCheck_Original.Text = (dr["backgroundcheck_original"].ToString() == "True") ? "1" : "0";
                    cbxBackgroundCheck_Translated.Text = (dr["backgroundcheck_translated"].ToString() == "True") ? "1" : "0";
                    cbxCurrI_94.Text = (dr["CurrI_94"].ToString() == "True") ? "1" : "0";
                    cbxCurrVisaPastVisas.Text = (dr["CurrVisaPastVisas"].ToString() == "True") ? "1" : "0";
                    cbxTaxReturnsPast3Yrs.Text = (dr["TaxReturnsPast3Yrs"].ToString() == "True") ? "1" : "0";

                    //Your Background Information
                    rbl1_AdmissionDeniedToUS.SelectedValue = (dr["1_AdmissionDeniedToUS"].ToString() == "True") ? "1" : "0";
                    rbl2_VisaDeniedToUS.SelectedValue = (dr["2_VisaDeniedToUS"].ToString() == "True") ? "1" : "0";
                    rbl3_WorkedUSWithoutAuthz.SelectedValue = (dr["3_WorkedUSWithoutAuthz"].ToString() == "True") ? "1" : "0";
                    rbl4_ViolatedTerms.SelectedValue = (dr["4_ViolatedTerms"].ToString() == "True") ? "1" : "0";
                    rbl5_InExclusion.SelectedValue = (dr["5_InExclusion"].ToString() == "True") ? "1" : "0";
                    rbl6_IssuedFinalOrderExcl.SelectedValue = (dr["6_IssuedFinalOrderExcl"].ToString() == "True") ? "1" : "0";
                    rbl7_HadPriorFinalOrderExcl.SelectedValue = (dr["7_HadPriorFinalOrderExcl"].ToString() == "True") ? "1" : "0";
                    rbl8_LawfulResident.SelectedValue = (dr["8_LawfulResident"].ToString() == "True") ? "1" : "0";
                    rbl9_GrantedDeparture.SelectedValue = (dr["9_GrantedDeparture"].ToString() == "True") ? "1" : "0";
                    rbl10_AppliedProtection.SelectedValue = (dr["10_AppliedProtection"].ToString() == "True") ? "1" : "0";
                    rbl11_A_BeenNonimmigrant.SelectedValue = (dr["11_A_BeenNonimmigrant"].ToString() == "True") ? "1" : "0";
                    rbl11_B_CompliedRequirement.SelectedValue = (dr["11_B_CompliedRequirement"].ToString() == "True") ? "1" : "0";
                    rbl11_C_BeenGrantedWaiver.SelectedValue = (dr["11_C_BeenGrantedWaiver"].ToString() == "True") ? "1" : "0";
                    rbl12_BeenArrested.SelectedValue = (dr["12_BeenArrested"].ToString() == "True") ? "1" : "0";
                    rbl13_CommittedCrime.SelectedValue = (dr["13_CommittedCrime "].ToString() == "True") ? "1" : "0";
                    rbl14_PledGuilty.SelectedValue = (dr["14_PledGuilty"].ToString() == "True") ? "1" : "0";
                    rbl15_BeenOrderedPunished.SelectedValue = (dr["15_BeenOrderedPunished"].ToString() == "True") ? "1" : "0";
                    rbl16_BeenDefendant.SelectedValue = (dr["16_BeenDefendant"].ToString() == "True") ? "1" : "0";
                    rbl17_ViolatedRegulation.SelectedValue = (dr["17_ViolatedRegulation"].ToString() == "True") ? "1" : "0";
                    rbl18_ConvictedForOffenses.SelectedValue = (dr["18_ConvictedForOffenses "].ToString() == "True") ? "1" : "0";
                    rbl19_TraffickedSubstances.SelectedValue = (dr["19_TraffickedSubstances"].ToString() == "True") ? "1" : "0";
                    rbl20_AidedTrafficking.SelectedValue = (dr["20_AidedTrafficking"].ToString() == "True") ? "1" : "0";
                    rbl21_FamilyTrafficked.SelectedValue = (dr["21_FamilyTrafficked"].ToString() == "True") ? "1" : "0";
                    rbl22_EngagedInProstitution.SelectedValue = (dr["22_EngagedInProstitution"].ToString() == "True") ? "1" : "0";
                    rbl23_ProcuredProstitutes.SelectedValue = (dr["23_ProcuredProstitutes"].ToString() == "True") ? "1" : "0";
                    rbl24_ReceiveMoneyProstitution.SelectedValue = (dr["24_ReceiveMoneyProstitution"].ToString() == "True") ? "1" : "0";
                    rbl25_IntendToEngageGambling.SelectedValue = (dr["25_IntendToEngageGambling"].ToString() == "True") ? "1" : "0";
                    rbl26_ExercisedImmunity.SelectedValue = (dr["26_ExercisedImmunity"].ToString() == "True") ? "1" : "0";
                    rbl27_ReligiousViolations.SelectedValue = (dr["27_ReligiousViolations"].ToString() == "True") ? "1" : "0";
                    rbl28_InducedTrafficking.SelectedValue = (dr["28_InducedTrafficking"].ToString() == "True") ? "1" : "0";
                    rbl29_TraffickedServitude.SelectedValue = (dr["29_TraffickedServitude"].ToString() == "True") ? "1" : "0";
                    rbl30_AbettedSexActs.SelectedValue = (dr["30_AbettedSexActs"].ToString() == "True") ? "1" : "0";
                    rbl31_FamilyTrafficking.SelectedValue = (dr["31_FamilyTrafficking"].ToString() == "True") ? "1" : "0";
                    rbl32_MoneyLaundering.SelectedValue = (dr["32_MoneyLaundering"].ToString() == "True") ? "1" : "0";
                    rbl33_ViolatesEspionage.SelectedValue = (dr["33_ViolatesEspionage"].ToString() == "True") ? "1" : "0";
                    rbl34_ProhibitingExport.SelectedValue = (dr["34_ProhibitingExport"].ToString() == "True") ? "1" : "0";
                    rbl35_OverthrowingUSGov.SelectedValue = (dr["35_OverthrowingUSGov"].ToString() == "True") ? "1" : "0";
                    rbl36_EndangerWelfare.SelectedValue = (dr["36_EndangerWelfare"].ToString() == "True") ? "1" : "0";
                    rbl37_UnlawfulActivity.SelectedValue = (dr["37_UnlawfulActivity"].ToString() == "True") ? "1" : "0";
                    rbl38_InAdversePolicy.SelectedValue = (dr["38_InAdversePolicy"].ToString() == "True") ? "1" : "0";
                    rbl39_CommittedCrime.SelectedValue = (dr["39_CommittedCrime"].ToString() == "True") ? "1" : "0";
                    rbl40_ParticipatedInGroup.SelectedValue = (dr["40_ParticipatedInGroup"].ToString() == "True") ? "1" : "0";
                    rbl41_RecruitedMembers.SelectedValue = (dr["41_RecruitedMembers"].ToString() == "True") ? "1" : "0";
                    rbl42_SupportActivities.SelectedValue = (dr["42_SupportActivities"].ToString() == "True") ? "1" : "0";
                    rbl43_SupportIndividual.SelectedValue = (dr["43_SupportIndividual"].ToString() == "True") ? "1" : "0";
                    rbl44_MilitaryTraining.SelectedValue = (dr["44_MilitaryTraining"].ToString() == "True") ? "1" : "0";
                    rbl45_IntendToEngageQ39To45.SelectedValue = (dr["45_IntendToEngageQ39To45"].ToString() == "True") ? "1" : "0";
                    rbl46_FamilyCommitted.SelectedValue = (dr["46_FamilyCommitted"].ToString() == "True") ? "1" : "0";
                    rbl47_FamilyParticipated.SelectedValue = (dr["47_FamilyParticipated"].ToString() == "True") ? "1" : "0";
                    rbl48_FamilyRecruited.SelectedValue = (dr["48_FamilyRecruited"].ToString() == "True") ? "1" : "0";
                    rbl49_FamilySupportActivity.SelectedValue = (dr["49_FamilySupportActivity"].ToString() == "True") ? "1" : "0";
                    rbl50_FamilySupportIndividual.SelectedValue = (dr["50_FamilySupportIndividual"].ToString() == "True") ? "1" : "0";
                    rbl51_FamilyMilitaryTraining.SelectedValue = (dr["51_FamilyMilitaryTraining"].ToString() == "True") ? "1" : "0";
                    rbl52_SellingWeapons.SelectedValue = (dr["52_SellingWeapons"].ToString() == "True") ? "1" : "0";
                    rbl53_WorkedInPrison.SelectedValue = (dr["53_WorkedInPrison"].ToString() == "True") ? "1" : "0";
                    rbl54_AssistedUsingWeapon.SelectedValue = (dr["54_AssistedUsingWeapon"].ToString() == "True") ? "1" : "0";
                    rbl55_ServedInArmedGroup.SelectedValue = (dr["55_ServedInArmedGroup"].ToString() == "True") ? "1" : "0";
                    rbl56_AffiliatedCommunist.SelectedValue = (dr["56_AffiliatedCommunist"].ToString() == "True") ? "1" : "0";
                    rbl57_IncitePersecution.SelectedValue = (dr["57_IncitePersecution "].ToString() == "True") ? "1" : "0";
                    rbl58_A_InvolvingGenocide.SelectedValue = (dr["58_A_InvolvingGenocide"].ToString() == "True") ? "1" : "0";
                    rbl58_B_KillingPerson.SelectedValue = (dr["58_B_KillingPerson"].ToString() == "True") ? "1" : "0";
                    rbl58_C_InjuringPerson.SelectedValue = (dr["58_C_InjuringPerson"].ToString() == "True") ? "1" : "0";
                    rbl58_D_SexualContact.SelectedValue = (dr["58_D_SexualContact"].ToString() == "True") ? "1" : "0";
                    rbl58_E_LimitingAbility.SelectedValue = (dr["58_E_LimitingAbility"].ToString() == "True") ? "1" : "0";
                    rbl59_RecruitedPersUnder15.SelectedValue = (dr["59_RecruitedPersUnder15"].ToString() == "True") ? "1" : "0";
                    rbl60_UsedPersUnder15.SelectedValue = (dr["60_UsedPersUnder15"].ToString() == "True") ? "1" : "0";
                    rbl61_ReceivedUSAsst.SelectedValue = (dr["61_ReceivedUSAsst"].ToString() == "True") ? "1" : "0";
                    rbl62_LikelyToReceiveAsst.SelectedValue = (dr["62_LikelyToReceiveAsst"].ToString() == "True") ? "1" : "0";
                    rbl63_FailedToAttend.SelectedValue = (dr["63_FailedToAttend"].ToString() == "True") ? "1" : "0";
                    rbl64_ReasonableCause.SelectedValue = (dr["64_ReasonableCause"].ToString() == "True") ? "1" : "0";
                    rbl65_AttachWrittenStatement.SelectedValue = (dr["65_AttachWrittenStatement"].ToString() == "True") ? "1" : "0";
                    rbl66_SubmittedFraudulentDoc.SelectedValue = (dr["66_SubmittedFraudulentDoc"].ToString() == "True") ? "1" : "0";
                    rbl67_LiedOnApplication.SelectedValue = (dr["67_LiedOnApplication"].ToString() == "True") ? "1" : "0";
                    rbl68_ClaimedUSCitizen.SelectedValue = (dr["68_ClaimedUSCitizen"].ToString() == "True") ? "1" : "0";
                    rbl69_StowawayOnVessel.SelectedValue = (dr["69_StowawayOnVessel"].ToString() == "True") ? "1" : "0";
                    rbl70_EncouragedSmuggling.SelectedValue = (dr["70_EncouragedSmuggling"].ToString() == "True") ? "1" : "0";
                    rbl71_UnderPenaltyForViolating.SelectedValue = (dr["71_UnderPenaltyForViolating"].ToString() == "True") ? "1" : "0";
                    rbl72_BeenExcludedFromUS.SelectedValue = (dr["72_BeenExcludedFromUS"].ToString() == "True") ? "1" : "0";
                    rbl73_EnteredUSWithoutInsp.SelectedValue = (dr["73_EnteredUSWithoutInsp"].ToString() == "True") ? "1" : "0";
                    rbl74_A_UnlawfullyInUS180Days.SelectedValue = (dr["74_A_UnlawfullyInUS180Days"].ToString() == "True") ? "1" : "0";
                    rbl74_B_UnlawfullyInUS1Year.SelectedValue = (dr["74_B_UnlawfullyInUS1Year"].ToString() == "True") ? "1" : "0";
                    rbl75_A_ReenteredWOInspection.SelectedValue = (dr["75_A_ReenteredWOInspection"].ToString() == "True") ? "1" : "0";
                    rbl75_B_BeenDeported.SelectedValue = (dr["75_B_BeenDeported"].ToString() == "True") ? "1" : "0";
                    rbl76_PlanPolygamy.SelectedValue = (dr["76_PlanPolygamy"].ToString() == "True") ? "1" : "0";
                    rbl77_AccompanyForeigner.SelectedValue = (dr["77_AccompanyForeigner"].ToString() == "True") ? "1" : "0";
                    rbl78_AssistedInDetaining.SelectedValue = (dr["78_AssistedInDetaining"].ToString() == "True") ? "1" : "0";
                    rbl79_VotedInViolation.SelectedValue = (dr["79_VotedInViolation"].ToString() == "True") ? "1" : "0";
                    rbl80_RenouncedUSCitizenship.SelectedValue = (dr["80_RenouncedUSCitizenship"].ToString() == "True") ? "1" : "0";
                    rbl81_AppliedExemption.SelectedValue = (dr["81_AppliedExemption"].ToString() == "True") ? "1" : "0";
                    rbl82_RelievedFromService.SelectedValue = (dr["82_RelievedFromService"].ToString() == "True") ? "1" : "0";
                    rbl83_ConvictedDesertion.SelectedValue = (dr["83_ConvictedDesertion"].ToString() == "True") ? "1" : "0";
                    rbl84_RemainedOutsideUS.SelectedValue = (dr["84_RemainedOutsideUS"].ToString() == "True") ? "1" : "0";
                    rbl85_ImmigrationStatus.SelectedValue = (dr["85_ImmigrationStatus"].ToString() == "True") ? "1" : "0";
                }
                else
                {
                    // something went wrong
                    Response.Redirect("Default.aspx");
                }
                //}

                ddlCountryOfBirth.DataSource = (DataTable)Application["Country"];
                ddlCountryOfBirth.DataValueField = "CountryID";
                ddlCountryOfBirth.DataTextField = "CountryName";
                ddlCountryOfBirth.DataBind();

                ddlCitizenship.DataSource = (DataTable)Application["Country"];
                ddlCitizenship.DataValueField = "CountryID";
                ddlCitizenship.DataTextField = "CountryName";
                ddlCitizenship.DataBind();


                labApplicantID.Text = ApplicantID;
                labRelationshipID.Text = RelationshipID;





                SetEditVisibility(true);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            SetEditVisibility(false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(cbkApplicantInfoChanged.Checked == true)
            {
                //save applicant info to db
                labI485ID.Text = bd.InsertUpdateI485_AppInfo(user, "n", true, "0", labApplicantID.Text, labRelationshipID.Text, txtLastName.Text, txtFirstName.Text);
            }
            SetEditVisibility(true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditVisibility(true);
        }

        protected void ApplicantInfo_Changed(object sender, EventArgs e)
        {
            cbkApplicantInfoChanged.Checked= true;
        }

        protected void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit.Visible = bLock;
            btnCancel.Visible = btnSave.Visible = !bLock;

            txtLastName.ReadOnly = bLock;
            txtLastName.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;
            txtFirstName.BorderStyle = sBorder;
        }
    }
}