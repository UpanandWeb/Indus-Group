﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class admin_Admin_Seminars_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        string streg = string.Empty;
        string usid = string.Empty;

        usid = Request.QueryString["sid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("delete from seminars where sid=" + usid, connection);

            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            string str = "alert('Seminar has been deleted Successfully');location.replace('Admin_Seminar.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //.Redirect("Admin_Careers.aspx?ret=ok");

        }
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