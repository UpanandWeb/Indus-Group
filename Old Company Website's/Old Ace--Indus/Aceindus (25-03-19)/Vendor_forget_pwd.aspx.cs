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
using System.Web.Mail;

/// <summary>
///  summarise code for forget password for vendor
/// </summary>
public partial class Vendor_forget_pwd : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    string st = "";

    /// <summary>
    /// To perform action when page is loaded.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    /// <summary>
    /// summarise code for submit button when we enter data for forget password and send mail after registering new password
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
                cmd.CommandText = "SELECT COUNT(*) FROM vendorreg WHERE cemail ='" + txtmail.Text.Replace("'", "''").Trim().ToLower() + "'";
                cnt = Convert.ToInt16(cmd.ExecuteScalar());
                if (cnt == 1)
                {
                    SqlCommand cmduid = new SqlCommand("SELECT username,password,cemail FROM vendorreg WHERE cemail='" + txtmail.Text.Replace("'", "''").Trim() + "'", connection);
                    SqlDataReader drUid;
                    drUid = cmduid.ExecuteReader();
                    if (drUid.HasRows)
                    {
                        drUid.Read();
                        string mailid = string.Empty;
                        mailid = drUid["cemail"].ToString();
                        MailMessage MsgMail = new MailMessage();
                        MsgMail.Subject = "Your Password :";
                        string bdy = "";
                        bdy += "Dear Ace Indus Member,<br>";
                        bdy += "<br> We have received a request for your password for email ID: '" + mailid + "'";
                        bdy += "<br> Your password : " + drUid["password"].ToString();
                        bdy += "<br> For security reasons we recommend the following:";
                        //bdy += "<br><br> 1. Never give out your Doctorssite password ";
                        bdy += "<br> 1. Make a password with special characters and numbers";
                        bdy += "<br> 2. Make your password easy for you to remember, but difficult for others to guess<br><br>";
                        bdy += "<br> <br>Thank you for using Ace Indus site";
                        bdy += "<br> <br><br>Regards,";
                        bdy += "<br> Customer Care Ace Indus site";
                        //bdy += "<br> <br><br>http://www.indusgroup.ws/DocInfo%5Fnew/";
                        drUid.Close();
                        MsgMail.IsBodyHtml = true;
                        MsgMail.From = new MailAddress("info@aceindus.in");
                        MsgMail.To.Add(txtmail.Text);
                        //MsgMail.CC.Add("akarnam@aceindus.in");
                        MsgMail.Body = bdy;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Send(MsgMail);
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
                //close database connection to disconnect to sql sqrver
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
    /// summarise code for cancel button 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void cancelbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtmail.Text = "";
    }
}
