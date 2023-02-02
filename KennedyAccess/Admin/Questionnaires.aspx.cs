using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Questionnaires : System.Web.UI.Page
    {
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Questionnaires"))
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                // campaign level questionnaire
                Questionnaire.bGeneral = true;
                Questionnaire.iEmployerID = -1;
                Questionnaire.iCampaignID = 0;
            }
        }
    }
}