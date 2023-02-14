//using KennedyAccess.users;
using Antlr.Runtime.Misc;
using KennedyAccess.Controls;
using KennedyAccess.users;
using Org.BouncyCastle.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Http.Results;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Api;
using TextMagicClient.Model;
using TextMagicClient.Client;
using static System.Net.Mime.MediaTypeNames;
using KennedyAccess.Admin;
using AjaxControlToolkit.Bundling;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;

namespace KennedyAccess.Classes
{
    public class BaseData
    {
        public void LoadBaseData(HttpApplicationState httpApplication)
        {
            // load base tables
            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "LoadBaseTables");
            httpApplication["RecordType"] = ds.Tables[0];

            DataTable dt = ds.Tables[1];
            DataRow dr = dt.NewRow();
            dr[0] = 0;
            dr[1] = "--";
            dr[2] = "--";
            dt.Rows.InsertAt(dr, 0);
            httpApplication["State"] = dt;

            DataTable country = ds.Tables[2];
            dr = country.NewRow();
            dr[0] = 0;
            dr[1] = "--";
            country.Rows.InsertAt(dr, 0);
            httpApplication["Country"] = country;

            httpApplication["SysSettings"] = ds.Tables[3];
            httpApplication["Franchise"] = ds.Tables[4];
            httpApplication["WebForm"] = ds.Tables[5];
            httpApplication["RoleSet"] = ds.Tables[6];
            httpApplication["Status"] = ds.Tables[7];
            httpApplication["Relationship"] = ds.Tables[8];
        }

        public int GetRecordTypeID(DataTable dt, int iFranchiseID, string sUsage, string sRecordType)
        {
            int iRecType = -1;
            DataRow[] dr;
            if (dt != null)
            {
                dr = dt.Select("FranchiseID=" + iFranchiseID + " and Usage ='" + sUsage + "' and RecordType='" + sRecordType + "'");

                if (dr.Length == 1)
                {
                    iRecType = int.Parse(dr[0]["RecordTypeID"].ToString());
                }
                else
                {
                    // profiles which are not offered in registration. ie team leader profiles
                    dr = dt.Select("FranchiseID=" + iFranchiseID + " and Usage ='" + sUsage + "' and RecordType='Kennedy Access'");

                    if (dr.Length == 1)
                    {
                        iRecType = int.Parse(dr[0]["RecordTypeID"].ToString());
                    }
                }
            }
            return iRecType;
        }

        public int GetStatusID(DataTable dt, int iFranchiseID, int iRecTypeID, string sStatusText)
        {
            int iStatusID = -1;

            DataRow[] dr = dt.Select("FranchiseID=" + iFranchiseID + " and RecordTypeID =" + iRecTypeID.ToString() + " and StatusText='" + sStatusText + "'");
            if (dr.Length == 1)
            {
                iStatusID = int.Parse(dr[0]["StatusID"].ToString());
            }
            return iStatusID;
        }

        public string GetRecordTypeByID(DataTable dt, int iFranchiseID, int iRecordTypeID)
        {
            string sRecordType = "";

            if (dt != null)
            {
                DataRow[] dr = dt.Select("Status<>'d' and FranchiseID=" + iFranchiseID + " and RecordTypeID= " + iRecordTypeID.ToString());

                if (dr.Length == 1)
                {
                    sRecordType = dr[0]["RecordType"].ToString();
                }
            }

            return sRecordType;
        }

        public double GetSysSettingValue(DataTable dt, int iFranchiseID, string sSysSettingName)
        {
            double result = 0;

            if (dt != null)
            {
                DataRow[] dr = dt.Select("FranchiseID=" + iFranchiseID + " and SystemSettingName ='" + sSysSettingName + "'");

                if (dr.Length == 1)
                {
                    result = double.Parse(dr[0]["SystemSettingValue"].ToString());
                }
            }

            return result;
        }

        public string GetSysSettingString(DataTable dt, int iFranchiseID, string sSysSettingName)
        {
            string result = null;

            if (dt != null)
            {
                DataRow[] dr = dt.Select("FranchiseID=" + iFranchiseID + " and SystemSettingName ='" + sSysSettingName + "'");

                if (dr.Length == 1)
                {
                    result = dr[0]["SystemSettingString"].ToString();
                }
            }

            return result;
        }

        public DateTime GetSysSettingDate(DataTable dt, int iFranchiseID, string sSysSettingName)
        {
            DateTime result = DateTime.MinValue;

            if (dt != null)
            {
                DataRow[] dr = dt.Select("FranchiseID=" + iFranchiseID + " and SystemSettingName ='" + sSysSettingName + "'");

                if (dr.Length == 1)
                {
                    result = DateTime.Parse(dr[0]["SystemSettingDate"].ToString());
                }
            }

            return result;
        }

        public DataTable AuthenticateByUserName(int iFranchiseID, string sUserName)
        {
            DataTable dt = new DataTable();
            DataSet ds = SqlHelper.ExecuteDataset(
                Global.dbcnn, "AuthenticateByUserName",
                new SqlParameter("@FranchiseID", iFranchiseID),
                new SqlParameter("@UserName", sUserName));
            if (ds != null && ds.Tables.Count > 0)
            {
                dt = ds.Tables[0];
            }

            return dt;
        }

        #region Campgin
        public string InsertUpdateCampaign(User user, int sEmployerID,
            int iCampaignID, int iAttorneyID, int iRecordTypeId, string sDateFrom,
            string DateThru, string sDescription, int PrevailingWageID,
            double G_1A_OfferedWageFrom, double G_1B_OfferedWageTo, string G_1C_Per)
        {
            var obj = SqlHelperv2.ExecuteScalar(
                        Global.dbcnn, "InsertUpdateCampaign",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", sEmployerID),
                        new SqlParameter("@CampaignID", iCampaignID),
                        new SqlParameter("@AttorneyID", iAttorneyID),
                        new SqlParameter("@RecordTypeId", iRecordTypeId),
                        new SqlParameter("@DateFrom", sDateFrom),
                        new SqlParameter("@DateThru", DateThru),
                        new SqlParameter("@Description", sDescription),
                        new SqlParameter("@PrevailingWageID", PrevailingWageID),
                        new SqlParameter("@G_1A_OfferedWageFrom", G_1A_OfferedWageFrom),
                        new SqlParameter("@G_1B_OfferedWageTo", G_1B_OfferedWageTo),
                        new SqlParameter("@G_1C_Per", G_1C_Per)
                        );

            return obj.ToString();
        }

        public DataTable GetCampaign(User user, string EmployerID, string CampaignID, string Search)
        {
            DataTable dtCampaign = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(
                    Global.dbcnn,
                    "GetCampaign",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@EmployerID", EmployerID),
                    new SqlParameter("@CampaignID", CampaignID),
                    new SqlParameter("@Search", Search)
                );

            if (ds != null && ds.Tables.Count > 0)
            {
                dtCampaign = ds.Tables[0];
            }
            return dtCampaign;
        }
        #endregion

        public DataTable GetUserRoles(int iFranchiseID, int iUserID, string sClientIP)
        {
            DataTable dt;

            dt = (SqlHelper.ExecuteDataset(
                Global.dbcnn, "GetUserRoles",
                new SqlParameter("@FranchiseID", iFranchiseID),
                new SqlParameter("@UserID", iUserID),
                new SqlParameter("@Log", sClientIP)
                )).Tables[0];

            return dt;
        }

        public DataTable GetWorkExperience(int iFranchiseID, int iUserID, int iApplicantID)
        {
            DataTable dt;

            dt = (SqlHelper.ExecuteDataset(
                Global.dbcnn, "GetWorkExperience",
                new SqlParameter("@FranchiseID", iFranchiseID),
                new SqlParameter("@UserID", iUserID),
                new SqlParameter("@ApplicantID", iApplicantID)
                )).Tables[0];

            return dt;
        }

        #region Applicant & ApplicantServiceAgreement
        public DataTable GetApplicantStatus(int iFranchiseID, int iUserID, int iApplicantID)
        {
            DataTable dt;

            dt = (SqlHelper.ExecuteDataset(
                Global.dbcnn, "GetApplicantStatus",
                new SqlParameter("@FranchiseID", iFranchiseID),
                new SqlParameter("@UserID", iUserID),
                new SqlParameter("@ApplicantID", iApplicantID)
                )).Tables[0];

            return dt;
        }

