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
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;


public partial class Emp_Register : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string alertbox;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int status = 0;
        int streg = 0;
        connection.Open();
        //string strQry = "insert into employeereg1(username,firstname,lastname,pwd,confirmpwd,mobile,status) values(@un,@fn,@ln,@pwd,@cpwd,@mobile,@status);insert into users_information (PhNo,mobile,EmailId) values(@PhNo,@umobile,@EmailId)";
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
        cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.NVarChar, 100));

        cmd.Parameters["@un"].Value = txtusername.Text;
        cmd.Parameters["@fn"].Value = txtfname.Text;
        cmd.Parameters["@ln"].Value = txtlname.Text;
        cmd.Parameters["@pwd"].Value = txtpwd.Text;
        cmd.Parameters["@cpwd"].Value = txtconfirmpwd.Text;
        cmd.Parameters["@mobile"].Value = txtphone.Text;
        cmd.Parameters["@status"].Value = status;
        cmd.Parameters["@EmailId"].Value = txtusername.Text;

        streg = cmd.ExecuteNonQuery();
        connection.Close();
        if (streg == 1)
        {
            imgcheck1.Visible = false;
            lblcheckavail.Visible = false;

            alertbox = "alert('Thanking you! You have been registered successfully.');";
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

    private void send(string fullname, string lastname, string email, string mobile)
    {
        try
        {
            string name = fullname + "" + lastname;
            string Msg = "";
            Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='center' valign='top'><font class='crentopenings'>*</font>&nbsp; Hi  </td>";
            Msg = Msg + "<td height='20' valign='top'>";
            Msg = Msg + "" + name + " </br> Registered in Our comany site as an Employee. Please activate";
            Msg = Msg + "</td>";

            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='center' valign='top'><font class='crentopenings'>*</font>&nbsp; Name </td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='20' valign='top'>";
            Msg = Msg + "  " + name + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Email Id </td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='20' valign='top'>";
            Msg = Msg + " " + email + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";

            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Mobile Number </td>";
            Msg = Msg + "<td valign='top'><strong>:</strong></td>";
            Msg = Msg + "<td height='20' valign='top'>";
            Msg = Msg + " " + mobile + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr>";

            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='right' valign='top'>&nbsp;</td>";
            Msg = Msg + "<td valign='top'>&nbsp;</td>";
            Msg = Msg + "<td height='20' valign='top'>";
            Msg = Msg + "" + "<a href='http://1indus.com/admin/Admin_Login.aspx'><b> Click Here to Login</b></a>" + "";
            Msg = Msg + "</td>";
            Msg = Msg + "</tr></table>";
            string sub = "New Employee Registered... PLease Activate";

            string f = "admin@1indus.com";
            string t = "hr@1indus.com";

            //string f = "vyarramsetty@1indus.com"; 
            //string t = "manjula@1indus.com";
            SendMail1(f, t, Msg, sub);
        }
        catch (Exception ee)
        {
            lblmsg.Text = ee.Message;
        }

    }

    public void SendMail1(string From, string To, string Body, string Subject)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");
        values.Add("from", From);
        values.Add("subject", Subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", To);
        // values.Add("to", "vyarramsetty@1indus.com");


        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
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
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        connection.Open();
        SqlCommand cmd = new SqlCommand("select * from employeereg1 where username=@uname", connection);
        cmd.Parameters.AddWithValue("@uname", txtusername.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            lblcheckavail.Visible = true;
            imgcheck1.Visible = true;
            //checkusername.Visible = true;
            imgcheck1.ImageUrl = "images/NotAvailable.gif";
            lblcheckavail.Text = "Email Already Exist";
        }
        else
        {
            lblcheckavail.Visible = true;
            imgcheck1.Visible = true;
            //checkusername.Visible = true;
            imgcheck1.ImageUrl = "Images/check.gif";
            lblcheckavail.Text = "Email Available";
        }
        connection.Close();
    }
}