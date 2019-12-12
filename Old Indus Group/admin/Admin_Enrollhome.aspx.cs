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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Enrollhome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "ed")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }

        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        DataSet ds = new DataSet();
        string fulldet = string.Empty;

        fulldet = "<br /><br /><table width='100%' border='1' cellspacing='0' cellpadding='0'>";


        fulldet = fulldet + "<tr> <td colspan='5' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b> Enrollment Details</b></font> </td><td colspan='2' align='center' valign='middle' bgcolor='white' width='16%'><font color='#003399' size='2pt'><b> <a href='Admin_Enroll.aspx'>Add New Details</a></b></font></td></tr>";

        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='16%'><font color='white' size='2pt'><b> Name</b></font></td>";
        fulldet = fulldet + "  <td align='center' valign='middle' bgcolor='white' width='16%'><font color='white' size='2pt'><b> Location</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='16%'><font color='white' size='2pt'><b>Course Attending</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='20%'> <font color='white' size='2pt'><b>Mobile </b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='16%'> <font color='white' size='2pt'><b>Email</b></font></td>";
        fulldet = fulldet + "<td colspan='2' align='center' valign='middle' bgcolor='white' width='16%'><font color='white' size='2pt'><b>Actions</b></font></td></tr>";
        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='16%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='16%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='16%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='20%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='16%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='8%'> <font color='white' size='2pt'><b>Edit</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='8%'><font color='white' size='2pt'><b>Delete</b></font></td></tr>";


        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_enroll order by Lname", sqlConnection);
        imgtext.Fill(ds, "wt_FeedBack");

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' width='16%' bgcolor='white'>";

                fulldet = fulldet + ds.Tables[0].Rows[i]["Fname"].ToString() + " " + ds.Tables[0].Rows[i]["Lname"].ToString() + "</td><td align='right' class='lable' width='16%' valign='center' bgcolor='white'>";

                fulldet = fulldet + ds.Tables[0].Rows[i]["City"].ToString() + ", " + ds.Tables[0].Rows[i]["State"].ToString() + " " + ds.Tables[0].Rows[i]["Country"].ToString() + "</td><td align='right' class='lable' width='16%' valign='center' bgcolor='white'>";

                fulldet = fulldet + ds.Tables[0].Rows[i]["Course_Enroll"].ToString() + "</td><td align='right' class='lable' width='20%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["Mobile_No"].ToString() + "</td><td align='right' class='lable' width='16%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["Email"].ToString() + "</td><td align='center' class='lable' width='8%' valign='center' bgcolor='white'>";
               
                fulldet = fulldet + "<a href='Admin_Enrolledit.aspx?cid=" + ds.Tables[0].Rows[i]["UserId"].ToString() + "'><img src='images/edit.gif' alt='Edit Enrollment Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='8%' valign='center' bgcolor='white'>";
                fulldet = fulldet + "<a href='Admin_Enrolldelete.aspx?cid=" + ds.Tables[0].Rows[i]["UserId"].ToString() + "'><img src='images/delete.gif' alt='Delete Enrollment Details' width='16' height='16' border='0' /></a>";


            }
        }


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
