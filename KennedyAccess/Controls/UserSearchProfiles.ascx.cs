using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class UserSearchProfiles : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                DataTable employers = bd.GetEmployer(user, "0", "");
                ddcbEmployers.ClearAll();
                ddcbEmployers.AddItems(employers, "EmployerName", "EmployerId");

                DataTable campaigns = bd.GetCampaign(user, "0", "0");
                ddcbCampaigns.ClearAll();
                ddcbCampaigns.AddItems(campaigns, "Description", "CampaignID");

                DataTable statuses = bd.GetProfile(user);
                ddcbStatuses.ClearAll();
                ddcbStatuses.AddItems(statuses, "RoleSetName", "RoleSetID");
            }
        }
        protected void SaveSearch_Click(object sender, EventArgs e)
        {

            // save the search name and get the parent id
            bool bDefault = rblDefaultSearchProfile.SelectedValue.ToString() == "1";
            string UserSearchID = bd.InsertUpdateSearch(user, "n", true, 0, bDefault, "Employers", txtSearchProfileName.Text);

            // loop each search criteria and save with parent id
            DataTable selectedEmps = ddcbEmployers.GetSelectedValues();
            foreach (DataRow row in selectedEmps.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Employers", row[0].ToString(), "");
            }
            DataTable selectedCamp = ddcbCampaigns.GetSelectedValues();
            foreach (DataRow row in selectedCamp.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Campaigns", row[0].ToString(), "");
            }
            DataTable selectedStat = ddcbStatuses.GetSelectedValues();
            foreach (DataRow row in selectedStat.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Status", row[0].ToString(), "");
            }
        }
    }
}