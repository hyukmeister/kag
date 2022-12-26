using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
//using TextMagicClient.Model;
using KennedyAccess.Classes;

namespace KennedyAccess.Login
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.SetUserVerification(1000, -1, txtUserName.Text);

            if (dt.Rows.Count==1)
            {
                User user = new User();
                user.UserID = int.Parse(dt.Rows[0]["UserID"].ToString());
                user.Email=txtUserName.Text;
                user.Authenticated = false;

                Session["User"] = user;
            }

            if (1==1)
            {
                // send authentication code via sms 
                bd.SendText(dt.Rows[0]["Mobilephone"].ToString(), dt.Rows[0]["VerificationCode"].ToString());
            }
            else
            {
                // send authentication code via email
                //bd.SendEmail(dt.Rows[0]["Email"].ToString(), dt.Rows[0]["VerificationCode"].ToString());
            }

            Response.Redirect("ResetPassword.aspx");

        }
    }
}