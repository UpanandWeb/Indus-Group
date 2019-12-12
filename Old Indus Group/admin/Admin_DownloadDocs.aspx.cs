using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 

public partial class admin_Admin_DownloadDocs : System.Web.UI.Page
{
    string LoginId;
    string FilePath;
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        LoginId = Convert.ToString(Session["LogInId"]);
        if (LoginId != "")
        {
            // it will stays in the same page
        }

        else
        {
            //After login into the account it will go Post ad
            Response.Redirect("Default.aspx");

        }
        try
        {
            //Getting file name of the document
            string fileName = Convert.ToString(Request.QueryString["fname"]);
            string folder = Convert.ToString(Request.QueryString["folder"]);
            string subfolder = Convert.ToString(Request.QueryString["subfolder"]);
            //Mensioning the file type                
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
            //Retrieving the file from the folder resume
            if (subfolder != "")
            {
                FilePath = "~/" + folder + "/" + subfolder + "/" + fileName;

            }
            else
            {
                FilePath = "~/" + folder + "/" + fileName;
            }
            Response.TransmitFile(Server.MapPath(FilePath));
            Response.End();
        }
        catch (Exception ex)
        {
            string script = string.Empty;
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        
    }

}
