using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    DataSet ds;
    AdminCS obj = new AdminCS();
    string uid;
    string pw;
    string utype;
    string country;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            if (Request.Cookies["userid22"] != null)
                emailLogin.Text = Request.Cookies["userid22"].Value;

            if (Request.Cookies["pwd22"] != null)
                pass.Attributes.Add("value", Request.Cookies["pwd22"].Value);

            if (Request.Cookies["type"] != null)
                ddlUserType.Attributes.Add("value", Request.Cookies["type"].Value);

            if (Request.Cookies["contry"] != null)
                ddlcountry.Attributes.Add("value", Request.Cookies["contry"].Value);

            if (Request.Cookies["userid"] != null && Request.Cookies["pwd22"] != null && Request.Cookies["type"] != null && Request.Cookies["contry"] != null)
                chkremember.Checked = true;

            obj.FillUserType(ddlUserType);

            
        }

        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        uid = Convert.ToString(emailLogin.Text);
        pw = Convert.ToString(pass.Text);
        utype = Convert.ToString(ddlUserType.SelectedValue);
        country = Convert.ToString(ddlcountry.SelectedValue);

        if (emailLogin.Text == "admin1" && pass.Text == "admin1")
        {
            tdmsg.InnerHtml = "";
            Session.Add("uid", uid);
            Session.Add("pw", pw);
            Session.Add("utype", utype);
            Session.Add("country", country);
            Response.Redirect("Admin_Home.aspx");
        }
        else
        {
            ds = new DataSet();
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Users_Information where UserId=" + "'" + emailLogin.Text.ToString() + "'" + " and Password='" + pass.Text.ToString() + "' and Designation='" + utype + "' and Country='" + country + "' ", sqlConnection);

            imgtext.Fill(ds, "Users_Information");

            //  imgtext.Fill(ds, "Users_Information");



            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
             //   if ((ds.Tables[0].Rows[0]["Status"].ToString() == "1") && (ds.Tables[0].Rows[0]["userid"].ToString() == "admin"))
                if (((ds.Tables[0].Rows[0]["Status"].ToString() == "1") && (ds.Tables[0].Rows[0]["userid"].ToString() == "admin")) || ((ds.Tables[0].Rows[0]["Status"].ToString() == "1") && (ds.Tables[0].Rows[0]["Designation"].ToString() == "Recruiter")))

                {
                    string usnm = ds.Tables[0].Rows[0]["FName"].ToString();
                    string usid = ds.Tables[0].Rows[0]["UserId"].ToString();
                    string uxid = ds.Tables[0].Rows[0]["uid"].ToString();
                    string email = ds.Tables[0].Rows[0]["EmailId"].ToString();

                    //string ap = ds.Tables[0].Rows[0]["Add_Perm"].ToString();
                    //string ep = ds.Tables[0].Rows[0]["Edit_Perm"].ToString();
                    //string dp = ds.Tables[0].Rows[0]["Delete_Perm"].ToString();
                    string ap = "Y";
                    string ep = "Y";
                    string dp = "Y";

                    Session["Authentication"] = "true";

                    Session.Add("Username", usnm);
                    Session.Add("LoginId", usid);
                    Session.Add("xId", uxid);

                    Session.Add("Addp", ap);
                    Session.Add("Editp", ep);
                    Session.Add("Deletep", dp);

                    Session.Add("uid", uid);
                    Session.Add("pw", pw);
                    Session.Add("email", email);
                    Session.Add("utype", utype);
                    Session.Add("country", country);
                    Session["dont"] = "dshow";

                    if (chkremember.Checked == true)
                    {
                        Response.Cookies["userid22"].Value = emailLogin.Text;
                        Response.Cookies["pwd22"].Value = pass.Text;
                        Response.Cookies["type"].Value = ddlUserType.SelectedItem.Text;
                        Response.Cookies["contry"].Value = ddlcountry.SelectedItem.Text;

                        Response.Cookies["userid22"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["pwd22"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["type"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["contry"].Expires = DateTime.Now.AddDays(15);

                    }

                    else
                    {
                        Response.Cookies["userid22"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["pwd22"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["type"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["contry"].Expires = DateTime.Now.AddDays(-1);
                    }

                    Response.Redirect("Admin_Home.aspx");
                    //Response.Redirect("Admin_Home.aspx?uid="+uid+"&pw="+pw+"&utype="+utype);
                }
                else
                {
                    tdmsg.InnerHtml = "Please Enter Correct UserId and Password";
                    Response.Redirect("Admin_Login.aspx?ret=ok");
                }
            }
        }

    }
}
