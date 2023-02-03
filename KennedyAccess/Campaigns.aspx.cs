using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;
using KennedyAccess.Admin;

namespace KennedyAccess
{
    public partial class Campaigns : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Campaigns"))
                Response.Redirect("Default.aspx");

            int employerid;
            // if user has Employers role then 0 else loged in user ID
            if (user.UserType == "Employer")
                employerid = user.ObjectID;
            else
                employerid = 0;


            if (!Page.IsPostBack)
            {
                DataTable dtCampaigns = bd.GetCampaign(user, employerid.ToString(), "0", txtSearch.Text);
                gvCampaigns.DataSource = dtCampaigns;
                gvCampaigns.DataBind();

                ViewState["dtCampaigns"] = dtCampaigns;
            }

            // E & A
            gvCampaigns.Columns[4].Visible = user.HasRole("Campaign");
            btnNew.Visible = user.HasRole("CampaignCreate");
        }

        protected void gvCampaign_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvCampaigns.Rows[index];
                Session["CampaignID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("Campaign.aspx");

            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.GetCampaign(user, "0", "0", txtSearch.Text);
            gvCampaigns.DataSource = dt;
            gvCampaigns.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Session["CampaignID"] = -1;
            Response.Redirect("Campaign.aspx");
        }
        protected void gvCampaigns_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtCampaigns = (DataTable)ViewState["dtCampaigns"];
            if (dtCampaigns != null)
            {
                DataView dataView = new DataView(dtCampaigns);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvCampaigns.DataSource = dataView;
                gvCampaigns.DataBind();
            }
        }
        private string SortDirection
        {
            get
            {
                return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC";
            }
            set
            {
                ViewState["SortDirection"] = value;
            }
        }
    }
}