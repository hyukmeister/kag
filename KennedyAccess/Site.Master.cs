using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess
{
    public partial class Sapphire : System.Web.UI.MasterPage
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user = (User)Session["User"];

                if (user != null && user.Authenticated)
                {
                    divEmployers.Visible = user.HasRole("Employers");
                    divAgents.Visible = user.HasRole("Agents");
                    divAttorneys.Visible = user.HasRole("Attorneys");
                    divPrevailingWages.Visible = user.HasRole("PrevailingWages") && (user.ObjectID != 0 || user.UserType != "Employer");
                    divApplicants.Visible = user.HasRole("Applicants");
                    divCampaigns.Visible = user.HasRole("Campaigns") && (user.ObjectID != 0 || user.UserType != "Employer");
                    divJobListings.Visible = user.HasRole("JobListings") && (user.ObjectID != 0 || user.UserType != "Applicant");
                    divApplications.Visible = user.HasRole("Applications") && (user.ObjectID != 0 || user.UserType != "Employer");
                    divUsers.Visible = user.HasRole("Users");
                    divSettings.Visible = user.HasRole("Settings");
                    divRoles.Visible = user.HasRole("Roles");
                    divRoleSets.Visible = user.HasRole("RoleSets");
                    divQuestionnaires.Visible = user.HasRole("Questionnaires");
                    divLogOut.Visible = user.HasRole("Employers");
                    divProfiles.Visible = user.HasRole("Profiles");

                    divProfile.Visible = user.UserType != "System Admin";
                    divLogOut.Visible = true;
                }
                else
                {
                    divMenu.Visible = false;
                }
            }
        }

        protected void btnProfile_Click(object sender, ImageClickEventArgs e)
        {
            user = (User)Session["User"];
            if (user != null)
            {
                //myProfile.
                switch (user.UserType)
                {
                    case "System Admin":
                        break;
                    case "Employer":
                        //Session["EmployerID"] = (user.ObjectID == 0) ? -1 : user.ObjectID;
                        Response.Redirect("Employer.aspx");
                        break;
                    case "Attorney":
                        break;
                    case "Kennedy Access":
                        break;
                    case "Agent":
                        break;
                    case "Applicant":
                        Response.Redirect("Applicant.aspx");
                        break;
                }
            }
        }

        protected void btnProfile_Click1(object sender, EventArgs e)
        {
            btnProfile_Click(sender, null);
        }
    }
}