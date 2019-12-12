using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class vendor_forgot_pwd : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitbtn_Click(object sender, EventArgs e)
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
                        // MailMessage MsgMail = new MailMessage();
                        // MsgMail.Subject = "Your Password :";
                        string bdy = "";
                        bdy += "Dear Indus group Member,<br>";
                        bdy += "<br> We have received a request for your password for email ID: '" + mailid + "'";
                        bdy += "<br> Your password : " + drUid["pwd"].ToString();
                        bdy += "<br> For security reasons we recommend the following:";
                        //bdy += "<br><br> 1. Never give out your Doctorssite password ";
                        bdy += "<br> 1. Make a password with special characters and numbers";
                        bdy += "<br> 2. Make your password easy for you to remember, but difficult for others to guess<br><br>";
                        bdy += "<br> <br>Thank you for using Indus group site";
                        bdy += "<br> <br><br>Regards,";
                        bdy += "<br> Customer Care Indus group site";
                        //bdy += "<br> <br><br>http://www.indusgroup.ws/DocInfo%5Fnew/";
                        drUid.Close();
                        //MsgMail.IsBodyHtml = true;
                        //MsgMail.From = new MailAddress("info@igiit.com");
                        // MsgMail.To.Add(txtmail.Text);
                        //MsgMail.CC.Add("akarnam@aceindus.in");
                        //MsgMail.Body = bdy;
                        //SmtpClient smtp = new SmtpClient();
                        // smtp.Send(MsgMail);
                        //lblMsg.Text = "Your Password has been sent to your mail id.";
                        string strscpt = "alert('Your Password has been sent to your mail id');location.replace('login.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                        txtmail.Text = "";

                        //MsgMail.Body = bdy;
                        //MsgMail.Body = bdy;
                        //MsgMail.From = new MailAddress("info@igiit.com");
                        //MsgMail.To = mailid;
                        //MsgMail.BodyFormat = MailFormat.Html;                     
                        //SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
                        //SmtpMail.Send(MsgMail);
                        //lblMsg.Text = "Your Password has been sent to your mail id.";
                        //txtmail.Text = "";
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
    protected void cancelbtn_Click(object sender, EventArgs e)
    {
        txtmail.Text = "";
        Response.Redirect("login.aspx");
    }
}