using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UControls_Top : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                lnklogin.Visible = false;
                lnklogout.Visible = true;
            }
            else
            {
                lnklogin.Visible = true;
                lnklogout.Visible = false;
            }
        }
    }

    protected void lnklogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }


    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }

    protected void lnkhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");

    }
}