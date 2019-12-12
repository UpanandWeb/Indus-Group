using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class admin_payrolldetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvEmployeePay.DataSource = GetData("select b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId");
            gvEmployeePay.DataBind();
        }
    }
    private static DataTable GetData(string query)
    {
        // string strConnString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

    protected void lnk_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_payroll.aspx");
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string employeeId = gvEmployeePay.DataKeys[e.Row.RowIndex].Value.ToString();
            GridView gvHours = e.Row.FindControl("gvHours") as GridView;
            string strQry = string.Format("select  * from emp_weekdetails where empid='{0}'", employeeId);
            gvHours.DataSource = GetData(strQry);
            gvHours.DataBind();
        }
    }
}