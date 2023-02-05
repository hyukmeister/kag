using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class DS260 : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user = (User)Session["User"];
                DataTable dt = bd.GetDS260(user, "10000", "0", "0");
                DataRow dr = dt.Rows[0];

                txt1_1_GivenName.Text = dr["1_1_GivenName"].ToString();
            }
        }
    }
}