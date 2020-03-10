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
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.SessionState;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string userfullname = "";
        string userph = "";
        string useremail = "";
        string useraddr = "";
        string usercity = "";
        string userstate = "";
        string userzipcode = "";
        string usercountry = "";
        string usercomments = "";

        userfullname = Convert.ToString(txtfname.Text);
        userph = Convert.ToString(txtphone.Text);
        useremail = Convert.ToString(txtemail.Text);
        useraddr = Convert.ToString(txtaddr.Text);
        usercity = Convert.ToString(txtcity.Text);
        userstate = Convert.ToString(txtstate.Text);
        userzipcode = Convert.ToString(txtzipcode.Text);
        usercountry = Convert.ToString(ddlcountry.SelectedItem.Text);
        usercomments = Convert.ToString(txtcomment.Text);

        string streg = string.Empty;

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("insert into contactinformation (fname,phno,email,addr,city,state,zipcode,country,comments) VALUES (@fname,@phno,@email,@addr,@city,@state,@zipcode,@country,@comments);", connection);


        cmd.Parameters.Add(new SqlParameter("@fname", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@phno", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@addr", SqlDbType.NVarChar, 150));
        cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@zipcode", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@comments", SqlDbType.NVarChar, 200));




        cmd.Parameters["@fname"].Value = userfullname;
        cmd.Parameters["@phno"].Value = userph;
        cmd.Parameters["@email"].Value = useremail;
        cmd.Parameters["@addr"].Value = useraddr;
        cmd.Parameters["@city"].Value = usercity;
        cmd.Parameters["@state"].Value = userstate;
        cmd.Parameters["@zipcode"].Value = userzipcode;
        cmd.Parameters["@country"].Value = usercountry;
        cmd.Parameters["@comments"].Value = usercomments;

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();

        string strScript = "";
        strScript = "alert('Thanking you! Contact Information.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        SendMail(userfullname, userph, useremail, useraddr, usercity, userstate, userzipcode, usercountry, usercomments);

    }

    private void SendMail(string fname, string phno, string email, string addr, string city, string state, string zipcode, string country, string comments)
    {
        try
        {
            string Msg = "";

            try
            {

                MailMessage mm = new MailMessage();
                mm.From = new MailAddress("info@wizardsedu.ws", email);

                mm.To.Add("seshu@aceindus.net");
                mm.To.Add("sjakkillinki@aceindus.net");

                Msg += " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  Contact Information of '" + fname + "'for Ace Indus " +
                    "<br>" +
                    "<br>" +

                    "My Name : '" + fname + "'" +
                     "<br>" +
                           "<br>My Phone No :'" + phno + "'" +
                            "<br>" +
                            "<br>My Email ID:'" + email + "'" +
                             "<br>" +
                               "<br>My Address1 :'" + addr + "'" +
                                "<br>" +
                                "<br>My City :'" + city + "'" +
                                "<br>" +
                                "<br>My State :'" + state + "'" +
                                "<br>" +
                                "<br>My Zipcode :'" + zipcode + "'" +
                                "<br>" +
                               "<br>My Country :'" + country + "'" +
                                "<br>" +
                                "<br>My Comments : '" + comments + "'";

                mm.Subject = "Contact form for Ace Indus";
                mm.IsBodyHtml = true;
                mm.Body = Msg;

                // your remote SMTP server.
                SmtpClient smtp = new SmtpClient();

                smtp.Send(mm);
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
        catch (Exception ee)
        {
            lblerror.Text = ee.Message;
        }



    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtfname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txtaddr.Text = "";
        txtcity.Text = "";
        txtstate.Text = "";
        txtzipcode.Text = "";
        txtcomment.Text = "";
        ddlcountry.SelectedItem.Text = "Choose a Country";
    }
   
}

