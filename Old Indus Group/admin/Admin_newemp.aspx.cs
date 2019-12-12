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
 
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Admin_newemp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string empid = string.Empty;
    string email = string.Empty;
    string pwd = string.Empty;
    string fname = string.Empty;
    string lname = string.Empty;
    string country = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

    }
    protected void btnempcreate_Click(object sender, EventArgs e)
    {
        empid = Convert.ToString(txtempid.Text);
        email = Convert.ToString(txtemail.Text);
        pwd = Convert.ToString(txtpwd.Text);
        fname = Convert.ToString(txtfname.Text);
        lname = Convert.ToString(txtlname.Text);
        country = Convert.ToString(ddlcountry.SelectedItem.Text);
        Int32 status = 0;
        string streg = string.Empty;
        try
        {
            con.Open();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("insert into employeereg1(empid,username,emailid,pwd,firstname,lastname,country1,status) values('" + empid + "','" + email + "','" + email + "','" + pwd + "','" + fname + "','" + lname + "','" + country + "','" + status + "')", con);
            streg = cmd.ExecuteNonQuery().ToString();
            SendMail(empid, email, pwd, fname, lname, country);
            string strScript = "";
            strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Admin_Employee.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            con.Close();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    private void SendMail(string EmpID, string Email, string pwd, string fname, string lname, string country)
    {
        string Msg = "";
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("info@aceindus.in");
            mm.To.Add(Email);
            mm.Bcc.Add("sjakkillinki@aceindus.in");
            mm.CC.Add("seshu@aceindus.in");

            Msg += "<table border='0'><tr><td class='data1'>Dear " + fname + " " + lname + ",</td></tr>"
                + "<tr><td height='10px'></td></tr>"
                + "<tr><td><h4>Your account details are as follows:</h4></td></tr>"
                + "<tr><td><h5>Emp ID : " + EmpID + "</h5></td></tr>"
                + "<tr><td><h5>Email ID : " + Email + "</h5></td></tr>"
                + "<tr><td><h5>Password : " + pwd + "</h5></td></tr>"
                + "<tr><td><h5>Country : " + country + "</h5></td></tr>"
                + "<tr><td>Please login with Your following Details.<a href='http://www.acsgit.net/login.aspx'>http://www.acsgit.net/login.aspx</a></td></tr>"
                + "<tr><td height='20px'></td></tr>"
                + "<tr><td height='50px'></td></tr>"
                + "<tr><td>Regards,</td></tr>"
                + "<tr><td><a href='http://www.www.acsgit.net/'>Acs Global.</a></td></tr></table>";

            mm.Subject = "Your Employee Login Details for Acs Global.";
            mm.IsBodyHtml = true;
            mm.Body = Msg;
            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);

        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
}