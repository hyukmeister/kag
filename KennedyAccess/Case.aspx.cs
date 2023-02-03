using KennedyAccess.Classes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Case : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                DataTable employers = bd.GetEmployer(user, "0", "");
                DropDownEmployers.ClearAll();
                DropDownEmployers.AddItems(employers, "EmployerName", "EmployerId");

                DataTable campaigns = bd.GetCampaign(user, "0", "0", "");
                DropDownCampaigns.ClearAll();
                DropDownCampaigns.AddItems(campaigns, "Description", "CampaignID");

                DataTable statuses = bd.GetProfile(user);
                DropDownStatuses.ClearAll();
                DropDownStatuses.AddItems(statuses, "RoleSetName", "RoleSetID");
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {

        }
        protected void SaveSearch_Click(object sender, EventArgs e)
        {

            // save the search name and get the parent id
            bool bDefault = rblDefaultSearchProfile.SelectedValue.ToString() == "1";
            string UserSearchID = bd.InsertUpdateSearch(user, "n", true, 0, bDefault, "Employers", txtSearchProfileName.Text);

            // loop each search criteria and save with parent id
            DataTable selectedEmps = DropDownEmployers.GetSelectedValues();
            foreach (DataRow row in selectedEmps.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Employers", row[0].ToString(), "");
            }
            DataTable selectedCamp = DropDownCampaigns.GetSelectedValues();
            foreach (DataRow row in selectedCamp.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Campaigns", row[0].ToString(), "");
            }
            DataTable selectedStat = DropDownStatuses.GetSelectedValues();
            foreach (DataRow row in selectedStat.Rows)
            {
                bd.InsertUpdateSearchDetails(user, "n", UserSearchID, "0", "Status", row[0].ToString(), "");
            }
        }
    }
}