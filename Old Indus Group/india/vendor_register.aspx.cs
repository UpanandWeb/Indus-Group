using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class vendor_register : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    StateCountry countries = new StateCountry();
    protected void Page_Load(object sender, EventArgs e)
    {
        //country countries = new country();
        lblmsg.Visible = false;
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
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtusername.Text))
        {
            //Establish sql connection
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //open database connection to connect to sql server
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from vendorreg where username=@uname", con);
            cmd.Parameters.AddWithValue("@uname", txtusername.Text);
            SqlDataReader dr = cmd.ExecuteReader();
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
                //close database connection to disconnect to sql server
                con.Close();
            }
        }
        else
        {
            checkusername.Visible = false;
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtusername.Text = "";
        txtpwd.Text = "";
        txtconfirmpwd.Text = "";
        txtcompanyname.Text = "";
        txtcompanymailid.Text = "";
        ddlindtype.SelectedItem.Text = "";
        txtcontactperson.Text = "";
        txtcontactpersondesg.Text = "";
        txtulr.Text = "";
        txtdesc.Text = "";
        txtaddrforcommunication.Text = "";
        txtstreetaddr.Text = "";
        state.SelectedItem.Text = "";
        txtcity.Text = "";
        txtphone.Text = "";
        txtfax.Text = "";
        country.SelectedItem.Text = "Select your Country";
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //args.IsValid = false;
        //if (CheckBox1.Checked)
        //{
        //    args.IsValid = true;
        //}
    }
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string userusername = "";
            string userpassword = "";
            //string userconfirmpassword = "";
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
            string Flag1 = "1";

            userusername = Convert.ToString(txtusername.Text);
            userpassword = Convert.ToString(txtpwd.Text);
            // userconfirmpassword = Convert.ToString(txtconfirmpwd.Text);
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
            //Establish sql connection
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //open database connection to connect to sql server
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into vendorreg (username,password,cname,cemail,indtype,cperson,cpdesig,comp_url ,cdesc,address,street,state,city,w1_phone,fax,country,pdate,flag1) VALUES (@username,@password,@cname,@cemail,@indtype,@cperson,@cpdesig,@comp_url,@cdesc,@address,@street,@state,@city,@w1_phone,@fax,@country,@pdate,@flag1);", connection);
            cmd.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cname", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@cemail", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@indtype", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cpdesig", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@comp_url", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cdesc", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@street", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@w1_phone", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@fax", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@flag1", SqlDbType.NChar, 10));


            cmd.Parameters["@username"].Value = userusername;
            cmd.Parameters["@password"].Value = userpassword;
            cmd.Parameters["@cname"].Value = usercompanyname;
            cmd.Parameters["@cemail"].Value = usercompanyemailid;
            cmd.Parameters["@indtype"].Value = userindustrytype;
            cmd.Parameters["@cperson"].Value = usercontactperson;
            cmd.Parameters["@cpdesig"].Value = usercontactpersondesg;
            cmd.Parameters["@comp_url"].Value = userurl;
            cmd.Parameters["@cdesc"].Value = userdesc;
            cmd.Parameters["@address"].Value = useraddressforcommunication;
            cmd.Parameters["@street"].Value = userstreetaddress;
            cmd.Parameters["@state"].Value = userstate;
            cmd.Parameters["@city"].Value = usercity;
            cmd.Parameters["@w1_phone"].Value = userphone;
            cmd.Parameters["@fax"].Value = userfax;
            cmd.Parameters["@country"].Value = usercountry;
            cmd.Parameters["@pdate"].Value = DateTime.Now.ToString();
            cmd.Parameters["@flag1"].Value = Flag1;

            streg = cmd.ExecuteNonQuery().ToString();
            //close database connection to disconnect to sql server
            connection.Close();

            SendMail(userusername, userpassword, usercompanyname, usercompanyemailid, userindustrytype, usercontactperson, usercontactpersondesg,
                useraddressforcommunication, userstreetaddress, userstate, usercity, userphone, userfax, usercountry);

            string strScript = "";
            strScript = "alert('Thanking you! You have been registered successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);


        }
    }
    private void SendMail(string userusername, string userpassword, string usercompanyname, string usercompanyemailid, string userindustrytype, string usercontactperson, string usercontactpersondesg,
       string useraddressforcommunication, string userstreetaddress, string userstate, string usercity, string userphone, string userfax, string usercountry)
    {
        string msg = "";
        try
        {

            //MailMessage mm = new MailMessage();
           // mm.From = usercompanyemailid;
            //mm.To = "test_indus@yahoo.com";
            msg +=
              "My Name : '" + userusername + "'" +
               "<br>" +
                   "<br>My Password :'" + userpassword + "'" +
                     "<br>" +
                    "<br>My Company Name:'" + usercompanyname + "'" +
                     "<br>" +
                      "<br>My Company Email ID:'" + usercompanyemailid + "'" +
                      "<br>" +
                      "<br>My Industry type :'" + userindustrytype + "'" +
                     "<br>" +
                       "<br>Contact Person :'" + usercontactperson + "'" +
                    "<br>" +
                     "<br>My Designation. :'" + usercontactpersondesg + "'" +
                      "<br>" +
                     "<br>My Address For Communication : '" + useraddressforcommunication + "'" +
                     "<br>" +
                    "<br>My Street Address. :'" + userstreetaddress + "'" +
                      "<br>" +
                       "<br>My State. :'" + userstate + "'" +
                     "<br>" +
                      "<br>My City. :'" + usercity + "'" +
                      "<br>" +
                       "<br>My Phone. :'" + userphone + "'" +
                      "<br>" +
                       "<br>My Fax. :'" + userfax + "'" +
                       "<br>" +
                     "<br>My Country. :'" + usercountry + "'" + "'";
            //mm.Subject = "Vendor Registration form for Ace Indus";
            //mm.BodyFormat = MailFormat.Html;
           // mm.Body = msg;
            //SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
            //SmtpMail.Send(mm);

        }
        catch (Exception ex)
        {
            //To catch exception handled
            lblmsg.Text = ex.Message;
        }

    }
}
