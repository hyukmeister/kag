using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                ddlDropDownTest.DataSource = (DataTable)Application["Country"];
                ddlDropDownTest.DataTextField = "CountryName";
                ddlDropDownTest.DataValueField = "CountryID";
                ddlDropDownTest.DataBind();
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
                string sText = txtLastName.Text;
        }

        protected void btnSave1_Click(object sender, EventArgs e)
        {
            string sText = TextBox3.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            cbkI_34_ListJob.Enabled = !cbkI_34_ListJob.Enabled;
        }

        protected void ddlDropDownTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlDropDownTest.SelectedItem.Text == "United States") 
            {
                //System.Console.WriteLine(ddlDropDownTest.SelectedValue);
                DataTable dtState = ((DataTable)Application["State"]);

                ddlState.DataSource = dtState;
                ddlState.DataTextField = "StateFull";
                ddlState.DataValueField = "StateID";
                ddlState.DataBind();

                ddlState.Enabled = true;
            }

        }
    }


}