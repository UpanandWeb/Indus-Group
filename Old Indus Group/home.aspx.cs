using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userclass _objStudentInfo = (userclass)Session["objStudentInfo"];
        lblDisplayUserName.Text = _objStudentInfo.UName;
    }
    protected void killall_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("test.aspx");
    }
}