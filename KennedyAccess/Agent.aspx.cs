using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using TextMagicClient.Model;

namespace KennedyAccess
{
    public partial class Agent : System.Web.UI.Page
    {
        private User user;
        //private Label AgentContactID;
        //private Button mybutton;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Agent"))
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
            {
                if (Session["AgentID"] != null && Session["AgentID"].ToString() == "-1")
                {
                    labAgent.Text = Page.Title = "New Agnet";
                    cbkActive.Checked = true;

                    //new Agent; enable edit
                    SetEditVisibility(false);

                    //mybutton = (Button)this.FindControl("btnSave");
                    //btnSaveAgent.Text = "test";
                    //mybutton.Text = "test";
                }
                else
                {
                    int AgentUserid = int.Parse(Session["Agentid"].ToString());

                    //AgentContactID = ((Label)AgentContact.FindControl("labContactID"));

                    DataTable dtAgt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetAgent",
                        new SqlParameter("@FranchiseID", user.FranchiseID),
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@AgentID", AgentUserid))).Tables[0];

                    if (dtAgt.Rows.Count == 1)
                    {
                        DataRow dr = dtAgt.Rows[0];

                        labAgent.Text = Page.Title = dr["Firstname"].ToString();
                        lblAgentID.Text = dr["AgentID"].ToString();
                        txtFranchise.Text = dr["FranchiseID"].ToString();
                        lblRecordType.Text = dr["RecordTypeID"].ToString();
                        lblUserID.Text = dr["UserID"].ToString();
                        cbkActive.Checked = (dr["Active"].ToString()) == "True" ? true : false;
                        AgentContact.intReferencerID = int.Parse(lblAgentID.Text);
                    }

                    SetEditVisibility(true);
                }
            }
        }

        private void SetEditVisibility(bool bLock)
        {
            BorderStyle sBorder = (bLock) ? BorderStyle.None : BorderStyle.NotSet;

            btnEditAgent.Visible = bLock && user.HasRole("AgentEdit");
            btnCancel.Visible = btnSaveAgent.Visible = !bLock;

            //lblAgentID.Enabled = bLock;
            //txtFranchise.Enabled = bLock;
            //lblRecordType.Enabled = bLock;
            // save Agnet Contact Contact
            AgentContact.SetEditability(bLock);

        }
        protected void btnEditAgent_Click(object sender, EventArgs e)
        {
            SetEditVisibility(false);
        }
        protected void btnSaveAgent_Click(object sender, EventArgs e)
        {
            int agtID = (lblAgentID.Text == "") ? 0 : int.Parse(lblAgentID.Text);

            DataSet ds = SqlHelper.ExecuteDataset(
                    Global.dbcnn, "InsertUpdateAgent",
                    new SqlParameter("@FranchiseID", user.FranchiseID),
                    new SqlParameter("@UserID", user.UserID),
                    new SqlParameter("@AgentID", agtID)
                    );
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];

                agtID = int.Parse(dr[0].ToString());
            }

            lblAgentID.Text = agtID.ToString();
            AgentContact.intReferencerID = agtID;

            // save agent contact
            AgentContact.btnSave_Click(sender, e);

            // reset editability
            SetEditVisibility(true);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (lblAgentID.Text == "")
            {
                Response.Redirect("Agents.aspx");
            }
            else
            {
                // Agent form
                SetEditVisibility(true);
            }
        }
    }

}
