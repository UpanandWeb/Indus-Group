using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;


public partial class admin_Create_User : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    string strScript;
    exception err = new exception();
    static string excep_page = "Create-User.aspx";
    DataSet dsadmin = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                create.Visible = true;
            }
        }
    }
/// <summary>
/// checking user id exist or not
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
    protected void txtUserId_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("select * from IA_Users where userid=@uname", con);
        cmd1.Parameters.AddWithValue("@uname", txtUserId.Text);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            lblStatus.Text = "User Id Already Exist";
        }
        else
        {
            lblStatus.Text = "User Id Available";
        }
    }

    /// <summary>
    /// save the user details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["User"] != null)
            {
                if (lblStatus.Text == "User Id Available")
                {
                    string fname = txtFName.Text;
                    string LName = txtLName.Text;
                    string desig = ddlUserType.SelectedItem.Text;
                    string contry = ddlCountry.SelectedItem.Text;
                    string userid = txtUserId.Text;
                    string pwd = txtPwd.Text;
                    string address = txtAddress.Text;
                    string mobile = txtMobile.Text;
                    string cont = txtConNumber.Text;
                    string email = txtEmailId.Text;
                    string date = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:tt");
                    int stat = 1;

                    string enqview;
                    string enqreply;
                    string enqdelete;

                    string courseview;
                    string courseedit;
                    string coursedelete;

                    if (CheckBox2.Checked == true) { enqview = "1"; } else { enqview = "0"; }
                    if (CheckBox3.Checked == true) { enqreply = "1"; } else { enqreply = "0"; }
                    if (CheckBox5.Checked == true) { enqdelete = "1"; } else { enqdelete = "0"; }

                    if (CheckBox8.Checked == true) { courseview = "1"; } else { courseview = "0"; }
                    if (CheckBox10.Checked == true) { courseedit = "1"; } else { courseedit = "0"; }
                    if (CheckBox11.Checked == true) { coursedelete = "1"; } else { coursedelete = "0"; }

                    string studentview;
                    string studentedit;
                    string studentdelete;

                    string supportview;
                    string supportreply;
                    string supportdelete;

                    if (CheckBox60.Checked == true) { studentview = "1"; } else { studentview = "0"; }
                    if (CheckBox103.Checked == true) { studentedit = "1"; } else { studentedit = "0"; }
                    if (CheckBox104.Checked == true) { studentdelete = "1"; } else { studentdelete = "0"; }

                    if (CheckBox14.Checked == true) { supportview = "1"; } else { supportview = "0"; }
                    if (CheckBox15.Checked == true) { supportreply = "1"; } else { supportreply = "0"; }
                    if (CheckBox17.Checked == true) { supportdelete = "1"; } else { supportdelete = "0"; }

                    string usersview;
                    string userscreate;
                    string usersedit;
                    string usersdelete;

                    string feedbackview;
                    string feedbackreply;
                    string feedbackdelete;

                    if (CheckBox32.Checked == true) { usersview = "1"; } else { usersview = "0"; }
                    if (CheckBox33.Checked == true) { userscreate = "1"; } else { userscreate = "0"; }
                    if (CheckBox34.Checked == true) { usersedit = "1"; } else { usersedit = "0"; }
                    if (CheckBox35.Checked == true) { usersdelete = "1"; } else { usersdelete = "0"; }

                    if (CheckBox38.Checked == true) { feedbackview = "1"; } else { feedbackview = "0"; }
                    if (CheckBox4.Checked == true) { feedbackreply = "1"; } else { feedbackreply = "0"; }
                    if (CheckBox41.Checked == true) { feedbackdelete = "1"; } else { feedbackdelete = "0"; }


                    con.Open();
                    string s1 = "insert into IA_Users (Fname,Lname,designation,country,userid,password,address,phno,contact,emailid,ustatus,cdate,Enquiryview,Enquiryreply,Enquirydelete,";
                    s1 += "Courseview,	Courseedit,	coursedelete,	studentview,	studentedit,	studentdelete,	supportview,	supportreply,	supportdelete,	usersview,	userscreate,";
                    s1 += "usersedit,	usersdelete,	feedbackview,	feedbackreply,	feedbackdelete)values";

                    s1 += "('" + fname + "','" + LName + "','" + desig + "','" + contry + "','" + userid + "','" + pwd + "','" + address + "','" + mobile + "','" + cont + "','" +
                        email + "' ,'" + stat + "','" + date + "','" + enqview + "','" + enqreply + "','" + enqdelete + "','" + courseview + "','" + courseedit + "','" + coursedelete
                        + "','" + studentview + "','" + studentedit + "','" + studentdelete + "','" + supportview + "','" + supportreply + "','" + supportdelete + "','" + usersview
                        + "','" + userscreate + "','" + usersedit + "','" + usersdelete + "','" + feedbackview + "','" + feedbackreply + "','" + feedbackdelete + "') ";
                    SqlCommand cmd = new SqlCommand(s1, con);
                    int k = cmd.ExecuteNonQuery();
                    con.Close();

                    if (k == 1)
                    {
                        string result1 = SendMail(contry, email, mobile, fname, desig, userid, pwd);

                        strScript = "alert('User Id is successfully Created');location.replace('Users.aspx')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                    }
                }
                else
                {
                    strScript = "alert('Sorry you Cant create new user id .Please make sure that user id is available or not');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                }
            }
            else
            {
                strScript = "alert('Sission Expired.. PLease Login again');relocation('Default.aspx')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }


    private string SendMail(string country, string email, string mobile, string name, string role, string userid, string Pwd)
    {
        string Msg = "";


        Msg += "<table border='0'><tr><td class='data1'>Dear " + name + " ,</td></tr>"
            + "<tr><td height='10px'></td></tr>"
            + "<tr><td><h4>Your account details are as follows:</h4></td></tr>"
             + "<tr><td><h5>User Type : " + role + "</h5></td></tr>"
              + "<tr><td><h5>Country : " + country + "</h5></td></tr>"
            + "<tr><td><h5>User ID : " + email + "</h5></td></tr>"
            + "<tr><td><h5>Password : " + Pwd + "</h5></td></tr>"
            + "<tr><td>Please login with Your following Details.<a href='http://indusabroad.com/admin'>Login</a></td></tr>"
            + "<tr><td height='20px'></td></tr>"
            + "<tr><td height='50px'></td></tr>"
            + "<tr><td>Regards,</td></tr>"
            + "<tr><td><a href='http://indusabroad.com/'>Indus Abroad ,</a></td></tr>"
            + "<tr><td>571-777-9969 </td></tr>"
            + "</table>";

        string from = "test@1indus.com";
        string fromName = "Indus Abroad User Creation";
        string to = email;
        string subject = "" + role + " Login Details for Indus Abroad.";
        string bodyText = Msg;

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", Msg);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    /// <summary>
    /// Enquiry select all CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            CheckBox2.Checked = true;
            CheckBox3.Checked = true;
            CheckBox5.Checked = true;
        }
        else
        {
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;
            CheckBox5.Checked = false;
        }
    }
    /// <summary>
    /// Enquiry view CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }
    /// <summary>
    /// Enquiry Reply CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    /// <summary>
    /// Enquiry Delete CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox5.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }
    /// <summary>
    /// Courses select all CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox7.Checked == true)
        {
            CheckBox8.Checked = true;
            CheckBox10.Checked = true;
            CheckBox11.Checked = true;
        }
        else
        {
            CheckBox8.Checked = false;
            CheckBox10.Checked = false;
            CheckBox11.Checked = false;
        }
    }
    /// <summary>
    /// Courses preview CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox8.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    /// <summary>
    /// Courses edit CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox10.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    /// <summary>
    /// courses delete CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox11.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    /// <summary>
    /// Student info select all CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox54_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox54.Checked == true)
        {
            CheckBox60.Checked = true;
            CheckBox103.Checked = true;
            CheckBox104.Checked = true;
        }
        else
        {
            CheckBox60.Checked = false;
            CheckBox103.Checked = false;
            CheckBox104.Checked = false;
        }
    }
    /// <summary>
    /// Student info preview  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox60_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox60.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true  && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }

    /// <summary>
    /// Student info edit  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox103_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox103.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true &&  CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }
    /// <summary>
    /// Student info delete  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox104_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox104.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }

    /// <summary>
    /// support select all  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox13.Checked == true)
        {
            CheckBox14.Checked = true;
            CheckBox15.Checked = true;
            CheckBox17.Checked = true;
        }
        else
        {
            CheckBox14.Checked = false;
            CheckBox15.Checked = false;
            CheckBox17.Checked = false;
        }
    }
    /// <summary>
    /// support preview  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox14.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true &&  CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }
    /// <summary>
    /// support reply  CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox15.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true &&  CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }


    /// <summary>
    /// support delete CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox17.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }
    /// <summary>
    /// users select all CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox31_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox31.Checked == true)
        {
            CheckBox32.Checked = true;
            CheckBox33.Checked = true;
            CheckBox34.Checked = true;
            CheckBox35.Checked = true;
        }
        else
        {
            CheckBox32.Checked = false;
            CheckBox33.Checked = false;
            CheckBox34.Checked = false;
            CheckBox35.Checked = false;
        }
    }
    /// <summary>
    /// users preview CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox32_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox32.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }
    /// <summary>
    /// users create CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox33_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox33.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }
    /// <summary>
    /// users edit CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox34_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox34.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }
    /// <summary>
    /// users delete CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox35_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox35.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }
    /// <summary>
    /// feedback select all CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox37_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox37.Checked == true)
        {
            CheckBox38.Checked = true;
            CheckBox4.Checked = true;
            CheckBox41.Checked = true;
        }
        else
        {
            CheckBox38.Checked = false;
            CheckBox4.Checked = false;
            CheckBox41.Checked = false;
        }
    }
    /// <summary>
    /// feedback preview CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox38_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox38.Checked == false)
        {
            CheckBox37.Checked = false;
        }
        else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
        {
            CheckBox37.Checked = true;
        }
    }
    /// <summary>
    /// feedback reply CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox41_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox41.Checked == false)
        {
            CheckBox37.Checked = false;
        }
        else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
        {
            CheckBox37.Checked = true;
        }
    }
    /// <summary>
    /// feedback delete CHECK/UNCHECK
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox4_CheckedChanged1(object sender, EventArgs e)
    {
        if (CheckBox41.Checked == false)
        {
            CheckBox37.Checked = false;
        }
        else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
        {
            CheckBox37.Checked = true;
        }
    }
    /// <summary>
    /// display all users
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkview_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");
    }


    /// <summary>
    /// SHOW enquiry permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void rdempyes_CheckedChanged(object sender, EventArgs e)
    {
        if (rdempyes.Checked == true)
        {
            tr1.Visible = true;
        }
        else if (rdempyes.Checked == false)
        {
            tr1.Visible = false;
        }
    }

    /// <summary>
    /// HIDE enquiry permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void rdempno_CheckedChanged(object sender, EventArgs e)
    {

        if (rdempyes.Checked == true)
        {
            tr1.Visible = true;
        }
        else if (rdempyes.Checked == false)
        {
            tr1.Visible = false;
        }
    }
    /// <summary>
    /// SHOW courses permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void rdh1byes_CheckedChanged(object sender, EventArgs e)
    {

        if (rdh1byes.Checked == true)
        {
            tr14.Visible = true;
        }
        else if (rdh1byes.Checked == false)
        {
            tr14.Visible = false;
        }
    }
    /// <summary>
    /// HIDE courses permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void rdh1bno_CheckedChanged(object sender, EventArgs e)
    {
        if (rdh1byes.Checked == true)
        {
            tr14.Visible = true;
        }
        else if (rdh1byes.Checked == false)
        {
            tr14.Visible = false;
        }
    }

    /// <summary>
    /// SHOW Student info permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Profileyes_CheckedChanged(object sender, EventArgs e)
    {
        if (Profileyes.Checked == true)
        {
            tr126.Visible = true;
        }
        else if (Profileyes.Checked == false)
        {
            tr126.Visible = false;
        }
    }
    /// <summary>
    /// HIDE Student info permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Profileno_CheckedChanged(object sender, EventArgs e)
    {
        if (Profileyes.Checked == true)
        {
            tr126.Visible = true;
        }
        else if (Profileyes.Checked == false)
        {
            tr126.Visible = false;
        }
    }
    /// <summary>
    /// SHOW support permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Careersyes_CheckedChanged(object sender, EventArgs e)
    {
        if (Careersyes.Checked == true)
        {
            tr21.Visible = true;
        }
        else if (Careersyes.Checked == false)
        {
            tr21.Visible = false;
        }
    }
    /// <summary>
    /// HIDE support permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Careersno_CheckedChanged(object sender, EventArgs e)
    {
        if (Careersyes.Checked == true)
        {
            tr21.Visible = true;
        }
        else if (Careersyes.Checked == false)
        {
            tr21.Visible = false;
        }
    }

    /// <summary>
    /// SHOW users permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Seminarsyes_CheckedChanged(object sender, EventArgs e)
    {
        if (Seminarsyes.Checked == true)
        {
            tr42.Visible = true;
        }
        else if (Seminarsyes.Checked == false)
        {
            tr42.Visible = false;
        }
    }
    /// <summary>
    /// HIDE users permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Seminarsno_CheckedChanged(object sender, EventArgs e)
    {
        if (Seminarsyes.Checked == true)
        {
            tr42.Visible = true;
        }
        else if (Seminarsyes.Checked == false)
        {
            tr42.Visible = false;
        }
    }
    /// <summary>
    /// SHOW feedback permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Feedbackyes_CheckedChanged(object sender, EventArgs e)
    {
        if (Feedbackyes.Checked == true)
        {
            tr49.Visible = true;
        }
        else if (Feedbackyes.Checked == false)
        {
            tr49.Visible = false;
        }
    }
    /// <summary>
    /// HIDE feedback permissions
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Feedbackno_CheckedChanged(object sender, EventArgs e)
    {
        if (Feedbackyes.Checked == true)
        {
            tr49.Visible = true;
        }
        else if (Feedbackyes.Checked == false)
        {
            tr49.Visible = false;
        }
    }

    /// <summary>
    /// redirect to users page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");
    }
}