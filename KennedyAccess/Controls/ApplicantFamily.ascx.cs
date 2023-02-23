using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class ApplicantFamily : System.Web.UI.UserControl
    {
        public string ApplicantID;
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!IsPostBack)
            {
                hidApplicantID.Value = ApplicantID;
                DataTable dt = bd.GetFamilyMember(user, hidApplicantID.Value);
                if (dt != null && dt.Rows.Count>0)
                {
                    gvFamilyMembers.DataSource= dt;
                    gvFamilyMembers.DataBind();



                }
            }



            
        }
    }
}