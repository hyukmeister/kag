using AjaxControlToolkit;
using iTextSharp.text.pdf;
using KennedyAccess.Classes;
using KennedyAccess.Controls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess
{
    public partial class Cases : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Applicants"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            //{
            //    TabContainer tcContainer = (TabContainer)Master.FindControl("tcContainer");
            //    tcContainer = (TabContainer)ViewState["tcContainer"];
            //}
            //else
            {
                DataTable dtApplicants = bd.GetApplicant(user, 0);

                gvCases.DataSource = dtApplicants;
                gvCases.DataBind();

                ViewState["dtApplicants"] = dtApplicants;

                // load info bar
                TabContainer tcContainer = (TabContainer)Master.FindControl("tcContainer");
                tcContainer.Visible = user.UserType == "System Admin";

                // tab 1 : application history
                tcContainer.Tabs[0].HeaderText = "Search Profiles";

                UserControl usp = (UserControl)Page.LoadControl("~/Controls/UserSearchProfiles.ascx");

                tcContainer.Tabs[0].Controls.Add(usp);
                tcContainer.Tabs[0].Visible = true;

                //ViewState["tcContainer"] = tcContainer;

            }

            gvCases.Columns[5].Visible = user.HasRole("Applicant");
        }

        protected void btnSearchCase_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.GetEmployer(user, "0", txtSearch.Text);
            gvCases.DataSource = dt;
            gvCases.DataBind();
        }

        protected void CaseGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "SignAgreement")
            {
                //Response.Redirect("eSignAgreement.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openAgreement();", true);
            }
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvCases.Rows[index];
                Session["ApplicantID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("Case.aspx");
            }
        }

        protected void gvCases_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtApplicants = (DataTable)ViewState["dtApplicants"];
            if (dtApplicants != null)
            {
                DataView dataView = new DataView(dtApplicants);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvCases.DataSource = dataView;
                gvCases.DataBind();
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