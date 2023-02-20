using RestSharp.Extensions;
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
        public string CheckedColor { get; set; }
        public string UncheckedColor { get; set; }
        public bool Checked 
        { 
            get
            {
                return cbkActive.Checked;
            }
            set
            {
                //hidChecked.Value = value.ToString();
                cbkActive.Checked = value;
            }
        }
        public bool Disable 
        { 
            get
            {
                bool bDisable = bool.Parse(hidEnable.Value);
                return bDisable;
            }
            set
            {
                hidEnable.Value = value.ToString();
                cbkActive.Disabled = value;
            }
        }

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
                if (CheckedColor is null)
                    CheckedColor = "orange";
                hidCheckedColor.Value = CheckedColor;
                if (UncheckedColor is null)
                    UncheckedColor = "silver";
                hidUncheckedColor.Value = UncheckedColor;                
                
                cbkActive.Checked = Checked;

                labCheckbox.InnerText = cbkActive.Checked ? hidCheckedText.Value : hidUncheckedText.Value;
                cbkActive.Attributes.Add("onclick", hidControlLabel.Value + "_Click(this)");

            }
        }
    }
}