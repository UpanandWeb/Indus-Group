using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.IO;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    new1indus add = new new1indus();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string cont = ConfigurationManager.AppSettings["con"].ToString();
        }
    }
    protected void mpview(object sender, EventArgs e)
    {
        mp1.Show();
    }
    protected void mpview(object sender, ImageClickEventArgs e)
    {
        mp1.Show();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string name = txt1name.Text;
        string email = txtemail.Text;
        string ph = txtphone.Text;
        string msg = txtmsg.Text;

        add.insertdata(name, email, ph, msg);
        sendmail(name, email, ph, msg);
      string  strScript = "alert('Thanks for leaving a message.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
    }
    public static string SendEmail(string to, string subject, string bodyText, string from, string fromName)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", bodyText);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }
    protected void sendmail(string name, string email, string ph, string msg)
    {
        string Msg = "";
        string from = "admin@1indus.com";
        string fromName = "IndusGroup Admin";
        string to = email;
        string subject = "Your Request Message.";

        //string subject = "Feedback form for Indus Group.";
        Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
        Msg = Msg + "<tr><td colspan='3' style='background:url(http://www.igiit.net/new1/images/logo2.gif) no-repeat;height:59px;width:219px'></td></tr>";
        Msg = Msg + "<tr>";
        //Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp; Name </td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>";
        Msg = Msg + "Dear";
        Msg = Msg + "" + name + "";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='left'>Your Message Request</td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td align='left'>"+msg+"</td>";
        Msg = Msg + "</tr>";
        SendEmail(email, subject, Msg, from, fromName);
    }

    protected void lnkloc_Click(object sender, EventArgs e)
    {

    }
}