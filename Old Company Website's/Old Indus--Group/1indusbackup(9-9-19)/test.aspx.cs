using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class test : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

protected void Button1_Click(object sender, EventArgs e)
{
    userclass _objStudentInfo = new userclass(TextBox1.Text, TextBox2.Text);

    Session["objStudentInfo"] = _objStudentInfo;

   // SqlConnection con;

    //con = new SqlConnection("server=user-182;user id=sa;password=007;database=srikanthch");

    sqlConnection.Open();

    SqlCommand cmd;

    SqlDataReader rdr;

    cmd = new SqlCommand("select UserName,Password from Sessionid", sqlConnection);

    rdr = cmd.ExecuteReader();
    while (rdr.Read())

{

    if (rdr["UserName"].ToString() == TextBox1.Text && rdr["Password"].ToString() == TextBox2.Text)

{

    string sKey = TextBox1.Text + TextBox2.Text;

string sUser = Convert.ToString(Cache[sKey]);

if (sUser == null || sUser == String.Empty)

{
    TimeSpan SessTimeOut = new TimeSpan(0, 0, HttpContext.Current.Session.Timeout, 0, 0);

    HttpContext.Current.Cache.Insert(sKey, sKey, null, DateTime.MaxValue, SessTimeOut,

    System.Web.Caching.CacheItemPriority.NotRemovable, null);

    Session["user"] = TextBox1.Text + TextBox2.Text;

    // Let them in - redirect to main page, etc.

    Response.Redirect("Home.aspx");

}

else
{

    // cache item exists, so too bad... 

    lblDisplay.Text = "<Marquee><h1><font color=red>Already Logged IN</font></h1></marquee>";

    return;

}

}

else
{

    lblDisplay.Text = "Invalid UserName and Password Try Again !!!";

}

}
}
}
