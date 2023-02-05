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

        public double StringToDouble(string sValue)
        {
            double dResult;

            double.TryParse(sValue, out dResult);
            return dResult;
        }
        public int StringToInt(string sValue)
        {
            int iResult=0;

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

        public DataTable GetUserSearchProfileDetail(User user, string UsrSearchID)
        {
            DataTable dtProfileDetail = null;
            DataSet ds = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUserSearchProfileDetail",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@UsrSearchID", UsrSearchID)));

            if (ds != null && ds.Tables.Count > 0)
            {
                dtProfileDetail = ds.Tables[0];
            }
            return dtProfileDetail;
        }
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
    }
}