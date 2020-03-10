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
using igiit.BussinessLogic;

/// <summary>
/// summarise code for feedback form 
/// </summary>
public partial class feedbackform : System.Web.UI.Page
{
    
    DataSet ds = new DataSet();
    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();

    /// <summary>
    ///  To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
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
        lblerror.Text = "";
    }
    /// <summary>
    /// Summarise code for submit button of feedback to insert data into table
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
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
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
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
        country.SelectedItem.Text = "Choose a Country";
        txtaddr.Text = "";
       

        SendMail(username, userorganization, useraddress, usercountry, usertelno, useremail, usercomments);
    }
    /// <summary>
    /// summarise code for send mail to the user who send feedback
    /// </summary>
    /// <param name="name">username</param>
    /// <param name="organization">Organisation</param>
    /// <param name="address">Address</param>
    /// <param name="country">Country</param>
    /// <param name="telno">Telephone Number</param>
    /// <param name="email">Email ID</param>
    /// <param name="comments">Comments</param>
    private void SendMail(string name, string organization, string address, string country, string telno, string email, string comments)
    {
        try
        {
            string Msg = "";
            try
            {
                MailMessage mm = new MailMessage();
                mm.From = new MailAddress(email);

                mm.To.Add("info@aceindus.in");

                Msg += " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  Contact Information of  '" + name + "'for Ace Indus " +
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

                mm.Subject = "Feedback form for Ace Indus";
                mm.IsBodyHtml = true;
                mm.Body = Msg;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mm);
            }
            catch (Exception ex)
            {
                //to catch exception handled
                lblerror.Text = ex.Message;
            }
        }
        catch (Exception ee)
        {
            //to catch exception handled
            lblerror.Text = ee.Message;
        }
    }
    /// <summary>
    /// summarise code to reset the data fields
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
        country.SelectedItem.Text = "Choose a Country";
        txtaddr.Text = "";
    }
   
}

