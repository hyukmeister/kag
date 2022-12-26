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
    public partial class PrevailingWages : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("PrevailingWages"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                DataTable dtPrevWage = bd.GetPrevailingwage(user, "0", user.ObjectID.ToString(), "1800-01-01");
                gvPrevailingWages.DataSource = dtPrevWage;
                gvPrevailingWages.DataBind();

                ViewState["dtPrevWage"] = dtPrevWage;
            }
            btnNew.Visible = user.HasRole("PrevailingWageCreate");
        }
        protected void gvPrevailingWages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvPrevailingWages.Rows[index];
                Session["PrevailingWageID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("PrevailingWage.aspx");
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //DataTable dt = bd.GetPrevailingwage(user, "0", txtEmployerID.Text, txtCampaignStartDate.Text);
            //gvPrevailingWages.DataSource = dt;
            //gvPrevailingWages.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Session["PrevailingWageID"] = -1;
            Response.Redirect("PrevailingWage.aspx");
        }
        protected void gvPrevailingWages_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtPrevWage = (DataTable)ViewState["dtPrevWage"];
            if (dtPrevWage != null)
            {
                DataView dataView = new DataView(dtPrevWage);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvPrevailingWages.DataSource = dataView;
                gvPrevailingWages.DataBind();
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