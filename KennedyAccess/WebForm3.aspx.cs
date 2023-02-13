using KennedyAccess.Admin;
using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnEnabled_Click(object sender, EventArgs e)
        {
            cbkActive.Disabled = !cbkActive.Disabled;

        }
    }
}