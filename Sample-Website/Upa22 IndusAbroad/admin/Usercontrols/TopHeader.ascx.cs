using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Usercontrols_TopHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                lbluser.Visible = true;
                lnklogout.Visible = true;
                lbluser.Text = Session["user"].ToString();
            }
            else
            {
                lnklogout.Visible = false;
            }
        }
    }
    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}