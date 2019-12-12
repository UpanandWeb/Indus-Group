
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
public partial class Admin_Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //lbltime.Text = DateTime.UtcNow.AddHours(-4).ToString("MM-dd-yyyy HH:mm:ss");

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            own = Session["UserName"].ToString();
            string ud = Session["uid"].ToString();
            string x = GetUser_IP();   // local ip ::1
            if (own == "admin")
            {
                lblname.Text = Session["UserName"].ToString();
            }
            else if ((x == "1.22.125.2") || (x == "98.175.101.254") || (own == "admin") || (ud == "rr@1indus.com") || (x == "::1") || (x == "71.163.132.64") || (x == "71.114.25.168") || (x == "70.183.4.89") || (x == "103.211.39.52") || (ud == "admin123") || (x == "103.195.94.146"))// US IP ADDRESS and india 1.22.125.2
            {
                //|| (x == "71.163.132.64") us home
                //||(x == "103.211.39.52") ind 

                txtOld.Text = Session["pw"].ToString();

                int status = 0;
                con.Open();
                SqlCommand cmds = new SqlCommand("select chFlag from Users_Information where UserId=@user", con);
                cmds.Parameters.AddWithValue("@user", Session["LoginId"].ToString());
                try
                {
                    status = Convert.ToInt32(cmds.ExecuteScalar());
                    if (status == 0)
                    {
                        mdpop.Show();
                    }
                    else
                    {
                        mdpop.Hide();
                    }
                }
                catch
                {
                }
                con.Close();
                lblname.Text = Session["UserName"].ToString();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No permission to out side company');location.replace('Admin_Login.aspx');", true);
            }
        }
    }

    protected string GetUser_IP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        return VisitorsIPAddr;
    }

    protected void btnok_Click(object sender, EventArgs e)
    {
        if (Session["LoginId"] == null)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "message", "<script>alert('Sorry!! time expired, please login again.');window.location('Admin_Login.aspx');</script>");           
        }
        else
        {
            int i = 0;
            string s1 = "";
            if (Session["utype"].ToString() == "Employee")
            {
                s1 = "update employeereg1 set pwd=@pass,confirmpwd=@pass where username=@user ; update Users_Information set Password=@pass,chFlag=1 where UserId=@user";
            }
            else
            {
                s1 = "update Users_Information set Password=@pass,chFlag=1 where UserId=@user";
            }
            con.Open();
            SqlCommand cmd = new SqlCommand(s1, con);
            cmd.Parameters.AddWithValue("@pass", txt1.Text);
            cmd.Parameters.AddWithValue("@user", Session["LoginId"].ToString());
            i = cmd.ExecuteNonQuery();
            con.Close();
            if ((i == 1) || (i == 2))
            {
                SendMail(Session["LoginId"].ToString(), txt1.Text, Session["UserName"].ToString());
                Session.Abandon();
                ClientScript.RegisterStartupScript(typeof(Page), "message", "<script>alert('change password sucessfully!! mail sent to your e-mail id');window.location('Admin_Login.aspx');</script>");
            }
            else
                ClientScript.RegisterStartupScript(typeof(Page), "message", "<script>alert('password change unsuccessfull');</script>");
        }
    }

    #region Web Form Designer generated code
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

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion


    private void SendMail(string userid, string pwd, string fname)
    {
        string Msg = "";
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("info@igiit.com");
            mm.To.Add(userid);
            mm.Bcc.Add("hr@igiit.com");
            mm.Bcc.Add("ravi_iginc@yahoo.com");
            Msg += "<table border='0'><tr><td><img src='http://igiit.net/images/logo2.gif' alt='Company Logo' /></td></tr><tr><td class='data1'>Dear " + fname + "</td></tr>"
                + "<tr><td height='10px'></td></tr>"
                + "<tr><td><h4>Your password changed successfully, new login details are:</h4></td></tr>"
                + "<tr><td><h5>Email ID : " + userid + "</h5></td></tr>"
                + "<tr><td><h5>Password : " + pwd + "</h5></td></tr>"
                + "<tr><td>Please login with Your following Details.<a href='http://igiit.net/login.aspx'>http://igiit.net/login.aspx</a></td></tr>"
                + "<tr><td height='20px'></td></tr>"
                + "<tr><td height='50px'></td></tr>"
                + "<tr><td>Regards,</td></tr>"
                + "<tr><td><a href='http://igiit.net/'>Indus Group ,</a></td></tr>"
                + "<tr><td>703-593-1234. </td></tr>"
                + "</table>";

            mm.Subject = "Your password change successfully for Indus Group.";
            mm.IsBodyHtml = true;
            mm.Body = Msg;
            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);

        }
        catch (Exception ex)
        {
            //ClientScript.RegisterStartupScript(typeof(Page), "message", "<script>alert('sending mail failed.');</script>");
        }
    }
   
}
