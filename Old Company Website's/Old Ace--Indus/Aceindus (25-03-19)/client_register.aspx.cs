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
//using System.Net;
//using System.Net.Mail;
using System.Web.Mail;
using System.Data.SqlClient;
using igiit.BussinessLogic;
using igiit.PropertiesLayer;

/// <summary>
/// Summarise description about the client Register
/// </summary>
public partial class client_register : System.Web.UI.Page
{
    
    StateCountry countries = new StateCountry();
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        lblerror.Visible = false;
        //Initilaise object to navigate and bind countries
        StateCountry countries = new StateCountry();
        DataSet ds = new DataSet();

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
    /// summarise code to select check box for rules and conditions
    /// </summary>
    /// <param name="source"></param>
    /// <param name="args"></param>
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (CheckBox1.Checked)
        {
            args.IsValid = true;
        }
    }
    /// <summary>
    /// summarise code for submit button to insert client details into table
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string userusername = "";
            string userpassword = "";
            string userconfirmpassword = "";
            string usercompanyname = "";
            string usercompanyemailid = "";
            string userindustrytype = "";
            string usercontactperson = "";
            string usercontactpersondesg = "";
            string userurl = "";
            string userdesc = "";
            string useraddressforcommunication = "";
            string userstreetaddress = "";
            string userstate = "";
            string usercity = "";
            string userphone = "";
            string userfax = "";
            string usercountry = "";

            userusername = Convert.ToString(txtusername.Text);
            userpassword = Convert.ToString(txtpwd.Text);
            userconfirmpassword = Convert.ToString(txtconfirmpwd.Text);
            usercompanyname = Convert.ToString(txtcompanyname.Text);
            usercompanyemailid = Convert.ToString(txtcompanymailid.Text);
            userindustrytype = Convert.ToString(ddlindtype.SelectedItem.Text);
            usercontactperson = Convert.ToString(txtcontactperson.Text);
            usercontactpersondesg = Convert.ToString(txtcontactpersondesg.Text);
            userurl = Convert.ToString(txtulr.Text);
            userdesc = Convert.ToString(txtdesc.Text);
            useraddressforcommunication = Convert.ToString(txtaddrforcommunication.Text);
            userstreetaddress = Convert.ToString(txtstreetaddr.Text);
            userstate = Convert.ToString(state.SelectedItem.Text);
            usercity = Convert.ToString(txtcity.Text);
            userphone = Convert.ToString(txtphone.Text);
            userfax = Convert.ToString(txtfax.Text);
            usercountry = Convert.ToString(country.SelectedItem.Text);

            string streg = string.Empty;
            //establish sql connection
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //open database connection to connect to sql server
            connection.Open();

            SqlCommand cmd = new SqlCommand("insert into client_register (uname,pwd,cnfpwdl,companyname,companyemail,industrytype,contactperson,contactpersondesignation,url,description,addressforcommunication,streetaddress,state,city,phone,fax,country) VALUES (@uname,@pwd,@cnfpwdl,@companyname,@companyemail,@industrytype,@contactperson,@contactpersondesignation,@url,@description,@addressforcommunication,@streetaddress,@state,@city,@phone,@fax,@country);", connection);

            cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cnfpwdl", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@companyname", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@companyemail", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@industrytype", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@contactperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@contactpersondesignation", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@url", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@addressforcommunication", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@streetaddress", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@fax", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 200));


            cmd.Parameters["@uname"].Value = userusername;
            cmd.Parameters["@pwd"].Value = userpassword;
            cmd.Parameters["@cnfpwdl"].Value = userconfirmpassword;
            cmd.Parameters["@companyname"].Value = usercompanyname;
            cmd.Parameters["@companyemail"].Value = usercompanyemailid;
            cmd.Parameters["@industrytype"].Value = userindustrytype;
            cmd.Parameters["@contactperson"].Value = usercontactperson;
            cmd.Parameters["@contactpersondesignation"].Value = usercontactpersondesg;
            cmd.Parameters["@url"].Value = userurl;
            cmd.Parameters["@description"].Value = userdesc;
            cmd.Parameters["@addressforcommunication"].Value = useraddressforcommunication;
            cmd.Parameters["@streetaddress"].Value = userstreetaddress;
            cmd.Parameters["@state"].Value = userstate;
            cmd.Parameters["@city"].Value = usercity;
            cmd.Parameters["@phone"].Value = userphone;
            cmd.Parameters["@fax"].Value = userfax;
            cmd.Parameters["@country"].Value = usercountry;

            streg = cmd.ExecuteNonQuery().ToString();
            //close database connection to disconnect to sql server
            connection.Close();

            SendMail(userusername, userpassword, userconfirmpassword, usercompanyname, usercompanyemailid, userindustrytype, usercontactperson, usercontactpersondesg,
               userurl, userdesc, useraddressforcommunication, userstreetaddress, userstate, usercity, userphone, userfax, usercountry);

            string strScript = "";
            strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Default.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                     
           
        }
    }
    /// <summary>
    /// Summarise code to send mail to the client who registered   
    /// </summary>
    /// <param name="uname">User name</param>
    /// <param name="pwd">Password</param>
    /// <param name="cnfpwd1">Confirm Password</param>
    /// <param name="companyname">Company Name</param>
    /// <param name="companyemail">Company email Id</param>
    /// <param name="industrytype">Industry Type</param>
    /// <param name="contactperson">Contact Person</param>
    /// <param name="contactpersondesignation">Contact Person Designation</param>
    /// <param name="url">URL</param>
    /// <param name="description">Description</param>
    /// <param name="addressforcommunication">Address For Communication</param>
    /// <param name="streetaddress">Street Address</param>
    /// <param name="state">State</param>
    /// <param name="city">City</param>
    /// <param name="phone">Phone</param>
    /// <param name="fax">Fax Number</param>
    /// <param name="country">Country</param>
    private void SendMail(string uname, string pwd, string cnfpwd1, string companyname, string companyemail, string industrytype, string contactperson,
                   string contactpersondesignation, string url, string description, string addressforcommunication, string streetaddress, string state, string city, string phone, string fax, string country)
    {
        try
        {
            string Msg = "";

            try
            {

                MailMessage mm = new MailMessage();
                mm.From = companyemail;
                mm.To = "info@aceindus.in";
                 Msg +=
                  "My Name : '" + uname + "'" +
                   "<br>" +
                        "<br>My Password :'" + pwd + "'" +
                       "<br>" +
                          "<br>My Company Name:'" + companyname + "'" +
                         "<br>" +
                        "<br>My Company Email ID:'" + companyemail + "'" +
                       "<br>" +
                         "<br>My Industry type :'" + industrytype + "'" +
                          "<br>" +
                          "<br>Contact Person :'" + contactperson + "'" +
                        "<br>" +
                        "<br>My Designation. :'" + contactpersondesignation + "'" +
                          "<br>" +
                          "<br>My Address For Communication : '" + addressforcommunication + "'" +
                        "<br>" +
                         "<br>My Street Address. :'" + streetaddress + "'" +
                       "<br>" +
                         "<br>My State. :'" + state + "'" +
                          "<br>" +
                        " <br>My City. :'" + city + "'" +
                         "<br>" +
                          "<br>My Phone. :'" + phone + "'" +
                          "<br>" +
                         "<br>My Fax. :'" + fax + "'" +
                         "<br>" +
                          "<br>My Country. :'" + country + "'" + "'";
                 mm.Subject = "Client Registration form for Ace Indus";
                 mm.BodyFormat = MailFormat.Html;
                 mm.Body = Msg;
                 SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
                 SmtpMail.Send(mm);

                 
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
    /// code to clear the text afetr sumitting the details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnreset_Click(object sender, EventArgs e)
    {

        txtusername.Text = "";
        txtpwd.Text = "";
        txtconfirmpwd.Text = "";
        txtcompanyname.Text = "";
        txtcompanymailid.Text = "";
        ddlindtype.SelectedItem.Text = "Select Industry Type";
        txtcontactperson.Text = "";
        txtcontactpersondesg.Text = "";
        txtulr.Text = "";
        txtdesc.Text = "";
        txtaddrforcommunication.Text = "";
        txtstreetaddr.Text = "";
        state.SelectedItem.Text = "Select your State";
        txtcity.Text = "";
        txtphone.Text = "";
        txtfax.Text = "";
        country.SelectedItem.Text = "Select your Country";

    }
    /// <summary>
    /// code to select state when we select item from country
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
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
    /// <summary>
    /// summary description to check the user name availability or not.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtusername.Text))
        {
            //establish sql connection
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from client_register where uname=@uname", con);
            cmd.Parameters.AddWithValue("@uname", txtusername.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            con.Close();
            if (dr.HasRows)
            {
                checkusername.Visible = true;
                imgstatus.ImageUrl = "images/NotAvailable.jpg";
                CheckAvailability.Text = "UserName Already Exist";
            }
            else
            {
                checkusername.Visible = true;
                imgstatus.ImageUrl = "images/Icon_Available.gif";
                CheckAvailability.Text = "UserName Available";
            }
        }
        else
        {
            checkusername.Visible = false;
        }
    }

    
}
