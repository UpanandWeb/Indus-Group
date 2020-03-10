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
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

/// <summary>
/// summary code to forward job to a friend 
/// </summary>
public partial class admin_forward_job_tofrd : System.Web.UI.Page
{
   
    
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {       
        
    }
    /// <summary>
    /// summary code to send mail to friend 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsend_Click(object sender, EventArgs e)
    {
            using (MailMessage message = new MailMessage())
            {
                message.From = new MailAddress(txtfrom.Text.ToString());
                message.To.Add(new MailAddress(txtto.Text.ToString()));
                message.Subject = "Message via My Site from " + txtsubject.Text.ToString();
                message.IsBodyHtml = true;
                message.Body = "<html><body>" + txtmessage.Text.ToString() + "</body></html>";
                SmtpClient client = new SmtpClient();
                //client.Host = "smtpout.secureserver.net";
                client.Send(message);
            }
            string strScript = "";

            //Displaying The Message Box 
            strScript = "alert('Thanking you! Message sent successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);        
    }
}
