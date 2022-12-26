using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Users : System.Web.UI.Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {

            user = (User)Session["User"];
            if (user == null || !user.HasRole("Users"))
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dtUsers = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUsrMain",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@UsrMainID", "0"))).Tables[0];
                gvUsers.DataSource = dtUsers;
                gvUsers.DataBind();

                ViewState["dtUsers"] = dtUsers;
            }
        }
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetUsrMain",
                        new SqlParameter("@UsrMainID", "0"),
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@Search", txtSearch.Text))).Tables[0];
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