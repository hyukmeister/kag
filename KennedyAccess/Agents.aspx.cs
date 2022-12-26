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
    public partial class Agents : System.Web.UI.Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {

            user = (User)Session["User"];
            if (user == null || !user.HasRole("Agents"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAgent",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@AgentID", 0),
                    new SqlParameter("@UserID", user.UserID))).Tables[0];
                gvAgents.DataSource = dt;
                gvAgents.DataBind();
            }
        }
        protected void btnNewAgent_Click(object sender, EventArgs e)
        {
            Session["AgentID"] = -1;
            Response.Redirect("Agent.aspx");
        }
        protected void btnSearchAgent_Click(object sender, EventArgs e)
        {
            DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAgent",
                        new SqlParameter("@AgentID", 0),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@Search", txtSearch.Text))).Tables[0];
            gvAgents.DataSource = dt;
            gvAgents.DataBind();
        }
        protected void gvAgents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvAgents.Rows[index];
                string sAgentID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Session["AgentID"] = sAgentID;
                Response.Redirect("Agent.aspx");
            }
        }
    }
}