using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	//if(!IsPostBack)
	//{
	//}

    }
    protected void imgenq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_Enquiry.aspx");
    }
    protected void lnkuser_Click(object sender, EventArgs e)
    {

    }
    protected void imgcourse_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_Courses.aspx");
    }
    protected void lnknews_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Courses.aspx");
    }
    protected void imgcontact_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void lnkcontact_Click(object sender, EventArgs e)
    {

    }
    protected void imgfeed_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void lnkfeed_Click(object sender, EventArgs e)
    {

    }
    protected void imgexcep_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void lnkexcep_Click(object sender, EventArgs e)
    {

    }
}