using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Employee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }

        DataSet ds = new DataSet();
        string fulldet = string.Empty;

        fulldet = "<br /><br /><table width='100%' border='1' cellspacing='0' cellpadding='0'>";

        fulldet = fulldet + "<tr> <td colspan='5' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b>Registered Employees List</b></font> </td>";

        fulldet = fulldet + "<td colspan='3' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b><a href='Admin_newemp.aspx'>Post New Employee Details</a></b></font> </td></tr>";
        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='22%'><font color='#003399' size='2pt'><b>Employee Name</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='12%'><font color='#003399' size='2pt'><b>City</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='10%'><font color='#003399' size='2pt'><b>State</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%'><font color='#003399' size='2pt'><b>Country</b></font></td>";


        fulldet = fulldet + "<td colspan='4' align='center' valign='middle' bgcolor='white' width='12%'> <font color='white' size='2pt'><b>Actions</b></font></td>";
        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='22%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='22%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>View</b></font> </td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Add EmpID</b></font> </td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Edit</b></font> </td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Delete</b></font></td></tr>";
      


        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from employeereg1 order by firstname Asc", sqlConnection);
        imgtext.Fill(ds, "employeereg1");
        string cnm = string.Empty;

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' width='22%' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["firstname"].ToString() + ds.Tables[0].Rows[i]["middlename"].ToString() + ds.Tables[0].Rows[i]["lastname"].ToString() + "</td><td align='center' class='lable' width='12%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["city1"].ToString() + "</td><td align='center' class='lable' width='10%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["state1"].ToString() + "</td><td align='center' class='lable' width='11%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["country1"].ToString() + "</td><td align='center' class='lable' width='11%' valign='center' bgcolor='white'>";
                fulldet = fulldet + "<a href='Admin_EmpView.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='View Employee Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                fulldet = fulldet + "<a href='Admin_EmpID.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='Edit Employee Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                fulldet = fulldet + "<a href='Admin_EmpEdit.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='Edit Employee Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                fulldet = fulldet + "<a href='Admin_EmpDelete.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/delete.gif' alt='Delete Employee Details' width='16' height='16' border='0' /></a></td></tr>";
               

            }
        }

        fulldet = fulldet + "</table>";
        tdcontent.InnerHtml = fulldet;
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
}
