using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] == null)
            {

            }
            else
            {
                lg.Text = "Log Out";
                string name = Convert.ToString(Session["name"]);
                //lblname.Text = name;
            }
        }
    }
    protected void lg_Click(object sender, EventArgs e)
    {
        if (lg.Text == "Log Out")
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {

    }
}