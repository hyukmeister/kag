using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.SqlClient;
using KennedyAccess;
using System.Configuration;
using System.Data;
using KennedyAccess.Classes;

namespace KennedyAccess
{
    public class Global : HttpApplication
    {
        public static string dbcnn = "";
        public static string sCompanyName = "";
        public static string sCompanyLogo = "";
        public static string sKey = "";
        public static string sEmailServer = "";
        public static string sEmailUserName = "";
        public static string sEmailPassword = "";
        public static int iEmailPort;
        public static string sSMSUser = "";
        public static string sSMSPass = "";

        public static string sService = "";
        public static string sConskey = "";
        public static string sSecret = "";

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            AppSettingsReader settingreader = new AppSettingsReader();

            string phrase = ((string)settingreader.GetValue("Vendor", typeof(string))).ToLower();
            string vector = ((string)settingreader.GetValue("Franchise", typeof(string))).ToLower();
            Data.Encrypt.RijndaelEnhanced rinEnhanced = new Data.Encrypt.RijndaelEnhanced(phrase, vector);

            sKey = RemoveSalt((string)settingreader.GetValue("Key", typeof(string)));

            sEmailServer = RemoveSalt((string)settingreader.GetValue("EServer", typeof(string)));
            sEmailUserName = RemoveSalt((string)settingreader.GetValue("EUserName", typeof(string)));
            sEmailPassword = RemoveSalt((string)settingreader.GetValue("EPassword", typeof(string)));
            string sEmailPort = RemoveSalt(settingreader.GetValue("EPort", typeof(string)).ToString());

            sSMSUser = RemoveSalt((string)settingreader.GetValue("SMUser", typeof(string)));
            sSMSPass = RemoveSalt((string)settingreader.GetValue("SMPass", typeof(string)));

            dbcnn = RemoveSalt((string)settingreader.GetValue("ODBCConnection", typeof(string)));
            sCompanyName = (string)settingreader.GetValue("CompanyName", typeof(string));
            sCompanyLogo = (string)settingreader.GetValue("CompanyLogo", typeof(string));

            sKey = rinEnhanced.Decrypt(sKey).Replace("#", "").Replace("^", "");
            sEmailServer = rinEnhanced.Decrypt(sEmailServer).Replace("#", "").Replace("^", "");
            sEmailUserName = rinEnhanced.Decrypt(sEmailUserName).Replace("#", "").Replace("^", "");
            sEmailPassword = rinEnhanced.Decrypt(sEmailPassword).Replace("$", "").Replace("^", "");
            iEmailPort = int.Parse(rinEnhanced.Decrypt(sEmailPort).Replace("#", "").Replace("^", ""));

            // salesforce
            sService = (string)settingreader.GetValue("ServiceProtocol", typeof(string));
            sConskey = (string)settingreader.GetValue("ConnectKey", typeof(string));
            sSecret = (string)settingreader.GetValue("EncryptKey", typeof(string));
            sService = RemoveSalt(sService).Replace("^", "");
            sConskey = RemoveSalt(sConskey).Replace("^", "");
            sSecret = RemoveSalt(sSecret).Replace("^", "");
            // salesforce

            sSMSUser = rinEnhanced.Decrypt(sSMSUser).Replace("$", "").Replace("^", "");
            sSMSPass = rinEnhanced.Decrypt(sSMSPass).Replace("$", "").Replace("^", "");

            rinEnhanced = new Data.Encrypt.RijndaelEnhanced(sKey, sKey);
            dbcnn = rinEnhanced.Decrypt(dbcnn).Replace("^", "");

            // salesforce
            sService = rinEnhanced.Decrypt(sService).Replace("^", "");
            sConskey = rinEnhanced.Decrypt(sConskey).Replace("^", "");
            sSecret = rinEnhanced.Decrypt(sSecret).Replace("^", "");
            // salesforce

            // load base tables
            BaseData bd = new BaseData();
            bd.LoadBaseData(Application);
        }

        void Session_Start(object sender, EventArgs e)
        {
            // your code here, it will be executed upon session start
        }
        void Session_End(object sender, EventArgs e)
        {
            //User user = (User)Session["User"];
            //if(user != null)
            //{
            //    BaseData bd = new BaseData();
            //    string recordtypeid = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", "Login").ToString();
            //    bd.WriteAuditTrail(user, recordtypeid, "User logged out");
            //}
        }
        private string RemoveSalt(string sSaltedString)
        {
            int iPos = 0;
            string result = "";

            for (iPos = 3; iPos < sSaltedString.Length; iPos += 4)
            {
                result += sSaltedString.Substring(iPos - 3, 3);
            }

            int len = sSaltedString.Length - (iPos - 3);
            result += sSaltedString.Substring(iPos - 3, len);
            return result;
        }
    } 
}