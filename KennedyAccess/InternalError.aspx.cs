using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class InternalError : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            txtDateTime.Text = DateTime.Now.ToString();
            txtUserID.Text = user.UserID.ToString();

            DataTable dt = bd.GetUserTrail(user);
            gvTrace.DataSource= dt;
            gvTrace.DataBind();
        }
    }
}