﻿using System;
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
//using System.Net.Mail;
//using System.Net;
using System.Web.Mail;

public partial class Emp_forget_pwd : System.Web.UI.Page
{
    //establish sql connection
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    string st = "";
    
    /// <summary>
    /// to perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    /// <summary>
    /// summary code to send mail about forget password to user
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void submitbtn_Click(object sender, ImageClickEventArgs e)
    {
        if (!txtmail.Text.Trim().ToLower().Equals(""))
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                //open database connection to connect to sql server
                connection.Open();
                Int16 cnt;
                //Checking wether the role name is already exist or not
                cmd.CommandText = "SELECT COUNT(*) FROM employeereg1 WHERE emailid ='" + txtmail.Text.Replace("'", "''").Trim().ToLower() + "'";
                cnt = Convert.ToInt16(cmd.ExecuteScalar());
                if (cnt == 1)
                {
                    SqlCommand cmduid = new SqlCommand("SELECT emailid,pwd FROM employeereg1 WHERE emailid='" + txtmail.Text.Replace("'", "''").Trim() + "'", connection);
                    SqlDataReader drUid;
                    drUid = cmduid.ExecuteReader();
                    if (drUid.HasRows)
                    {
                        drUid.Read();
                        string mailid = string.Empty;
                        mailid = drUid["emailid"].ToString();
                        MailMessage MsgMail = new MailMessage();
                        MsgMail.Subject = "Your Password :";
                        string bdy = "";
                        bdy += "Dear Ace Indus Member,<br>";
                        bdy += "<br> We have received a request for your password for email ID: '" + mailid + "'";
                        bdy += "<br> Your password : " + drUid["pwd"].ToString();
                        bdy += "<br> For security reasons we recommend the following:";
                        //bdy += "<br><br> 1. Never give out your Doctorssite password ";
                        bdy += "<br> 1. Make a password with special characters and numbers";
                        bdy += "<br> 2. Make your password easy for you to remember, but difficult for others to guess<br><br>";
                        bdy += "<br> <br>Thank you for using Ace Indus site";
                        bdy += "<br> <br><br>Regards,";
                        bdy += "<br> Customer Care Ace Indus site";
                        //bdy += "<br> <br><br>http://www.indusgroup.ws/DocInfo%5Fnew/";
                        drUid.Close();
                        MsgMail.Body = bdy;
                        MsgMail.Body = bdy;
                        MsgMail.From = "info@wizardsedu.ws";
                        MsgMail.To = mailid;
                        MsgMail.BodyFormat = MailFormat.Html;
                       
                        //MsgMail.From = new MailAddress("info@wizardsedu.ws");
                        //MsgMail.To.Add("" + txtmail.Text + "");
                        //SmtpClient smtp = new SmtpClient();
                        //smtp.Send(MsgMail);
                        SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
                        SmtpMail.Send(MsgMail);
                        lblMsg.Text = "Your Password has been sent to your mail id.";
                        txtmail.Text = "";
                    }
                }
                else
                {
                    lblMsg.Text = "Invalid User Id";
                    txtmail.Text = "";
                }
            }
            catch (SqlException oe)
            {
                //to catch exception handled
                lblMsg.Text = oe.Message;
            }
            catch (Exception ex)
            {
                //to catch exception handled
                lblMsg.Text = ex.Message;
            }
            finally
            {
                //close database connection to disconnect to sql server
                connection.Close();
            }
        }
        else
        {
            lblMsg.Text = "Invalid User Id";
            txtmail.Text = "";
        }
    }
    /// <summary>
    /// summary code for cancel  button
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void cancelbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtmail.Text = "";
    }
}








