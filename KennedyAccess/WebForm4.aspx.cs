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
                Toggle1.CheckedText = "I love Eunsook";
                Toggle1.UncheckedText = "No";
                Toggle1.Width = "300px";
                Toggle1.Checked = true;
                Toggle1.Disable = true;

                Toggle2.ControlLabel = "Status2";
                Toggle2.CheckedText = "Active";
                Toggle2.UncheckedText = "Inactive";
                Toggle2.Checked = true;

                Toggle3.ControlLabel = "Status3";                
                Toggle3.Checked= true;

                Toggle4.ControlLabel = "Status4";
                Toggle4.CheckedText = "Approved";
                Toggle4.UncheckedText = "Dinied";

                Toggle4.Checked = false;

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Toggle1.Disable = !Toggle1.Disable;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Toggle1.Checked = !Toggle1.Checked;
        }
    }
}