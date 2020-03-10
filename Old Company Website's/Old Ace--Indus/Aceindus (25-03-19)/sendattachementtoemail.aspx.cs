using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.SessionState;
using System.IO;
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using System.Data.SqlClient;
using igiit.safeConvert;

/// <summary>
/// summary code to attach file and send mail about job details
/// </summary>
public partial class admin_sendattachementtoemail : System.Web.UI.Page
{
    string jid;
    Binddata obj = new Binddata();
   
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Establish sql connection
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //Open database connection to connect to sql server
        conn.Open();
        DataSet ds = new DataSet();
        jid = (Request.QueryString["id"].ToString());
        //Navigate and get career job details
        ds = obj.GetJobDetails(jid);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            string jobid = ds.Tables[0].Rows[0]["jobid"].ToString();
            string jobtitle = ds.Tables[0].Rows[0]["jobtitle"].ToString();
            string loc = ds.Tables[0].Rows[0]["Location"].ToString();
            txtsubject.Text = "Application for "+jobid + " - " + jobtitle + " - " + loc;
        }
        //close database connection to disconnect to sql server
        conn.Close();
    }

    /// <summary>
    /// Sends an mail message
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string strResult = string.Empty;
        string strBody = "";

        MailMessage mail = new MailMessage();

        string xx = txtfrom.Text.ToString();

        // Sender e-mail address.
        mail.From = new MailAddress(xx);

        // Recipient e-mail address.
        mail.To.Add("info@aceindus.in");

        strBody = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0' class='data'><tr><td colspan='2'><a href='www.aceindus.in'><img src='http://www.aceindus.in/images/logo.png' width='250' height='76' border='0'></a></td></tr>";
        strBody = strBody + "<tr><td height='10px'></td></tr><tr><td  class='data'><b>From " + txtfrom.Text + " ,</b></td></tr>";
        strBody = strBody + "<tr><td  class='data'>Subject: + " + txtsubject.Text + ",  </td></tr>";
        strBody = strBody + "<tr><td height='5px'></td></tr><tr><td><hr height='2px'></hr></td></tr><tr><td height='3px'></td></tr>";
        strBody = strBody + "<tr><td height='2px'></td></tr><tr><td><table border='0' cellpadding='0' cellspacing='0'><tr><td>Message: </td><td>:</td><td  class='data'>" + txtmessage.Text + "</td></tr><tr><td colspan='3' height='5px'></td></tr></table></td></tr>";
        strBody = strBody + "<tr><td><hr height='3px'></td></tr><tr><td height='5px'></td></tr><tr><td class='data'>Please send me details for AceIndus.</td></tr><tr><td></td></tr>";
        strBody = strBody + "</table>";
        mail.Body = strBody;
        mail.IsBodyHtml = true;

        // Subject of e-mail
        mail.Subject = txtsubject.Text;

        // your remote SMTP server.
        SmtpClient smtp = new SmtpClient();

        //Attach file using FileUpload Control and put the file in memory stream
        if (this.uploadresume.HasFile)
        {
            Attachment at = new Attachment(uploadresume.PostedFile.InputStream, MediaTypeNames.Application.Octet);
            at.ContentDisposition.FileName = this.uploadresume.FileName;

            //Attaching uploaded file
            mail.Attachments.Add(at);

        }
        smtp.Send(mail);

        if (mail.Attachments.Count > 0)
        {
            //Clear the attachments and delete the sessionid folder from tempFiles 
            mail.Attachments.Dispose();
        }
        else
            lblmsg.Text = "Sorry you may only attach a maximum of 5 files";

        string strScript = "";

        //Displaying The Message Box 
        strScript = "alert('Thanking you! Message sent successfully.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        txtfrom.Text = "";
        txtsubject.Text = "";
        txtmessage.Text = "";

    }
    
}
