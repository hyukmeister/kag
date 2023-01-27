using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class DropDownCheckBox : System.Web.UI.UserControl
    {
        public string ControlLabel { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                labLabel.InnerText = ControlLabel;
            }

            chkList.Attributes.Add("onclick", "CheckItem_" + ControlLabel + "(this)");
        }
        public int WidthCheckListBox
        {
            set
            {
                chkList.Width = value;
                Panel111.Width = value + 20;
            }
        }
        /// <summary>
        /// Set the Width of the Combo
        /// </summary>
        public int Width
        {
            set { txtCombo.Width = value; }
            get { return (Int32)txtCombo.Width.Value; }
        }
        public bool Enabled
        {
            set { txtCombo.Enabled = value; }
        }
        /// <summary>
        /// Set the CheckBoxList font Size
        /// </summary>
        public FontUnit fontSizeCheckBoxList
        {
            set { chkList.Font.Size = value; }
            get { return chkList.Font.Size; }
        }
        /// <summary>
        /// Set the ComboBox font Size
        /// </summary>
        public FontUnit fontSizeTextBox
        {
            set { txtCombo.Font.Size = value; }
        }

        /// <summary>
        /// Add Items to the CheckBoxList.
        /// </summary>
        /// <param name="array">ArrayList to be added to the CheckBoxList</param>
        public void AddItems(ArrayList array)
        {
            for (int i = 0; i < array.Count; i++)
            {
                chkList.Items.Add(array[i].ToString());
            }
        }

        /// <summary>
        /// Add Items to the CheckBoxList
        /// </summary>
        /// <param name="dr"></param>
        /// <param name="nombreCampoTexto">Field Name of the OdbcDataReader to Show in the CheckBoxList</param>
        /// <param name="nombreCampoValor">Value Field of the OdbcDataReader to be added to each Field Name (it can be the same string of the textField)</param>
        public void AddItems(DataTable dt, string textField, string valueField)
        {
            ClearAll();
            int i = 0;

            foreach(DataRow dr in dt.Rows)
            {
                chkList.Items.Add(dr[textField].ToString());
                chkList.Items[i].Value = dr[valueField].ToString();
                i++;
            }
        }

        /// <summary>
        /// Uncheck of the Items of the CheckBox
        /// </summary>
        public void unselectAllItems()
        {
            for (int i = 0; i < chkList.Items.Count; i++)
            {
                chkList.Items[i].Selected = false;
            }
        }

        /// <summary>
        /// Delete all the Items of the CheckBox;
        /// </summary>
        public void ClearAll()
        {
            txtCombo.Text = "";
            chkList.Items.Clear();
        }

        /// <summary>
        /// Get or Set the Text shown in the Combo
        /// </summary>
        public string Text
        {
            set { txtCombo.Text = value; }
        }

        public string GetSelectedValues()
        {
            string SelectedValues = string.Empty;

            foreach (ListItem listItem in chkList.Items)
            {
                if (listItem.Selected)
                {
                    //do some work 
                    SelectedValues += ","+listItem.Value;
                }
            }

            return "(" + SelectedValues.Substring(1, SelectedValues.Length - 1) + ")";
        }
    }
}