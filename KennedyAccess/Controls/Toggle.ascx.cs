using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class Toggle : System.Web.UI.UserControl
    {
        public string ControlLabel { get; set; }
        public string CheckedText { get; set; }
        public string UncheckedText { get; set; }
        public string Width { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CheckedText is null)
                CheckedText = "Yes";
            if (UncheckedText is null)
                UncheckedText = "No";
            if (Width is null)
                Width = "100px";

        }
    }
}