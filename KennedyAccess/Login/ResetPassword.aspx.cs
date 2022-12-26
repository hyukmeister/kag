using Org.BouncyCastle.Crypto.Tls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.Encrypt;

namespace KennedyAccess.users
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // validate password complexity

            // encrypt password
            string hashpass = HashGenerator.ComputeHash(txtPassword.Text, "SHA512", null);

            // reset password
            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, 
                "VerifyOTPandResetPassword", 
                new SqlParameter("@UserID", user.UserID), 
                new SqlParameter("@OTP", txtAuthentication.Text),
                new SqlParameter("@NewPassword", hashpass));
            DataTable dt = ds.Tables[0];

            if (dt.Rows.Count > 0)
            {
                if (int.Parse(dt.Rows[0][0].ToString()) == user.UserID)
                {
                    // verified
                    user.UserID = int.Parse(dt.Rows[0]["userid"].ToString());
                    user.FirstName = dt.Rows[0]["FirstName"].ToString();
                    user.LastName = dt.Rows[0]["LastName"].ToString();
                    user.Email = dt.Rows[0]["Email"].ToString();
                    user.Authenticated = true;
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    // verification failed
                    labLoginError.Visible = true;
                }
            }
        }
    }
}