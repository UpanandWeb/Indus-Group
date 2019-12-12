﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security;
using System.Security.Permissions;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.SessionState;
using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;

public partial class Postyour_Resume : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string imgPath, imgName;
    int jobid = 0;
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    string attachment;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["jid"] != null)
            {
                jobid = Convert.ToInt32(Request.QueryString["jid"]);
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string strResult = string.Empty;
            string strBody = "";
            Insert();

            strBody = "<table width='100%'  border='0' align='center' cellpadding='3' cellspacing='8' class='lable2'><tr><td colspan='2'><a href='www.1indus.com'><img src='http://www.1indus.com/img/logo2.gif' width='219' height='59' border='0'></a></td></tr>";
            strBody = strBody + "<tr><td height='3'></td></tr><tr><td  class='data'><b>Message From " + txtfname.Text + " ,</b></td></tr>";
            strBody = strBody + "<tr><td  class='data'>Email ID: " + txtemail.Text + ",  </td></tr>";
            strBody = strBody + "<tr><td class='data'>Phone No: " + txtphno.Text + " ,</b></td></tr>";

            strBody = strBody + "<tr><td class='data'>Discription: " + txtcomment.Text + " </b></td></tr>";
            strBody = strBody + "</table>";
            string Msg = "";
            string from = txtemail.Text;
            string fromName = "Indus Group";
            string to = "hr@1indus.com";
            string basedir = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
            imgName = System.IO.Path.GetFileName(uploadresume.PostedFile.FileName);
            //  uploadresume.PostedFile.SaveAs(basedir + "admin/Resumes/" + imgName);
            imgPath = "admin/Resumes/" + imgName;
            attachment = UploadAttachment(basedir + "admin/Resumes/" + imgName, uploadresume.PostedFile.FileName);
            string subject = "Resume from Jobseeker";
            SendEmail(to, subject, strBody, from, fromName, attachment);
            string strScript = "";
            //Displaying The Message Box 
            strScript = "alert('Thanking you!Your Resume is Uploaded successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }

        catch (Exception ex)
        {
            //string  script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
            //   lblmsg.Visible = true;
            //  lblmsg.Text = ex.ToString();
        }

        txtfname.Text = "";
        txtphno.Text = "";
        txtemail.Text = "";
        txtcomment.Text = "";
    }

    //https://api.elasticemail.com/v2/email/send?apikey=94DAF66E-4DF6-4E8E-AF96-D094A8D21DF3&subject=&from=&fromName=&sender=&senderName=&msgFrom=&msgFromName=&replyTo=&replyToName=&to=&msgTo=&msgCC=&msgBcc=&lists=&segments=&mergeSourceFilename=&channel=&bodyHtml=&bodyText=&charset=&charsetBodyHtml=&charsetBodyText=&encodingType=&template=&headers_firstname=firstname: myValueHere&postBack=&merge_firstname=John&timeOffSetMinutes=&poolName=My Custom Pool&isTransactional=false

    public static string SendEmail(string to, string subject, string bodyText, string from, string fromName, string attachment)
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

        values.Add("attachments", attachment);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    private void Insert()
    {
        if (uploadresume.HasFile)
        {
            string basedir = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
            imgName = System.IO.Path.GetFileName(uploadresume.PostedFile.FileName);
            uploadresume.PostedFile.SaveAs(basedir + "admin/Resumes/" + imgName);
            imgPath = "admin/Resumes/" + imgName;
            con.Open();
            SqlCommand cmd = new SqlCommand("insertresume", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", txtfname.Text);
            cmd.Parameters.AddWithValue("@phno", txtphno.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@resume", imgName);
            cmd.Parameters.AddWithValue("@resumepath", imgPath);
            cmd.Parameters.AddWithValue("@comments", txtcomment.Text);
            cmd.Parameters.AddWithValue("@jobid", jobid);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {

            }
        }
    }

    public static string UploadAttachment(string filepath, string filename)
    {
        FileStream stream = File.OpenRead(filepath);
        // WebRequest request = WebRequest.Create("https://api.elasticemail.com/attachments/upload?username=" + ConfigurationManager.AppSettings["ElasticUsername"].ToString() + "&api_key=" + ConfigurationManager.AppSettings["ElasticAPI"].ToString() + "&file=" + filename);
        WebRequest request = WebRequest.Create("https://api.elasticemail.com/attachments/upload?username=" + USERNAME + "&api_key=" + API_KEY + "&file=" + filename);


        request.Method = "PUT";
        request.ContentLength = stream.Length;
        Stream outstream = request.GetRequestStream();
        Postyour_Resume.CopyTo(stream, outstream);
        stream.Close();

        WebResponse response = request.GetResponse();
        string result = new StreamReader(response.GetResponseStream(), Encoding.UTF8).ReadToEnd();
        response.Close();
        return result;
    }

    public static void CopyTo(Stream input, Stream output)
    {
        byte[] buffer = new byte[16 * 1024]; // Fairly arbitrary size
        int bytesRead;
        while ((bytesRead = input.Read(buffer, 0, buffer.Length)) > 0)
        {
            output.Write(buffer, 0, bytesRead);
        }
    }
}
