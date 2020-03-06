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
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
            }
        }
    }
    protected void imgenq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-Enquiry.aspx");
    }

    protected void linkenq_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Enquiry.aspx");
    }

    protected void imgcourse_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");
    }

    protected void lnknews_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");
    }

    protected void imgcontact_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-Student-Info.aspx");

    }
    protected void lnkcontact_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Student-Info.aspx");
    }
    protected void imgfeed_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Feedback.aspx");

    }
    protected void lnkfeed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx");

    }
    protected void imgexcep_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Support.aspx");

    }
    protected void lnkexcep_Click(object sender, EventArgs e)
    {
        Response.Redirect("Support.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Users.aspx");

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }

    protected void lnkuni_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-University.aspx");
    }

    protected void Imageuniversity_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-University.aspx");

    }
}