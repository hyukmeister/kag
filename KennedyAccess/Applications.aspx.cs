using KennedyAccess.Classes;
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
    public partial class Applications : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Applications"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                string sJobListingID = string.Empty;

                switch (user.UserType)
                {
                    case "Employer":
                        if (Session["JobListingID"] != null)
                            sJobListingID = Session["JobListingID"].ToString();
                        else
                            sJobListingID = "0";
                        break;
                    case "System Admin":
                        sJobListingID = "0";
                        break;
                }

                DataTable dtApplicants = bd.GetApplication(user, "0", sJobListingID, user.ObjectID.ToString());
                
                gvApplications.DataSource = dtApplicants;
                gvApplications.DataBind();

                ViewState["dtApplicants"] = dtApplicants;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //DataTable dt = bd.GetApplication(user, "0", "0", "0");
            //gvApplications.DataSource = dt;
            //gvApplications.DataBind();
        }

        protected void gvApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvApplications.Rows[index];
                Session["ApplicationID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("Application.aspx");

            }
        }
        protected void gvApplications_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtApplicants = (DataTable)ViewState["dtApplicants"];
            if (dtApplicants != null)
            {
                DataView dataView = new DataView(dtApplicants);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvApplications.DataSource = dataView;
                gvApplications.DataBind();
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