        public int InsertUpdateApplicant(User user, int iApplicantID,
            int iRecordTypeID, string sStatus,
            bool bActive, int iCitizenshipCountryID, int iBirthCountryID,
            string dDateOfBirth, string sAdmissionClass, string sAlienRegistration,
            string sAlienAdmission, bool bProfileCompleted)
        {
            int iNewApplicantID = 0;
            DataSet ds = SqlHelper.ExecuteDataset(
                Global.dbcnn, "InsertUpdateApplicant",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicantID", iApplicantID),
                    new SqlParameter("@RecordTypeID", iRecordTypeID),
                    new SqlParameter("@Status", sStatus),
                    new SqlParameter("@Active", bActive),
                    new SqlParameter("@CitizenshipCountryID", iCitizenshipCountryID),
                    new SqlParameter("@BirthCountryID", iBirthCountryID),
                    new SqlParameter("@DateOfBirth", dDateOfBirth),
                    new SqlParameter("@AdmissionClass", sAdmissionClass),
                    new SqlParameter("@AlienRegistration", sAlienRegistration),
                    new SqlParameter("@AlienAdmission", sAlienAdmission),
                    new SqlParameter("@ProfileCompleted", bProfileCompleted)
                );
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];
                iNewApplicantID = int.Parse(dr[0].ToString());
            }
            return iNewApplicantID;
        }
        public DataTable GetApplicant(User user, int iApplicantID, string Search)
        {
            DataTable dtApplicant = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetApplicant",
                            new SqlParameter("@FranchiseID", user.FranchiseID),
                            new SqlParameter("@UserID", user.UserID),
                            new SqlParameter("@ApplicantID", iApplicantID),
                            new SqlParameter("@Search", Search))).Tables[0];
            return dtApplicant;
        }

        public void UpdateApplicantServiceAgreement(User user, int iApplicantID, string sWebformID)
        {
            SqlHelper.ExecuteNonQuery(Global.dbcnn, "UpdateApplicantServiceAgreement",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ApplicantID", iApplicantID),
                new SqlParameter("@WebForm", sWebformID));
        }
        #endregion

        public DataTable GetQuestionnaire(User user, bool bGeneral, string iEmployerID, string iCampaignID)
        {
            DataTable dtQuestionnaire = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetQuestionnaire",
                            new SqlParameter("@FranchiseID", user.FranchiseID),
                            new SqlParameter("@UserID", user.UserID),
                            new SqlParameter("@General", bGeneral),
                            new SqlParameter("@EmployerID", iEmployerID),
                            new SqlParameter("@CampaignID", iCampaignID))).Tables[0];
            return dtQuestionnaire;
        }

        public void InsertUpdateQuestionnaire(User user, int iQuestionnaireID, int iEmployerID,
            string iCampaignID, bool bGeneral, int iSort, string sQUestion, string sQuestionType, bool active)
        {
            SqlHelper.ExecuteNonQuery(Global.dbcnn, "InsertUpdateQuestionnaire",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@QuestionnaireID", iQuestionnaireID),
                new SqlParameter("@EmployerID", iEmployerID),
                new SqlParameter("@CampaignID", iCampaignID),
                new SqlParameter("@General", bGeneral),
                new SqlParameter("@Sort", iSort),
                new SqlParameter("@Question", sQUestion),
                new SqlParameter("@QuestionType", sQuestionType),
                new SqlParameter("@Active", active)
            );
        }

        public DataTable GetQuestionnaireResponse(User user, string sJobListingID, string sApplicantID)
        {
            DataTable dtResult = null;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "GetQuestionnaireResponse",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@JobListingID", sJobListingID),
                new SqlParameter("@ApplicantID", sApplicantID)
            );

            if (ds != null && ds.Tables.Count > 0)
            {
                dtResult = ds.Tables[0];
            }

            return dtResult;
        }

        public void InsertUpdateQuestionnaireResponse(User user,
            string sQuestionnaireResponseID, string sQuestionnaireID,
            string sApplicantID, string sJobListingID,
            string sResponseText, bool bResponseBool)
        {
            SqlHelper.ExecuteNonQuery(
                Global.dbcnn, "InsertUpdateQuestionnaireResponse",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@QuestionnaireResponseID", sQuestionnaireResponseID),
                new SqlParameter("@QuestionnaireID", sQuestionnaireID),
                new SqlParameter("@ApplicantID", sApplicantID),
                new SqlParameter("@JobListingID", sJobListingID),
                new SqlParameter("@ResponseText", sResponseText),
                new SqlParameter("@ResponseBool", bResponseBool)
                );
        }

        public DataTable GetPrevailingwage(User user, string PrevailingwageID, string sEmployerID, string CampaignStartDate)
        {
            DataTable dtResult = null;
            DataSet dsPrevWage = SqlHelper.ExecuteDataset(
               Global.dbcnn, "GetPrevailingwage",
               new SqlParameter("@FranchiseID", user.FranchiseID),
               new SqlParameter("@UserID", user.UserID),
               new SqlParameter("@PrevailingwageID", PrevailingwageID),
               new SqlParameter("@EmployerID", sEmployerID),
               new SqlParameter("@CampaignStartDate", CampaignStartDate));

            dtResult = dsPrevWage.Tables[0];

            return dtResult;
        }

        public string InsertUpdatePrevailingWage(User user, string PrevailingwageID, string Status, bool Active,
            int RecordTypeId, string EmployerID, string F_1_WageTracking, string F_2_SOCONET, string F_3_Occupation,
            string F_4_SkillLevel, string F_5_PrevailingWage, string F_5A_RatePeriod, string F_6_WageSource,
            string F_6A_SpecifyIfOther, string F_7_DeterminationDate, string F_8_ExpirationDate,
            string AdditionalRecruitment, string JobTitle, string JobDuties)

        {
            string sPrevailingWageID = string.Empty;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "InsertUpdatePrevailingWage",
               new SqlParameter("@FranchiseID", user.FranchiseID),
               new SqlParameter("@UserID", user.UserID),
               new SqlParameter("@PrevailingwageID", PrevailingwageID),
               new SqlParameter("@Status", Status),
               new SqlParameter("@Active", Active),
               new SqlParameter("@RecordTypeId", RecordTypeId),
               new SqlParameter("@EmployerID", EmployerID),
               new SqlParameter("@F_1_WageTracking", F_1_WageTracking),
               new SqlParameter("@F_2_SOCONET", F_2_SOCONET),
               new SqlParameter("@F_3_Occupation", F_3_Occupation),
               new SqlParameter("@F_4_SkillLevel", F_4_SkillLevel),
               new SqlParameter("@F_5_PrevailingWage", F_5_PrevailingWage),
               new SqlParameter("@F_5A_RatePeriod", F_5A_RatePeriod),
               new SqlParameter("@F_6_WageSource", F_6_WageSource),
               new SqlParameter("@F_6A_SpecifyIfOther", F_6A_SpecifyIfOther),
               new SqlParameter("@F_7_DeterminationDate", F_7_DeterminationDate),
               new SqlParameter("@F_8_ExpirationDate", F_8_ExpirationDate),
               new SqlParameter("@I_5_AdditionalRecruitment", AdditionalRecruitment),
               new SqlParameter("@H_3_JobTitle", JobTitle),
               new SqlParameter("@H_11_JobDuties", JobDuties)
               );

            if (ds != null && ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    sPrevailingWageID = ds.Tables[0].Rows[0][0].ToString();
                }
            }


            return sPrevailingWageID;
        }

        public DataTable GetJoblisting(User user, string CampaignID, string JoblistingID, string ApplicantID)
        {
            DataTable dtJob = null;

            DataSet ds = SqlHelper.ExecuteDataset(
                    Global.dbcnn, "GetJoblisting",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@CampaignID", CampaignID),
                    new SqlParameter("@JoblistingID", JoblistingID),
                    new SqlParameter("@ApplicantID", ApplicantID)
                );

            if (ds != null && ds.Tables.Count > 0)
            {
                dtJob = ds.Tables[0];
            }
            return dtJob;
        }

        public DataTable GetJoblistingOutline(User user, string CampaignID, string JoblistingID)
        {
            DataTable dtJobList = null;

            DataSet ds = SqlHelper.ExecuteDataset(
                    Global.dbcnn, "GetJoblistingOutline",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@CampaignID", CampaignID),
                    new SqlParameter("@JoblistingID", JoblistingID),
                    new SqlParameter("@ApplicantID", user.ObjectID)
                );

            if (ds != null && ds.Tables.Count > 0)
            {
                dtJobList = ds.Tables[0];
            }
            return dtJobList;
        }


        public DataTable SetUserVerification(int iFranchiseID, int iUserID, string sEmail)
        {
            DataTable dtUser = null;
            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn,
                "SetUserVerification",
                new SqlParameter("@FranchiseID", iFranchiseID),
                new SqlParameter("@UserID", iUserID),
                new SqlParameter("@email", sEmail));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtUser = ds.Tables[0];
            }
            return dtUser;
        }

        public void SendMFACode(string sEmail, string sCode)
        {
            string fromemail = Global.sEmailUserName;
            string emailTo = sEmail;
            string emailSubject = "Email Verification Code";
            string emailBody = "Please do not reply to this email. Please use the verification code below to complete the process. <br/>Email Verification Code is " + sCode;

            EmailServer myEmail = new EmailServer();
            myEmail.ToEmail = emailTo;
            myEmail.Subject = emailSubject;
            myEmail.Body = emailBody;
            myEmail.SendEmail();
        }

        public DataRow GetOfferLetter(User user, string sApplicationID)
        {
            DataRow drResult = null;
            // get applicant's email, employer's offerletter
            DataTable dtOfferLettter = GetOfferLetterInfo(user, sApplicationID);
            if (dtOfferLettter != null && dtOfferLettter.Rows.Count == 1)
            {
                drResult = dtOfferLettter.Rows[0];

                // replace dummy strings with data
                string emailBody = drResult["OfferLetter"].ToString();
                emailBody = emailBody.Replace("[Candidate Name]", drResult["FirstName"].ToString());
                emailBody = emailBody.Replace("[job title]", drResult["H_3_JobTitle"].ToString());
                emailBody = emailBody.Replace("[JobDuties]", drResult["H_11_JobDuties"].ToString());
                emailBody = emailBody.Replace("[dollar amount]", drResult["F_5_PrevailingWage"].ToString());
                emailBody = emailBody.Replace("[Company name]", drResult["EmployerName"].ToString());
                emailBody = emailBody.Replace("[hour, year, etc.]", drResult["PayPeriod"].ToString());
                drResult["OfferLetter"] = emailBody;
            }

            return drResult;
        }

        public void SendEmail(string ToEmail, string Subject, string emailBody)
        {
            EmailServer myEmail = new EmailServer
            {
                ToEmail = ToEmail,
                Subject = Subject,
                Body = emailBody
            };
            myEmail.SendEmail();
        }

        public void SendText(string Mobilephone, string sCode)
        {
            // My TextMagic Account Info
            //Configuration.Default.Username = "hyukyi";
            //Configuration.Default.Password = "X7EtOeL0GayuQeODj9zmHVkexxtO1Y";

            TextMagicClient.Client.Configuration.Default.Username = "noticekag";
            TextMagicClient.Client.Configuration.Default.Password = "f2RPD2XOaQ5GIoDMgxyinNkXywsVeE";
            TextMagicClient.Client.Configuration.Default.BasePath = "https://rest.textmagic.com";

            string sMessageBody = "Please do not reply to this message. Please use the following verification code to complete the authentication process. <br/>Your Verification Code is: " + sCode;
            var apiInstance = new TextMagicApi();
            // Send a new message request sample
            try
            {
                var sendMessageInputObject = new SendMessageInputObject
                {
                    Text = sMessageBody,
                    Phones = "+" + Mobilephone
                };

                var result = apiInstance.SendMessage(sendMessageInputObject);
                //Console.WriteLine(result.Id);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception when calling TextMagicApi.SendMessage: " + ex.Message);
            }

        }

        public string InserUpdatetUser(int FranchiseID, int UserID, int UserUsrMainID, string UserName,
            string Password, string UserFirstName, string UserLastName, string Email, string RecordTypeID, string RoleSetID,
            bool Active, string ValidFrom, string ValidThru, bool Authenticated, string Mobilephone, string note)
        {
            string sResult;
            SqlDataReader dr = SqlHelper.ExecuteReader(
                Global.dbcnn, "InserUpdatetUser",
                new SqlParameter("@FranchiseID", FranchiseID),
                new SqlParameter("@UserID", UserID),
                new SqlParameter("@UserUsrMainID", UserUsrMainID),
                new SqlParameter("@UserName", UserName),
                new SqlParameter("@Password", Password),
                new SqlParameter("@UserFirstName", UserFirstName),
                new SqlParameter("@UserLastName", UserLastName),
                new SqlParameter("@Email", Email),
                new SqlParameter("@RecordTypeID", RecordTypeID),
                new SqlParameter("@RoleSetID", RoleSetID),
                new SqlParameter("@Active", Active),
                new SqlParameter("@ValidFrom", ValidFrom),
                new SqlParameter("@ValidThru", ValidThru),
                new SqlParameter("@Authenticated", Authenticated),
                new SqlParameter("@Mobilephone", Mobilephone),
                new SqlParameter("@note", note));
            dr.Read();
            sResult = dr[0].ToString();
            dr.Close();

            return sResult;
        }

        public DataTable GetUserTrail(User user)
        {
            DataTable dtUserTrail = null;
            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn, "UserTrail",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtUserTrail = ds.Tables[0];
            }
            return dtUserTrail;

        }

        public DataTable GetEmployerList(User user)
        {
            DataTable dtEmployerList = null;
            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn, "GetEmployerList",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtEmployerList = ds.Tables[0];
            }
            return dtEmployerList;
        }

        public void UpdateOfferLetter(User user, string CampaignID, string OfferLetter)
        {
            SqlHelperv2.ExecuteNonQuery(Global.dbcnn, "UpdateOfferLetter",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@CampaignID", CampaignID),
                new SqlParameter("@OfferLetter", OfferLetter)
            );
        }

        public DataTable GetAttachment(User user, string RecordTypeID, string ReferenceID)
        {
            DataTable dtAttachment;
            dtAttachment = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAttachment",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@RecordTypeID", RecordTypeID),
                        new SqlParameter("@ReferenceID", ReferenceID),
                        new SqlParameter("@AttachmentID", 0))).Tables[0];

            return dtAttachment;
        }

        public void InsertAttachment(User user, string RecordTypeID, string ReferenceID, string fileName, byte[] imagefile)
        {
            SqlHelper.ExecuteNonQuery(Global.dbcnn, "InsertAttachment",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@RecordTypeID", RecordTypeID),
                        new SqlParameter("@ReferenceID", ReferenceID),
                        new SqlParameter("@FileName", fileName),
                        new SqlParameter("@FileData", imagefile));
        }

        public void UpdateProfilePicture(User user, string Object, string ObjectID, byte[] imagefile)
        {
            SqlHelper.ExecuteNonQuery(Global.dbcnn, "UpdateProfilePicture",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@Object", Object),
                        new SqlParameter("@ObjectID", ObjectID),
                        new SqlParameter("@ProfilePicture", imagefile));
        }

        public byte[] GetProfilePicture(User user, string Object, string OjbectID)
        {
            var obj = SqlHelperv2.ExecuteScalar(Global.dbcnn, "GetProfilePicture",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@Object", Object),
                        new SqlParameter("@ObjectID", OjbectID)
                        );
            if (obj == null || obj.GetType().Name == "DBNull")
                return null;
            else
                return (byte[])obj;
        }

        public DataRow GetAttachmentFile(User user, string AttachementID)
        {
            DataRow trAttachmentFile = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "GetAttachmentFile",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@AttachementID", AttachementID)
                );

            if (ds != null && ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    trAttachmentFile = ds.Tables[0].Rows[0];
                }
            }
            return trAttachmentFile;
        }

        public string InsertUpdateApplication(User user, string ApplicationID, string JobListingID,
            int ApplicationStatusID, string ApplicantID, string Status, bool Active, string Acceptance)
        {
            var obj = SqlHelper.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateApplication",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicationID", ApplicationID),
                    new SqlParameter("@JobListingID", JobListingID),
                    new SqlParameter("@ApplicationStatusID", ApplicationStatusID),
                    new SqlParameter("@ApplicantID", ApplicantID),
                    new SqlParameter("@Status", Status),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@Comment", Acceptance)
                );

            return obj.ToString();
        }


        public string InsertUpdateJobOpportunity(User user, string sCampaignID, string sJobListingID, string sRecordTypeID, string Status, bool bActive,
                    string sWorkAddress1, string sWorkAddress2, string sWorkCity, string sWorkState, string sWorkPostalCode,
                    string txtI_6_StartDateForSWA, string txtI_7_EndDateForSWA,
                    string txtFilingDatePosted, string txtFilingDateRemoved,
                    bool rblI_8_SundayNewspaper, string txtI_9_NameOfNewspaper, string txtI_10_FirstAdvertisementDate,
                    bool rblI_11_SecondAdvertisement, string txtI_12_DateOfSecondAdvertisement, string txtI_27_NameOfSecondNewspaper,
                    bool rblI_28_SaturdayNewspaper, string txtI_29_NameOfSaturdayNewspaper, string txtI_30_SaturdayAdvertisementDate,
                    bool rblI_31_SecondSatAdvertisement, string txtI_32_DateOfSecondSatAdvertisement, string txtI_33_NameOfSecondSatNewspaper,
                    bool rblI_34_ListJob)

        {
            var obj = SqlHelperv2.ExecuteScalar(
                      Global.dbcnn, "InsertUpdateJobOpportunity",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@CampaignID", sCampaignID),
                        new SqlParameter("@JoblistingID", sJobListingID),
                        new SqlParameter("@RecordTypeId", sRecordTypeID),
                        new SqlParameter("@Status", "u"),
                        new SqlParameter("@Active", true),
                        new SqlParameter("@H_1_Address1", sWorkAddress1),
                        new SqlParameter("@H_1A_Address2", sWorkAddress2),
                        new SqlParameter("@H_2A_City", sWorkCity),
                        new SqlParameter("@H_2B_State", sWorkState),
                        new SqlParameter("@H_2C_Postalcode", sWorkPostalCode),

                        new SqlParameter("@I_6_StartDateForSWA", txtI_6_StartDateForSWA),
                        new SqlParameter("@I_7_EndDateForSWA", txtI_7_EndDateForSWA),

                        new SqlParameter("@FilingDatePosted", txtFilingDatePosted),
                        new SqlParameter("@FilingDateRemoved", txtFilingDateRemoved),

                        new SqlParameter("@I_8_SundayNewspaper", rblI_8_SundayNewspaper),
                        new SqlParameter("@I_9_NameOfNewspaper", txtI_9_NameOfNewspaper),
                        new SqlParameter("@I_10_FirstAdvertisementDate", txtI_10_FirstAdvertisementDate),
                        new SqlParameter("@I_11_SecondAdvertisement", rblI_11_SecondAdvertisement),
                        new SqlParameter("@I_12_DateOfSecondAdvertisement", txtI_12_DateOfSecondAdvertisement),
                        new SqlParameter("@I_27_NameOfSecondNewspaper", txtI_27_NameOfSecondNewspaper),
                        new SqlParameter("@I_28_SaturdayNewspaper", rblI_28_SaturdayNewspaper),
                        new SqlParameter("@I_29_NameOfSaturdayNewspaper", txtI_29_NameOfSaturdayNewspaper),
                        new SqlParameter("@I_30_SaturdayAdvertisementDate", txtI_30_SaturdayAdvertisementDate),

                        new SqlParameter("@I_31_SecondSatAdvertisement", rblI_31_SecondSatAdvertisement),
                        new SqlParameter("@I_32_DateOfSecondSatAdvertisement", txtI_32_DateOfSecondSatAdvertisement),
                        new SqlParameter("@I_33_NameOfSecondSatNewspaper", txtI_33_NameOfSecondSatNewspaper),
                        new SqlParameter("@I_34_ListJob", rblI_34_ListJob)
                    );

            return obj.ToString();
        }

        public DataTable GetApplication(User user, string sApplicationID, string sJobListingID, string sEmployerID)
        {
            DataTable dtApplication = null;
            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "GetApplication",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ApplicationID", sApplicationID),
                new SqlParameter("@JobListingID", sJobListingID),
                new SqlParameter("@EmployerID", sEmployerID)
                );

            if (ds != null && ds.Tables.Count > 0)
            {
                dtApplication = ds.Tables[0];
            }
            return dtApplication;
        }

        public DataTable GetEmployer(User user, string EmployerID, string Search)
        {
            DataTable dtEmployer = null;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "GetEmployer",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@EmployerID", EmployerID),
                        new SqlParameter("@Search", Search));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtEmployer = ds.Tables[0];
            }

            return dtEmployer;
        }

        public DataTable GetRole(User user, string RoleID, string Search)
        {
            DataTable dtRole = null;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "GetRole",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@RoleID", 0),
                        new SqlParameter("@Search", Search));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtRole = ds.Tables[0];
            }

            return dtRole;
        }

        public string InsertUpdateRole(User user, string RoleID,
            string RoleName, string RoleDescription)
        {
            var obj = SqlHelperv2.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateRole",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@RoleID", RoleID),
                    new SqlParameter("@RoleName", RoleName),
                    new SqlParameter("@RoleDescription", RoleDescription)
                );

            return obj.ToString();
        }

        public DataTable GetRoleSets(User user, string RoleSetID, string Search)
        {
            DataTable dtRoleSets = null;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "GetRoleSets",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@RoleSetID", RoleSetID),
                        new SqlParameter("@Search", Search));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtRoleSets = ds.Tables[0];
            }

            return dtRoleSets;
        }

        public string InsertUpdateRoleSetRoleRel(User user, string RoleSetRoleRelID,
            string RoleSetid, string RoleID, bool Active,
            string ValidFrom, string ValidThru)
        {
            var obj = SqlHelperv2.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateRoleSetRoleRel",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@RoleSetRoleRelID", RoleSetRoleRelID),
                    new SqlParameter("@RoleSetID", RoleSetid),
                    new SqlParameter("@RoleID", RoleID),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@ValidFrom", ValidFrom),
                    new SqlParameter("@ValidThru", ValidThru)
                );

            return obj.ToString();
        }

        public DataTable GetOfferLetterInfo(User user, string ApplicationID)
        {
            DataTable dtOfferLetterInfo = null;

            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "GetOfferLetterInfo",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@ApplicationID", ApplicationID));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtOfferLetterInfo = ds.Tables[0];
            }

            return dtOfferLetterInfo;
        }

        public DataTable GetProfile(User user)
        {
            DataTable dtProfile = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn, "GetProfile",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID));
            if (ds != null && ds.Tables.Count > 0)
            {
                dtProfile = ds.Tables[0];
            }
            return dtProfile;
        }

        public void InserUpdatetProfile(User user, bool Active,
            string RoleSetID, string RoleSetName)
        {
            SqlHelperv2.ExecuteScalar(
                    Global.dbcnn, "InserUpdatetProfile",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@RoleSetID", RoleSetID),
                    new SqlParameter("@RoleSetName", RoleSetName)
                );
        }

        public DataTable GetApplicationHistory(User user, string ApplicantID)
        {
            DataTable dtApplicantInfo = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "GetApplicationHistory",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ApplicantID", ApplicantID)
            );
            if (ds != null && ds.Tables.Count > 0)
            {
                dtApplicantInfo = ds.Tables[0];
            }
            return dtApplicantInfo;
        }

        public DataTable GetDashboardData(User user)
        {
            DataTable dtDashboard = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "GetDashboardData",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID)
            );
            if (ds != null && ds.Tables.Count > 0)
            {
                dtDashboard = ds.Tables[0];
            }
            return dtDashboard;
        }

        public DataTable GetUserRoleSets(User user, string ManualUserID)
        {
            DataTable dtDashboard = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "GetUserRoleSets",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ManualUserID", ManualUserID)
            );
            if (ds != null && ds.Tables.Count > 0)
            {
                dtDashboard = ds.Tables[0];
            }
            return dtDashboard;
        }

        public string InsertUpdateUserRoleSets(User user, 
            string ManualUserID, string RoleRelID,
            string RoleID, bool Active,
            string ValidFrom, string ValidThru)
        {
            var obj = SqlHelperv2.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateUserRoleSets",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ManualUserID", ManualUserID),
                    new SqlParameter("@RoleRelID", RoleRelID),
                    new SqlParameter("@RoleID", RoleID),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@ValidFrom", ValidFrom),
                    new SqlParameter("@ValidThru", ValidThru)
                );

            return obj.ToString();
        }

        public DataTable ResetUserRoleSets(User user, string ManualUserID)
        {
            DataTable dtDashboard = null;

            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn,
                "ResetUserRoleSets",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ManualUserID", ManualUserID)
            );
            if (ds != null && ds.Tables.Count > 0)
            {
                dtDashboard = ds.Tables[0];
            }
            return dtDashboard;
        }

        public DataTable GetEmpUserList(User user, string ManualUserID)
        {
            DataTable dtEmployerList = null;
            DataSet ds = SqlHelperv2.ExecuteDataset(Global.dbcnn, "GetEmpUserList",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ManualUserID", ManualUserID));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtEmployerList = ds.Tables[0];
            }
            return dtEmployerList;
        }

        public DataTable GetUsrMain(User user, string UsrMainID, string Search)
        {
            DataTable dtUsers = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUsrMain",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@UsrMainID", UsrMainID),
                new SqlParameter("@Search", Search)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtUsers = ds.Tables[0];
            }
            return dtUsers;

        }

        public DataTable GetSystemSettings(User user, string SystemSettingID)
        {
            DataTable dtSettings = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetSystemSettings",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@SystemSettingID", SystemSettingID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtSettings = ds.Tables[0];
            }
            return dtSettings;
        }

        public void InsertUpdateSettings(User user,
            bool Active, string SettingID,
            string SettingName, string SettingDate, 
            string SettingValue, string SettingString,
            string SettingDesc)
        {            
            SqlHelperv2.ExecuteNonQuery(
                Global.dbcnn, "InsertUpdateSettings",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@Active", Active),
                new SqlParameter("@SystemSettingID", SettingID),
                new SqlParameter("@SystemSettingName", SettingName),
                new SqlParameter("@SystemSettingDate", SettingDate),
                new SqlParameter("@SystemSettingValue", SettingValue),
                new SqlParameter("@SystemSettingString", SettingString),
                new SqlParameter("@SystemSettingDesc", SettingDesc)
            );
        }

        public DataTable GetLoginHistory(string FranchiseID, string UserID)
        {
            DataTable dtHistory = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetLoginHistory",
                new SqlParameter("@FranchiseID", FranchiseID),
                    new SqlParameter("@UserID", UserID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtHistory = ds.Tables[0];
            }
            return dtHistory;
        }
        public string InsertUpdateSearch(User user, string Status, 
            bool Active, int UsrSearchID, bool Default, 
            string RecordType, string SearchName)
        {
            var obj = SqlHelper.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateSearch",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@Status", Status),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@UsrSearchID", UsrSearchID),
                    new SqlParameter("@Default", Default),
                    new SqlParameter("@RecordType", RecordType),
                    new SqlParameter("@SearchName", SearchName)
                );

            return obj.ToString();
        }

        public void InsertUpdateSearchDetails(User user, string Status,
            string UsrSearchID, string UsrSearchDetailID, string RecordType, 
            string IntValue, string StrValue)
        {
            var obj = SqlHelper.ExecuteScalar(
                    Global.dbcnn, "InsertUpdateSearchDetails",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@Status", Status),
                    new SqlParameter("@UsrSearchDetailID", UsrSearchDetailID),
                    new SqlParameter("@UsrSearchID", UsrSearchID),
                    new SqlParameter("@RecordType", RecordType),
                    new SqlParameter("@IntValue", IntValue),
                    new SqlParameter("@StrValue", StrValue)
                );
        }

        public void WriteAuditTrail(User user, string RecordTypeID, string SystemLog)
        {
            SqlHelperv2.ExecuteNonQuery(Global.dbcnn, "WriteAuditTrail",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@RecordTypeID", RecordTypeID),
                    new SqlParameter("@SystemLog", SystemLog));
        }

        public DataTable GetUserSearchProfile(User user)
        {
            DataTable dtSearchProfile = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUserSearchProfile",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtSearchProfile = ds.Tables[0];
            }
            return dtSearchProfile;
        }

        public DataSet GetUserSearchProfileDetail(User user, string UsrSearchID)
        {
            DataSet dsProfileDetail = null;
            dsProfileDetail = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUserSearchProfileDetail",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@UsrSearchID", UsrSearchID)));

            return dsProfileDetail;
        }

        #region DS260
       
        public DataTable GetDS260(User user, string ApplicantID, string FamilyRelationID, string ReferenceID)
        {
            DataTable dtDS260 = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetDS260",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicantID", ApplicantID),
                    new SqlParameter("@FamilyRelationID", FamilyRelationID),
                    new SqlParameter("@ReferenceID", ReferenceID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtDS260 = ds.Tables[0];
            }
            return dtDS260;
        }

        public string InsertUpdateDS260(User user, string Status, bool Active, 
            string sDS260ID, string sApplicantID, string sFamilyRelationID, string sReferenceID, string s1_Surname,
            string s1_1_GivenName, string s1_2_FullNameInNative, bool b2_AnotherName, string s2_1_AnotherSurname,
            string s2_2_AnotherGivenName, bool b3_Gender, string s4_MaritalStatus, string s5_DateOfBirth, string s6_CityOfBirth, 
            string s7_StateOfBirth, int i8_CountryOfBirth, int  i9_Nationality, string s10_CurrPPNo, int i10_1_CountryPPIssued, 
            string s10_2_DatePPIssued, string s10_3_DatePPExpires, bool b11_HavePrevNationalities, string s14_PrimaryPhone, 
            string s15_SecondaryPhone, string s16_WorkPhone, bool b16_1_AnyUsedPhone, string s16_2_UsedPrevPhone, 
            string s17_PrimaryEmail, bool b17_1_AnyUsedEmail, string s17_2_UsedPrevEmail, string s18_SocialMediasUserID,
            bool b18_1_ShareInfoSocialMedia, string s18_2_OtherSocialMedias, string s18_3_OtherUserID, 
            bool b19_CurrAddSameMailingAdd, bool b20_HaveAddInUS, bool b20_1_UseKAGAddress, bool b21_MailingAddSame
            )
        {
            string sResult;
        SqlDataReader dr = SqlHelper.ExecuteReader(
                Global.dbcnn, "InsertUpdateDS260",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@Status", Status),
                new SqlParameter("@Active", Active),
                new SqlParameter("@DS260ID", sDS260ID),
                new SqlParameter("@ApplicantID", sApplicantID),
                new SqlParameter("@FamilyRelationID", sFamilyRelationID),
                new SqlParameter("@ReferenceID", sReferenceID),
                new SqlParameter("@1_Surname", s1_Surname),
                new SqlParameter("@1_1_GivenName", s1_1_GivenName),
                new SqlParameter("@1_2_FullNameInNative", s1_2_FullNameInNative),
                new SqlParameter("@2_AnotherName", b2_AnotherName),
                new SqlParameter("@2_1_AnotherSurname", s2_1_AnotherSurname),
                new SqlParameter("@2_2_AnotherGivenName", s2_2_AnotherGivenName),
                new SqlParameter("@3_Gender", b3_Gender),
                new SqlParameter("@4_MaritalStatus", s4_MaritalStatus),
                new SqlParameter("@5_DateOfBirth", s5_DateOfBirth),
                new SqlParameter("@6_CityOfBirth", s6_CityOfBirth),
                new SqlParameter("@7_StateOfBirth", s7_StateOfBirth),
                new SqlParameter("@8_CountryOfBirth", i8_CountryOfBirth),
                new SqlParameter("@9_Nationality", i9_Nationality),
                new SqlParameter("@10_CurrPPNo", s10_CurrPPNo),
                new SqlParameter("@10_1_CountryPPIssued", i10_1_CountryPPIssued),
                new SqlParameter("@10_2_DatePPIssued", s10_2_DatePPIssued),
                new SqlParameter("@10_3_DatePPExpires", s10_3_DatePPExpires),
                new SqlParameter("@11_HavePrevNationalities", b11_HavePrevNationalities),
                new SqlParameter("@14_PrimaryPhone", s14_PrimaryPhone),
                new SqlParameter("@15_SecondaryPhone", s15_SecondaryPhone),
                new SqlParameter("@16_WorkPhone", s16_WorkPhone),
                new SqlParameter("@16_1_AnyUsedPhone", b16_1_AnyUsedPhone),
                new SqlParameter("@16_2_UsedPrevPhone", s16_2_UsedPrevPhone),
                new SqlParameter("@17_PrimaryEmail", s17_PrimaryEmail),
                new SqlParameter("@17_1_AnyUsedEmail", b17_1_AnyUsedEmail),
                new SqlParameter("@17_2_UsedPrevEmail", s17_2_UsedPrevEmail),
                new SqlParameter("@18_SocialMediasUserID", s18_SocialMediasUserID),
                new SqlParameter("@18_1_ShareInfoSocialMedia", b18_1_ShareInfoSocialMedia),
                new SqlParameter("@18_2_OtherSocialMedias", s18_2_OtherSocialMedias),
                new SqlParameter("@18_3_OtherUserID", s18_3_OtherUserID),
                new SqlParameter("@19_CurrAddSameMailingAdd", b19_CurrAddSameMailingAdd),
                new SqlParameter("@20_HaveAddInUS", b20_HaveAddInUS),
                new SqlParameter("@20_1_UseKAGAddress", b20_1_UseKAGAddress),
                new SqlParameter("@21_MailingAddSame", b21_MailingAddSame)
                       );

            dr.Read();
            sResult = dr[0].ToString();
            dr.Close();

            return sResult;
        }
        #endregion

        #region I485 & FamilyMember
        public DataTable GetI485(User user, string I485ID)
        {
            DataTable dtGetI485 = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetI485",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@I485ID", I485ID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtGetI485 = ds.Tables[0];
            }
            return dtGetI485;
        }

        public string InsertUpdateI485_AppInfo(User user,
            string Status, bool Active, string I485ID, string ApplicantID, string ReferenceID,
            string FamilyRelationID, string LastName, string FirstName, string MiddleName, string MaidenName, string DateOfBirth,
            string CityOfBirth, int CountryOfBirth, int Citizenship, string PhoneNumber,
            string EmailAddress, string PassportNumber, string DateOfIssue, string DateOfExpiry, string IssuingCountry, string AlienNumber,
            string SSN, string CurrLegalStatus, string CurrVisaIssued, string CurrVisaExpires, string VisaNumber, string ConsulateVisaIssued,
            string I94Number, string ExactNameOnI94, string MostRecentEntry, string PortOfEntry, string StatusOfEntry, string NameOfMilitary,
            string CityOfMil, string StateOfMil, int CountryOfMil, string NatureOfGroup, string InvolvementFrom,
            string InvolvementTo, bool HaveAppliedVisa, string CityOfConsulate, int CountryOfConsulate,
            String VisaDecision, string DecisionDate, bool HaveAppliedEAD, string USCISOffice, string EADDecision
            )
        {
            string sResult;
            SqlDataReader dr = SqlHelper.ExecuteReader(
                    Global.dbcnn, "InsertUpdateI485_AppInfo",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@Status", Status),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@I485ID", I485ID),
                    new SqlParameter("@ApplicantID", ApplicantID),
                    new SqlParameter("@ReferenceID", ReferenceID),
                    new SqlParameter("@FamilyRelationID", FamilyRelationID),
                    new SqlParameter("@LastName", LastName),
                    new SqlParameter("@FirstName", FirstName),
                    new SqlParameter("@MiddleName", MiddleName),
                    new SqlParameter("@MaidenName", MaidenName),
                    new SqlParameter("@DateOfBirth", DateOfBirth),
                    new SqlParameter("@CityOfBirth", CityOfBirth),
                    new SqlParameter("@CountryOfBirth", CountryOfBirth),
                    new SqlParameter("@Citizenship", Citizenship),
                    new SqlParameter("@PhoneNumber", PhoneNumber),
                    new SqlParameter("@EmailAddress", EmailAddress),
                    new SqlParameter("@PassportNumber", PassportNumber),
                    new SqlParameter("@DateOfIssue", DateOfIssue),
                    new SqlParameter("@DateOfExpiry", DateOfExpiry),
                    new SqlParameter("@IssuingCountry", IssuingCountry),
                    new SqlParameter("@AlienNumber", AlienNumber),
                    new SqlParameter("@SSN", SSN),
                    new SqlParameter("@CurrLegalStatus", CurrLegalStatus),
                    new SqlParameter("@CurrVisaIssued", CurrVisaIssued),
                    new SqlParameter("@CurrVisaExpires", CurrVisaExpires),
                    new SqlParameter("@VisaNumber", VisaNumber),
                    new SqlParameter("@ConsulateVisaIssued", ConsulateVisaIssued),
                    new SqlParameter("@I94Number", I94Number),
                    new SqlParameter("@ExactNameOnI94", ExactNameOnI94),
                    new SqlParameter("@MostRecentEntry", MostRecentEntry),
                    new SqlParameter("@PortOfEntry", PortOfEntry),
                    new SqlParameter("@StatusOfEntry", StatusOfEntry),
                    new SqlParameter("@NameOfMilitary", NameOfMilitary),
                    new SqlParameter("@CityOfMil", CityOfMil),
                    new SqlParameter("@StateOfMil", StateOfMil),
                    new SqlParameter("@CountryOfMil", CountryOfMil),
                    new SqlParameter("@NatureOfGroup", NatureOfGroup),
                    new SqlParameter("@InvolvementFrom", InvolvementFrom),
                    new SqlParameter("@InvolvementTo", InvolvementTo),
                    new SqlParameter("@HaveAppliedVisa", HaveAppliedVisa),
                    new SqlParameter("@CityOfConsulate", CityOfConsulate),
                    new SqlParameter("@CountryOfConsulate", CountryOfConsulate),
                    new SqlParameter("@VisaDecision", VisaDecision),
                    new SqlParameter("@DecisionDate", DecisionDate),
                    new SqlParameter("@HaveAppliedEAD", HaveAppliedEAD),
                    new SqlParameter("@USCISOffice", USCISOffice),
                    new SqlParameter("@EADDecision", EADDecision)
                );

            dr.Read();
            sResult = dr[0].ToString();
            dr.Close();

            return sResult;
        }

        public void UpdateI485_InterpInfo(User user, string I485ID,
            bool UnderstandEngOnI_485, string LastNameOfInterp, string GivenNameOfInterp, string BusinessOfInterp,
            string StreetOfInterp, string CityInterp, string StateOfInterp, int CountryOfInterp,
            string ZipCodeOfInterp, string PhoneOfInterp, string EmailOfInterp
            )
        {

            SqlDataReader dr = SqlHelper.ExecuteReader(
                 Global.dbcnn, "UpdateI485_InterpInfo",
                 new SqlParameter("@FranchiseID", user.FranchiseID),
                 new SqlParameter("@UserID", user.UserID),
                 new SqlParameter("@I485ID", I485ID),
                 new SqlParameter("@UnderstandEngOnI_485", UnderstandEngOnI_485),
                 new SqlParameter("@LastNameOfInterp", LastNameOfInterp),
                 new SqlParameter("@GivenNameOfInterp", GivenNameOfInterp),
                 new SqlParameter("@BusinessOfInterp", BusinessOfInterp),
                 new SqlParameter("@StreetOfInterp", StreetOfInterp),
                 new SqlParameter("@CityInterp", CityInterp),
                 new SqlParameter("@StateOfInterp", StateOfInterp),
                 new SqlParameter("@CountryOfInterp", CountryOfInterp),
                 new SqlParameter("@ZipCodeOfInterp", ZipCodeOfInterp),
                 new SqlParameter("@PhoneOfInterp", PhoneOfInterp),
                 new SqlParameter("@EmailOfInterp", EmailOfInterp)
                );
        }

        public void UpdateI485_BioInfo(User user, string I485ID,
           bool bEthnicity, string sRace, string sHeightFt, string sHeightIn,
           string sHeightCm, string sWeightLbs, string sWeightKg, string sEyeColor,
           string sHairColor
           )
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(
                 Global.dbcnn, "UpdateI485_BioInfo",
                 new SqlParameter("@FranchiseID", user.FranchiseID),
                 new SqlParameter("@UserID", user.UserID),
                 new SqlParameter("@I485ID", I485ID),
                 new SqlParameter("@Ethnicity", bEthnicity),
                 new SqlParameter("@Race", sRace),
                 new SqlParameter("@HeightFt", sHeightFt),
                 new SqlParameter("@HeightIn", sHeightIn),
                 new SqlParameter("@HeightCm", sHeightCm),
                 new SqlParameter("@WeightLbs", sWeightLbs),
                 new SqlParameter("@WeightKg", sWeightKg),
                 new SqlParameter("@EyeColor", sEyeColor),
                 new SqlParameter("@HairColor", sHairColor)
                );
        }

        public void UpdateI485_DocInfo(User user, string I485ID,
           bool sFilingFee14over, bool sFilingFeeUnder14, bool sSixPassportPhotos, bool sI693MedicalExam,
           bool sFamilyRelCert_Original, bool sFamilyRelCert_Translated, bool sMarriageCert_Original,
           bool sMarriageCert_Translated, bool sBackgroundCheck_Original, bool sBackgroundCheck_Translated,
           bool sCurrI_94, bool sCurrVisaPastVisas, bool sTaxReturnsPast3Yrs, bool sI_20s
           )
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(
                 Global.dbcnn, "UpdateI485_DocInfo",
                 new SqlParameter("@FranchiseID", user.FranchiseID),
                 new SqlParameter("@UserID", user.UserID),
                 new SqlParameter("@I485ID", I485ID),
                 new SqlParameter("@FilingFee14over", sFilingFee14over),
                 new SqlParameter("@FilingFeeUnder14", sFilingFeeUnder14),
                 new SqlParameter("@SixPassportPhotos", sSixPassportPhotos),
                 new SqlParameter("@I693MedicalExam", sI693MedicalExam),
                 new SqlParameter("@FamilyRelCert_Original", sFamilyRelCert_Original),
                 new SqlParameter("@FamilyRelCert_Translated", sFamilyRelCert_Translated),
                 new SqlParameter("@MarriageCert_Original", sMarriageCert_Original),
                 new SqlParameter("@MarriageCert_Translated", sMarriageCert_Translated),
                 new SqlParameter("@BackgroundCheck_Original", sBackgroundCheck_Original),
                 new SqlParameter("@BackgroundCheck_Translated", sBackgroundCheck_Translated),
                 new SqlParameter("@CurrI_94", sCurrI_94),
                 new SqlParameter("@CurrVisaPastVisas", sCurrVisaPastVisas),
                 new SqlParameter("@TaxReturnsPast3Yrs", sTaxReturnsPast3Yrs),
                 new SqlParameter("@I_20s", sI_20s)
                );
        }

        public void UpdateI485_BackgroundInfo(User user, string I485ID, bool b1_AdmissionDeniedToUS,
            bool b2_VisaDeniedToUS, bool b3_WorkedUSWithoutAuthz, bool b4_ViolatedTerms, bool b5_InExclusion,
            bool b6_IssuedFinalOrderExcl, bool b7_HadPriorFinalOrderExcl, bool b8_LawfulResident, bool b9_GrantedDeparture,
            bool b10_AppliedProtection, bool b11_A_BeenNonimmigrant, bool b11_B_CompliedRequirement, bool b11_C_BeenGrantedWaiver,
            bool b12_BeenArrested, bool b13_CommittedCrime, bool b14_PledGuilty, bool b15_BeenOrderedPunished,
            bool b16_BeenDefendant, bool b17_ViolatedRegulation, bool b18_ConvictedForOffenses, bool b19_TraffickedSubstances,
            bool b20_AidedTrafficking, bool b21_FamilyTrafficked, bool b22_EngagedInProstitution, bool b23_ProcuredProstitutes,
            bool b24_ReceiveMoneyProstitution, bool b25_IntendToEngageGambling, bool b26_ExercisedImmunity,
            bool b27_ReligiousViolations, bool b28_InducedTrafficking, bool b29_TraffickedServitude, bool b30_AbettedSexActs,
            bool b31_FamilyTrafficking, bool b32_MoneyLaundering, bool b33_ViolatesEspionage, bool b34_ProhibitingExport,
            bool b35_OverthrowingUSGov, bool b36_EndangerWelfare, bool b37_UnlawfulActivity, bool b38_InAdversePolicy,
            bool b39_CommittedCrime, bool b40_ParticipatedInGroup, bool b41_RecruitedMembers, bool b42_SupportActivities,
            bool b43_SupportIndividual, bool b44_MilitaryTraining, bool b45_IntendToEngageQ39To45, bool b46_FamilyCommitted,
            bool b47_FamilyParticipated, bool b48_FamilyRecruited, bool b49_FamilySupportActivity, bool b50_FamilySupportIndividual,
            bool b51_FamilyMilitaryTraining, bool b52_SellingWeapons, bool b53_WorkedInPrison, bool b54_AssistedUsingWeapon,
            bool b55_ServedInArmedGroup, bool b56_AffiliatedCommunist, bool b57_IncitePersecution, bool b58_A_InvolvingGenocide,
            bool b58_B_KillingPerson, bool b58_C_InjuringPerson, bool b58_D_SexualContact, bool b58_E_LimitingAbility,
            bool b59_RecruitedPersUnder15, bool b60_UsedPersUnder15, bool b61_ReceivedUSAsst, bool b62_LikelyToReceiveAsst,
            bool b63_FailedToAttend, bool b64_ReasonableCause, bool b65_AttachWrittenStatement, bool b66_SubmittedFraudulentDoc,
            bool b67_LiedOnApplication, bool b68_ClaimedUSCitizen, bool b69_StowawayOnVessel, bool b70_EncouragedSmuggling,
            bool b71_UnderPenaltyForViolating, bool b72_BeenExcludedFromUS, bool b73_EnteredUSWithoutInsp,
            bool b74_A_UnlawfullyInUS180Days, bool b74_B_UnlawfullyInUS1Year, bool b75_A_ReenteredWOInspection,
            bool b75_B_BeenDeported, bool b76_PlanPolygamy, bool b77_AccompanyForeigner, bool b78_AssistedInDetaining,
            bool b79_VotedInViolation, bool b80_RenouncedUSCitizenship, bool b81_AppliedExemption, bool b82_RelievedFromService,
            bool b83_ConvictedDesertion, bool b84_RemainedOutsideUS, bool b85_ImmigrationStatus)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(
                 Global.dbcnn, "UpdateI485_BackgroundInfo",
                 new SqlParameter("@FranchiseID", user.FranchiseID),
                 new SqlParameter("@UserID", user.UserID),
                 new SqlParameter("@I485ID", I485ID),
                 new SqlParameter("@1_AdmissionDeniedToUS", b1_AdmissionDeniedToUS),
                 new SqlParameter("@2_VisaDeniedToUS", b2_VisaDeniedToUS),
                 new SqlParameter("@3_WorkedUSWithoutAuthz", b3_WorkedUSWithoutAuthz),
                 new SqlParameter("@4_ViolatedTerms", b4_ViolatedTerms),
                 new SqlParameter("@5_InExclusion", b5_InExclusion),
                 new SqlParameter("@6_IssuedFinalOrderExcl", b6_IssuedFinalOrderExcl),
                 new SqlParameter("@7_HadPriorFinalOrderExcl", b7_HadPriorFinalOrderExcl),
                 new SqlParameter("@8_LawfulResident", b8_LawfulResident),
                 new SqlParameter("@9_GrantedDeparture", b9_GrantedDeparture),
                 new SqlParameter("@10_AppliedProtection", b10_AppliedProtection),
                 new SqlParameter("@11_A_BeenNonimmigrant", b11_A_BeenNonimmigrant),
                 new SqlParameter("@11_B_CompliedRequirement", b11_B_CompliedRequirement),
                 new SqlParameter("@11_C_BeenGrantedWaiver", b11_C_BeenGrantedWaiver),
                 new SqlParameter("@12_BeenArrested", b12_BeenArrested),
                 new SqlParameter("@13_CommittedCrime", b13_CommittedCrime),
                 new SqlParameter("@14_PledGuilty", b14_PledGuilty),
                 new SqlParameter("@15_BeenOrderedPunished", b15_BeenOrderedPunished),
                 new SqlParameter("@16_BeenDefendant", b16_BeenDefendant),
                 new SqlParameter("@17_ViolatedRegulation", b17_ViolatedRegulation),
                 new SqlParameter("@18_ConvictedForOffenses", b18_ConvictedForOffenses),
                 new SqlParameter("@19_TraffickedSubstances", b19_TraffickedSubstances),
                 new SqlParameter("@20_AidedTrafficking", b20_AidedTrafficking),
                 new SqlParameter("@21_FamilyTrafficked", b21_FamilyTrafficked),
                 new SqlParameter("@22_EngagedInProstitution", b22_EngagedInProstitution),
                 new SqlParameter("@23_ProcuredProstitutes", b23_ProcuredProstitutes),
                 new SqlParameter("@24_ReceiveMoneyProstitution", b24_ReceiveMoneyProstitution),
                 new SqlParameter("@25_IntendToEngageGambling", b25_IntendToEngageGambling),
                 new SqlParameter("@26_ExercisedImmunity", b26_ExercisedImmunity),
                 new SqlParameter("@27_ReligiousViolations", b27_ReligiousViolations),
                 new SqlParameter("@28_InducedTrafficking", b28_InducedTrafficking),
                 new SqlParameter("@29_TraffickedServitude", b29_TraffickedServitude),
                 new SqlParameter("@30_AbettedSexActs", b30_AbettedSexActs),
                 new SqlParameter("@31_FamilyTrafficking", b31_FamilyTrafficking),
                 new SqlParameter("@32_MoneyLaundering", b32_MoneyLaundering),
                 new SqlParameter("@33_ViolatesEspionage", b33_ViolatesEspionage),
                 new SqlParameter("@34_ProhibitingExport", b34_ProhibitingExport),
                 new SqlParameter("@35_OverthrowingUSGov", b35_OverthrowingUSGov),
                 new SqlParameter("@36_EndangerWelfare", b36_EndangerWelfare),
                 new SqlParameter("@37_UnlawfulActivity", b37_UnlawfulActivity),
                 new SqlParameter("@38_InAdversePolicy", b38_InAdversePolicy),
                 new SqlParameter("@39_CommittedCrime", b39_CommittedCrime),
                 new SqlParameter("@40_ParticipatedInGroup", b40_ParticipatedInGroup),
                 new SqlParameter("@41_RecruitedMembers", b41_RecruitedMembers),
                 new SqlParameter("@42_SupportActivities", b42_SupportActivities),
                 new SqlParameter("@43_SupportIndividual", b43_SupportIndividual),
                 new SqlParameter("@44_MilitaryTraining", b44_MilitaryTraining),
                 new SqlParameter("@45_IntendToEngageQ39To45", b45_IntendToEngageQ39To45),
                 new SqlParameter("@46_FamilyCommitted", b46_FamilyCommitted),
                 new SqlParameter("@47_FamilyParticipated", b47_FamilyParticipated),
                 new SqlParameter("@48_FamilyRecruited", b48_FamilyRecruited),
                 new SqlParameter("@49_FamilySupportActivity", b49_FamilySupportActivity),
                 new SqlParameter("@50_FamilySupportIndividual", b50_FamilySupportIndividual),
                 new SqlParameter("@51_FamilyMilitaryTraining", b51_FamilyMilitaryTraining),
                 new SqlParameter("@52_SellingWeapons", b52_SellingWeapons),
                 new SqlParameter("@53_WorkedInPrison", b53_WorkedInPrison),
                 new SqlParameter("@54_AssistedUsingWeapon", b54_AssistedUsingWeapon),
                 new SqlParameter("@55_ServedInArmedGroup", b55_ServedInArmedGroup),
                 new SqlParameter("@56_AffiliatedCommunist", b56_AffiliatedCommunist),
                 new SqlParameter("@57_IncitePersecution", b57_IncitePersecution),
                 new SqlParameter("@58_A_InvolvingGenocide", b58_A_InvolvingGenocide),
                 new SqlParameter("@58_B_KillingPerson", b58_B_KillingPerson),
                 new SqlParameter("@58_C_InjuringPerson", b58_C_InjuringPerson),
                 new SqlParameter("@58_D_SexualContact", b58_D_SexualContact),
                 new SqlParameter("@58_E_LimitingAbility", b58_E_LimitingAbility),
                 new SqlParameter("@59_RecruitedPersUnder15", b59_RecruitedPersUnder15),
                 new SqlParameter("@60_UsedPersUnder15", b60_UsedPersUnder15),
                 new SqlParameter("@61_ReceivedUSAsst", b61_ReceivedUSAsst),
                 new SqlParameter("@62_LikelyToReceiveAsst", b62_LikelyToReceiveAsst),
                 new SqlParameter("@63_FailedToAttend", b63_FailedToAttend),
                 new SqlParameter("@64_ReasonableCause", b64_ReasonableCause),
                 new SqlParameter("@65_AttachWrittenStatement", b65_AttachWrittenStatement),
                 new SqlParameter("@66_SubmittedFraudulentDoc", b66_SubmittedFraudulentDoc),
                 new SqlParameter("@67_LiedOnApplication", b67_LiedOnApplication),
                 new SqlParameter("@68_ClaimedUSCitizen", b68_ClaimedUSCitizen),
                 new SqlParameter("@69_StowawayOnVessel", b69_StowawayOnVessel),
                 new SqlParameter("@70_EncouragedSmuggling", b70_EncouragedSmuggling),
                 new SqlParameter("@71_UnderPenaltyForViolating", b71_UnderPenaltyForViolating),
                 new SqlParameter("@72_BeenExcludedFromUS", b72_BeenExcludedFromUS),
                 new SqlParameter("@73_EnteredUSWithoutInsp", b73_EnteredUSWithoutInsp),
                 new SqlParameter("@74_A_UnlawfullyInUS180Days", b74_A_UnlawfullyInUS180Days),
                 new SqlParameter("@74_B_UnlawfullyInUS1Year", b74_B_UnlawfullyInUS1Year),
                 new SqlParameter("@75_A_ReenteredWOInspection", b75_A_ReenteredWOInspection),
                 new SqlParameter("@75_B_BeenDeported", b75_B_BeenDeported),
                 new SqlParameter("@76_PlanPolygamy", b76_PlanPolygamy),
                 new SqlParameter("@77_AccompanyForeigner", b77_AccompanyForeigner),
                 new SqlParameter("@78_AssistedInDetaining", b78_AssistedInDetaining),
                 new SqlParameter("@79_VotedInViolation", b79_VotedInViolation),
                 new SqlParameter("@80_RenouncedUSCitizenship", b80_RenouncedUSCitizenship),
                 new SqlParameter("@81_AppliedExemption", b81_AppliedExemption),
                 new SqlParameter("@82_RelievedFromService", b82_RelievedFromService),
                 new SqlParameter("@83_ConvictedDesertion", b83_ConvictedDesertion),
                 new SqlParameter("@84_RemainedOutsideUS", b84_RemainedOutsideUS),
                 new SqlParameter("@85_ImmigrationStatus", b85_ImmigrationStatus)

                );
            }


        public DataTable GetFamilyMember(User user, string ApplicantID)
        {
            DataTable dtFamilyMember = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetFamilyMember",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicantID", ApplicantID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtFamilyMember = ds.Tables[0];
            }
            return dtFamilyMember;
        }

        public void InsertUpdateFamilyMember(User user,
            string ApplicantID, string ApplicantFamilyID, string Status, bool Active,
            string RelationshipID, string LastName, string FirstName, string MI)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(
                    Global.dbcnn, "InsertUpdateFamilyMember",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicantID", ApplicantID),
                    new SqlParameter("@ApplicantFamilyID", ApplicantFamilyID),
                    new SqlParameter("@Status", Status),
                    new SqlParameter("@Active", Active),
                    new SqlParameter("@RelationshipID", RelationshipID),
                    new SqlParameter("@FirstName", FirstName),
                    new SqlParameter("@LastName", LastName),
                    new SqlParameter("@MI", MI)
                );
        }

        public DataTable GetFamilyI485ByApplicantID(User user, string ApplicantID)
        {
            DataTable dtFamilyI485 = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetFamilyI485ByApplicantID",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@ApplicantID", ApplicantID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtFamilyI485 = ds.Tables[0];
            }
            return dtFamilyI485;
        }
        #endregion

        #region functions
        public static string BoolToDefault(Object obj, string Default)
        {
            string result = Default;
            if (obj.ToString() != string.Empty)
            {
                result = (obj.ToString() == "True") ? "1" : "0";
            }
            return result;
        }

        public double StringToDouble(string sValue)
        {
            double dResult;

            double.TryParse(sValue, out dResult);
            return dResult;
        }

        public int StringToInt(string sValue)
        {
            int iResult = 0;

            int.TryParse(sValue, out iResult);
            return iResult;
        }

        public string EmptyToNull(string sParam)
        {
            string sResult = null;

            if (sParam != string.Empty)
            {
                sResult = sParam;
            }

            return sResult;
        }


        public static string StringToDateFormat(Object dt)
        {
            string result = string.Empty;
            try
            {
                result = DateTime.Parse(dt.ToString()).ToString("yyyy-MM-dd");
            }
            catch (Exception)
            {
                //
            }
            return result;
        }

        public static string StringToDefault(Object obj, string Default)
        {
            string result = Default;
            if (obj.ToString() != string.Empty)
            {
                result = obj.ToString();
            }
            return result;
        }
        #endregion
    }
}