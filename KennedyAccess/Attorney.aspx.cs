using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Attorney : System.Web.UI.Page
    {
        private User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Attorney"))
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                if (Session["AttorneyID"] != null && Session["AttorneyID"].ToString() == "-1")
                {
                    lblAttorney.Text = Page.Title = "New Agnet";
                    cbkActive.Checked = true;

                    //new Attorney; enable edit
                    SetEditVisibility(false);

                }
                else
                {
                    int AttorneyUserid = int.Parse(Session["AttorneyID"].ToString());
                    DataTable dtAttorney = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAttorney",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@AttorneyID", AttorneyUserid))).Tables[0];

                    if (dtAttorney.Rows.Count == 1)
                    {
                        DataRow dr = dtAttorney.Rows[0];
                            lblAttorney.Text = Page.Title = dr["Firstname"].ToString() + " " + dr["Lastname"].ToString();
                            lblAttorneyID.Text = dr["AttorneyID"].ToString();
                            lblFranchise.Text = dr["FranchiseID"].ToString();
                            lblRecordType.Text = dr["RecordTypeID"].ToString();
                            lblUserID.Text = dr["UserID"].ToString();
                            txtFEIN.Text = dr["FEIN"].ToString();
                            cbkActive.Checked = (dr["Active"].ToString()) == "True" ? true : false;
                            AttorneyContact.intReferencerID = int.Parse(lblAttorneyID.Text);
                    }

                    SetEditVisibility(true);
                }
            }
        }
        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditAttorney.Visible = bLock && user.HasRole("AttorneyEdit");
            btnCancel.Visible = btnSaveAttorney.Visible = !bLock;
            //lblAttorneyID.Enabled = bLock;
            //lblFranchise.Enabled = bLock;
            //lblRecordType.Enabled = bLock;
            txtFEIN.ReadOnly = bLock;
            // save Attorney Contact Contact
            AttorneyContact.SetEditability(bLock);

        }
        protected void btnEditAttorney_Click(object sender, EventArgs e)
        {
            SetEditVisibility(false);
        }
        protected void btnSaveAttorney_Click(object sender, EventArgs e)
        {
            int atnyID = (lblAttorneyID.Text == "") ? 0 : int.Parse(lblAttorneyID.Text);

            DataSet ds = SqlHelper.ExecuteDataset(
                    Global.dbcnn, "InsertUpdateAttorney",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@AttorneyID", atnyID),
                    new SqlParameter("@FEIN", txtFEIN.Text)
                    );
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];

                atnyID = int.Parse(dr[0].ToString());
            }

            lblAttorneyID.Text = atnyID.ToString();
            AttorneyContact.intReferencerID = atnyID;

            // save Attorney contact
            AttorneyContact.btnSave_Click(sender, e);

            // reset editability
            SetEditVisibility(true);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (lblAttorneyID.Text == "")
            {
                Response.Redirect("Attorney.aspx");
            }
            else
            {
                // Attorney form
                SetEditVisibility(true);
            }
        }

    }
}