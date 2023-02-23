using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class UserSearchProfiles : System.Web.UI.UserControl
    {
        private User user;
        public bool LoadProfiles;

        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack && LoadProfiles)
            {
                bool bDefaultProfile = false;

                // load search profiles
                DataTable dt = bd.GetUserSearchProfile(user);
                gvSearchProfiles.DataSource = dt;
                gvSearchProfiles.DataBind();

                // check for default profile
                foreach(DataRow dr in dt.Rows)
                {
                    if (dr["Default"].ToString() == "True")
                    {
                        // set dropdown checkboxes with default profile settings
                        LoadSearchProfile(dr["UsrSearchID"].ToString());
                        bDefaultProfile = true;
                        continue;
                    }
                }

                if(!bDefaultProfile)
                {
                    // load all employers
                    DataTable employers = bd.GetEmployer(user, "0", "");
                    ddcbEmployers.AddItems(employers, "EmployerName", "EmployerId");

                    // load all statuses
                    DataTable statuses = bd.GetProfile(user);
                    ddcbStatuses.AddItems(statuses, "RoleSetName", "RoleSetID");
                }
            }
            ddcbEmployers.UserControlButtonClicked += new EventHandler(PopulateddbcCampains);

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

        protected void gvSearchProfiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvSearchProfiles.Rows[index];
                string UsrSearchID = ((Label)selectedRow.Cells[0].Controls[1]).Text;
                foreach(GridViewRow gvr in gvSearchProfiles.Rows)
                {
                    gvr.BackColor = Color.White;
                }

                selectedRow.BackColor = Color.Silver;

                // get search profile
                LoadSearchProfile(UsrSearchID);
            }
        }

        private void LoadSearchProfile(string UsrSearchID)
        {
            // clear prev search texts
            ddcbEmployers.ClearAll();
            ddcbCampaigns.ClearAll();
            ddcbStatuses.ClearAll();

            // get the default search profile
            DataSet ds = bd.GetUserSearchProfileDetail(user, UsrSearchID);

            ddcbEmployers.AddItems(ds.Tables[0], "EmployerName", "EmployerId");
            //ddcbEmployers.SetCheckboxItems(true);
            ddcbCampaigns.AddItems(ds.Tables[1], "Description", "CampaignID");
            //ddcbCampaigns.SetCheckboxItems(true);
            ddcbStatuses.AddItems(ds.Tables[2], "RoleSetName", "RoleSetID");
            //ddcbStatuses.SetCheckboxItems(true);

            //if (ddcbEmployers.Text.Length > 0)
            //    ddcbEmployers.Text = ddcbEmployers.Text.Substring(2, ddcbEmployers.Text.Length - 2);
            //if (ddcbCampaigns.Text.Length > 0)
            //    ddcbCampaigns.Text = ddcbCampaigns.Text.Substring(2, ddcbCampaigns.Text.Length - 2);
            //if (ddcbStatuses.Text.Length > 0)
            //    ddcbStatuses.Text = ddcbStatuses.Text.Substring(2, ddcbStatuses.Text.Length - 2);

            // Search
            btnSearch_Click(null, null);
        }

        private void SetCheckBoxValues(DropDownCheckBox ddcb, string cbValue)
        {
            string s = string.Empty;
            for (int i = 0; i < ddcb.Length(); i++)
            {
                ListItem li = ddcb.Item(i);
                if (li.Value.ToString() == cbValue)
                {
                    li.Selected = true;
                    s += ", " + li.Text;
                    break;
                }
            }
            ddcb.Text += s;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvSearchProfiles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((CheckBox)e.Row.Cells[1].Controls[1]).Checked)
                {
                    e.Row.BackColor = Color.Silver;
                }
            }
        }

        // do this only when creating a new profile
        public void PopulateddbcCampains(object sender, EventArgs e)
        {
            // get list of selected employers
            DataTable selectedEmps = ddcbEmployers.GetSelectedValues();

            // concat employer IDs separated by ','
            string sEmployers = string.Empty;
            foreach(DataRow dr in selectedEmps.Rows)
            {
                sEmployers += "," + dr["value"].ToString();
            }
            sEmployers = sEmployers.Substring(1, sEmployers.Length - 1);

            DataTable campaigns = bd.GetCampaign(user, "0", "0", sEmployers);
            ddcbCampaigns.AddItems(campaigns, "Description", "CampaignID");
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            // get the selected row from gvSearchProfiles

            // get the profileid, name, default

            // update the profile with new selections
        }
    }
}