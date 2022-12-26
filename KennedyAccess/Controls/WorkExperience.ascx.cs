using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TextMagicClient.Model;

namespace KennedyAccess.Controls
{
    public partial class WorkExperience : System.Web.UI.UserControl
    {
        private User user;
        public int iApplicantID { get; set; }
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            // work experience repeater
            if(!IsPostBack)
            {

                DataTable dtWorkExperience = bd.GetWorkExperience(user.FranchiseID, user.UserID, iApplicantID);
                ViewState["dtWorkExperience"] = dtWorkExperience;

                repWorkExperience.DataSource = dtWorkExperience;
                repWorkExperience.DataBind();

                txtApplicantID.Text = iApplicantID.ToString();

                if (user.HasRole("Applicant"))
                {
                    //btnEditWorkExp.Visible = true;
                }
                else
                {
                    //btnEditWorkExp.Visible = false;
                }
                foreach (RepeaterItem item in repWorkExperience.Items)
                {
                    SetEditability(item, true);
                }                
            }
        }
        public void SetEditability(RepeaterItem item, bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;
            TextBox txtEmployerName = (TextBox)item.FindControl("txtEmployerName");
            txtEmployerName.ReadOnly = bLock;
            txtEmployerName.BorderStyle = sBorder;
            TextBox txtAddress1 = (TextBox)item.FindControl("txtAddress1");
            txtAddress1.ReadOnly = bLock;
            txtAddress1.BorderStyle = sBorder;
            TextBox txtAddress2 = (TextBox)item.FindControl("txtAddress2");
            txtAddress2.ReadOnly = bLock;
            txtAddress2.BorderStyle = sBorder;
            TextBox txtCity = (TextBox)item.FindControl("txtCity");
            txtCity.ReadOnly = bLock;
            txtCity.BorderStyle = sBorder;
            TextBox txtStateProvince = (TextBox)item.FindControl("txtStateProvince");
            txtStateProvince.ReadOnly = bLock;
            txtStateProvince.BorderStyle = sBorder;
            DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
            ddlCountry.Enabled = !bLock;
            ddlCountry.BorderStyle = sBorder;
            TextBox txtPostalCode = (TextBox)item.FindControl("txtPostalCode");
            txtPostalCode.ReadOnly = bLock;
            txtPostalCode.BorderStyle = sBorder;
            TextBox txtPhoneNumber = (TextBox)item.FindControl("txtPhoneNumber");
            txtPhoneNumber.ReadOnly = bLock;
            txtPhoneNumber.BorderStyle = sBorder;
            TextBox txtExtention = (TextBox)item.FindControl("txtExtention");
            txtExtention.ReadOnly = bLock;
            txtExtention.BorderStyle = sBorder;
            TextBox txtEmail = (TextBox)item.FindControl("txtEmail");
            txtEmail.ReadOnly = bLock;
            txtEmail.BorderStyle = sBorder;
            TextBox txtTypeOfBusiness = (TextBox)item.FindControl("txtTypeOfBusiness");
            txtTypeOfBusiness.ReadOnly = bLock;
            txtTypeOfBusiness.BorderStyle = sBorder;
            TextBox txtDateFrom = (TextBox)item.FindControl("txtDateFrom");
            txtDateFrom.ReadOnly = bLock;
            txtDateFrom.BorderStyle = sBorder;
            TextBox txtDateThru = (TextBox)item.FindControl("txtDateThru");
            txtDateThru.ReadOnly = bLock;
            txtDateThru.BorderStyle = sBorder;
            TextBox txtHoursPerWeek = (TextBox)item.FindControl("txtHoursPerWeek");
            txtHoursPerWeek.ReadOnly = bLock;
            txtHoursPerWeek.BorderStyle = sBorder;
            TextBox txtJobDescription = (TextBox)item.FindControl("txtJobDescription");
            txtJobDescription.ReadOnly = bLock;
            txtJobDescription.BorderStyle = sBorder;
            TextBox txtJobTitle = (TextBox)item.FindControl("txtJobTitle");
            txtJobTitle.ReadOnly = bLock;
            txtJobTitle.BorderStyle = sBorder;

            // contact
            //Contact ucContact = (Contact)item.FindControl("ucContact");
            //ucContact.SetEditability(bLock);

            // buttons
            Button btnEditWorkExp = (Button)item.FindControl("btnEditWorkExp");
            Button btnSaveWorkExp = (Button)item.FindControl("btnSaveWorkExp");
            Button btnCancel = (Button)item.FindControl("btnCancel");
            btnCancel.Visible = btnSaveWorkExp.Visible = !bLock;
            btnEditWorkExp.Visible = bLock;
        }

