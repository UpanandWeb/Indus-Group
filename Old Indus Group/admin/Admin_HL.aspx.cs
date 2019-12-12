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

public partial class Admin_HL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        DataSet ds = new DataSet();
        string fulldet = string.Empty;

        fulldet = "<table align='center' width='95%' border='1' valign='top' cellspacing='0' cellpadding='0'>";

        fulldet = fulldet + "<tr> <td colspan='9' align='center' bgcolor='#cccccc' width='100%'><font color='#003399' size='3pt'><b><a href='Admin_HLCreate.aspx' >Post New HeadLines</a></b></font> </td></tr>";

        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='LightSteelBlue' width='18%'><font color='#cc0099' size='2pt'><b>Head Lines</b></font></td>";

        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='LightSteelBlue' width='6%'><font color='#cc0099' size='2pt'><b>Edit</b></font> </td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='LightSteelBlue' width='6%'><font color='#cc0099' size='2pt'><b>Delete</b></font></td></tr>";


        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from headlines order by date", sqlConnection);
        imgtext.Fill(ds, "headlines");
        string cnm = string.Empty;

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                
                fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' width='12%' bgcolor='#cccccc'>";

                fulldet = fulldet +  ds.Tables[0].Rows[i]["headlines"].ToString() + "</td><td align='right' class='lable' width='10%' valign='center' bgcolor='#cccccc'>";
               
                fulldet = fulldet + "<a href='Admin_HLEdit.aspx?cid=" + ds.Tables[0].Rows[i]["id"].ToString() + "'><img src='edit.gif' alt='Edit Headlines Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='#cccccc'>";
                fulldet = fulldet + "<a href='Admin_HLDelete.aspx?cid=" + ds.Tables[0].Rows[i]["id"].ToString() + "'><img src='delete.gif' alt='Delete Headlines Details' width='16' height='16' border='0' /></a></td></tr>";

            }
        }

        fulldet = fulldet + "</table>";
        tdcontent.InnerHtml = fulldet;


    }
   
 
}
