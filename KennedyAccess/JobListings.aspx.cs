using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Drawing;
using KennedyAccess.Classes;

namespace KennedyAccess
{
    public partial class JobListings : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("JobListings"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dtJobListings = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetJoblistingOutline",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@CampaignID", 0))).Tables[0];
                gvJobListings.DataSource = bd.GetJoblistingOutline(user,"0","0");
                gvJobListings.DataBind();

                ViewState["dtJobListings"] = dtJobListings;

                if(user.UserType=="Applicant")
                {
                    gvJobListings.Columns[4].Visible = false;
                    gvJobListings.Columns[5].Visible = true;
                }
                else
                {
                    gvJobListings.Columns[4].Visible = true;
                    gvJobListings.Columns[5].Visible = false;
                }
            }
        }
        protected void btnSearchJobListing_Click(object sender, EventArgs e)
        {
            DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetJoblisting",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@CampaignID", 0),
                        new SqlParameter("@Search", txtSearch.Text))).Tables[0];
            gvJobListings.DataSource = dt;
            gvJobListings.DataBind();
        }
        protected void gvJobListings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                
                GridViewRow selectedRow = gvJobListings.Rows[index];
                string sJobListingID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Session["JobListingID"] = sJobListingID;
                Response.Redirect("JobListing.aspx");
            }
        }

        protected void gvJobListings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbllblJobListingID = (Label)e.Row.FindControl("lblJobListingID");
                if (e.Row.RowType == DataControlRowType.DataRow && lbllblJobListingID != null && lbllblJobListingID.Text == user.AppliedJobidID.ToString())
                {
                    
                    //GridViewRow selectedRow = gvJobListings.Rows[e.Row.RowIndex];
                    e.Row.BackColor = Color.Gray;
                }
            }
        }
        protected void gvJobListings_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtJobListings = (DataTable)ViewState["dtJobListings"];
            if (dtJobListings != null)
            {
                DataView dataView = new DataView(dtJobListings);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvJobListings.DataSource = dataView;
                gvJobListings.DataBind();
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