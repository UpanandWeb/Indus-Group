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
using System.Net.Mail;
using System.Net;

/// <summary>
/// summary code for login page when user login and redirect to career job details
/// </summary>
public partial class newaccount_login : System.Web.UI.Page
{
    
    Binddata obj = new Binddata();
    string jid;
    string jtitle;
    string jloc;
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {

        string rid = Request.QueryString["id"].ToString();
        //establish sql server
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //open database connection to connect to sql server
        con.Open();
        DataSet ds = new DataSet();
        string jobid = Request.QueryString["id"].ToString();
        ds = obj.GetJobidDet(jobid);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            jid = ds.Tables[0].Rows[0]["jobid"].ToString();
            jtitle = ds.Tables[0].Rows[0]["jobtitle"].ToString();
            jloc = ds.Tables[0].Rows[0]["Location"].ToString();
            lnkbtn.Text = jid + "," ;
            lblmsg.Text = jtitle;           
            
        }
        //close database connection to disconnect to sql server
        con.Close();
        lnkbtn.Attributes.Add("onclick", "window.close('newaccount_login.aspx?id=" + jobid + " ');return false");
    }    
    /// <summary>
    /// summary code to validate login
    /// </summary>
    /// <param name="email"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    public int Validate_Login(string email, string password)
    {
        //Establish sql connection
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "[dbo].[SP_login]";
        cmd.Parameters.Add("@emailId", SqlDbType.NVarChar, 50).Value = email;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = password;
        cmd.Parameters.Add("@OutRes", SqlDbType.Int, 4);
        cmd.Parameters["@OutRes"].Direction = ParameterDirection.Output;
        cmd.Connection = con;
        int Results = 0;
        try
        {
            //open database connection to connect to sql server
            con.Open();
            cmd.ExecuteNonQuery();
            Results = (int)cmd.Parameters["@OutRes"].Value;

        }
        catch (SqlException ex)
        {
            //to catch exception handled
            lblMessage.Text = ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con != null)
            {
                //to close connection
                con.Close();
            }
        }
        return Results;
    }
    /// <summary>
    /// summary code to login
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //Establish sql connection
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        string str = "select count(*) from jobhistory where emailid='" + txtuname.Text + "'and jobtitle='" + jtitle + "'";
        SqlCommand cmd = new SqlCommand(str, conn);
        //Open database connection to connect to sql server
        conn.Open();
        string count = cmd.ExecuteScalar().ToString();
        //close database connection to disconnect to sql server
        conn.Close();
        int Results = 0;
        //checks username and password values if there are values then validate_Login function will execute 
        //otherwise it shows invalid login
        if (txtuname.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_Login(txtuname.Text, txtpwd.Text);
        }
        else
        {
            lblMessage.Text = "Please make sure that the Email Id and the password are Correct";
        }
        if (count == "0")
        {
            if (Results == 1)
            {
                //string catn = Convert.ToString(Request.QueryString["categ"]);
                Session["USERID"] = txtuname.Text;
                Session["PASSWORD"] = txtpwd.Text;
                lblMessage.Text = "Login is Good";
                //Open database connection to connect to sql server
                conn.Open();
                string qry = "insert into jobhistory(emailid,jobtitle,location,pdate)values(@emailid,@jobtitle,@loc,@pdate)";
                SqlCommand cmd1 = new SqlCommand(qry, conn);
                cmd1.Parameters.Add("@emailid", SqlDbType.NVarChar, 50).Value = txtuname.Text;
                cmd1.Parameters.Add("@jobtitle", SqlDbType.NVarChar, 50).Value = jtitle;
                cmd1.Parameters.Add("@loc", SqlDbType.NVarChar, 50).Value = jloc;
                cmd1.Parameters.Add("@pdate", SqlDbType.NVarChar, 50).Value = DateTime.Now.ToString("dd-MM-yyyy");
                cmd1.ExecuteNonQuery();
                //close database connection to disconnect to sql server
                conn.Close();
                Response.Redirect("jobhistory.aspx");

            }
            else
            {
                lblMessage.Text = "<b>Please make sure that the Email Id and the password are Correct <b>";
                lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login

            }
        }
        else
        {
            lblMessage.Text = "<b>You have already applied for this job</b>";
        }
    }
    /// <summary>
    /// summary description for link button for forget password
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkpwd_Click(object sender, EventArgs e)
    {
        //Establish sql connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //if else statement for to check user id which you entered is existed or not
        if (!txtuname.Text.Trim().ToLower().Equals(""))
        {
            try
            {
                SqlCommand commnd = new SqlCommand();
                commnd.Connection = connection;
                //To open connection
                connection.Open();
                Int16 cnt;
                //Checking wether the role name is already exist or not
                commnd.CommandText = "SELECT COUNT(*) FROM JDT_PersonalInfo1 WHERE email ='" + txtuname.Text.Replace("'", "''").Trim().ToLower() + "'";
                cnt = Convert.ToInt16(commnd.ExecuteScalar());
                if (cnt == 1)
                {
                    SqlCommand cmd = new SqlCommand("SELECT email,pwd FROM JDT_PersonalInfo1 WHERE email='" + txtuname.Text.Replace("'", "''").Trim() + "'", connection);
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    //Send mail to the id which you entered in the text field with your password details
                    if (dr.HasRows)
                    {
                        dr.Read();
                        string mailid = string.Empty;
                        mailid = dr["email"].ToString();
                        MailMessage MsgMail = new MailMessage();
                        MsgMail.Subject = "Your Password :";
                        string bdy = "";
                        bdy += "Dear Ace Indus Member,<br>";
                        bdy += "<br> We have received a request for your password for email ID: '" + mailid + "'";
                        bdy += "<br> Your password : " + dr["pwd"].ToString();
                        bdy += "<br> For security reasons we recommend the following:";
                        //bdy += "<br><br> 1. Never give out your Doctorssite password ";
                        bdy += "<br> 1. Make a password with special characters and numbers";
                        bdy += "<br> 2. Make your password easy for you to remember, but difficult for others to guess<br><br>";
                        bdy += "<br> <br>Thank you for using Ace Indus site";
                        bdy += "<br> <br><br>Regards,";
                        bdy += "<br> Customer Care Ace Indus site";
                        //bdy += "<br> <br><br>http://www.indusgroup.ws/DocInfo%5Fnew/";
                        dr.Close();
                        MsgMail.Body = bdy;
                        MsgMail.From = new MailAddress("info@wizardsedu.ws");
                        MsgMail.To.Add(mailid);
                        MsgMail.IsBodyHtml = true;
                        //MsgMail.From = new MailAddress("info@wizardsedu.ws");
                        //MsgMail.To.Add("" + txtmail.Text + "");
                        SmtpClient smtp = new SmtpClient();
                        //SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
                        smtp.Send(MsgMail);
                        //lblMsg.Text = "Your Password has been sent to your mail id.";
                        string strScript = "";
                        strScript = "alert('Your Password has been sent to your mail id'); location.replace('Default.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        txtuname.Text = "";
                        txtpwd.Text = "";
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid User Id";
                    txtuname.Text = "";
                    txtpwd.Text = "";
                }
            }
            // To catch exception handled
            catch (SqlException oe)
            {
                // To catch exception handled
                lblMessage.Text = oe.Message;
            }
            catch (Exception ex)
            {
                // To catch exception handled
                lblMessage.Text = ex.Message;
            }
            finally
            {
                //To close connection
                connection.Close();
            }
        }
        else
        {
            lblMessage.Text = "Invalid User Id";
            txtuname.Text = "";
            txtpwd.Text = "";
        }
    }
    /// <summary>
    /// summary code for link button to redirect to registration for job seeker page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkreg_Click(object sender, EventArgs e)
    {
        string rid = Request.QueryString["id"].ToString();
        Response.Redirect("Registrationforjobseeker.aspx?id="+ rid+" ");
    }
}
