using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using KennedyAccess.Classes;

namespace KennedyAccess.users
{
    public partial class Applicant : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            if (user == null || !user.HasRole("Applicants"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                DataTable dtApplicants = bd.GetApplicant(user, 0);

                gvApplicants.DataSource = dtApplicants;
                gvApplicants.DataBind();

                ViewState["dtApplicants"] = dtApplicants;
            }
        }

        protected void ApplicantGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "SignAgreement")
            {
                //Response.Redirect("eSignAgreement.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openAgreement();", true);
            }
            if (e.CommandName == "ViewPDF")
            {
                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = gvApplicants.Rows[index];
                TableCell contactName = selectedRow.Cells[2];
                string sApplicantID = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                // Display the selected author.
                DataTable dt = (SqlHelper.ExecuteDataset(Global.dbcnn, "GetFile",
                        new SqlParameter("@UserID", user.UserID),
                        new SqlParameter("@FileId", 8))).Tables[0];
                byte[] pdfByte = (byte[])dt.Rows[0]["FileData"];

                string firstName = ((Label)selectedRow.Cells[1].Controls[1]).Text;
                string lastName = ((Label)selectedRow.Cells[2].Controls[1]).Text;
                string fileName = Server.MapPath(".") + "\\KAG_ServiceAgreement-" + lastName + ".pdf";

                PdfReader pdfReader = new PdfReader(pdfByte);
                PdfReader.unethicalreading = true;

                PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(fileName, FileMode.Create));

                AcroFields pdfFormFields = pdfStamper.AcroFields;

                //// populate form
                //pdfFormFields.SetField("Pt1Line1a_FamilyName[0]", lastName);
                //pdfFormFields.SetField("Pt1Line1b_GivenName[0]", firstName);
                //pdfFormFields.SetField("Line2_CompanyName[0]", "company");
                //pdfStamper.FormFlattening = true;

                // close the pdf
                pdfStamper.Close();
                pdfReader.Close();

                System.Net.WebClient client = new System.Net.WebClient();
                Byte[] buffer = client.DownloadData(fileName);
                if (buffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", buffer.Length.ToString());
                    Response.BinaryWrite(buffer);
                }
            }
            if (e.CommandName == "Open")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = gvApplicants.Rows[index];
                Session["ApplicantID"] = ((Label)selectedRow.Cells[0].Controls[1]).Text;

                Response.Redirect("Applicant.aspx");

            }
        }

        protected void btnSearchApplicant_Click(object sender, EventArgs e)
        {
            DataTable dt = bd.GetEmployer(user, "0", txtSearch.Text);
            gvApplicants.DataSource = dt;
            gvApplicants.DataBind();
        }
        protected void btnNewApplicant_Click(object sender, EventArgs e)
        {
            Session["ApplicantID"] = "-1";
            Response.Redirect("Applicant.aspx");
        }
        protected void gvApplicants_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtApplicants = (DataTable)ViewState["dtApplicants"];
            if (dtApplicants != null)
            {
                DataView dataView = new DataView(dtApplicants);
                SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
                dataView.Sort = e.SortExpression + " " + SortDirection;
                gvApplicants.DataSource = dataView;
                gvApplicants.DataBind();
            }
        }
        private string SortDirection
        {
            get
            {
                return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC";
            }
            set
            {
                ViewState["SortDirection"] = value;
            }
        }
    }
}