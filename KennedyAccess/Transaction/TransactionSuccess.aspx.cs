using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Transaction
{
    public partial class TransactionSuccess : System.Web.UI.Page
    {
        private User user;
        private int iPaymentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];
            iPaymentID = int.Parse(Session["PaymentID"].ToString());

            if (user == null)
                Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                // update payment status

            }
        }
    }
}