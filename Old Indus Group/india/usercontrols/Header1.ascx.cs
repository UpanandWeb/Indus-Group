using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrols_Header1 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null && Session["Designation"] != null)
            {
                lnkOut.Visible = true;
                lnk1.Visible = false;
                lnkimg.Visible = false;
            }
            else
            {
                lnk1.Visible = true;
                lnkimg.Visible = true;
                lnkOut.Visible = false;
            }
        }
    }

    protected void lnk1_Click(object sender, EventArgs e)
    {
        lnk1.Visible = true;
        lnkimg.Visible = true;
        lnkOut.Visible = false;
        Response.Redirect("Login.aspx");
    }

    protected void lnkOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        lnk1.Visible = true;
        lnkimg.Visible = true;
        lnkOut.Visible = false;
        Response.Redirect("Default.aspx");
    }
}