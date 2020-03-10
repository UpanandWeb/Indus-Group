using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;
using System.Net;
using System.Net.Mail;

public partial class newemp : System.Web.UI.Page
{
   
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string alertbox;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);


        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblcheckavail.Visible = false;
        }
    }

    /// <summary>
    /// values saved and registerd employee and sent mail
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        connection.Open();
        SqlCommand cmd1 = new SqlCommand("select * from employeereg1 where username=@uname", connection);
        cmd1.Parameters.AddWithValue("@uname", txtusername.Text);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            lblcheckavail.Visible = true;
            //imgcheck1.Visible = true;
            //checkusername.Visible = true;
            //imgcheck1.ImageUrl = "images/NotAvailable.jpg";
            lblcheckavail.ForeColor = System.Drawing.Color.Red;
            lblcheckavail.Text = "Email Already Exist";
        }
        else
        {
            lblcheckavail.Visible = true;
            //imgcheck1.Visible = true;
            //checkusername.Visible = true;
            //imgcheck1.ImageUrl = "Images/check.gif";
            lblcheckavail.ForeColor = System.Drawing.Color.Green;

            lblcheckavail.Text = "Email Available";
        }
        connection.Close();
        if (lblcheckavail.Text == "Email Available")
        {
            int status = 0;
            int streg = 0;
            connection.Open();
            //string strQry = "insert into employeereg1(username,emailid,firstname,lastname,pwd,confirmpwd,mobile,status) values(@un,@EmailId,@fn,@ln,@pwd,@cpwd,@mobile,@status);insert into users_information (PhNo,mobile,EmailId) values(@PhNo,@umobile,@EmailId)";
            string strQry = "insert into employeereg1(username,emailid,firstname,lastname,pwd,confirmpwd,mobile,status) values(@un,@EmailId,@fn,@ln,@pwd,@cpwd,@mobile,@status);";

            //employeereg1
            SqlCommand cmd = new SqlCommand(strQry, connection);
            cmd.Parameters.Add(new SqlParameter("@un", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cpwd", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@mobile", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
            cmd.Parameters["@un"].Value = txtusername.Text;
            cmd.Parameters["@fn"].Value = txtfname.Text;
            cmd.Parameters["@ln"].Value = txtlname.Text;
            cmd.Parameters["@pwd"].Value = txtpwd.Text;
            cmd.Parameters["@cpwd"].Value = txtconfirmpwd.Text;
            cmd.Parameters["@mobile"].Value = txtphone.Text;
            cmd.Parameters["@status"].Value = status;

            //users information
            //cmd.Parameters.Add(new SqlParameter("@PhNo", SqlDbType.NVarChar, 20));
            //cmd.Parameters.Add(new SqlParameter("@umobile", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.NVarChar, 100));

            //cmd.Parameters["@PhNo"].Value = "";
            //cmd.Parameters["@umobile"].Value = txtphone.Text;
            cmd.Parameters["@EmailId"].Value = txtusername.Text;

            streg = cmd.ExecuteNonQuery();

            string strQry1 = "insert into Users_Information(userid,emailid,fname,lname,password,mobile,status,country,Designation) values('" + txtusername.Text + "','" + txtusername.Text + "','" + txtfname.Text + "','" + txtlname.Text + "','" + txtpwd.Text + "','" + txtphone.Text + "','0','USA','Employee');";
            SqlCommand cmd11 = new SqlCommand(strQry1, connection);
            int i = cmd11.ExecuteNonQuery();
            connection.Close();
            if (streg == 1)
            {
                alertbox = "alert('Thanking you! You have been registered successfully. You recived confirmation mail shortly with Employee ID,email id and Password');location.replace('Default.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", alertbox, true);
                send(txtfname.Text, txtlname.Text, txtusername.Text, txtphone.Text);
            }
            txtusername.Text = "";
            txtfname.Text = "";
            txtlname.Text = "";
            txtpwd.Text = "";
            txtconfirmpwd.Text = "";
            txtphone.Text = "";
        }
    }

    private void send(string fullname, string lastname, string email, string mobile)
    {
        //try
        //{
            string Msg = "";
            Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            Msg = Msg + "<tr><td colspan='3'></td></tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;First Name </td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='30' valign='top'>";
            Msg = Msg + "" + fullname + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Lastname </td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='30' valign='top'>";
            Msg = Msg + "" + lastname + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'>Mobile </strong></td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='40' valign='top'>";
            Msg = Msg + "" + mobile + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";

            try
            {
                string form1 = "info@1indus.com";
                MailMessage msgs = new MailMessage();
                msgs.To.Add(email);
                MailAddress address = new MailAddress(form1);
                msgs.From = address;
                msgs.Subject = "Account Registered Successfully.. Activation mail send shortly.." ;
                string htmlBody = Msg;
                msgs.Body = htmlBody;
                msgs.IsBodyHtml = true;
                SmtpClient client = new SmtpClient();
                client.Host = "relay-hosting.secureserver.net";
                client.Port = 25;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("svadapalliwar@aceindus.in", "Indusgroup1");
                client.Send(msgs);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your Details Mail Sent Successfull.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("Exception in send Email:" + ex.Message);
            }

        //}
        //catch (Exception ee)
        //{
        //    lblmsg.Text = ee.Message;
        //}

    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtusername.Text = "";
        txtfname.Text = "";
        txtlname.Text = "";
        txtpwd.Text = "";
        txtconfirmpwd.Text = "";
        txtphone.Text = "";
    }

    //protected void txtusername_TextChanged(object sender, EventArgs e)
    //{

    //    connection.Open();
    //    SqlCommand cmd = new SqlCommand("select * from employeereg1 where username=@uname", connection);
    //    cmd.Parameters.AddWithValue("@uname", txtusername.Text);
    //    SqlDataReader dr = cmd.ExecuteReader();
    //    if (dr.HasRows)
    //    {
    //        lblcheckavail.Visible = true;
    //        imgcheck1.Visible = true;
    //        //checkusername.Visible = true;
    //        imgcheck1.ImageUrl = "images/NotAvailable.jpg";
    //        lblcheckavail.Text = "Email Already Exist";
    //    }
    //    else
    //    {
    //        lblcheckavail.Visible = true;
    //        imgcheck1.Visible = true;
    //        //checkusername.Visible = true;
    //        imgcheck1.ImageUrl = "Images/check.gif";
    //        lblcheckavail.Text = "Email Available";
    //    }
    //    connection.Close();
    //}
}
