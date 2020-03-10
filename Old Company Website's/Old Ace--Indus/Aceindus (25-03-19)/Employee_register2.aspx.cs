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
using System.Data.SqlClient;

public partial class Employee_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string useremail = "";
            string usercountry = "";
            string userpassword = "";
            string userconfirmpassword = "";

            useremail = Convert.ToString(txtemail.Text);
            usercountry = Convert.ToString(ddlcountry.SelectedItem.Text);
            userpassword = Convert.ToString(txtpwd.Text);
            userconfirmpassword = Convert.ToString(txtcnfpwd.Text);

            string streg = string.Empty;

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("insert into emp_register (email,country,pwd,cnfpwd) VALUES (@email,@country,@pwd,@cnfpwd);", connection);

            cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@cnfpwd", SqlDbType.NVarChar, 50));


            cmd.Parameters["@email"].Value = useremail;
            cmd.Parameters["@country"].Value = usercountry;
            cmd.Parameters["@pwd"].Value = userpassword;
            cmd.Parameters["@cnfpwd"].Value = userconfirmpassword;

            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();


            string strScript = "";
            strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Default.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            txtemail.Text = "";
            ddlcountry.SelectedItem.Text = "Select your Country";
            txtpwd.Text = "";
            txtcnfpwd.Text = "";


           // SendMail(useremail, usercountry, userpassword, userconfirmpassword);
        }

    }

    //private void SendMail(string email, string country, string pwd, string cnfpwd)
    //{
    //    try
    //    {
    //        string Msg = "";

    //        try
    //        {

    //            MailMessage mm = new MailMessage();
    //            mm.From = new MailAddress("info@wizardsedu.ws", email);

    //            //mm.To.Add("training@wizardsedu.com");
    //            mm.To.Add("infohyd@mnhbs.com");
    //            //mm.To.Add("info@mnhbs.com");
    //            //mm.To.Add("accounts@mnhbs.com");
    //            mm.To.Add("sjakkillinki@mnhbs.com");

    //            Msg +=
    //                //"My Email : '" + email + "'" +
    //                // "<br>" +
    //                //       "<br>My Country :'" + country + "'" +
    //                //        "<br>" +
    //                //        "<br>My Password:'" + pwd + "'" +


    //            mm.Subject = "Employee Register form for Ace Indus";
    //            mm.IsBodyHtml = true;
    //            mm.Body = Msg;
    //            SmtpClient smtp = new SmtpClient();
    //            smtp.Send(mm);
    //        }
    //        catch (Exception ex)
    //        {
    //            lblerror.Text = ex.Message;
    //        }
    //    }
    //    catch (Exception ee)
    //    {
    //        lblerror.Text = ee.Message;
    //    }



    //}
}

