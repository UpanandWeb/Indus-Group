using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text;


public partial class Feedback : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    exception err = new exception();
    static string excep_page = "Feedback.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    /// <summary>
    /// Save the feedback details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string username = "";
            string userorganization = "";
            string useraddress = "";
            string usercountry = "";
            string usertelno = "";
            string useremail = "";
            string usercomments = "";


            username = Convert.ToString(txtname.Text);
            userorganization = Convert.ToString(txtorg.Text);
            useraddress = Convert.ToString(txtaddr.Text);
            usercountry = Convert.ToString(country.SelectedItem.Text);
            usertelno = Convert.ToString(txttelno.Text);
            useremail = Convert.ToString(txtemail.Text);
            usercomments = Convert.ToString(txtcomment.Text);

            string streg = string.Empty;
            //establish sql connection
            //open database connection to connect to sql server
            connection.Open();

            SqlCommand cmd = new SqlCommand("insert into feedbackform (name,organization,address,country,telno,email,comments) VALUES (@name,@organization,@address,@country,@telno,@email,@comments);", connection);


            cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@organization", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@telno", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@comments", SqlDbType.NVarChar, 150));


            cmd.Parameters["@name"].Value = username;
            cmd.Parameters["@organization"].Value = userorganization;
            cmd.Parameters["@address"].Value = useraddress;
            cmd.Parameters["@country"].Value = usercountry;
            cmd.Parameters["@telno"].Value = usertelno;
            cmd.Parameters["@email"].Value = useremail;
            cmd.Parameters["@comments"].Value = usercomments;

            streg = cmd.ExecuteNonQuery().ToString();
            //close database connection to disconnect to sql server
            connection.Close();

            string strScript = "";
            strScript = "alert('Thanking you! For your Valuable Feedback.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            txtname.Text = "";
            txtemail.Text = "";
            txtorg.Text = "";
            txttelno.Text = "";
            txtcomment.Text = "";
            country.SelectedIndex = -1;
            txtaddr.Text = "";


            SendMail(username, userorganization, useraddress, usercountry, usertelno, useremail, usercomments);
        }
        catch(Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ErrorPage.aspx");
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

    /// <summary>
    /// summarise code for send mail to the user who send feedback
    /// </summary>
     
    protected void SendMail(string name, string organization, string address, string country, string telno, string email, string comments)
    {
        string Msg = "";
        string from = "info@aceindus.in";
        string fromName = "Feedback";
        string to = email;
        string subject = "Feedback form for Ace Indus";

        //string subject = "Feedback form for Indus Group.";
        Msg = Msg += " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  Contact Information of  '" + name + "'for Ace Indus " +
                    "<br>" +
                    "<br>" +

                    "My Name : '" + name + "'" +
                     "<br>" +
                           "<br>My Organization :'" + organization + "'" +
                            "<br>" +
                            "<br>My Email ID:'" + email + "'" +
                             "<br>" +
                               "<br>My Address :'" + address + "'" +
                                "<br>" +
                                "<br>My Country :'" + country + "'" +
                                "<br>" +
                                "<br>My Telephone No. :'" + telno + "'" +
                                "<br>" +
                                "<br>My Comments : '" + comments + "'";
        SendEmail(email, subject, Msg, from, fromName);
    }
    /// <summary>
    /// Reset  Textbox fields
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtemail.Text = "";
        txtorg.Text = "";
        txttelno.Text = "";
        txtcomment.Text = "";
        country.SelectedIndex = -1;
        txtaddr.Text = "";
    }
}