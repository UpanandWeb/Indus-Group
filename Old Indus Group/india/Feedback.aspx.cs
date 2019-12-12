using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Text;
using System.Collections.Specialized;
public partial class Feedback : System.Web.UI.Page
{
    StateCountry countries = new StateCountry();
    DataSet ds = new DataSet();
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = countries.GetCounty();

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                country.Items.Add("");
                country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string strScript = "";
        try
        {
            recaptcha.Validate();
            if (recaptcha.IsValid)
            {
                string Fullname = "";
                string Lastname = "";
                string Organization = "";
                string Address = "";
                string Country = "";
                string Phone = "";
                string Email = "";
                string Comments = "";
                string pdate = System.DateTime.Now.ToString("dd MMM,yyyy hh:mm:ss tt");
                Fullname = Convert.ToString(txtfname.Text);
                Lastname = Convert.ToString(txtNname.Text);
                Organization = Convert.ToString(txtorg.Text);
                Address = Convert.ToString(txtaddr.Text);
                Country = Convert.ToString(country.SelectedItem.Text);
                Phone = Convert.ToString(txttel.Text);
                Email = Convert.ToString(txtemail.Text);
                Comments = Convert.ToString(txtdec.Text);

                string streg = string.Empty;
                //Establish sql connection
                SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                //open database connection to connect to sql server
                connection.Open();
                SqlCommand cmd = new SqlCommand("insert into feedbackform (name,nickname,organization,address,country,phno,email,comment,status,postdate) VALUES (@name,@nickname,@organization,@address,@country,@phno,@email,@comment,@status,@postdate);", connection);
                cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@nickname", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@organization", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@phno", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@comment", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.NVarChar));

                cmd.Parameters["@name"].Value = Fullname;
                cmd.Parameters["@nickname"].Value = Lastname;
                cmd.Parameters["@organization"].Value = Organization;
                cmd.Parameters["@address"].Value = Address;
                cmd.Parameters["@country"].Value = Country;
                cmd.Parameters["@phno"].Value = Phone;
                cmd.Parameters["@email"].Value = Email;
                cmd.Parameters["@comment"].Value = Comments;
                cmd.Parameters["@status"].Value = 0;
                cmd.Parameters["@postdate"].Value = pdate;

                streg = cmd.ExecuteNonQuery().ToString();
                //close database connection to disconnect to sql server
                connection.Close();

                strScript = "alert('Thanking you!. Feedback Form Submitted.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                sendmail(Fullname, Organization, Address, Country, Phone, Email, Comments);
                txtaddr.Text = "";
                txtdec.Text = "";
                txtemail.Text = "";
                txtfname.Text = "";
                txtNname.Text = "";
                txtorg.Text = "";
                txttel.Text = "";
                //txtCapcha.Text = "";
                country.SelectedIndex = 0;
            }
            else
            {
                strScript = "alert('entered characters are invalid on image');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.ToString();
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnreset_Click(object sender, EventArgs e)
    {

        txtfname.Text = "";
        txtorg.Text = "";
        txtemail.Text = "";
        txtaddr.Text = "";
        txttel.Text = "";
        txtdec.Text = "";
        country.SelectedItem.Text = "Select Country";
    }
    protected void sendmail(string fullname, string org, string address, string country, string phone,string email,string comments)
    {

        string Msg = "";
        string from = "admin@1indus.com";
        string fromName = "IndusGroup Admin";
        string to = email;
        string subject = "Feedback from for Indus Group.";
        Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
        Msg = Msg + "<tr><td colspan='3' style='background:url(http://www.igiit.net/new1/images/logo2.gif) no-repeat;height:59px;width:219px'></td></tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp; Name </td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>";
        Msg = Msg + "" + fullname + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Organization </td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>";
        Msg = Msg + "" + org + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'>Address </strong></td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='40' valign='top'>";
        Msg = Msg + "" + address + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp; Country </td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>" + country + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Tel No</td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>";
        Msg = Msg + "" + phone + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp; E-mail</td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='30' valign='top'>";
        Msg = Msg + "" + email + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";
        Msg = Msg + "<tr>";
        Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp; Comment</td>";
        Msg = Msg + "<td valign='top'><strong>:</strong></td>";
        Msg = Msg + "<td height='75' valign='top'>";
        Msg = Msg + "" + comments + "";
        Msg = Msg + "</td>";
        Msg = Msg + "</tr>";

        string cc = "hr@1indus.com";

        SendEmail(email, subject, Msg, from, fromName);
        SendEmail1(cc, subject, Msg, from, fromName);

        //string result1 = SendEmail(to, subject, bodyText, from, fromName);
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

    public static string SendEmail1(string to, string subject, string bodyText, string from, string fromName)
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

}
