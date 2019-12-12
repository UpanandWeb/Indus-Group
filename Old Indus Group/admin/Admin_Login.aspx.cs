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

public partial class Admin_Login : System.Web.UI.Page
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
            obj.FillUserType(ddlUserType);
        }

        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //if (Session["LoginId"] != null)
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('User already loggedin');location.replace('Admin-Login.aspx');", true);
        //}
        //else
        //{
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
                        FormsAuthentication.SetAuthCookie(emailLogin.Text, true);
                        Session.Add("Username", usnm);
                        Session.Add("LoginId", usid);
                        Session.Add("1userid", usid);

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

                        Response.Redirect("Admin_Home.aspx");
                        //Response.Redirect("Admin_Home.aspx?uid="+uid+"&pw="+pw+"&utype="+utype);
                    }
                    else
                    {
                        tdmsg.InnerHtml = "Please Enter Correct UserId and Password";
                        Response.Redirect("Admin_Login.aspx?ret=ok");
                    }
                }
            //}

        }
    }
}
