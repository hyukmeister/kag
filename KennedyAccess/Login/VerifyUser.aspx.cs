using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using KennedyAccess;

using KennedyAccess.Classes;

namespace KennedyAccess
{
    public partial class VerifyUser : System.Web.UI.Page
    {
        private string cnn;
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            cnn = Global.dbcnn;
            user = (User)Session["User"];
            user.FranchiseID = 1000;

            if (!Page.IsPostBack && !user.Authenticated)
                btnSendOTC_Click(sender, e);
        }
        protected void btnVerify_Click(object sender, EventArgs e)
        {
            DataSet ds = SqlHelper.ExecuteDataset(cnn, "VerifyOTP", new SqlParameter("@UserID", user.UserID), new SqlParameter("@OTP", txtAuthentication.Text));
            DataTable dt = ds.Tables[0];

            if(dt.Rows.Count>0)
            {
                if(dt.Rows[0]["Authenticated"].ToString()=="True")
                {
                    // create user rolesets
                    bd.ResetUserRoleSets(user);

                    // verified
                    Console.WriteLine("Success");
                    Session.Clear(); 

                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    // verification failed
                    Console.WriteLine("Fail");
                }
            }

        }
        protected void btnSendOTC_Click(object sender, EventArgs e)
        {

            DataTable dt = bd.SetUserVerification(user.FranchiseID, user.UserID, "");

            if (1 == 1)
            {
                // send authentication code via sms 
                bd.SendText(dt.Rows[0]["Mobilephone"].ToString(), dt.Rows[0]["VerificationCode"].ToString());
            }
            else
            {
                // send authentication code via email
                //bd.SendMFACode(dt.Rows[0]["Email"].ToString(), dt.Rows[0]["VerificationCode"].ToString());
            }
        }
    }
}