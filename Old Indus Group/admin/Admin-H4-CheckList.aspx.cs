using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_H4_CheckList : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (!IsPostBack)
        {

        }
    }
    protected void h1checklist_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H1B-CheckList.aspx");
    }
    protected void h4application_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H4-CheckList.aspx");
    }
    protected void h1information_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H1B-InformationSheet.aspx");
    }
}