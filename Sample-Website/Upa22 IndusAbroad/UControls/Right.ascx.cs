using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Collections.Specialized;
using System.Text;

public partial class UControls_Right : System.Web.UI.UserControl
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.ToString("dd-MM-yyyy");
        int sts = 0;
        SqlCommand cmd = new SqlCommand("insert into [dbo].[IB_Enquiry] (Name,email_id,mobile,Status,comments,posteddate) values ('" + txtname.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "'," + sts + ",'" + txtcomments.Text + "','" + date + "')", con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            
            txtname.Text = "";
            txtemail.Text = "";
            txtmobile.Text = "";
            txtcomments.Text = "";

            string result1 = SendMail(txtname.Text, txtemail.Text, txtmobile.Text, txtcomments.Text);

            string strscpt = "alert ('Your Request Recieved..  Will Contact Shortly..');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    private string SendMail(string Name, string email, string mobile, string comments )
    {
        string Msg = "";


        Msg += "<table border='0'><tr><td class='data1'>Dear " + Name + " ,</td></tr>"
            + "<tr><td height='10px'></td></tr>"
            + "<tr><td><h4>Your Contact Details for regarding Query</h4></td></tr>"
             + "<tr><td><h5>Email Id: " + email + "</h5></td></tr>"
              + "<tr><td><h5>Mobile : " + mobile + "</h5></td></tr>"
            + "<tr><td><h5>Comments : " + comments + "</h5></td></tr>"
            + "<tr><td height='20px'></td></tr>"
            + "<tr><td height='50px'></td></tr>"
            + "<tr><td>Regards,</td></tr>"
            + "<tr><td><a href='http://indusabroad.com/'>Thanks and Regards</a></td></tr>"
            + "<tr><td>Indus Abroad Team</td></tr>"
            + "</table>";

        string from = "info@indusabroad.com";
        string fromName = "Indus Abroad Admin";
        string to = email;
        string to1 ="info@indusabroad.com";

        string subject = "Contact Details for regarding Query.";
        string bodyText = Msg;

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("to", to1);

        values.Add("subject", subject);
        values.Add("body_html", Msg);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtemail.Text = "";
        txtmobile.Text = "";
        txtcomments.Text = "";
    }
}