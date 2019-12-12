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

public partial class igiit_Admin_Admin_Errors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["flag"].ToString() != "" || Request.QueryString["flag"].ToString() != null)
        {
            if (Request.QueryString["flag"].ToString() == "edit")
                Errmsg.InnerHtml = "You Didn't Have Edit Permission...";

            if (Request.QueryString["flag"].ToString() == "delete")
                Errmsg.InnerHtml = "You Didn't Have Delete Permission...";
        }
        else
            Errmsg.InnerHtml = "Error Page....";
    }

    
}
