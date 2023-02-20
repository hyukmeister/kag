using Data.Encrypt;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;
using KennedyAccess.users;
using System.Web.UI.HtmlControls;

namespace KennedyAccess
{
    public partial class Default : System.Web.UI.Page
    {
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["user"]!=null)
                {

                    User user = (User)Session["User"];
                    if (user != null)
                    {
                        BaseData bd = new BaseData();
                        string recordtypeid = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "User", "Login").ToString();
                        bd.WriteAuditTrail(user, recordtypeid, "User logged out");
                    }

                    Session.Clear();
                    Session.Abandon();
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cnn = Global.dbcnn;

            //string hashpass = HashGenerator.ComputeHash(txtPassword.Text, "SHA512", null);
            DataTable dt = bd.AuthenticateByUserName(1000, txtUserName.Text);

            if (dt.Rows.Count > 0)
            {
                string passwordEnc = dt.Rows[0]["auth"].ToString();

                if (HashGenerator.VerifyHash(txtPassword.Text, "SHA512", passwordEnc))
                {
                    DataRow dr = dt.Rows[0];

                    // load user object into session
                    User user = new User();
                    user.UserID = int.Parse(dr["userid"].ToString());
                    user.FranchiseID= int.Parse(dr["FranchiseID"].ToString());
                    user.FirstName = dr["FirstName"].ToString();
                    user.LastName = dr["LastName"].ToString();
                    user.Email = dr["Email"].ToString();
                    user.Authenticated = (dr["Authenticated"].ToString() == "True") ? true : false;
                    user.UserType = dt.Rows[0]["RecordType"].ToString();
                    user.Mobilephone = dt.Rows[0]["Mobilephone"].ToString();
                    user.FranchiseName = dt.Rows[0]["FranchiseName"].ToString();
                    user.ObjectID = (dr["ObjectID"].ToString() == "") ? 0:int.Parse(dr["ObjectID"].ToString());

                    switch(user.UserType)
                    {
                        case "Employer":
                            Session["EmployerID"] = (user.ObjectID == 0) ? -1 : user.ObjectID;
                            break;
                        case "Applicant":
                            Session["ApplicantID"] = (user.ObjectID == 0) ? -1 : user.ObjectID;

                            // check if applicant applied for any job
                            user.AppliedJobidID = (dr["ApplicationID"].ToString() == "") ? 0 : int.Parse(dr["ApplicationID"].ToString());
                            break;
                        case "Agent":
                            Session["AgentID"] = (user.ObjectID == 0) ? -1 : user.ObjectID;
                            break;
                        case "Attorney":
                            Session["AttorneyID"] = (user.ObjectID == 0) ? -1 : user.ObjectID;
                            break;
                    }

                    // user roles
                    DataTable dtRoles = bd.GetUserRoles(user.FranchiseID, user.UserID, Request.UserHostAddress);
                    string roles = "";
                    foreach(DataRow drRole in dtRoles.Rows)
                    {
                        if (drRole["Active"].ToString()=="True")
                        roles += drRole["RoleName"].ToString() + ",";
                    }
                    user.UserRoles = roles;

                    // store user in session
                    Session["User"] = user;

                    if (user.Authenticated)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                        Response.Redirect("/Login/VerifyUser.aspx");
                }
            }
            else
            {
                // incorrect user name or password
                drError.Visible = true;
            }
        }
    }
}