using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Http.Results;
using KennedyAccess.Classes;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using iTextSharp.text.pdf;
using KennedyAccess.Controls;
using AjaxControlToolkit;

namespace KennedyAccess
{
    public partial class Applicant : System.Web.UI.Page
    {
        private double dRate;
        private User user;
        private int iApplicantID;
        public static int uid;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Applicant"))
                Response.Redirect("Default.aspx");

            uid = user.UserID;
            dRate = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "PayPal_Fee_Perc");
            
            if (!Page.IsPostBack)
            {
                ddlCitizenshipCountry.DataSource = (DataTable)Application["Country"];
                ddlCitizenshipCountry.DataValueField = "CountryID";
                ddlCitizenshipCountry.DataTextField = "CountryName";
                ddlCitizenshipCountry.DataBind();

                ddlBirthCountry.DataSource = (DataTable)Application["Country"];
                ddlBirthCountry.DataValueField = "CountryID";
                ddlBirthCountry.DataTextField = "CountryName";
                ddlBirthCountry.DataBind();

                if (Session["ApplicantID"].ToString() == "-1")
                {
                    labApplicant.Text = Page.Title = "New Applicant";
                    labApplicantID.Text = "0";

                    // new applicant; enable edit
                    SetEditVisibility(false);

                    // set visibilities
                    panStep2.Visible = false;
                }
                else
                { 
                    iApplicantID = int.Parse(Session["ApplicantID"].ToString());

                    WorkExperience.iApplicantID = iApplicantID;
                    labApplicantID.Text = iApplicantID.ToString();

                    labProcessingFeeRate.Text = "Processing Fee (" + (dRate * 100).ToString() + "%)";

                    labApplicant.Text = Page.Title = "Applicant Profile";

                    // if payment transaction postback
                    if (Session["PaymentID"] != null && Request.QueryString.Count > 0)
                    {
                        string sPaymentStats = Request.QueryString["status"].ToString();
                        string sAuthorizationCode = Request.QueryString["authcode"].ToString();
                        int iPaymentID = int.Parse(Session["PaymentID"].ToString());

                        // update payment status
                       SqlHelper.ExecuteNonQuery(Global.dbcnn, "UpdatePaymentStatus",
                            new SqlParameter("@UserID", user.UserID),
                            new SqlParameter("@PaymentID", iPaymentID),
                            new SqlParameter("@TransactionID", sAuthorizationCode)
                            );

                        Session["PaymentID"] = null;
                    }
                    else
                    {
                        DataTable dtApplicant = bd.GetApplicant(user, iApplicantID);

                        if (dtApplicant.Rows.Count == 1)
                        {
                            DataRow drApplicant = dtApplicant.Rows[0]; 
                            labApplicantID.Text = drApplicant["ApplicantID"].ToString();
                            labAgentName.Text= drApplicant["AgentName"].ToString();

                            ddlCitizenshipCountry.SelectedValue = drApplicant["CitizenshipCountryID"].ToString();
                            ddlBirthCountry.SelectedValue = drApplicant["BirthCountryID"].ToString();
                            ddlCitizenshipCountry.Enabled = ddlBirthCountry.Enabled = true;

                            txtDateOfBirth.Text = DateTime.Parse(drApplicant["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");

                            txtAdmissionClass.Text = drApplicant["AdmissionClass"].ToString();
                            txtAlienRegistration.Text = drApplicant["AlienRegistration"].ToString();
                            txtAlienAdmission.Text = drApplicant["AlienAdmission"].ToString();
                            cbkProfileCompleted.Checked=(drApplicant["ProfileCompleted"].ToString()=="True") ? true : false;
                            labWebForm.Text = drApplicant["WID"].ToString();
                        }
                    }

                    // read only
                    SetEditVisibility(true);

                    // reload payment schedule
                    PopulatePaymentSchedule();

                    // profile picture control
                    ProfilePicture.sObject = "Applicant";
                    ProfilePicture.sObjectID = labApplicantID.Text;
                    ProfilePicture.bShowButtons = true;

                    // profile is completed
                    panStep2.Visible = true;

                    TabContainer tcContainer = (TabContainer)Master.FindControl("tcContainer");
                    tcContainer.Visible = user.UserType == "System Admin";
                    
                    // tab 1 : application history
                    tcContainer.Tabs[0].HeaderText = "Application History";
                    GridView gv1 = new GridView();
                    gv1.CssClass = "table table-hover";
                    gv1.GridLines = GridLines.None;
                    gv1.HeaderStyle.ForeColor = System.Drawing.Color.DimGray;
                    gv1.HeaderStyle.BackColor = System.Drawing.Color.Silver;
                    gv1.DataSource = bd.GetApplicationHistory(user, labApplicantID.Text);
                    gv1.DataBind();
                    tcContainer.Tabs[0].Controls.Add(gv1);
                    tcContainer.Tabs[0].Visible = true;

                    // tab 2 : login history
                    tcContainer.Tabs[1].HeaderText = "Login History";
                    GridView gv2 = new GridView();
                    gv2.CssClass = "table table-hover";
                    gv2.GridLines = GridLines.None;
                    gv2.HeaderStyle.ForeColor = System.Drawing.Color.DimGray;
                    gv2.HeaderStyle.BackColor = System.Drawing.Color.Silver;
                    gv2.DataSource = bd.GetLoginHistory(user.FranchiseID.ToString(), labApplicantID.Text);
                    gv2.DataBind();
                    tcContainer.Tabs[1].Controls.Add(gv2);
                    tcContainer.Tabs[1].Visible = true;
                }

                // applicant progress
                DataTable dt = bd.GetApplicantStatus(user.FranchiseID, user.UserID, iApplicantID);
                string sImage = "images/ApplicantStatus_Profile.png";
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    if (dr["ProfileCompleted"].ToString() == "True")
                    {
                        sImage = "images/ApplicantStatus_JobExperience.png";
                    }
                    if (int.Parse(dr["JobExperienceCount"].ToString()) > 0)
                    {
                        sImage = "images/ApplicantStatus_Agreement.png";
                    }
                    if (int.Parse(dr["AgreementCount"].ToString()) > 0)
                    {
                        sImage = "images/ApplicantStatus_Payment.png";
                    }
                    if (double.Parse(dr["PaymentAmount"].ToString()) > 4000)
                    {
                        sImage = "images/ApplicantStatus_Eta9089.png";
                    }
                    if (int.Parse(dr["ETA9089Count"].ToString()) > 0)
                    {
                        sImage = "images/ApplicantStatus_I140.png";
                    }
                    if (int.Parse(dr["I140Count"].ToString()) > 0)
                    {
                        sImage = "images/ApplicantStatus_completed.png";
                    }
                }
                imgApplicantProgress.ImageUrl = sImage;
            }

