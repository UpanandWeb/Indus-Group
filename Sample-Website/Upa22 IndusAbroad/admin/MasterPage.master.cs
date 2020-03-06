using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void lnkhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
    protected void lnenq_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Enquiry.aspx");
    }
    protected void lnkcourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");
    }
    protected void lnkreports_Click(object sender, EventArgs e)
    {

    }
    protected void lnkstatus_Click(object sender, EventArgs e)
    {

    }
    protected void lnkFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedabck.aspx");

    }
    protected void lnkuser_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");

    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Student-Info.aspx");
    }
    protected void lnksupport_Click(object sender, EventArgs e)
    {
        Response.Redirect("Support.aspx");

    }
}
