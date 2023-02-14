﻿using System;
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
        public bool Checked { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                hidControlLabel.Value = ControlLabel;
                hidCheckedText.Value = CheckedText;
                hidUncheckedText.Value = UncheckedText;
                cbkActive.Checked = Checked;
            }
            labCheckbox.InnerText = cbkActive.Checked ? hidCheckedText.Value : hidUncheckedText.Value;
        }
    }
}