        protected void btnSaveWorkExperience_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (RepeaterItem)((Button)sender).NamingContainer;
            string sEmployerName = ((TextBox)item.FindControl("txtEmployerName")).Text;
            string sAddress1 = ((TextBox)item.FindControl("txtAddress1")).Text;
            string sAddress2 = ((TextBox)item.FindControl("txtAddress2")).Text;
            string sCity = ((TextBox)item.FindControl("txtCity")).Text;
            string sStateProvince = ((TextBox)item.FindControl("txtStateProvince")).Text;
            string sCountry = ((DropDownList)item.FindControl("ddlCountry")).Text;
            string sPostalCode = ((TextBox)item.FindControl("txtPostalCode")).Text;
            string sPhoneNumber = ((TextBox)item.FindControl("txtPhoneNumber")).Text;
            string sExtention = ((TextBox)item.FindControl("txtExtention")).Text;
            string sEmail = ((TextBox)item.FindControl("txtEmail")).Text;
            string sTypeOfBusiness = ((TextBox)item.FindControl("txtTypeOfBusiness")).Text;
            string sJobTitle = ((TextBox)item.FindControl("txtJobTitle")).Text;
            string sDateFrom = ((TextBox)item.FindControl("txtDateFrom")).Text;
            string sDateThru = ((TextBox)item.FindControl("txtDateThru")).Text;
            string sHoursPerWeek = ((TextBox)item.FindControl("txtHoursPerWeek")).Text;
            string sJobDescription = ((TextBox)item.FindControl("txtJobDescription")).Text;
            string sWorkExperienceID = ((Label)item.FindControl("lblWorkExperienceID")).Text;

            // save WorkExperience
            DataSet ds = SqlHelper.ExecuteDataset(Global.dbcnn, "InsertUpdateWorkExperience",
                new SqlParameter("@FranchiseID", user.FranchiseID),
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@WorkExperienceID", sWorkExperienceID),
                new SqlParameter("@ApplicantID", txtApplicantID.Text),
                new SqlParameter("@EmployerName", sEmployerName),
                new SqlParameter("@Address1", sAddress1),
                new SqlParameter("@Address2", sAddress2),
                new SqlParameter("@City", sCity),
                new SqlParameter("@StateProvince", sStateProvince),
                new SqlParameter("@CountryID", sCountry),
                new SqlParameter("@PostalCode", sPostalCode),
                new SqlParameter("@PhoneNumber", sPhoneNumber),
                new SqlParameter("@Extention", sExtention),
                new SqlParameter("@Email", sEmail),
                new SqlParameter("@TypeOfBusiness", sTypeOfBusiness),
                new SqlParameter("@JobTitle", sJobTitle),
                new SqlParameter("@DateFrom", sDateFrom),
                new SqlParameter("@DateThru", sDateThru),
                new SqlParameter("@HoursPerWeek", sHoursPerWeek),
                new SqlParameter("@JobDescription", sJobDescription));

            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dtWorkExperience = ds.Tables[0];
                ViewState["dtWorkExperience"] = dtWorkExperience;

                repWorkExperience.DataSource = dtWorkExperience;
                repWorkExperience.DataBind();

                //if (dt.Rows.Count > 0)
                //{
                //    //DataRow dr = dt.Rows[0];
                //    //Contact ucContact = ((Contact)item.FindControl("ucContact"));
                //    //ucContact.intReferencerID = int.Parse(dr[0].ToString());
                //    //// save WorkExperience contact
                //    //ucContact.btnSave_Click(sender, e);
                //    //
                //    Label lblWorkExp = ((Label)item.FindControl("lblWorkExperienceID"));
                //    lblWorkExp.Text= dt.Rows[0][0].ToString();
                //}
            }

            SetEditability(item, true);
            btnNewWorkExperience.Visible = true;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dtWorkExperience"];

            for(int iPos = dt.Rows.Count-1; iPos >= 0; --iPos)
            {
                DataRow dr = dt.Rows[iPos];
                if (dr[1].ToString() == "0")
                {
                    dt.Rows.Remove(dr);
                }
            }
            repWorkExperience.DataSource = dt;
            repWorkExperience.DataBind();

            btnNewWorkExperience.Visible = true;
        }
        protected void btnNewWorkExperience_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dtWorkExperience"];
            DataRow dr = dt.NewRow();
            dr[1] = 0;
            dt.Rows.Add(dr);
            repWorkExperience.DataSource = dt;
            repWorkExperience.DataBind();

            //for (int iPos = 0; iPos < dt.Rows.Count; iPos++)
            //{
            //    DataRow drWE = dt.Rows[iPos];
            //    RepeaterItem ri = repWorkExperience.Items[iPos];
            //    ((Contact)ri.FindControl("ucContact")).intReferencerID = int.Parse(drWE[1].ToString());
            //    ((Contact)ri.FindControl("ucContact")).intReferencerID = int.Parse(drWE[1].ToString());
            //}


            RepeaterItem item = repWorkExperience.Items[repWorkExperience.Items.Count - 1];
            SetEditability(item, false);

            btnNewWorkExperience.Visible = false;
        }

        protected void btnEditWorkExp_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (RepeaterItem)((Button)sender).NamingContainer;
            SetEditability(item, false);

            btnNewWorkExperience.Visible = false;
        }

        protected void repWorkExperience_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Reference the Repeater Item.
                RepeaterItem item = e.Item;

                //Reference the Controls.
                DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
                ddlCountry.DataSource = (DataTable)Application["Country"];
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                string sCountryID = ((DataRowView)e.Item.DataItem)["CountryID"].ToString();
                if(sCountryID!="")
                {
                    ddlCountry.SelectedValue = sCountryID;
                }
                ddlCountry.DataBind();
            }
        }

        protected void btnDeleteWorkExp_Click(object sender, EventArgs e)
        {

        }
    }
}