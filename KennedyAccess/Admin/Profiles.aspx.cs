using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Admin
{
    public partial class Profiles : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Profiles"))
                Response.Redirect("Default.aspx");

            if (user.HasRole("ProfilesCreate"))
                tabNewRole.Visible = true;

            if (!IsPostBack)
            {
                LoadProfiles(true);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        private void LoadProfiles(bool bDBLoad)
        {
            DataTable dtProfile = null;
            if (bDBLoad)
            {
                dtProfile = bd.GetProfile(user);
                Application["RoleSet"] = dtProfile;
            }
            else
            {
                dtProfile = (DataTable)Application["RoleSet"];
            }
            gvProfiles.DataSource = dtProfile;
            gvProfiles.DataBind();
        }

        protected void gvProfiles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProfiles.EditIndex = -1;
            LoadProfiles(false);
        }

        protected void gvProfiles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string sProfileId = ((Label)(gvProfiles.Rows[gvProfiles.EditIndex].Cells[0].Controls[1])).Text;
            TextBox txtProfile = (TextBox)gvProfiles.Rows[gvProfiles.EditIndex].Cells[2].Controls[1];
            bd.InserUpdatetProfile(user, true, sProfileId, txtProfile.Text);

            gvProfiles.EditIndex = -1;
            LoadProfiles(true);

            labError.Text = "";
        }

        protected void gvProfiles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProfiles.EditIndex = e.NewEditIndex;
            LoadProfiles(false);
        }

        protected void btnSaveNewProfile_Click(object sender, EventArgs e)
        {
            try
            {
                bd.InserUpdatetProfile(user, true, "0", txtNewProfileName.Text);

                // clear textboxes
                txtNewProfileName.Text = String.Empty;

                // reload grid
                LoadProfiles(true);
            }
            catch 
            {
                labError.Text = "Cannot add duplicate record. Please revise and try again.";
            }
        }
    }
}