            // to pass ApplicantID to controls: attachment and contacts
           contApplicantContact.intReferencerID = contApplicantOversea.intReferencerID = int.Parse(labApplicantID.Text);

            // to pass ApplicantID to controls: attachment 
            contAttachments.RecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Contact", "Applicant").ToString();
            contAttachments.ReferenceID = labApplicantID.Text;
        }

        private void PopulatePaymentSchedule()
        {
            // populate payment schedule
            DataTable dtPayment = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetPayment",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@ReferenceID", labApplicantID.Text))).Tables[0];
            gvPaymentSchedule.DataSource = dtPayment;
            gvPaymentSchedule.DataBind();

            if (dtPayment.Rows.Count > 0)
            {
                trPaymentSchedule.Visible = true;
                trPaymentButton.Visible = false;
            }
            else
            {
                trPaymentSchedule.Visible = false;
                trPaymentButton.Visible = true;

                // populate payment plan
                lab2022AInstallment.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Initial").ToString("C", new CultureInfo("en-US"));
                lab2022AMonthlyPayment.Text = "N/A";
                lab2022AFilingFee.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Filing").ToString("C", new CultureInfo("en-US"));
                lab2022AFinalAmount.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Final").ToString("C", new CultureInfo("en-US"));
                labLumpSumPlanTotal.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "KAG_Service_Fee").ToString("C", new CultureInfo("en-US"));

                lab2022MInstallment.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Initial").ToString("C", new CultureInfo("en-US"));
                lab2022MMonthlyPayment.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Monthly").ToString("C", new CultureInfo("en-US")) + " per month for 20 months";
                lab2022MFilingFee.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Filing").ToString("C", new CultureInfo("en-US"));
                lab2022MFinalAmount.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Final").ToString("C", new CultureInfo("en-US"));
                labMontlyPlanTotal.Text = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "KAG_Service_Fee").ToString("C", new CultureInfo("en-US"));         
            }
        }

        protected void btnSchedulePayment_Click(object sender, EventArgs e)
        {
            DateTime paydate = DateTime.Now;
            double dServiceFeeTotal;

            double dInstallment2022M;
            double dMonthoyPayment;
            double dNumberOfPayment;
            double dFiling2022M;
            double dFinal2022M;

            double dInstallment2022A;
            double dFiling2022A;
            double dFinal2022A;            

            dServiceFeeTotal = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "KAG_Service_Fee");

            if (rb2022M.Checked)
            {
                dInstallment2022M = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Initial");
                dMonthoyPayment = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Monthly");
                dNumberOfPayment = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Term");
                dFiling2022M = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Filing");
                dFinal2022M = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022M_Fee_Final");
                labMontlyPlanTotal.Text = dServiceFeeTotal.ToString();

                // insert payment records
                WritePayment(dInstallment2022M, paydate);
                paydate = paydate.AddDays(30);

                for (int i = 0; i < (int)dMonthoyPayment; i++)
                {
                    WritePayment(dMonthoyPayment, paydate);
                }

                WritePayment(dFiling2022M, paydate);
                WritePayment(dFinal2022M, paydate);

                // update applicant Agreement WebFormID
                bd.UpdateApplicantServiceAgreement(user, int.Parse(labApplicantID.Text), "2022M");
            }
            if (rb2022A.Checked)
            {
                dInstallment2022A = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Initial");
                dFiling2022A = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Filing");
                dFinal2022A = bd.GetSysSettingValue((DataTable)Application["SysSettings"], user.FranchiseID, "2022A_Fee_Final");
                labLumpSumPlanTotal.Text = dServiceFeeTotal.ToString();

                WritePayment(dInstallment2022A, paydate);
                WritePayment(dFiling2022A, paydate);
                WritePayment(dFinal2022A, paydate);

                // update applicant Agreement WebFormID
                bd.UpdateApplicantServiceAgreement(user, int.Parse(labApplicantID.Text), "2022A");
            }

            PopulatePaymentSchedule();
        }

        private void WritePayment(double dMonthoyPayment, DateTime paydate)
        {
            int iRecordType = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Payment", "Applicant");
            DateTime dNextPaymentDate = DateTime.Now;

            SqlHelper.ExecuteNonQuery(Global.dbcnn, "InsertPayment",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@RecordTypeId", iRecordType),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@ReferenceID", labApplicantID.Text),
                        new SqlParameter("@TransactionID", "-"),
                        new SqlParameter("@PaymentAmount", dMonthoyPayment),
                        new SqlParameter("@PaymentDate", dNextPaymentDate.ToString("yyyy-MM-dd")),
                        new SqlParameter("@PaymentStatusID", 1)
                        );
        }
 
        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditApplicant.Visible = bLock && user.HasRole("ApplicantEdit");
            btnCancel.Visible = btnSaveApplicant.Visible = !bLock;

            txtDateOfBirth.ReadOnly = bLock;
            txtDateOfBirth.BorderStyle = sBorder;
            txtAdmissionClass.ReadOnly = bLock;
            txtAdmissionClass.BorderStyle = sBorder;
            txtAlienRegistration.ReadOnly = bLock;
            txtAlienRegistration.BorderStyle = sBorder;
            txtAlienAdmission.ReadOnly = bLock;
            txtAlienAdmission.BorderStyle = sBorder;
            txtDateOfBirth.ReadOnly = bLock;
            txtDateOfBirth.BorderStyle = sBorder;

            ddlCitizenshipCountry.Enabled = !bLock;
            ddlCitizenshipCountry.BorderStyle = sBorder;
            ddlBirthCountry.Enabled = !bLock;
            ddlBirthCountry.BorderStyle = sBorder;

            // applicant Contact Edit & Visibility
            contApplicantContact.SetEditability(bLock);

            // applicant oversea Edit & Visibility
            contApplicantOversea.SetEditability(bLock);

        }

        protected void btnEditApplicant_Click(object sender, EventArgs e)
        {
            // applicant
            SetEditVisibility(false);
        }
        protected void btnSaveApplicant_Click(object sender, EventArgs e)
        {
            if (cbkApplicantChanged.Checked)
            { 
            //iApplicantID = int.Parse(labApplicantID.Text);
            // save data
            iApplicantID = (labApplicantID.Text == "") ? 0 : int.Parse(labApplicantID.Text);
            int iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Contact", "Applicant");
            iApplicantID = bd.InsertUpdateApplicant(user, iApplicantID, iRecordTypeID, "u", true,
                int.Parse(ddlCitizenshipCountry.SelectedValue), int.Parse(ddlBirthCountry.SelectedValue), txtDateOfBirth.Text, txtAdmissionClass.Text,
                txtAlienRegistration.Text, txtAlienAdmission.Text, true);

            // set contact reference id
            Session["ApplicantID"] = user.ObjectID = contApplicantContact.intReferencerID = contApplicantOversea.intReferencerID = iApplicantID;

            // to pass ApplicantID to controls: attachment 
            contAttachments.RecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Object", "Applicant").ToString();
            contAttachments.ReferenceID = iApplicantID.ToString();
            ((Label)contAttachments.FindControl("LabReferenceID")).Text = iApplicantID.ToString();

            // set work experience reference id
            WorkExperience.iApplicantID = iApplicantID;
            ((Label)WorkExperience.FindControl("txtApplicantID")).Text = iApplicantID.ToString();

            labApplicantID.Text = iApplicantID.ToString();

            // save applicant current contact
            contApplicantContact.btnSave_Click(sender, e);

            // save applicant oversea contact
            contApplicantOversea.btnSave_Click(sender, e);
            }
            // go to read only mode
            SetEditVisibility(true);
            cbkApplicantChanged.Checked = false;
            panStep2.Visible = true;
        }
        protected void ApplicantChanged(object sender, EventArgs e)
        {
            cbkApplicantChanged.Checked = true;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if(labApplicantID.Text=="0")
            {
                Response.Redirect("Applicants.aspx");
            }
            else
            {
                SetEditVisibility(true);
            }
        }

        bool bFirstPayButton = false;
        protected void gvPaymentSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblTransactionID = (Label)e.Row.FindControl("lblTransactionID");
                if (!bFirstPayButton && lblTransactionID.Text == "-")
                {
                    //lbPay.Visible = true;
                    bFirstPayButton = true;

                    double dDueAmount = double.Parse((e.Row.FindControl("lblPaymentAmount") as Label).Text);
                    double dProcessingFee = dDueAmount * dRate;
                    double dTotalDue = dDueAmount + dProcessingFee;

                    Session["PaymentID"] = lblPaymentID.Text = (e.Row.FindControl("lblPaymentID") as Label).Text;
                    lblDueDate.Text = (e.Row.FindControl("lbPaymentDate") as Label).Text; ;
                    lblDueAmount.Text = dDueAmount.ToString("C");
                    lblProcessingFee.Text = dProcessingFee.ToString("C");
                    blbDueTotal.Text = dTotalDue.ToString("C");
                }
                else
                {
                    //lbPay.Visible = false;
                }
            }
        }
    }
}