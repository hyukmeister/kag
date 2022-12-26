using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private User user;
        BaseData bd = new BaseData();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            DataTable dtDashboard = bd.GetDashboardData(user);
            string chartData = "";
            string views = "";
            string labels = "";
            string views1 = "";
            string labels1 = "";

            chartData += "<script>";
            if (dtDashboard.Rows.Count == 2)
            {
                DataRow dr = dtDashboard.Rows[0];
                DataRow dr1 = dtDashboard.Rows[1];
                for (int i =0; i < dtDashboard.Columns.Count; i++)
                {
                    views += dr[i].ToString() + ",";
                    labels += "\"" + dtDashboard.Columns[i].ColumnName + "\",";
                    views1 += dr1[i].ToString() + ",";
                    labels1 += "\"" + dtDashboard.Columns[i].ColumnName + "\",";
                }
            }
            views = views.Substring(0, views.Length - 1);
            labels = labels.Substring(0, labels.Length - 1);
            views1 = views1.Substring(0, views1.Length - 1);
            labels1 = labels1.Substring(0, labels1.Length - 1);

            chartData += "chartLabels =[" + labels + "]; chartData = [" + views + "];chartLabels1 =[" + labels1 + "]; chartData1 = [" + views1 + "]";
            chartData += "</script>";
            ltChartData.Text= chartData;
        }
    }
}