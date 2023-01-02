using KennedyAccess.Classes;
//using KennedyAccess.users;
using Microsoft.Ajax.Utilities;
using Org.BouncyCastle.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class Contact : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();

        public string ContactType { get; set; }
        public int intReferencerID { get; set; }
        private int iRecordTypeID;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            // if first load and contact type is defined
            if ((!Page.IsPostBack && ContactType != null) || (ContactType=="WorkExperience" && labObjectID.Text == "")) 
            {
                ddlCountry.DataSource = (DataTable)Application["Country"];
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();
                iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Contact", ContactType);
                 
                if (ContactType == "Employer" || ContactType == "Applicant" || ContactType == "ApplicantOversea" || ContactType == "Agent")
                {
                    TREmployerName.Visible = false;
                    TRContactName.Visible = true;
                    //rfvcontEmployerName.Enabled = true;
                }
                else // Headquarter, Institution
                {
                    TREmployerName.Visible = true;
                    TRContactName.Visible = false;
                    //labOrgName.Text = ContactType + "'s Name";
                    //rfvcontFirstName.Enabled = true;
                    //rfvcontLastName.Enabled = true;
                }

                labObjectID.Text = intReferencerID.ToString();

                DataTable dtCont = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetContact",
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@EmployerID", intReferencerID),
                    new SqlParameter("@RecordTypeID", iRecordTypeID))).Tables[0];

                if (dtCont != null && dtCont.Rows.Count > 0)
                {
                    DataRow drContact = dtCont.Rows[0];
                    txtEmployerName.Text = drContact["EmployerName"].ToString();
                    labContactID.Text = drContact["ContactID"].ToString();
                    txtLastName.Text = drContact["LastName"].ToString();
                    txtFirstName.Text = drContact["FirstName"].ToString();
                    txtMI.Text = drContact["MI"].ToString();
                    txtAddress1.Text = drContact["Address1"].ToString();
                    txtAddress2.Text = drContact["Address2"].ToString();
                    txtCity.Text = drContact["City"].ToString();
                    txtStateProvince.Text = drContact["StateProvince"].ToString();
                    ddlCountry.SelectedValue = drContact["CountryID"].ToString();
                    txtPostalCode.Text = drContact["PostalCode"].ToString();
                    txtPhoneNumber.Text = drContact["PhoneNumber"].ToString();
                    txtExtention.Text = drContact["Extention"].ToString();
                    txtEmail.Text = drContact["Email"].ToString();
                }
                else
                {
                    string sCountryID = string.Empty;
                    DataTable dt = (DataTable)Application["Country"];

                    DataRow[] dr = dt.Select("CountryName='United States'");

                    if (dr.Length == 1)
                    {
                        sCountryID = dr[0]["CountryID"].ToString();
                    }

                    ddlCountry.SelectedValue = sCountryID;
                }
                //SetEditability(user.HasRole("ApplicantEdit"));
            }
        }

        public void btnSave_Click(object sender, EventArgs e)
        {
            string sContactID;
            sContactID = (labContactID.Text == "") ? "-1" : labContactID.Text;

            iRecordTypeID = bd.GetRecordTypeID((DataTable)Application["RecordType"], user.FranchiseID, "Contact", ContactType);

            if (sContactID == "-1")
            {
                // insert new contact
                SqlDataReader dr = SqlHelper.ExecuteReader(
                    Global.dbcnn, "[InsertContact]",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@RecordTypeID", iRecordTypeID),
                    new SqlParameter("@ReferenceID", labObjectID.Text),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@EmployerName", txtEmployerName.Text),
                    new SqlParameter("@FirstName", txtFirstName.Text),
                    new SqlParameter("@LastName", txtLastName.Text),
                    new SqlParameter("@MI", txtMI.Text),
                    new SqlParameter("@Address1", txtAddress1.Text),
                    new SqlParameter("@Address2", txtAddress2.Text),
                    new SqlParameter("@City", txtCity.Text),
                    new SqlParameter("@StateProvince", txtStateProvince.Text),
                    new SqlParameter("@Country", int.Parse(ddlCountry.SelectedValue)),
                    new SqlParameter("@PostalCode", txtPostalCode.Text),
                    new SqlParameter("@PhoneNumber", txtPhoneNumber.Text),
                    new SqlParameter("@Extention", txtExtention.Text),
                    new SqlParameter("@Email", txtEmail.Text));
                dr.Read();
                sContactID = dr[0].ToString();
                dr.Close();
                labContactID.Text = sContactID;
            }
            else
            {
                // update contact
                SqlHelper.ExecuteNonQuery(
                    Global.dbcnn, "[UpdateContact]",
                    new SqlParameter("@ContactID", labContactID.Text),
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@RecordTypeID", iRecordTypeID),
                    new SqlParameter("@ReferenceID", intReferencerID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@EmployerName", txtEmployerName.Text),
                    new SqlParameter("@FirstName", txtFirstName.Text),
                    new SqlParameter("@LastName", txtLastName.Text),
                    new SqlParameter("@MI", txtMI.Text),
                    new SqlParameter("@Address1", txtAddress1.Text),
                    new SqlParameter("@Address2", txtAddress2.Text),
                    new SqlParameter("@City", txtCity.Text),
                    new SqlParameter("@StateProvince", txtStateProvince.Text),
                    new SqlParameter("@Country", int.Parse(ddlCountry.SelectedValue)),
                    new SqlParameter("@PostalCode", txtPostalCode.Text),
                    new SqlParameter("@PhoneNumber", txtPhoneNumber.Text),
                    new SqlParameter("@Extention", txtExtention.Text),
                    new SqlParameter("@Email", txtEmail.Text));
            }
        }
        public void SetEditability(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;
            txtEmployerName.ReadOnly = bLock;
            txtEmployerName.BorderStyle = sBorder;
            txtLastName.ReadOnly = bLock;
            txtLastName.BorderStyle = sBorder;
            txtFirstName.ReadOnly = bLock;
            txtFirstName.BorderStyle = sBorder;
            txtMI.ReadOnly = bLock;
            txtMI.BorderStyle = sBorder;
            txtAddress1.ReadOnly = bLock;
            txtAddress1.BorderStyle = sBorder;
            txtAddress2.ReadOnly = bLock;
            txtAddress2.BorderStyle = sBorder;
            txtCity.ReadOnly = bLock;
            txtCity.BorderStyle = sBorder;
            txtStateProvince.ReadOnly = bLock;
            txtStateProvince.BorderStyle = sBorder;
            ddlCountry.Enabled = !bLock;
            ddlCountry.BorderStyle = sBorder;
            txtPostalCode.ReadOnly = bLock;
            txtPostalCode.BorderStyle = sBorder;
            txtPhoneNumber.ReadOnly = bLock;
            txtPhoneNumber.BorderStyle = sBorder;
            txtExtention.ReadOnly = bLock;
            txtExtention.BorderStyle = sBorder;
            txtEmail.ReadOnly = bLock;
            txtEmail.BorderStyle = sBorder;
        }
    }
}