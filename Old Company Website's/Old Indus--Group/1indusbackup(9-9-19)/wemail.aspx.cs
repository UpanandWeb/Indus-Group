using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.Mail;
//using System.Net.Mail;
//using System.Web.Mail;

using System.Net.Mail;
using System.Net.Mime;
using System.IO;

public partial class wemail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsend_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mail = new MailMessage();
           // mail.To.Add(txtto.Text);

            mail.From = new MailAddress("vyarramsetty@aceindus.in");
            mail.Subject = txtsub.Text;
            string[] ToMuliId = txtto.Text.Split(',');
            foreach (string ToEMailId in ToMuliId)
            {
                mail.To.Add(new MailAddress(ToEMailId)); //adding multiple TO Email Id
            }

            if (txtcc.Text != "")
            {
                string[] CCId = txtcc.Text.Split(',');

                foreach (string CCEmail in CCId)
                {
                    mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                }
            }

            if (txtbcc.Text != "")
            {
                string[] bccid = txtbcc.Text.Split(',');

                foreach (string bccEmailId in bccid)
                {
                    mail.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
                }
            }

            string fppath = string.Empty;
            string fppath1 = string.Empty;
            string imgName1 = "";
            string imgName = "";
            if (FileUploadControl.HasFile)
            {
                //string filename = Path.GetFileName(FileUploadControl.FileName);
                //Attachment data = new Attachment(Server.MapPath(filename)); //Could not find file 'D:\Hosting\4770480\html\37604977_1667955583253833_8013065676069535744_o.jpg'.
                //// your path may look like Server.MapPath("~/file.ABC")
                //mail.Attachments.Add(data);

                string fileName = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                mail.Attachments.Add(new Attachment(FileUploadControl.PostedFile.InputStream, fileName));
            }

            mail.Body = txtmsg.Text;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
       //     smtp.Host = "smtpout.secureserver.net"; //Or Your SMTP Server Address
        //    smtp.Port = 465;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("vyarramsetty@aceindus.in", "Indusgroup1");

            //Or your Smtp Email ID and Password
            smtp.EnableSsl = false;
            smtp.Send(mail);
            lblsub1.Text = "sent successfully";
        }
        catch (Exception ex)
        {
            lblsub1.Text = ex.Message;

        }


        // MailMessage msg = new MailMessage();
        // msg.Body = "Body";

        //// string smtpServer = "smtp.indus4domains.com";
        // //The message could not be sent to the SMTP server. The transport error code was 0x800ccc6f. The server response was 554 p3plibsmtp01-07.prod.phx3.secureserver.net bizsmtp IB105. 
        // //Connection refused. 103.211.39.52 is listed on the Exploits Block List (XBL) <http://www.spamhaus.org/query/ip/103.211.39.52> Please visit http://www.spamhaus.org/xbl/ for more information.

        // string smtpServer = "relay-hosting.secureserver.net";
        // string userName = "vyarramsetty@aceindus.in";
        // string password = "Indusgroup1";
        // int cdoBasic = 1;
        // int cdoSendUsingPort = 2;
        // if (userName.Length > 0)
        // {
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer);
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName);
        //     msg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password);
        // }
        // msg.To = txtto.Text;
        // msg.From = "vyarramsetty@aceindus.in";
        // msg.Subject = "Testing Email from webmail";
        // msg.BodyEncoding = System.Text.Encoding.UTF8;
        // SmtpMail.SmtpServer = smtpServer;
        // SmtpMail.Send(msg);           //The transport failed to connect to the server.



       // SmtpClient smtpClient = new SmtpClient("1indus.com");

       // smtpClient.Credentials = new System.Net.NetworkCredential("vyarramsetty@aeindus.in", "Indusgroup1");
       // smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
       // MailMessage mailMsg = new MailMessage("pr@1indus.com", "vyarramsetty@aeindus.in");

       ////MailMessage mailMessage = new MailMessage(txtFrom.Text, txtTo.Text);
       // mailMsg.Subject = "Test email";
       // mailMsg.Body = txtmsg.Text;

       // try
       // {
       //     smtpClient.Send(mailMsg);
       //     lblsub.Text = "Message sent";
       // }
       // catch (Exception ex)
       // {
       //     lblsub.Text = ex.ToString();
       // }

        //try
        //{
        //    System.Net.Mail.MailMessage msgs = new System.Net.Mail.MailMessage();
        //    msgs.To.Add(txtto.Text.Trim());
        //    MailAddress address = new MailAddress("vyarramsetty@aceindus.in");
        //    msgs.From = address;
        //    msgs.Subject = "Test mail from webmail";
        //    string htmlBody = txtmsg.Text;
        //    msgs.Body = htmlBody;
        //    msgs.IsBodyHtml = true;

        //    SmtpClient client = new SmtpClient("aceindus.in");
        //    //  client.Host = "smtp.secureserver.net";
        //    // client.Host = "pop.secureserver.net";
        //    //  client.Host = "imap.secureserver.net";
        //    client.Host = "smtpout.secureserver.net"; //smtpout.asia.secureserver.net
        //    client.Port = 25;

        //    //  client.EnableSsl = true;
        //    client.UseDefaultCredentials = false;
        //    client.Credentials = new System.Net.NetworkCredential("vyarramsetty@aceindus.in", "Indusgroup1");
        //    //Send the msgs  
        //    client.Send(msgs);
        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your Details Sent Successfull.');", true);
        //}
        //catch (Exception ex)
        //{
        //    lblsub.Text = Convert.ToString(ex);
        //}
    }
}