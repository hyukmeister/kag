using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;

namespace KennedyAccess
{
    public partial class Users : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.MaintainScrollPositionOnPostBack = true;
            user = (User)Session["User"];
            if (user == null || !(user.HasRole("Users") || user.HasRole("CampaignTeamLeader") || user.HasRole("CampaignTeamLeader")))
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dtUsers = bd.GetUsrMain(user, "0", "");
                gvUsers.DataSource = dtUsers;
                gvUsers.DataBind();

                ViewState["dtUsers"] = dtUsers;
            }
            gvUsers.Columns[8].Visible = user.HasRole("User");

        }
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.GetUsrMain(user, "0", txtSearch.Text);
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }
        protected void gvUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvUsers.Rows[index];
                string sUserID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Session["UserID"] = sUserID;
                Response.Redirect("User.aspx");
            }
        }
        protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtUsers = (DataTable)ViewState["dtUsers"];
            if (dtUsers != null)
            {
                DataView dataView = new DataView(dtUsers);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvUsers.DataSource = dataView;
                gvUsers.DataBind();
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