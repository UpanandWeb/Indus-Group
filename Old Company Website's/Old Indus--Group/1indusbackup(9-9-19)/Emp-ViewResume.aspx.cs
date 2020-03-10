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

public partial class Emp_ViewResume : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string uid = string.Empty;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        uid = Request.QueryString["sid"].ToString();

        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from CurrentResumes where rid=" + uid, con);
            imgtext.Fill(ds, "CurrentResumes");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtcname.Text = ds.Tables[0].Rows[0]["ConsultName"].ToString();
                txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["Emailid"].ToString();
                txtrec.Text = ds.Tables[0].Rows[0]["RecName"].ToString();
                txtloc.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                txtopen.Text = ds.Tables[0].Rows[0]["Opento"].ToString();

                string statusid = ds.Tables[0].Rows[0]["status"].ToString();

                if (statusid == "0")
                {
                    txtstatus.SelectedItem.Text = "New";
                }
                else if (statusid == "1")
                {
                    txtstatus.SelectedItem.Text = "Process";

                }
                else
                {
                    txtstatus.SelectedItem.Text = "Complete";
                }

                txtremarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string consult = txtcname.Text;
        string mobile = txtmobile.Text;
        string email = txtemail.Text;
        string recuter = txtrec.Text;
        string location = txtloc.Text;
        string open = txtopen.Text;
        uid = Request.QueryString["sid"].ToString();

        int statusid = 0;

        if (txtstatus.SelectedItem.Text == "New")
        {
            statusid = 0;
        }
        else if (txtstatus.SelectedItem.Text == "Process")
        {
            statusid = 1;
        }
        else
        {
            statusid = 2;
        }

        string remarks = txtremarks.Text;
        con.Open();
        string s = "update CurrentResumes set ConsultName='"+consult+"',Mobile='"+mobile+"',Emailid='"+email+"',Location='"+location+"',Opento='"+open+"',RecName='"+recuter+"',status='"+statusid+"',Remarks='"+remarks+"' where rid='"+uid+"'";
        SqlCommand cmd = new SqlCommand(s,con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Details has been Updated Successfully');location.replace('Emp-Resumes.aspx');", true);

        }
    }
}