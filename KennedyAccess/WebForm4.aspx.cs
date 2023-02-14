using KennedyAccess.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Toggle1.ControlLabel = "Status1";
                Toggle1.CheckedText = "Yes";
                Toggle1.UncheckedText = "No";
                Toggle1.Width = "200px";
                Toggle1.Checked = false;

                //Toggle2.ControlLabel = "Status2";
                //Toggle2.CheckedText = "Active";
                //Toggle2.UncheckedText = "Inactive";
                //Toggle2.Checked = true;

                //Toggle3.ControlLabel = "Status3";
                //Toggle3.CheckedText = "True";
                //Toggle3.UncheckedText = "False";
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Toggle1.Checked = !Toggle1.Checked;
            //Toggle1.Checked = Toggle1.Checked ? Toggle1.CheckedText : Toggle1.UncheckedText;
        }
    }
}