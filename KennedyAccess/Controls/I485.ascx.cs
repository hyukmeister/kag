using Antlr.Runtime.Misc;
using KennedyAccess.Classes;
using KennedyAccess.users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Application"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                labApplicantID.Text = ApplicantID;
                DataTable dt = bd.GetFamilyI485ByApplicantID(user, labApplicantID.Text);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    ViewState["FamilyI485"] = dt;

                    ddlFamilyMember.DataSource = dt;
                    ddlFamilyMember.DataValueField = "ApplicantFamilyID";
                    ddlFamilyMember.DataTextField = "FirstName";
                    ddlFamilyMember.DataBind();
                    ddlFamilyMember.SelectedIndex = 0;

                    labReferenceID.Text = dr["ApplicantFamilyID"].ToString();
                    labRelationshipID.Text = dr["RelationshipID"].ToString();
                    labI485ID.Text = dr["I485ID"].ToString();
                }


                ddlCountryOfBirth.DataSource = (DataTable)Application["Country"];
                ddlCountryOfBirth.DataValueField = "CountryID";
                ddlCountryOfBirth.DataTextField = "CountryName";
                ddlCountryOfBirth.DataBind();

                ddlCitizenship.DataSource = (DataTable)Application["Country"];
                ddlCitizenship.DataValueField = "CountryID";
                ddlCitizenship.DataTextField = "CountryName";
                ddlCitizenship.DataBind();

                ddlIssuingCountry.DataSource = (DataTable)Application["Country"];
                ddlIssuingCountry.DataValueField = "CountryID";
                ddlIssuingCountry.DataTextField = "CountryName";
                ddlIssuingCountry.DataBind();

                ddlCountryOfMil.DataSource = (DataTable)Application["Country"];
                ddlCountryOfMil.DataValueField = "CountryID";
                ddlCountryOfMil.DataTextField = "CountryName";
                ddlCountryOfMil.DataBind();

                ddlCountryOfConsulate.DataSource = (DataTable)Application["Country"];
                ddlCountryOfConsulate.DataValueField = "CountryID";
                ddlCountryOfConsulate.DataTextField = "CountryName";
                ddlCountryOfConsulate.DataBind();

                ddlCountryOfInterp.DataSource = (DataTable)Application["Country"];
                ddlCountryOfInterp.DataValueField = "CountryID";
                ddlCountryOfInterp.DataTextField = "CountryName";
                ddlCountryOfInterp.DataBind();

                PopulateI485();

                SetEditVisibility_AppInfo(true);
                SetEditVisibility_InterpInfo(true);
                SetEditVisibility_BioInfo(true);
                SetEditVisibility_DocInfo(true);
                SetEditVisibility_BackgroundInfo(true);
            }
        }

        protected void btnEdit_AppInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_AppInfo(false);
        }

        protected void btnSave_AppInfoClick(object sender, EventArgs e)
        {
            if(cbkApplicantInfoChanged.Checked == true)
            {
                //save applicant info to db
                labI485ID.Text = bd.InsertUpdateI485_AppInfo(user, "n", true, labI485ID.Text, labApplicantID.Text, "10000",//labReferenceID.Text,
                    "10001",//labRelationshipID.Text, 
                    txtLastName.Text, txtFirstName.Text, txtMiddleName.Text, txtMaidenName.Text, txtDateOfBirth.Text, 
                    txtCityOfBirth.Text, int.Parse(ddlCountryOfBirth.SelectedValue), int.Parse(ddlCitizenship.SelectedValue), txtPhoneNumber.Text, 
                    txtEmailAddress.Text, txtPassportNumber.Text, txtDateOfIssue.Text, txtDateOfExpiry.Text, ddlIssuingCountry.SelectedValue, txtAlienNumber.Text,
                    txtSSN.Text, txtCurrLegalStatus.Text, txtCurrVisaIssued.Text, txtCurrVisaExpires.Text, txtVisaNumber.Text, txtConsulateVisaIssued.Text, 
                    txtI94Number.Text, txtExactNameOnI94.Text, txtMostRecentEntry.Text, txtPortOfEntry.Text, txtStatusOfEntry.Text, txtNameOfMilitary.Text, 
                    txtCityOfMil.Text, txtStateOfMil.Text, int.Parse(ddlCountryOfMil.SelectedValue), txtNatureOfGroup.Text, txtInvolvementFrom.Text, 
                    txtInvolvementTo.Text, rblAppliedVisa.SelectedValue=="1", txtCityOfConsulate.Text, int.Parse(ddlCountryOfConsulate.SelectedValue), 
                    rblVisaDecision.SelectedValue, txtDecisionDate.Text, rblHaveAppliedEAD.SelectedValue == "1", txtUSCISOffice.Text, txtEADDecision.Text
                   );
                cbkApplicantInfoChanged.Checked = false;
            }
            SetEditVisibility_AppInfo(true);
        }

        protected void btnCancel_AppInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_AppInfo(true);
        }

        protected void ApplicantInfo_Changed(object sender, EventArgs e)
        {
            cbkApplicantInfoChanged.Checked= true;
        }

        protected void SetEditVisibility_AppInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit1.Visible = bLock;
            btnCancel1.Visible = btnSave1.Visible = !bLock;

            txtLastName.ReadOnly = bLock;            txtLastName.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;           txtFirstName.BorderStyle = sBorder;
            txtMiddleName.ReadOnly = bLock;          txtMiddleName.BorderStyle = sBorder;
            txtMaidenName.ReadOnly = bLock;          txtMaidenName.BorderStyle = sBorder; 
            txtDateOfBirth.ReadOnly = bLock;         txtDateOfBirth.BorderStyle = sBorder; 
            txtCityOfBirth.ReadOnly = bLock;         txtCityOfBirth.BorderStyle = sBorder; 
            ddlCountryOfBirth.Enabled = !bLock;      ddlCountryOfBirth.BorderStyle = sBorder;
            ddlCitizenship.Enabled = !bLock;         ddlCitizenship.BorderStyle = sBorder;
            txtPhoneNumber.ReadOnly = bLock;         txtPhoneNumber.BorderStyle = sBorder; 
            txtEmailAddress.ReadOnly = bLock;        txtEmailAddress.BorderStyle = sBorder; 
            txtPassportNumber.ReadOnly = bLock;      txtPassportNumber.BorderStyle = sBorder; 
            txtDateOfIssue.ReadOnly = bLock;         txtDateOfIssue.BorderStyle = sBorder;
            txtDateOfExpiry.ReadOnly = bLock;        txtDateOfExpiry.BorderStyle = sBorder;
            ddlIssuingCountry.Enabled = bLock;       ddlIssuingCountry.BorderStyle = sBorder;
            txtAlienNumber.ReadOnly = bLock;         txtAlienNumber.BorderStyle = sBorder;
            txtSSN.ReadOnly = bLock;                 txtSSN.BorderStyle = sBorder;
            txtCurrLegalStatus.ReadOnly = bLock;     txtCurrLegalStatus.BorderStyle = sBorder; 
            txtCurrVisaIssued.ReadOnly = bLock;      txtCurrVisaIssued.BorderStyle = sBorder;
            txtCurrVisaExpires.ReadOnly = bLock;     txtCurrVisaExpires.BorderStyle = sBorder; 
            txtVisaNumber.ReadOnly = bLock;          txtVisaNumber.BorderStyle = sBorder;
            txtConsulateVisaIssued.ReadOnly = bLock; txtConsulateVisaIssued.BorderStyle = sBorder; 
            txtI94Number.ReadOnly = bLock;           txtI94Number.BorderStyle = sBorder; 
            txtExactNameOnI94.ReadOnly = bLock;      txtExactNameOnI94.BorderStyle = sBorder; 
            txtMostRecentEntry.ReadOnly = bLock;     txtMostRecentEntry.BorderStyle = sBorder; 
            txtPortOfEntry.ReadOnly = bLock;         txtPortOfEntry.BorderStyle = sBorder; 
            txtStatusOfEntry.ReadOnly = bLock;       txtStatusOfEntry.BorderStyle = sBorder;
            txtNameOfMilitary.ReadOnly = bLock;      txtNameOfMilitary.BorderStyle = sBorder; 
            txtCityOfMil.ReadOnly = bLock;           txtCityOfMil.BorderStyle = sBorder;
            txtStateOfMil.ReadOnly = bLock;          txtStateOfMil.BorderStyle = sBorder;
            ddlCountryOfMil.Enabled = !bLock;        ddlCountryOfMil.BorderStyle = sBorder;
            txtNatureOfGroup.ReadOnly = bLock;       txtNatureOfGroup.BorderStyle = sBorder;
            txtInvolvementFrom.ReadOnly = bLock;     txtInvolvementFrom.BorderStyle = sBorder; 
            txtInvolvementTo.ReadOnly = bLock;       txtInvolvementTo.BorderStyle = sBorder; 
            rblAppliedVisa.Enabled = !bLock;         rblAppliedVisa.BorderStyle = sBorder;
            txtCityOfConsulate.ReadOnly = bLock;     txtCityOfConsulate.BorderStyle = sBorder; 
            ddlCountryOfConsulate.Enabled = !bLock;  ddlCountryOfConsulate.BorderStyle = sBorder;
            rblVisaDecision.Enabled = !bLock;        rblVisaDecision.BorderStyle = sBorder;
            txtDecisionDate.ReadOnly = bLock;        txtDecisionDate.BorderStyle = sBorder; 
            rblHaveAppliedEAD.Enabled = !bLock;      rblHaveAppliedEAD.BorderStyle = sBorder;
            txtUSCISOffice.ReadOnly = bLock;         txtUSCISOffice.BorderStyle = sBorder; 
            txtEADDecision.ReadOnly = bLock;         txtEADDecision.BorderStyle = sBorder;
        }

        //-------------------------------------------------------------------------------------------Update Interprer's information----------------------------------------------------------------------------------------
       
        protected void btnEdit_InterpInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_InterpInfo(false);
        }

        protected void btnSave_InterpInfoClick(object sender, EventArgs e)
        {
            if (cbkInterpInfoChanged.Checked == true)
            {
                //save Interpreter info to db
                bd.UpdateI485_InterpInfo(user, labI485ID.Text, 
                    rblUnderstandEngOnI_485.SelectedValue == "1", txtLastNameOfInterp.Text, txtGivenNameOfInterp.Text, txtBusinessOfInterp.Text,
                    txtStreetOfInterp.Text, txtCityInterp.Text, txtStateOfInterp.Text, int.Parse(ddlCountryOfInterp.SelectedValue),
                    txtZipCodeOfInterp.Text, txtPhoneOfInterp.Text, txtEmailOfInterp.Text
                   );
                cbkInterpInfoChanged.Checked = false;
            }
            SetEditVisibility_InterpInfo(true);
        }


        protected void btnCancel_InterpInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_InterpInfo(true);
        }

        protected void InterpInfo_Changed(object sender, EventArgs e)
        {
            cbkInterpInfoChanged.Checked = true;
        }

        protected void SetEditVisibility_InterpInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit2.Visible = bLock;
            btnCancel2.Visible = btnSave2.Visible = !bLock;

            txtLastName.ReadOnly = bLock;
            txtLastName.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;
            txtFirstName.BorderStyle = sBorder;
            rblUnderstandEngOnI_485.Enabled = !bLock;
            rblUnderstandEngOnI_485.BorderStyle = sBorder;
            txtLastNameOfInterp.ReadOnly = bLock;
            txtLastNameOfInterp.BorderStyle = sBorder;
            txtGivenNameOfInterp.ReadOnly = bLock;
            txtGivenNameOfInterp.BorderStyle = sBorder;
            txtBusinessOfInterp.ReadOnly = bLock;
            txtBusinessOfInterp.BorderStyle = sBorder;
            txtStreetOfInterp.ReadOnly = bLock;
            txtStreetOfInterp.BorderStyle = sBorder;
            txtCityInterp.ReadOnly = bLock;
            txtCityInterp.BorderStyle = sBorder;
            txtStateOfInterp.ReadOnly = bLock;
            txtStateOfInterp.BorderStyle = sBorder;
            ddlCountryOfInterp.Enabled = !bLock;
            ddlCountryOfInterp.BorderStyle = sBorder;
            txtZipCodeOfInterp.ReadOnly = bLock;
            txtZipCodeOfInterp.BorderStyle = sBorder;
            txtPhoneOfInterp.ReadOnly = bLock;
            txtPhoneOfInterp.BorderStyle = sBorder;
            txtEmailOfInterp.ReadOnly = bLock;
            txtEmailOfInterp.BorderStyle = sBorder;

        }

        //-------------------------------------------------------------------------------------------Update Biographic Information----------------------------------------------------------------------------------------

        protected void btnEdit_BioInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_BioInfo(false);
        }

        protected void btnSave_BioInfoClick(object sender, EventArgs e)
        {
            if (cbkBioInfoChanged.Checked == true)
            {
                //save Biographic info to db
                bd.UpdateI485_BioInfo(user, labI485ID.Text,
                    rblEthnicity.SelectedValue == "1", rblRace.SelectedValue, txtHeightFt.Text, txtHeightIn.Text,
                    txtHeightCm.Text, txtWeightLbs.Text, txtWeightKg.Text, rblEyeColor.SelectedValue,
                    rblHairColor.SelectedValue  
                   );
                cbkBioInfoChanged.Checked = false;
            }
            SetEditVisibility_BioInfo(true);
        }


        protected void btnCancel_BioInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_BioInfo(true);
        }

        protected void BioInfo_Changed(object sender, EventArgs e)
        {
            cbkBioInfoChanged.Checked = true;
        }

        protected void SetEditVisibility_BioInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit3.Visible = bLock;
            btnCancel3.Visible = btnSave3.Visible = !bLock;

            rblEthnicity.Enabled = !bLock;
            rblEthnicity.BorderStyle = sBorder;
            rblRace.Enabled = !bLock;    
            rblRace.BorderStyle = sBorder;
            txtHeightFt.ReadOnly = bLock;               
            txtHeightFt.BorderStyle = sBorder;
            txtHeightIn.ReadOnly = bLock;               
            txtHeightIn.BorderStyle = sBorder;
            txtHeightCm.ReadOnly = bLock;               
            txtHeightCm.BorderStyle = sBorder;
            txtWeightLbs.ReadOnly = bLock;              
            txtWeightLbs.BorderStyle = sBorder;
            txtWeightKg.ReadOnly = bLock;               
            txtWeightKg.BorderStyle = sBorder;
            rblEyeColor.Enabled = !bLock; 
            rblEyeColor.BorderStyle = sBorder;
            rblHairColor.Enabled = !bLock;
            rblHairColor.BorderStyle = sBorder;

        }
        //-------------------------------------------------------------------------------------------Update Documentation Information----------------------------------------------------------------------------------------

        protected void btnEdit_DocInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_DocInfo(false);
        }

        protected void btnSave_DocInfoClick(object sender, EventArgs e)
        {
            if (cbkDocInfoChanged.Checked == true)
            {
                //save Documentaion info to db
                bd.UpdateI485_DocInfo(user, labI485ID.Text,
                    cbxFilingFee14over.Checked, cbxFilingFeeUnder14.Checked,
                    cbxSixPassportPhotos.Checked, cbxI693MedicalExam.Checked,
                    cbxFamilyRelCert_Original.Checked, cbxFamilyRelCert_Translated.Checked,
                    cbxMarriageCert_Original.Checked, cbxMarriageCert_Translated.Checked,
                    cbxBackgroundCheck_Original.Checked, cbxBackgroundCheck_Translated.Checked,
                    cbxCurrI_94.Checked, cbxCurrVisaPastVisas.Checked,
                    cbxTaxReturnsPast3Yrs.Checked, cbxI20.Checked
                   );
                cbkDocInfoChanged.Checked = false;
            }
            SetEditVisibility_DocInfo(true);
        }


        protected void btnCancel_DocInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_DocInfo(true);
        }

        protected void DocInfo_Changed(object sender, EventArgs e)
        {
            cbkDocInfoChanged.Checked = true;
        }

        protected void SetEditVisibility_DocInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit4.Visible = bLock;
            btnCancel4.Visible = btnSave4.Visible = !bLock;

            cbxFilingFee14over.Enabled = !bLock;           
            cbxFilingFee14over.BorderStyle = sBorder;
            cbxFilingFeeUnder14.Enabled = !bLock;           
            cbxFilingFeeUnder14.BorderStyle = sBorder;
            cbxSixPassportPhotos.Enabled = !bLock;          
            cbxSixPassportPhotos.BorderStyle = sBorder;
            cbxI693MedicalExam.Enabled = !bLock;            
            cbxI693MedicalExam.BorderStyle = sBorder;
            cbxFamilyRelCert_Original.Enabled = !bLock;     
            cbxFamilyRelCert_Original.BorderStyle = sBorder;
            cbxFamilyRelCert_Translated.Enabled = !bLock;   
            cbxFamilyRelCert_Translated.BorderStyle = sBorder;
            cbxMarriageCert_Original.Enabled = !bLock;      
            cbxMarriageCert_Original.BorderStyle = sBorder;
            cbxMarriageCert_Translated.Enabled = !bLock;    
            cbxMarriageCert_Translated.BorderStyle = sBorder;
            cbxBackgroundCheck_Original.Enabled = !bLock;   
            cbxBackgroundCheck_Original.BorderStyle = sBorder;
            cbxBackgroundCheck_Translated.Enabled = !bLock; 
            cbxBackgroundCheck_Translated.BorderStyle = sBorder;
            cbxCurrI_94.Enabled = !bLock;                   
            cbxCurrI_94.BorderStyle = sBorder;
            cbxCurrVisaPastVisas.Enabled = !bLock;          
            cbxCurrVisaPastVisas.BorderStyle = sBorder;
            cbxTaxReturnsPast3Yrs.Enabled = !bLock;         
            cbxTaxReturnsPast3Yrs.BorderStyle = sBorder;
            cbxI20.Enabled = !bLock;
            cbxI20.BorderStyle = sBorder;
            
        }


        //-------------------------------------------------------------------------------------------Update Background Information----------------------------------------------------------------------------------------

        protected void btnEdit_BackgroundInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_BackgroundInfo(false);
        }

        protected void btnSave_BackgroundInfoClick(object sender, EventArgs e)
        {
            if (cbkBackgroundInfoChanged.Checked == true)
            {
                //save Background info to db
                bd.UpdateI485_BackgroundInfo(user, labI485ID.Text, rbl1_AdmissionDeniedToUS.SelectedValue == "1", 
                    rbl2_VisaDeniedToUS.SelectedValue == "1", rbl3_WorkedUSWithoutAuthz.SelectedValue == "1", 
                    rbl4_ViolatedTerms.SelectedValue == "1", rbl5_InExclusion.SelectedValue == "1",
                    rbl6_IssuedFinalOrderExcl.SelectedValue == "1", rbl7_HadPriorFinalOrderExcl.SelectedValue == "1", 
                    rbl8_LawfulResident.SelectedValue == "1", rbl9_GrantedDeparture.SelectedValue == "1",
                    rbl10_AppliedProtection.SelectedValue == "1", rbl11_A_BeenNonimmigrant.SelectedValue == "1", 
                    rbl11_B_CompliedRequirement.SelectedValue == "1", rbl11_C_BeenGrantedWaiver.SelectedValue == "1",
                    rbl12_BeenArrested.SelectedValue == "1", rbl13_CommittedCrime.SelectedValue == "1", 
                    rbl14_PledGuilty.SelectedValue == "1", rbl15_BeenOrderedPunished.SelectedValue == "1",
                    rbl16_BeenDefendant.SelectedValue == "1", rbl17_ViolatedRegulation.SelectedValue == "1", 
                    rbl18_ConvictedForOffenses.SelectedValue == "1", rbl19_TraffickedSubstances.SelectedValue == "1",
                    rbl20_AidedTrafficking.SelectedValue == "1", rbl21_FamilyTrafficked.SelectedValue == "1", 
                    rbl22_EngagedInProstitution.SelectedValue == "1", rbl23_ProcuredProstitutes.SelectedValue == "1",
                    rbl24_ReceiveMoneyProstitution.SelectedValue == "1", rbl25_IntendToEngageGambling.SelectedValue == "1", 
                    rbl26_ExercisedImmunity.SelectedValue == "1", rbl27_ReligiousViolations.SelectedValue == "1", 
                    rbl28_InducedTrafficking.SelectedValue == "1", rbl29_TraffickedServitude.SelectedValue == "1",
                    rbl30_AbettedSexActs.SelectedValue == "1", rbl31_FamilyTrafficking.SelectedValue == "1", 
                    rbl32_MoneyLaundering.SelectedValue == "1", rbl33_ViolatesEspionage.SelectedValue == "1", 
                    rbl34_ProhibitingExport.SelectedValue == "1", rbl35_OverthrowingUSGov.SelectedValue == "1", 
                    rbl36_EndangerWelfare.SelectedValue == "1", rbl37_UnlawfulActivity.SelectedValue == "1", 
                    rbl38_InAdversePolicy.SelectedValue == "1", rbl39_CommittedCrime.SelectedValue == "1", 
                    rbl40_ParticipatedInGroup.SelectedValue == "1", rbl41_RecruitedMembers.SelectedValue == "1", 
                    rbl42_SupportActivities.SelectedValue == "1",rbl43_SupportIndividual.SelectedValue == "1", 
                    rbl44_MilitaryTraining.SelectedValue == "1", rbl45_IntendToEngageQ39To45.SelectedValue == "1",
                    rbl46_FamilyCommitted.SelectedValue == "1", rbl47_FamilyParticipated.SelectedValue == "1", 
                    rbl48_FamilyRecruited.SelectedValue == "1", rbl49_FamilySupportActivity.SelectedValue == "1", 
                    rbl50_FamilySupportIndividual.SelectedValue == "1", rbl51_FamilyMilitaryTraining.SelectedValue == "1", 
                    rbl52_SellingWeapons.SelectedValue == "1", rbl53_WorkedInPrison.SelectedValue == "1", 
                    rbl54_AssistedUsingWeapon.SelectedValue == "1", rbl55_ServedInArmedGroup.SelectedValue == "1", 
                    rbl56_AffiliatedCommunist.SelectedValue == "1", rbl57_IncitePersecution.SelectedValue == "1", 
                    rbl58_A_InvolvingGenocide.SelectedValue == "1", rbl58_B_KillingPerson.SelectedValue == "1", 
                    rbl58_C_InjuringPerson.SelectedValue == "1", rbl58_D_SexualContact.SelectedValue == "1", 
                    rbl58_E_LimitingAbility.SelectedValue == "1", rbl59_RecruitedPersUnder15.SelectedValue == "1", 
                    rbl60_UsedPersUnder15.SelectedValue == "1", rbl61_ReceivedUSAsst.SelectedValue == "1", 
                    rbl62_LikelyToReceiveAsst.SelectedValue == "1", rbl63_FailedToAttend.SelectedValue == "1", 
                    rbl64_ReasonableCause.SelectedValue == "1", rbl65_AttachWrittenStatement.SelectedValue == "1", 
                    rbl66_SubmittedFraudulentDoc.SelectedValue == "1", rbl67_LiedOnApplication.SelectedValue == "1", 
                    rbl68_ClaimedUSCitizen.SelectedValue == "1", rbl69_StowawayOnVessel.SelectedValue == "1", 
                    rbl70_EncouragedSmuggling.SelectedValue == "1", rbl71_UnderPenaltyForViolating.SelectedValue == "1", 
                    rbl72_BeenExcludedFromUS.SelectedValue == "1", rbl73_EnteredUSWithoutInsp.SelectedValue == "1",
                    rbl74_A_UnlawfullyInUS180Days.SelectedValue == "1", rbl74_B_UnlawfullyInUS1Year.SelectedValue == "1", 
                    rbl75_A_ReenteredWOInspection.SelectedValue == "1", rbl75_B_BeenDeported.SelectedValue == "1", 
                    rbl76_PlanPolygamy.SelectedValue == "1", rbl77_AccompanyForeigner.SelectedValue == "1", 
                    rbl78_AssistedInDetaining.SelectedValue == "1", rbl79_VotedInViolation.SelectedValue == "1", 
                    rbl80_RenouncedUSCitizenship.SelectedValue == "1", rbl81_AppliedExemption.SelectedValue == "1",
                    rbl82_RelievedFromService.SelectedValue == "1", rbl83_ConvictedDesertion.SelectedValue == "1", 
                    rbl84_RemainedOutsideUS.SelectedValue == "1", rbl85_ImmigrationStatus.SelectedValue == "1"
                   );
                cbkBackgroundInfoChanged.Checked = false;
            }
            SetEditVisibility_BackgroundInfo(true);
        }

        protected void btnCancel_BackgroundInfoClick(object sender, EventArgs e)
        {
            SetEditVisibility_BackgroundInfo(true);
        }

        protected void BackgroundInfo_Changed(object sender, EventArgs e)
        {
            cbkBackgroundInfoChanged.Checked = true;
        }

        protected void SetEditVisibility_BackgroundInfo(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEdit5.Visible = bLock;
            btnCancel5.Visible = btnSave5.Visible = !bLock;


            rbl1_AdmissionDeniedToUS.Enabled = !bLock;              rbl1_AdmissionDeniedToUS.BorderStyle = sBorder; 
            rbl2_VisaDeniedToUS.Enabled = !bLock;                   rbl2_VisaDeniedToUS.BorderStyle = sBorder; 
            rbl3_WorkedUSWithoutAuthz.Enabled = !bLock;             rbl3_WorkedUSWithoutAuthz.BorderStyle = sBorder; 
            rbl4_ViolatedTerms.Enabled = !bLock;                    rbl4_ViolatedTerms.BorderStyle = sBorder; 
            rbl5_InExclusion.Enabled = !bLock;                      rbl5_InExclusion.BorderStyle = sBorder;
            rbl6_IssuedFinalOrderExcl.Enabled = !bLock;             rbl6_IssuedFinalOrderExcl.BorderStyle = sBorder; 
            rbl7_HadPriorFinalOrderExcl.Enabled = !bLock;           rbl7_HadPriorFinalOrderExcl.BorderStyle = sBorder; 
            rbl8_LawfulResident.Enabled = !bLock;                   rbl8_LawfulResident.BorderStyle = sBorder; 
            rbl9_GrantedDeparture.Enabled = !bLock;                 rbl9_GrantedDeparture.BorderStyle = sBorder;
            rbl10_AppliedProtection.Enabled = !bLock;               rbl10_AppliedProtection.BorderStyle = sBorder; 
            rbl11_A_BeenNonimmigrant.Enabled = !bLock;              rbl11_A_BeenNonimmigrant.BorderStyle = sBorder; 
            rbl11_B_CompliedRequirement.Enabled = !bLock;           rbl11_B_CompliedRequirement.BorderStyle = sBorder; 
            rbl11_C_BeenGrantedWaiver.Enabled = !bLock;             rbl11_C_BeenGrantedWaiver.BorderStyle = sBorder;
            rbl12_BeenArrested.Enabled = !bLock;                    rbl12_BeenArrested.BorderStyle = sBorder; 
            rbl13_CommittedCrime.Enabled = !bLock;                  rbl13_CommittedCrime.BorderStyle = sBorder; 
            rbl14_PledGuilty.Enabled = !bLock;                      rbl14_PledGuilty.BorderStyle = sBorder; 
            rbl15_BeenOrderedPunished.Enabled = !bLock;             rbl15_BeenOrderedPunished.BorderStyle = sBorder;
            rbl16_BeenDefendant.Enabled = !bLock;                   rbl16_BeenDefendant.BorderStyle = sBorder; 
            rbl17_ViolatedRegulation.Enabled = !bLock;              rbl17_ViolatedRegulation.BorderStyle = sBorder; 
            rbl18_ConvictedForOffenses.Enabled = !bLock;            rbl18_ConvictedForOffenses.BorderStyle = sBorder; 
            rbl19_TraffickedSubstances.Enabled = !bLock;            rbl19_TraffickedSubstances.BorderStyle = sBorder;
            rbl20_AidedTrafficking.Enabled = !bLock;                rbl20_AidedTrafficking.BorderStyle = sBorder; 
            rbl21_FamilyTrafficked.Enabled = !bLock;                rbl21_FamilyTrafficked.BorderStyle = sBorder; 
            rbl22_EngagedInProstitution.Enabled = !bLock;           rbl22_EngagedInProstitution.BorderStyle = sBorder; 
            rbl23_ProcuredProstitutes.Enabled = !bLock;             rbl23_ProcuredProstitutes.BorderStyle = sBorder;
            rbl24_ReceiveMoneyProstitution.Enabled = !bLock;        rbl24_ReceiveMoneyProstitution.BorderStyle = sBorder; 
            rbl25_IntendToEngageGambling.Enabled = !bLock;          rbl25_IntendToEngageGambling.BorderStyle = sBorder; 
            rbl26_ExercisedImmunity.Enabled = !bLock;               rbl26_ExercisedImmunity.BorderStyle = sBorder; 
            rbl27_ReligiousViolations.Enabled = !bLock;             rbl27_ReligiousViolations.BorderStyle = sBorder; 
            rbl28_InducedTrafficking.Enabled = !bLock;              rbl28_InducedTrafficking.BorderStyle = sBorder; 
            rbl29_TraffickedServitude.Enabled = !bLock;             rbl29_TraffickedServitude.BorderStyle = sBorder;
            rbl30_AbettedSexActs.Enabled = !bLock;                  rbl30_AbettedSexActs.BorderStyle = sBorder; 
            rbl31_FamilyTrafficking.Enabled = !bLock;               rbl31_FamilyTrafficking.BorderStyle = sBorder; 
            rbl32_MoneyLaundering.Enabled = !bLock;                 rbl32_MoneyLaundering.BorderStyle = sBorder;
            rbl33_ViolatesEspionage.Enabled = !bLock;               rbl33_ViolatesEspionage.BorderStyle = sBorder; 
            rbl34_ProhibitingExport.Enabled = !bLock;               rbl34_ProhibitingExport.BorderStyle = sBorder; 
            rbl35_OverthrowingUSGov.Enabled = !bLock;               rbl35_OverthrowingUSGov.BorderStyle = sBorder; 
            rbl36_EndangerWelfare.Enabled = !bLock;                 rbl36_EndangerWelfare.BorderStyle = sBorder; 
            rbl37_UnlawfulActivity.Enabled = !bLock;                rbl37_UnlawfulActivity.BorderStyle = sBorder; 
            rbl38_InAdversePolicy.Enabled = !bLock;                 rbl38_InAdversePolicy.BorderStyle = sBorder;
            rbl39_CommittedCrime.Enabled = !bLock;                  rbl39_CommittedCrime.BorderStyle = sBorder; 
            rbl40_ParticipatedInGroup.Enabled = !bLock;             rbl40_ParticipatedInGroup.BorderStyle = sBorder; 
            rbl41_RecruitedMembers.Enabled = !bLock;                rbl41_RecruitedMembers.BorderStyle = sBorder; 
            rbl42_SupportActivities.Enabled = !bLock;               rbl42_SupportActivities.BorderStyle = sBorder;
            rbl43_SupportIndividual.Enabled = !bLock;               rbl43_SupportIndividual.BorderStyle = sBorder; 
            rbl44_MilitaryTraining.Enabled = !bLock;                rbl44_MilitaryTraining.BorderStyle = sBorder; 
            rbl45_IntendToEngageQ39To45.Enabled = !bLock;           rbl45_IntendToEngageQ39To45.BorderStyle = sBorder;
            rbl46_FamilyCommitted.Enabled = !bLock;                 rbl46_FamilyCommitted.BorderStyle = sBorder; 
            rbl47_FamilyParticipated.Enabled = !bLock;              rbl47_FamilyParticipated.BorderStyle = sBorder; 
            rbl48_FamilyRecruited.Enabled = !bLock;                 rbl48_FamilyRecruited.BorderStyle = sBorder; 
            rbl49_FamilySupportActivity.Enabled = !bLock;           rbl49_FamilySupportActivity.BorderStyle = sBorder; 
            rbl50_FamilySupportIndividual.Enabled = !bLock;         rbl50_FamilySupportIndividual.BorderStyle = sBorder; 
            rbl51_FamilyMilitaryTraining.Enabled = !bLock;          rbl51_FamilyMilitaryTraining.BorderStyle = sBorder; 
            rbl52_SellingWeapons.Enabled = !bLock;                  rbl52_SellingWeapons.BorderStyle = sBorder; 
            rbl53_WorkedInPrison.Enabled = !bLock;                  rbl53_WorkedInPrison.BorderStyle = sBorder; 
            rbl54_AssistedUsingWeapon.Enabled = !bLock;             rbl54_AssistedUsingWeapon.BorderStyle = sBorder; 
            rbl55_ServedInArmedGroup.Enabled = !bLock;              rbl55_ServedInArmedGroup.BorderStyle = sBorder; 
            rbl56_AffiliatedCommunist.Enabled = !bLock;             rbl56_AffiliatedCommunist.BorderStyle = sBorder; 
            rbl57_IncitePersecution.Enabled = !bLock;               rbl57_IncitePersecution.BorderStyle = sBorder; 
            rbl58_A_InvolvingGenocide.Enabled = !bLock;             rbl58_A_InvolvingGenocide.BorderStyle = sBorder; 
            rbl58_B_KillingPerson.Enabled = !bLock;                 rbl58_B_KillingPerson.BorderStyle = sBorder; 
            rbl58_C_InjuringPerson.Enabled = !bLock;                rbl58_C_InjuringPerson.BorderStyle = sBorder; 
            rbl58_D_SexualContact.Enabled = !bLock;                 rbl58_D_SexualContact.BorderStyle = sBorder; 
            rbl58_E_LimitingAbility.Enabled = !bLock;               rbl58_E_LimitingAbility.BorderStyle = sBorder; 
            rbl59_RecruitedPersUnder15.Enabled = !bLock;            rbl59_RecruitedPersUnder15.BorderStyle = sBorder; 
            rbl60_UsedPersUnder15.Enabled = !bLock;                 rbl60_UsedPersUnder15.BorderStyle = sBorder;
            rbl61_ReceivedUSAsst.Enabled = !bLock;                  rbl61_ReceivedUSAsst.BorderStyle = sBorder; 
            rbl62_LikelyToReceiveAsst.Enabled = !bLock;             rbl62_LikelyToReceiveAsst.BorderStyle = sBorder; 
            rbl63_FailedToAttend.Enabled = !bLock;                  rbl63_FailedToAttend.BorderStyle = sBorder; 
            rbl64_ReasonableCause.Enabled = !bLock;                 rbl64_ReasonableCause.BorderStyle = sBorder; 
            rbl65_AttachWrittenStatement.Enabled = !bLock;          rbl65_AttachWrittenStatement.BorderStyle = sBorder; 
            rbl66_SubmittedFraudulentDoc.Enabled = !bLock;          rbl66_SubmittedFraudulentDoc.BorderStyle = sBorder; 
            rbl67_LiedOnApplication.Enabled = !bLock;               rbl67_LiedOnApplication.BorderStyle = sBorder; 
            rbl68_ClaimedUSCitizen.Enabled = !bLock;                rbl68_ClaimedUSCitizen.BorderStyle = sBorder; 
            rbl69_StowawayOnVessel.Enabled = !bLock;                rbl69_StowawayOnVessel.BorderStyle = sBorder; 
            rbl70_EncouragedSmuggling.Enabled = !bLock;             rbl70_EncouragedSmuggling.BorderStyle = sBorder;
            rbl71_UnderPenaltyForViolating.Enabled = !bLock;        rbl71_UnderPenaltyForViolating.BorderStyle = sBorder; 
            rbl72_BeenExcludedFromUS.Enabled = !bLock;              rbl72_BeenExcludedFromUS.BorderStyle = sBorder;
            rbl73_EnteredUSWithoutInsp.Enabled = !bLock;            rbl73_EnteredUSWithoutInsp.BorderStyle = sBorder;
            rbl74_A_UnlawfullyInUS180Days.Enabled = !bLock;         rbl74_A_UnlawfullyInUS180Days.BorderStyle = sBorder;
            rbl74_B_UnlawfullyInUS1Year.Enabled = !bLock;           rbl74_B_UnlawfullyInUS1Year.BorderStyle = sBorder; 
            rbl75_A_ReenteredWOInspection.Enabled = !bLock;         rbl75_A_ReenteredWOInspection.BorderStyle = sBorder;
            rbl75_B_BeenDeported.Enabled = !bLock;                  rbl75_B_BeenDeported.BorderStyle = sBorder; 
            rbl76_PlanPolygamy.Enabled = !bLock;                    rbl76_PlanPolygamy.BorderStyle = sBorder; 
            rbl77_AccompanyForeigner.Enabled = !bLock;              rbl77_AccompanyForeigner.BorderStyle = sBorder; 
            rbl78_AssistedInDetaining.Enabled = !bLock;             rbl78_AssistedInDetaining.BorderStyle = sBorder; 
            rbl79_VotedInViolation.Enabled = !bLock;                rbl79_VotedInViolation.BorderStyle = sBorder; 
            rbl80_RenouncedUSCitizenship.Enabled = !bLock;          rbl80_RenouncedUSCitizenship.BorderStyle = sBorder;
            rbl81_AppliedExemption.Enabled = !bLock;                rbl81_AppliedExemption.BorderStyle = sBorder;
            rbl82_RelievedFromService.Enabled = !bLock;             rbl82_RelievedFromService.BorderStyle = sBorder;
            rbl83_ConvictedDesertion.Enabled = !bLock;              rbl83_ConvictedDesertion.BorderStyle = sBorder; 
            rbl84_RemainedOutsideUS.Enabled = !bLock;               rbl84_RemainedOutsideUS.BorderStyle = sBorder; 
            rbl85_ImmigrationStatus.Enabled = !bLock;               rbl85_ImmigrationStatus.BorderStyle = sBorder;

        }

        //-------------------------------------------------------------------------------------------Populate I485----------------------------------------------------------------------------------------
        protected void ddlFamilyMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            labReferenceID.Text = ddlFamilyMember.SelectedValue.ToString();
            DataTable dt = (DataTable)ViewState["FamilyI485"];

            DataRow[] drs = dt.Select("ApplicantFamilyID = '" + labReferenceID.Text + "'");
            labI485ID.Text = drs[0]["I485ID"].ToString();
            labRelationshipID.Text = drs[0]["RelationshipID"].ToString();

            PopulateI485();

            SetEditVisibility_AppInfo(labI485ID.Text!="0");
            SetEditVisibility_InterpInfo(labI485ID.Text != "0");
            SetEditVisibility_BioInfo(labI485ID.Text != "0");
            SetEditVisibility_DocInfo(labI485ID.Text != "0");
            SetEditVisibility_BackgroundInfo(labI485ID.Text != "0");

        }

        private void PopulateI485()
        {

            DataTable dtI485 = bd.GetI485(user, labI485ID.Text);
            DataRow dr;
            if (dtI485 != null && dtI485.Rows.Count == 1 ) 
            {
                dr = dtI485.Rows[0];
            }
            else
            {
                dr = dtI485.NewRow();
            }

            txtLastName.Text = dr["LastName"].ToString();
            txtFirstName.Text = dr["FirstName"].ToString();
            txtMiddleName.Text = dr["MiddleName"].ToString();
            txtMaidenName.Text = dr["MaidenName"].ToString();
            txtDateOfBirth.Text = BaseData.StringToDateFormat(dr["DateOfBirth"]);
            txtCityOfBirth.Text = dr["CityOfBirth"].ToString();
            ddlCountryOfBirth.SelectedValue = dr["CountryOfBirth"].ToString()=="" ? "0" : dr["CountryOfBirth"].ToString();
            ddlCitizenship.SelectedValue = dr["Citizenship"].ToString()=="" ? "0" : dr["Citizenship"].ToString();
            txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
            txtEmailAddress.Text = dr["EmailAddress"].ToString();
            txtPassportNumber.Text = dr["PassportNumber"].ToString();
            ddlIssuingCountry.SelectedValue = dr["CountryOfMil"].ToString() == "" ? "0" : dr["IssuingCountry"].ToString();
            txtDateOfIssue.Text = BaseData.StringToDateFormat(dr["DateOfIssue"]);
            txtDateOfExpiry.Text = BaseData.StringToDateFormat(dr["DateOfExpiry"]);
            txtAlienNumber.Text = dr["AlienNumber"].ToString();
            txtSSN.Text = dr["SSN"].ToString();
            txtCurrLegalStatus.Text = dr["CurrLegalStatus"].ToString();
            txtCurrVisaIssued.Text = BaseData.StringToDateFormat(dr["CurrVisaIssued"]);
            txtCurrVisaExpires.Text = BaseData.StringToDateFormat(dr["CurrVisaExpires"]);
            txtVisaNumber.Text = dr["VisaNumber"].ToString();
            txtConsulateVisaIssued.Text = dr["ConsulateVisaIssued"].ToString();
            txtI94Number.Text = dr["I94Number"].ToString();
            txtExactNameOnI94.Text = dr["ExactNameOnI94"].ToString();
            txtMostRecentEntry.Text = BaseData.StringToDateFormat(dr["MostRecentEntry"]);
            txtPortOfEntry.Text = dr["PortOfEntry"].ToString();
            txtStatusOfEntry.Text = dr["StatusOfEntry"].ToString();
            txtNameOfMilitary.Text = dr["NameOfMilitary"].ToString();
            txtCityOfMil.Text = dr["CityOfMil"].ToString();
            txtStateOfMil.Text = dr["StateOfMil"].ToString();
            ddlCountryOfMil.SelectedValue = dr["CountryOfMil"].ToString()=="" ? "0" : dr["CountryOfMil"].ToString();
            txtNatureOfGroup.Text = dr["NatureOfGroup"].ToString();
            txtInvolvementFrom.Text = BaseData.StringToDateFormat(dr["InvolvementFrom"]);
            txtInvolvementTo.Text = BaseData.StringToDateFormat(dr["InvolvementTo"]);
            rblAppliedVisa.SelectedValue = BaseData.BoolToDefault(dr["HaveAppliedVisa"], null);  
            txtCityOfConsulate.Text = dr["CityOfConsulate"].ToString();
            ddlCountryOfConsulate.SelectedValue = dr["CountryOfConsulate"].ToString()=="" ? "0" : dr["CountryOfConsulate"].ToString();
            rblVisaDecision.SelectedValue = BaseData.StringToDefault(dr["VisaDecision"], null);
            //if(dr["VisaDecision"].ToString()==String.Empty)
            //{
            //    rblVisaDecision.SelectedValue = null;
            //}
            //else
            //{
            //    rblVisaDecision.SelectedValue = dr["VisaDecision"].ToString();
            //}
            txtDecisionDate.Text = BaseData.StringToDateFormat(dr["DecisionDate"]);
            rblHaveAppliedEAD.SelectedValue = BaseData.BoolToDefault(dr["HaveAppliedEAD"], null);  
            txtUSCISOffice.Text = dr["USCISOffice"].ToString();
            txtEADDecision.Text = dr["EADDecision"].ToString();

            //Interprer's information
            rblUnderstandEngOnI_485.SelectedValue = BaseData.BoolToDefault(dr["UnderstandEngOnI_485"], null); 
            txtLastNameOfInterp.Text = dr["LastNameOfInterp"].ToString();
            txtGivenNameOfInterp.Text = dr["GivenNameOfInterp"].ToString();
            txtBusinessOfInterp.Text = dr["BusinessOfInterp"].ToString();
            txtStreetOfInterp.Text = dr["StreetOfInterp"].ToString();
            txtCityInterp.Text = dr["CityInterp"].ToString();
            txtStateOfInterp.Text = dr["StateOfInterp"].ToString();
            txtZipCodeOfInterp.Text = dr["ZipCodeOfInterp"].ToString();
            ddlCountryOfInterp.SelectedValue = dr["CountryOfInterp"].ToString()=="" ? "0" : dr["CountryOfInterp"].ToString();
            txtPhoneOfInterp.Text = dr["PhoneOfInterp"].ToString();
            txtEmailOfInterp.Text = dr["EmailOfInterp"].ToString();

            //Biographic Information
            rblEthnicity.SelectedValue = BaseData.BoolToDefault(dr["Ethnicity"], null);
            rblRace.SelectedValue = BaseData.StringToDefault(dr["Race"], null);
            ////rblRace.SelectedValue = dr["Race"].ToString();
            //if (dr["Race"].ToString() == String.Empty)
            //{
            //    rblRace.SelectedValue = null;
            //}
            //else
            //{
            //    rblRace.SelectedValue = dr["Race"].ToString();
            //}
            txtHeightFt.Text = dr["HeightFt"].ToString();
            txtHeightIn.Text = dr["HeightIn"].ToString();
            txtHeightCm.Text = dr["HeightCm"].ToString();
            txtWeightLbs.Text = dr["WeightLbs"].ToString();
            txtWeightKg.Text = dr["WeightKg"].ToString();
            rblEyeColor.SelectedValue = BaseData.StringToDefault(dr["EyeColor"], null);
            rblHairColor.SelectedValue = BaseData.StringToDefault(dr["HairColor"], null);

            ////Documentation
            cbxFilingFee14over.Checked = dr["FilingFee14over"].ToString() == "True";
            cbxFilingFeeUnder14.Checked = dr["FilingFeeUnder14"].ToString() == "True";
            cbxSixPassportPhotos.Checked = dr["SixPassportPhotos"].ToString() == "True";
            cbxI693MedicalExam.Checked = dr["I693MedicalExam"].ToString() == "True";
            cbxFamilyRelCert_Original.Checked = dr["familyrelcert_original"].ToString() == "True";
            cbxFamilyRelCert_Translated.Checked = dr["familyrelcert_translated"].ToString() == "True";
            cbxMarriageCert_Original.Checked = dr["marriagecert_original"].ToString() == "True";
            cbxMarriageCert_Translated.Checked = dr["marriagecert_translated"].ToString() == "True";
            cbxBackgroundCheck_Original.Checked = dr["backgroundcheck_original"].ToString() == "True";
            cbxBackgroundCheck_Translated.Checked = dr["backgroundcheck_translated"].ToString() == "True";
            cbxCurrI_94.Checked = dr["CurrI_94"].ToString() == "True";
            cbxCurrVisaPastVisas.Checked = dr["CurrVisaPastVisas"].ToString() == "True";
            cbxTaxReturnsPast3Yrs.Checked = dr["TaxReturnsPast3Yrs"].ToString() == "True";
            cbxI20.Checked = dr["I_20s"].ToString() == "True";


            //Your Background Information
            rbl1_AdmissionDeniedToUS.SelectedValue = BaseData.BoolToDefault(dr["1_AdmissionDeniedToUS"], null); 
            rbl2_VisaDeniedToUS.SelectedValue = BaseData.BoolToDefault(dr["2_VisaDeniedToUS"], null); 
            rbl3_WorkedUSWithoutAuthz.SelectedValue = BaseData.BoolToDefault(dr["3_WorkedUSWithoutAuthz"], null); 
            rbl4_ViolatedTerms.SelectedValue = BaseData.BoolToDefault(dr["4_ViolatedTerms"], null);
            rbl5_InExclusion.SelectedValue = BaseData.BoolToDefault(dr["5_InExclusion"], null); 
            rbl6_IssuedFinalOrderExcl.SelectedValue = BaseData.BoolToDefault(dr["6_IssuedFinalOrderExcl"], null); 
            rbl7_HadPriorFinalOrderExcl.SelectedValue = BaseData.BoolToDefault(dr["7_HadPriorFinalOrderExcl"], null); 
            rbl8_LawfulResident.SelectedValue = BaseData.BoolToDefault(dr["8_LawfulResident"], null); 
            rbl9_GrantedDeparture.SelectedValue = BaseData.BoolToDefault(dr["9_GrantedDeparture"], null); 
            rbl10_AppliedProtection.SelectedValue = BaseData.BoolToDefault(dr["10_AppliedProtection"], null); 
            rbl11_A_BeenNonimmigrant.SelectedValue = BaseData.BoolToDefault(dr["11_A_BeenNonimmigrant"], null); 
            rbl11_B_CompliedRequirement.SelectedValue = BaseData.BoolToDefault(dr["11_B_CompliedRequirement"], null); 
            rbl11_C_BeenGrantedWaiver.SelectedValue = BaseData.BoolToDefault(dr["11_C_BeenGrantedWaiver"], null); 
            rbl12_BeenArrested.SelectedValue = BaseData.BoolToDefault(dr["12_BeenArrested"], null); 
            rbl13_CommittedCrime.SelectedValue = BaseData.BoolToDefault(dr["13_CommittedCrime"], null); 
            rbl14_PledGuilty.SelectedValue = BaseData.BoolToDefault(dr["14_PledGuilty"], null); 
            rbl15_BeenOrderedPunished.SelectedValue = BaseData.BoolToDefault(dr["15_BeenOrderedPunished"], null); 
            rbl16_BeenDefendant.SelectedValue = BaseData.BoolToDefault(dr["16_BeenDefendant"], null); 
            rbl17_ViolatedRegulation.SelectedValue = BaseData.BoolToDefault(dr["17_ViolatedRegulation"], null); 
            rbl18_ConvictedForOffenses.SelectedValue = BaseData.BoolToDefault(dr["18_ConvictedForOffenses"], null);
            rbl19_TraffickedSubstances.SelectedValue = BaseData.BoolToDefault(dr["19_TraffickedSubstances"], null); 
            rbl20_AidedTrafficking.SelectedValue = BaseData.BoolToDefault(dr["20_AidedTrafficking"], null); 
            rbl21_FamilyTrafficked.SelectedValue = BaseData.BoolToDefault(dr["21_FamilyTrafficked"], null); 
            rbl22_EngagedInProstitution.SelectedValue = BaseData.BoolToDefault(dr["22_EngagedInProstitution"], null); 
            rbl23_ProcuredProstitutes.SelectedValue = BaseData.BoolToDefault(dr["23_ProcuredProstitutes"], null); 
            rbl24_ReceiveMoneyProstitution.SelectedValue = BaseData.BoolToDefault(dr["24_ReceiveMoneyProstitution"], null); 
            rbl25_IntendToEngageGambling.SelectedValue = BaseData.BoolToDefault(dr["25_IntendToEngageGambling"], null); 
            rbl26_ExercisedImmunity.SelectedValue = BaseData.BoolToDefault(dr["26_ExercisedImmunity"], null); 
            rbl27_ReligiousViolations.SelectedValue = BaseData.BoolToDefault(dr["27_ReligiousViolations"], null); 
            rbl28_InducedTrafficking.SelectedValue = BaseData.BoolToDefault(dr["28_InducedTrafficking"], null);
            rbl29_TraffickedServitude.SelectedValue = BaseData.BoolToDefault(dr["29_TraffickedServitude"], null); 
            rbl30_AbettedSexActs.SelectedValue = BaseData.BoolToDefault(dr["30_AbettedSexActs"], null); 
            rbl31_FamilyTrafficking.SelectedValue = BaseData.BoolToDefault(dr["31_FamilyTrafficking"], null);
            rbl32_MoneyLaundering.SelectedValue = BaseData.BoolToDefault(dr["32_MoneyLaundering"], null); 
            rbl33_ViolatesEspionage.SelectedValue = BaseData.BoolToDefault(dr["33_ViolatesEspionage"], null);
            rbl34_ProhibitingExport.SelectedValue = BaseData.BoolToDefault(dr["34_ProhibitingExport"], null); 
            rbl35_OverthrowingUSGov.SelectedValue = BaseData.BoolToDefault(dr["35_OverthrowingUSGov"], null); 
            rbl36_EndangerWelfare.SelectedValue = BaseData.BoolToDefault(dr["36_EndangerWelfare"], null); 
            rbl37_UnlawfulActivity.SelectedValue = BaseData.BoolToDefault(dr["37_UnlawfulActivity"], null); 
            rbl38_InAdversePolicy.SelectedValue = BaseData.BoolToDefault(dr["38_InAdversePolicy"], null);
            rbl39_CommittedCrime.SelectedValue = BaseData.BoolToDefault(dr["39_CommittedCrime"], null); 
            rbl40_ParticipatedInGroup.SelectedValue = BaseData.BoolToDefault(dr["40_ParticipatedInGroup"], null); 
            rbl41_RecruitedMembers.SelectedValue = BaseData.BoolToDefault(dr["41_RecruitedMembers"], null); 
            rbl42_SupportActivities.SelectedValue = BaseData.BoolToDefault(dr["42_SupportActivities"], null);
            rbl43_SupportIndividual.SelectedValue = BaseData.BoolToDefault(dr["43_SupportIndividual"], null); 
            rbl44_MilitaryTraining.SelectedValue = BaseData.BoolToDefault(dr["44_MilitaryTraining"], null); 
            rbl45_IntendToEngageQ39To45.SelectedValue = BaseData.BoolToDefault(dr["45_IntendToEngageQ39To45"], null); 
            rbl46_FamilyCommitted.SelectedValue = BaseData.BoolToDefault(dr["46_FamilyCommitted"], null);
            rbl47_FamilyParticipated.SelectedValue = BaseData.BoolToDefault(dr["47_FamilyParticipated"], null);
            rbl48_FamilyRecruited.SelectedValue = BaseData.BoolToDefault(dr["48_FamilyRecruited"], null); 
            rbl49_FamilySupportActivity.SelectedValue = BaseData.BoolToDefault(dr["49_FamilySupportActivity"], null); 
            rbl50_FamilySupportIndividual.SelectedValue = BaseData.BoolToDefault(dr["50_FamilySupportIndividual"], null); 
            rbl51_FamilyMilitaryTraining.SelectedValue = BaseData.BoolToDefault(dr["51_FamilyMilitaryTraining"], null); 
            rbl52_SellingWeapons.SelectedValue = BaseData.BoolToDefault(dr["52_SellingWeapons"], null); 
            rbl53_WorkedInPrison.SelectedValue = BaseData.BoolToDefault(dr["53_WorkedInPrison"], null); 
            rbl54_AssistedUsingWeapon.SelectedValue = BaseData.BoolToDefault(dr["54_AssistedUsingWeapon"], null);
            rbl55_ServedInArmedGroup.SelectedValue = BaseData.BoolToDefault(dr["55_ServedInArmedGroup"], null);
            rbl56_AffiliatedCommunist.SelectedValue = BaseData.BoolToDefault(dr["56_AffiliatedCommunist"], null);
            rbl57_IncitePersecution.SelectedValue = BaseData.BoolToDefault(dr["57_IncitePersecution"], null);
            rbl58_A_InvolvingGenocide.SelectedValue = BaseData.BoolToDefault(dr["58_A_InvolvingGenocide"], null);
            rbl58_B_KillingPerson.SelectedValue = BaseData.BoolToDefault(dr["58_B_KillingPerson"], null); 
            rbl58_C_InjuringPerson.SelectedValue = BaseData.BoolToDefault(dr["58_C_InjuringPerson"], null); 
            rbl58_D_SexualContact.SelectedValue = BaseData.BoolToDefault(dr["58_D_SexualContact"], null); 
            rbl58_E_LimitingAbility.SelectedValue = BaseData.BoolToDefault(dr["58_E_LimitingAbility"], null); 
            rbl59_RecruitedPersUnder15.SelectedValue = BaseData.BoolToDefault(dr["59_RecruitedPersUnder15"], null); 
            rbl60_UsedPersUnder15.SelectedValue = BaseData.BoolToDefault(dr["60_UsedPersUnder15"], null); 
            rbl61_ReceivedUSAsst.SelectedValue = BaseData.BoolToDefault(dr["61_ReceivedUSAsst"], null); 
            rbl62_LikelyToReceiveAsst.SelectedValue = BaseData.BoolToDefault(dr["62_LikelyToReceiveAsst"], null); 
            rbl63_FailedToAttend.SelectedValue = BaseData.BoolToDefault(dr["63_FailedToAttend"], null); 
            rbl64_ReasonableCause.SelectedValue = BaseData.BoolToDefault(dr["64_ReasonableCause"], null); 
            rbl65_AttachWrittenStatement.SelectedValue = BaseData.BoolToDefault(dr["65_AttachWrittenStatement"], null); 
            rbl66_SubmittedFraudulentDoc.SelectedValue = BaseData.BoolToDefault(dr["66_SubmittedFraudulentDoc"], null); 
            rbl67_LiedOnApplication.SelectedValue = BaseData.BoolToDefault(dr["67_LiedOnApplication"], null); 
            rbl68_ClaimedUSCitizen.SelectedValue = BaseData.BoolToDefault(dr["68_ClaimedUSCitizen"], null); 
            rbl69_StowawayOnVessel.SelectedValue = BaseData.BoolToDefault(dr["69_StowawayOnVessel"], null); 
            rbl70_EncouragedSmuggling.SelectedValue = BaseData.BoolToDefault(dr["70_EncouragedSmuggling"], null); 
            rbl71_UnderPenaltyForViolating.SelectedValue = BaseData.BoolToDefault(dr["71_UnderPenaltyForViolating"], null); 
            rbl72_BeenExcludedFromUS.SelectedValue = BaseData.BoolToDefault(dr["72_BeenExcludedFromUS"], null); 
            rbl73_EnteredUSWithoutInsp.SelectedValue = BaseData.BoolToDefault(dr["73_EnteredUSWithoutInsp"], null); 
            rbl74_A_UnlawfullyInUS180Days.SelectedValue = BaseData.BoolToDefault(dr["74_A_UnlawfullyInUS180Days"], null); 
            rbl74_B_UnlawfullyInUS1Year.SelectedValue = BaseData.BoolToDefault(dr["74_B_UnlawfullyInUS1Year"], null);
            rbl75_A_ReenteredWOInspection.SelectedValue = BaseData.BoolToDefault(dr["75_A_ReenteredWOInspection"], null); 
            rbl75_B_BeenDeported.SelectedValue = BaseData.BoolToDefault(dr["75_B_BeenDeported"], null); 
            rbl76_PlanPolygamy.SelectedValue = BaseData.BoolToDefault(dr["76_PlanPolygamy"], null);
            rbl77_AccompanyForeigner.SelectedValue = BaseData.BoolToDefault(dr["77_AccompanyForeigner"], null); 
            rbl78_AssistedInDetaining.SelectedValue = BaseData.BoolToDefault(dr["78_AssistedInDetaining"], null);
            rbl79_VotedInViolation.SelectedValue = BaseData.BoolToDefault(dr["79_VotedInViolation"], null); 
            rbl80_RenouncedUSCitizenship.SelectedValue = BaseData.BoolToDefault(dr["80_RenouncedUSCitizenship"], null); 
            rbl81_AppliedExemption.SelectedValue = BaseData.BoolToDefault(dr["81_AppliedExemption"], null); 
            rbl82_RelievedFromService.SelectedValue = BaseData.BoolToDefault(dr["82_RelievedFromService"], null);
            rbl83_ConvictedDesertion.SelectedValue = BaseData.BoolToDefault(dr["83_ConvictedDesertion"], null); 
            rbl84_RemainedOutsideUS.SelectedValue = BaseData.BoolToDefault(dr["84_RemainedOutsideUS"], null); 
            rbl85_ImmigrationStatus.SelectedValue = BaseData.BoolToDefault(dr["85_ImmigrationStatus"], null); 
        }
    }
}