using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Admin
{
    public partial class Roles : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Roles"))
                Response.Redirect("../Default.aspx");

            if (!Page.IsPostBack)
            {
                LoadRoles("");
            }
        }

        private void LoadRoles(string sSearch)
        {
            DataTable dtRoles = bd.GetRole(user, "0", sSearch);
            gvRoles.DataSource = dtRoles;
            gvRoles.DataBind();
            ViewState["dtRoles"] = dtRoles;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRoles(txtSearch.Text);
        }

        protected void gvRoles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoles.EditIndex = -1;
            LoadRoles("");
        }

        protected void gvRoles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoles.EditIndex = e.NewEditIndex;
            LoadRoles("");
        }

        protected void gvRoles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string sRoleId = ((Label)(gvRoles.Rows[gvRoles.EditIndex].Cells[0].Controls[1])).Text;
            TextBox txtRoleName = (TextBox)gvRoles.Rows[gvRoles.EditIndex].Cells[2].Controls[1];
            TextBox txtRoleDescription = (TextBox)gvRoles.Rows[gvRoles.EditIndex].Cells[3].Controls[1];
            sRoleId = bd.InsertUpdateRole(user, sRoleId, txtRoleName.Text, txtRoleDescription.Text);

            gvRoles_RowCancelingEdit(sender, null);

            // requires IISRESET?
        }

        protected void btnSaveNewRole_Click(object sender, EventArgs e)
        {
            bd.InsertUpdateRole(user, "0", txtNewRoleName.Text, txtNewRoleDescription.Text);

            // clear textboxes
            txtNewRoleName.Text = txtNewRoleDescription.Text = String.Empty;

            // reload grid
            LoadRoles("");
        }

        protected void gvRoles_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtRoles = (DataTable)ViewState["dtRoles"];
            if (dtRoles != null)
            {
                DataView dataView = new DataView(dtRoles);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvRoles.DataSource = dataView;
                gvRoles.DataBind();
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