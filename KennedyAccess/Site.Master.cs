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
                    bool users = user.HasRole("Users");
                    bool settings = user.HasRole("Settings");
                    bool roles = user.HasRole("Roles");
                    bool rolesets = user.HasRole("RoleSets");
                    bool questionnaires = user.HasRole("Questionnaires");
                    bool employers = user.HasRole("Employers");
                    bool profiles = user.HasRole("Profiles");

                    divEmployers.Visible = user.HasRole("Employers");
                    divAgents.Visible = user.HasRole("Agents");
                    divAttorneys.Visible = user.HasRole("Attorneys");
                    divPrevailingWages.Visible = user.HasRole("PrevailingWages") && (user.ObjectID != 0 || user.UserType != "Employer");
                    divApplicants.Visible = user.HasRole("Applicants");
                    divCampaigns.Visible = user.HasRole("Campaigns") && (user.ObjectID != 0 || user.UserType != "Employer");
                    divJobListings.Visible = user.HasRole("JobListings") && (user.ObjectID != 0 || user.UserType != "Applicant");
                    divApplications.Visible = user.HasRole("Applications") && (user.ObjectID != 0 || user.UserType != "Employer");

                    accordionMenu.Visible = users || settings || roles || rolesets || roles || questionnaires || employers || profiles;
                    divUsers.Visible = users;
                    divSettings.Visible = settings;
                    divRoles.Visible = roles;
                    divRoleSets.Visible = rolesets;
                    divQuestionnaires.Visible = questionnaires;
                    divLogOut.Visible = employers;
                    divProfiles.Visible = profiles;

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