using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlDropDownTest.DataSource = (DataTable) Application["Country"];
            ddlDropDownTest.DataTextField = "CountryName";
            ddlDropDownTest.DataValueField = "CountryID";
            ddlDropDownTest.DataBind();

        }

        protected void ddlDropDownTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Console.WriteLine(ddlDropDownTest.SelectedValue);
            DataTable dtState = ((DataTable)Application["Country"]).Clone();
            dtState.Rows.Clear();
            DataRow drState= dtState.NewRow();
            drState[0] = 0;
            drState[1] = ddlDropDownTest.SelectedItem.ToString();
            dtState.Rows.Add(drState);

            ddlState.DataSource= dtState;
            ddlState.DataTextField = "CountryName";
            ddlState.DataValueField = "CountryID";
            ddlState.DataBind();

            ddlState.Enabled = true;

        }
    }
}