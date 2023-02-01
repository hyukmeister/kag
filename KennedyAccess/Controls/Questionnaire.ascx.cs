using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class Questionnaire : System.Web.UI.UserControl
    {
        public int iEmployerID { get; set; }
        public int iCampaignID { get; set; }
        public bool bGeneral { get; set; }
        BaseData bd = new BaseData();
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                cbkGeneral.Checked = bGeneral;
                labEmployerID.Text = iEmployerID.ToString();
                labCampaignID.Text = iCampaignID.ToString();

                PopulateQuestionnaireGrid();
            }
        }

        public void PopulateQuestionnaireGrid()
        {
            DataTable dt = bd.GetQuestionnaire(user, cbkGeneral.Checked, labEmployerID.Text, labCampaignID.Text);
            if (dt.Rows.Count > 0)
            {
                gvQuestionnaire.DataSource = dt;
            }
            else
            {
                gvQuestionnaire.DataSource = new DataTable();
            }
            gvQuestionnaire.DataBind();
        }

        protected void gvQuestionnaire_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rblQType = (RadioButtonList)e.Row.FindControl("rblQustionType");
                rblQType.SelectedValue = ((DataRowView)e.Row.DataItem)["QuestionType"].ToString();
                if (((DataRowView)e.Row.DataItem)["General"].ToString() == "True")
                {
                    rblQType.Enabled = false;
                    ImageButton lbUpdate = (ImageButton)e.Row.FindControl("lnkBtnUpdate");
                    lbUpdate.Visible = false;
                }
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Visible = true;
            }
        }

        protected void lnkBtnUpdate_OnClik(object sender, EventArgs e)
        {
            Control gridRow = ((System.Web.UI.Control)sender).DataItemContainer;
            Label labQID = (Label)gridRow.FindControl("labQuestionnaireID");
            TextBox txtQ = (TextBox)gridRow.FindControl("txtQuestion");
            RadioButtonList rblQt = (RadioButtonList)gridRow.FindControl("rblQustionType");
            int iQuestionnaireID = int.Parse(labQID.Text);
            string sQuestionnaire = txtQ.Text;
            string sQuestionType = rblQt.SelectedValue;

            bd.InsertUpdateQuestionnaire(user, iQuestionnaireID, iEmployerID, labCampaignID.Text, false, 0, sQuestionnaire, sQuestionType, true);

        }
        protected void lnkBtnAddNew_OnClik(object sender, EventArgs e)
        {            
            bd.InsertUpdateQuestionnaire(user, 0, int.Parse(labEmployerID.Text), 
                labCampaignID.Text, cbkGeneral.Checked, 0, txtNewQuestion.Text, rblNewQustionType.SelectedValue, true);

            txtNewQuestion.Text = "";
            rblNewQustionType.SelectedIndex = -1;

            PopulateQuestionnaireGrid();
        }

        protected void lnkBtnDelete_Click(object sender, EventArgs e)
        {
            Control gridRow = ((System.Web.UI.Control)sender).DataItemContainer;
            Label labQID = (Label)gridRow.FindControl("labQuestionnaireID");
            TextBox txtQ = (TextBox)gridRow.FindControl("txtQuestion");
            RadioButtonList rblQt = (RadioButtonList)gridRow.FindControl("rblQustionType");
            int iQuestionnaireID = int.Parse(labQID.Text);
            string sQuestionnaire = txtQ.Text;
            string sQuestionType = rblQt.SelectedValue;

            bd.InsertUpdateQuestionnaire(user, iQuestionnaireID, iEmployerID, labCampaignID.Text, false, 0, sQuestionnaire, sQuestionType, false);

            PopulateQuestionnaireGrid();
        }
    }
}