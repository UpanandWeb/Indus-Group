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
using igiit.BussinessLogic;

/// <summary>
///  summarise description of contact page
/// </summary>
public partial class contact : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Initialise object to bind and navigate countries
         StateCountry countries = new StateCountry();
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
    /// <summary>
    /// summarise description for submit button to insert the contact details into the table.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
        userstate = Convert.ToString(state.Text);
        userzipcode = Convert.ToString(txtzipcode.Text);
        usercountry = Convert.ToString(country.SelectedItem.Text);
        usercomments = Convert.ToString(txtcomment.Text);

        string streg = string.Empty;
        //Establish sql connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //open database connection to connect to sql server
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
        //close database connection to disconnect to sql server
        connection.Close();

        string strScript = "";
        strScript = "alert('Thanking you! Contact Information.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        SendMail(userfullname, userph, useremail, useraddr, usercity, userstate, userzipcode, usercountry, usercomments);

    }
    /// <summary>
    /// summarise description to send mail about the contact details to the user
    /// </summary>
    /// <param name="fname">First Name</param>
    /// <param name="phno">Phone Number</param>
    /// <param name="email">Email Id</param>
    /// <param name="addr">Address</param>
    /// <param name="city">City</param>
    /// <param name="state">State</param>
    /// <param name="zipcode">zip code</param>
    /// <param name="country">Country</param>
    /// <param name="comments">Comments</param>
    private void SendMail(string fname, string phno, string email, string addr, string city, string state, string zipcode, string country, string comments)
    {
        try
        {
            string Msg = "";

            try
            {

                MailMessage mm = new MailMessage();
                mm.From = new MailAddress(email);

                mm.To.Add("info@aceindus.in");
                
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
    /// <summary>
    /// summarise code to clear the text 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtfname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        txtaddr.Text = "";
        txtcity.Text = "";
        state.Text = "";
        txtzipcode.Text = "";
        txtcomment.Text = "";
        country.SelectedItem.Text = "Choose a Country";
    }
    /// <summary>
    /// summarise code to change state based on the selected country
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        string y = country.SelectedItem.Value.ToString();
        ds = countries.GetState(y);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add("");
                state.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                state.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
    }
   
}

