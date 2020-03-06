using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string test2 = Request.Url.AbsoluteUri;

        if (test2.Contains("Admin-Home.aspx"))
        {
            li1.Attributes.Add("style", "background-color: #336699!important;"); 
        }
        //if (!IsPostBack)
        //{
        //}
    }
    protected void lnk1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}
