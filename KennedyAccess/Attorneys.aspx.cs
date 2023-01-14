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
    public partial class Attorneys : System.Web.UI.Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Attorneys"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAttorney",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@AttorneyID", 0),
                        new SqlParameter("@UserID", user.UserID))).Tables[0];
                gvAttorneys.DataSource = dt;
                gvAttorneys.DataBind();
            }

            gvAttorneys.Columns[6].Visible = user.HasRole("Attorney");
            btnNewAttorney.Visible = user.HasRole("AttorneyCreate");
        }
        protected void btnNewAttorney_Click(object sender, EventArgs e)
        {
            Session["AttorneyID"] = -1;
            Response.Redirect("Attorney.aspx");
        }
        protected void btnSearchAttorney_Click(object sender, EventArgs e)
        {
            DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAttorney",
                        new SqlParameter("@AttorneyID", 0),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@Search", btnSearch.Text))).Tables[0];
            gvAttorneys.DataSource = dt;
            gvAttorneys.DataBind();
        }
        protected void gvAttorneys_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvAttorneys.Rows[index];
                string sAttorneyID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Session["AttorneyID"] = sAttorneyID;
                Response.Redirect("Attorney.aspx");
            }
        }

    }
}