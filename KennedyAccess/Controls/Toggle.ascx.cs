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
        public string Checked { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hidControlLabel.Value = ControlLabel;

                if (CheckedText is null)
                    CheckedText = "Yes";
                hidCheckedText.Value = CheckedText;
                if (UncheckedText is null)
                    UncheckedText = "No";
                hidUncheckedText.Value = UncheckedText;
                if (Width is null)
                    Width = "100px";
                hidWidth.Value = Width;
                if (Checked is null)
                    Checked = "";
                hidChecked.Value = Checked;
            }
            else
            {
                ControlLabel = hidControlLabel.Value;
                CheckedText = hidCheckedText.Value;
                UncheckedText = hidUncheckedText.Value;
                //Width = hidWidth.Value;
                //Checked = hidChecked.Value;

            }
        }
    }
}