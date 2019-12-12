using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Admin_Seminars_Create : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string streg = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }
    }
    //#region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into seminars (CourseName,CouserDes,SeDate,SfacilityName,spdate) VALUES (@jname,@jdesc,@jsedate,@jfame,@postdate)", connection);

        cmd.Parameters.Add(new SqlParameter("@jname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@jdesc", SqlDbType.NVarChar, 2000));
        cmd.Parameters.Add(new SqlParameter("@jsedate", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@jfame", SqlDbType.NVarChar, 250));  
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

        cmd.Parameters["@jname"].Value = Convert.ToString(txtjname.Text);
        cmd.Parameters["@jdesc"].Value = Convert.ToString(txtjdesc.Text);
        cmd.Parameters["@jsedate"].Value = Convert.ToString(txtdate.Text);
        cmd.Parameters["@jfame"].Value = Convert.ToString(txtfaculity.Text);        
        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();
        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        //Response.Redirect("Admin_Seminar.aspx?ret=create");
        string str = "alert('Seminar has been Added Successfully');location.replace('Admin_Seminar.aspx?ret=create');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }
}
