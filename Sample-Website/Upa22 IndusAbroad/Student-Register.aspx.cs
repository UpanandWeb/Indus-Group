using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student_Register : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string alertbox;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblcheckavail.Visible = false;
        }
    }

    /// <summary>
    /// values saved and registerd Student and sent mail
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        connection.Open();
        SqlCommand cmd1 = new SqlCommand("select * from IA_Studentinfo where username=@uname", connection);
        cmd1.Parameters.AddWithValue("@uname", txtusername.Text);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            lblcheckavail.Visible = true;
            lblcheckavail.ForeColor = System.Drawing.Color.Red;
            lblcheckavail.Text = "Email Already Exist";
        }
        else
        {
            lblcheckavail.Visible = true;
            lblcheckavail.ForeColor = System.Drawing.Color.Green;
            lblcheckavail.Text = "Email Available";
        }
        connection.Close();
        if (lblcheckavail.Text == "Email Available")
        {
            int status = 0;
            int streg = 0;
            connection.Open();
            string strQry = "insert into employeereg1(username,emailid,firstname,lastname,pwd,confirmpwd,mobile,status) values(@un,@EmailId,@fn,@ln,@pwd,@cpwd,@mobile,@status);";

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

            cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.NVarChar, 100));
            cmd.Parameters["@EmailId"].Value = txtusername.Text;

            streg = cmd.ExecuteNonQuery();
            connection.Close();
            if (streg == 1)
            {
                alertbox = "alert('Thanking you! You have been registered successfully. You recived confirmation mail shortly with Student ID,email id and Password');location.replace('Default.aspx');";
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
        try
        {
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
        }
        catch (Exception ee)
        {
        }
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
}