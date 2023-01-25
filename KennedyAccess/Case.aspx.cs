using KennedyAccess.Classes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Case : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                DataTable employers = bd.GetEmployer(user, "0", "");
                DropDownEmployers.ClearAll();
                DropDownEmployers.AddItems(employers, "EmployerName", "EmployerId");

                DataTable campaigns = bd.GetCampaign(user, "0", "0");
                DropDownCampaigns.ClearAll();
                DropDownCampaigns.AddItems(campaigns, "Description", "CampaignID");

            }
        }
    }
}