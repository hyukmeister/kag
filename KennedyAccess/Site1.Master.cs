using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class SiteMaster : MasterPage
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user = (User)Session["User"];
                if (user != null && user.Authenticated)
                {
                    for (int i = mainMenu.Items.Count - 1; i > 0; i--)
                    {
                        MenuItem oMenuItem = mainMenu.Items[i];
                        bool bSubMenu = false;

                        for (int j = oMenuItem.ChildItems.Count - 1; j >= 0; j--)
                        {
                            MenuItem m = oMenuItem.ChildItems[j];
                            if (user.HasRole(m.Text) || m.Text == "Log Out" || m.Text == "Profile")
                            {
                                bSubMenu = true;
                            }
                            else
                            {
                                oMenuItem.ChildItems.Remove(m);
                            }
                        }

                        if ((!bSubMenu && !user.HasRole(oMenuItem.Value)) && oMenuItem.Value != "Profile")
                        {
                            mainMenu.Items.Remove(oMenuItem);
                        }
                    }
                }
                else
                {
                    tabmainMenu.Visible = false;
                }
            }
        }

        protected void imgProfile_Click(object sender, ImageClickEventArgs e)
        {
            user = (User)Session["User"];
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

        protected void mainMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            user = (User)Session["User"];
            if(e.Item.Text=="Profile")
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
                        Response.Redirect("Attorney.aspx");
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
    }
}