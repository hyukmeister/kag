using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KennedyAccess.Classes;

namespace KennedyAccess.users
{
    public partial class Employer : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Employers"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dtEmployers = bd.GetEmployer(user, "0","");
                gvEmployers.DataSource = dtEmployers;
                gvEmployers.DataBind();

                ViewState["dtEmployers"] = dtEmployers;
            }

            gvEmployers.Columns[6].Visible = user.HasRole("Employer");
            btnNewEmployer.Visible = user.HasRole("EmployerCreate");
        }
        protected void btnNewEmployer_Click(object sender, EventArgs e)
        {
            Session["EmployerID"] = -1;
            Response.Redirect("Employer.aspx");
        }

        protected void gvEmployers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvEmployers.Rows[index];
                string sEmployerID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Session["EmployerID"] = sEmployerID;
                Response.Redirect("Employer.aspx");
            }
            if (e.CommandName == "ViewPDF")
                Console.WriteLine("");
        }
        protected void btnSearchEmployer_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.GetEmployer(user, "0", txtSearch.Text);
            gvEmployers.DataSource = dt;
            gvEmployers.DataBind();
        }

        protected void gvEmployers_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtEmployers = (DataTable)ViewState["dtEmployers"];
            if (dtEmployers != null)
            {
                DataView dataView = new DataView(dtEmployers);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvEmployers.DataSource = dataView;
                gvEmployers.DataBind();
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