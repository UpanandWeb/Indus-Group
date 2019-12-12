using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrols_Indheader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnk1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}