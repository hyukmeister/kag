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
    public partial class PrevWage : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();
        public string PrevailingWageID;
        public string EmployerID;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (!Page.IsPostBack)
            {
                txtPrevailingWageID.Text = PrevailingWageID;
                labEmployerID.Text = EmployerID;

                if (Session["PrevailingWageID"] != null && Session["PrevailingWageID"].ToString() == "-1")
                {
                    // new employer; enable edit
                    SetEditVisibility(false);
                }
                else
                {
                    PopulatePrevailingWageInfo(user, txtPrevailingWageID.Text);
                }
            }
        }
        public void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            //btnEditPrevailingWage.Visible = bLock;
            //btnCancel.Visible = btnSavePrevailingWage.Visible = !bLock;

            txtWageTrackingNum.ReadOnly = bLock;
            txtWageTrackingNum.BorderStyle = sBorder;
            txtSOCOESCode.ReadOnly = bLock;
            txtSOCOESCode.BorderStyle = sBorder;
            txtOccupationTitle.ReadOnly = bLock;
            txtOccupationTitle.BorderStyle = sBorder;
            txtSkillLevel.ReadOnly = bLock;
            txtSkillLevel.BorderStyle = sBorder;
            txtPrevailingWage.ReadOnly = bLock;
            txtPrevailingWage.BorderStyle = sBorder;
            rblRatePeriod.Enabled = !bLock;
            rblRatePeriod.BorderStyle = sBorder;
            rblWageSource.Enabled = !bLock;
            rblWageSource.BorderStyle = sBorder;
            txtSource.ReadOnly = bLock;
            txtSource.BorderStyle = sBorder;
            txtDateDetermined.ReadOnly = bLock;
            txtDateDetermined.BorderStyle = sBorder;
            txtDateExpiration.ReadOnly = bLock;
            txtDateExpiration.BorderStyle = sBorder;
            txtI_5_AdditionalRecruitment.ReadOnly = bLock;
            txtI_5_AdditionalRecruitment.BorderStyle = sBorder;
            txtJobTitle.ReadOnly = bLock;
            txtJobTitle.BorderStyle = sBorder;
            txtJobDuties.ReadOnly = bLock;
            txtJobDuties.BorderStyle = sBorder;
        }

        public void btnSavePrevailingWage_Click(object sender, EventArgs e)
        {
            int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "PrevailingWage");

            PrevailingWageID = bd.InsertUpdatePrevailingWage(user, txtPrevailingWageID.Text, "n", true, iRecordTypeID, EmployerID,
                txtWageTrackingNum.Text, txtSOCOESCode.Text, txtOccupationTitle.Text, txtSkillLevel.Text, txtPrevailingWage.Text,
                rblRatePeriod.SelectedValue, rblWageSource.SelectedValue, txtSource.Text, txtDateDetermined.Text, txtDateExpiration.Text,
                txtI_5_AdditionalRecruitment.Text, txtJobTitle.Text, txtJobDuties.Text);

            txtPrevailingWageID.Text = PrevailingWageID;
            SetEditVisibility(true);
        }

        public void PopulatePrevailingWageInfo(User user, string sPrevWageID)
        {
            if (sPrevWageID == "0" || sPrevWageID == "")
            {
                txtWageTrackingNum.Text = "";
                txtSOCOESCode.Text = "";
                txtOccupationTitle.Text = "";
                txtSkillLevel.Text = "";
                txtPrevailingWage.Text = "";
                rblRatePeriod.SelectedIndex = -1;
                rblWageSource.SelectedIndex = -1;
                txtSource.Text = "";
                txtDateDetermined.Text = "";
                txtDateExpiration.Text = "";
                txtI_5_AdditionalRecruitment.Text = string.Empty;
                txtJobTitle.Text = string.Empty;
                txtJobDuties.Text = string.Empty;
            }
            else
            {
                DataTable dtPrevWage = bd.GetPrevailingwage(user, sPrevWageID, "0", "1800-01-01");

                if (dtPrevWage != null && dtPrevWage.Rows.Count > 0)
                {
                    DataRow drPrevailingWage = dtPrevWage.Rows[0];

                    txtWageTrackingNum.Text = drPrevailingWage["F_1_WageTracking"].ToString();
                    txtSOCOESCode.Text = drPrevailingWage["F_2_SOCONET"].ToString();
                    txtOccupationTitle.Text = drPrevailingWage["F_3_Occupation"].ToString();
                    txtSkillLevel.Text = drPrevailingWage["F_4_SkillLevel"].ToString();
                    txtPrevailingWage.Text = drPrevailingWage["F_5_PrevailingWage"].ToString();
                    rblRatePeriod.SelectedValue = drPrevailingWage["F_5A_RatePeriod"].ToString();
                    rblWageSource.SelectedValue = drPrevailingWage["F_6_WageSource"].ToString();
                    txtSource.Text = drPrevailingWage["F_6A_SpecifyIfOther"].ToString();
                    txtDateDetermined.Text = DateTime.Parse(drPrevailingWage["F_7_DeterminationDate"].ToString()).ToString("yyyy-MM-dd");
                    txtDateExpiration.Text = DateTime.Parse(drPrevailingWage["F_8_ExpirationDate"].ToString()).ToString("yyyy-MM-dd");
                    txtI_5_AdditionalRecruitment.Text = drPrevailingWage["I_5_AdditionalRecruitment"].ToString();
                    txtJobTitle.Text = drPrevailingWage["H_3_JobTitle"].ToString();
                    txtJobDuties.Text = drPrevailingWage["H_11_JobDuties"].ToString();
                }
            }
        }
    }
}