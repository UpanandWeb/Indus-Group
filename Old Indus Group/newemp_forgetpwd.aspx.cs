using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Net;
using System.Collections.Specialized;

public partial class newemp_forgetpwd : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd = null;
    SqlDataReader dr = null;
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 60; // (60 sec = 1 min)
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
        }
    }

    /// <summary>
    /// send email woth password to employee
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
                    SqlCommand cmduid = new SqlCommand("SELECT firstname,lastname,emailid,pwd,mobile FROM employeereg1 WHERE emailid='" + txtmail.Text.Replace("'", "''").Trim() + "'", connection);
                    SqlDataReader drUid;
                    drUid = cmduid.ExecuteReader();
                    if (drUid.HasRows)
                    {
                        drUid.Read();
                        string mailid = string.Empty;
                        mailid = drUid["emailid"].ToString();
                        string name=drUid["firstname"].ToString() + drUid["lastname"].ToString();
                        string ph=drUid["mobile"].ToString();
                        string bdy = "";
                        bdy += "Dear Indus group Member,<br>";
                        bdy += "<br> We have received a request for your password for email ID: '" + mailid + "'";
                        bdy += "<br> Your password : " + drUid["pwd"].ToString();
                        bdy += "<br> Your Mobile Number : " + drUid["mobile"].ToString();

                        bdy += "<br> For security reasons we recommend the following:";
                        bdy += "<br> 1. Make a password with special characters and numbers";
                        bdy += "<br> 2. Make your password easy for you to remember, but difficult for others to guess<br><br>";
                        bdy += "<br> <br>Thank you for using Indus group site";
                        bdy += "<br> <br><br>Regards,";
                        bdy += "<br> Customer Care Indus group site";

                        sendmail(name, mailid, ph, bdy);
                        drUid.Close();

                        string strscpt = "alert('Your Password has been sent to your mail id');location.replace('login.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                        txtmail.Text = "";
                    }
                }
                else
                {
                    lblMsg.Text = "Email Id not Registered";
                    txtmail.Text = "";
                }
            }
            catch (SqlException oe)
            {
                lblMsg.Text = oe.Message;
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
            finally
            {
                connection.Close();
            }
        }
        else
        {
            lblMsg.Text = "Invalid User Id";
            txtmail.Text = "";
        }
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
        string from = "admin@1indus.com";
        string fromName = "IndusGroup Admin";
        string to = email;
        string subject = "Request for your password";
        SendEmail(email, subject, msg, from, fromName);
    }

    protected void cancelbtn_Click(object sender, EventArgs e)
    {
        txtmail.Text = "";
        Response.Redirect("login.aspx");
    }
}