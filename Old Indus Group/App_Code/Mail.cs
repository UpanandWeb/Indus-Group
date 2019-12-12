﻿using System;
using System.Data;
using System.Configuration;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Net.Mail;

/// <summary>
/// Summary description for Mail
/// </summary>
public static class Mail
{
    public static void sendmail(string from, string to, string subject, string body)
    {
        MailMessage email = new MailMessage(from, to, subject, body);
        //email.Bcc.Add("lmuppirisetty@aceindus.in", "sjakkillinki@aceindus.in");
        email.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Send(email);
    }
}
