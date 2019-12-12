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
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;


public partial class newsletter : System.Web.UI.Page
{
    string fulldet = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            btnsend.Visible = false;
        }
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
    
    protected void btnsend_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string fulldet = string.Empty;
        fulldet = "";
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_newsmails order by Pdate desc", sqlConnection);
        imgtext.Fill(ds, "wt_newsmails");
        string emid = string.Empty;
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                emid = "" + ds.Tables[0].Rows[i]["id"].ToString();
                string emlid = "http://www.Wizardstraining.com/Unsubscribe.aspx?eid=" + emid;
                fulldet = "<table width='100%'>";
                fulldet = fulldet + "<tr> <td colspan='2'> <img src='http://acsgit.net/acsgit/admin/images/acs-globaltraining.png' border='0' alt='AcsGlobalTraining'/></td></tr>";
                fulldet = fulldet + "<tr> <td>Dear Student, </br> </td> </tr>";
                fulldet = fulldet + "<tr> <td>" + newscontent.Text.ToString() + "</td> </tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td>Your acsgit.net Member Support Team</td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td>You are a acsgit.net Subscriber. This E-mail comes to you in accordance with acsgit.net Privacy Policy.<br/> To unsubscribe,<a href=" + emlid + " target='_blank'>Click here.</a> <br/>acsgit.net is not responsible for content other than this.</td></tr>";
                fulldet = fulldet + "</table>";
                string Msg = "";
                try
                {
                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress("info@acsglobaltraining.net");
                    mm.To.Add("venki326587m@gmail.com");
                    Msg += fulldet;
                    mm.Subject = "ACS Gobal training News Letter";
                    mm.IsBodyHtml = true;
                    mm.Body = Msg;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Send(mm);
                }
                catch (Exception ex)
                {
                    lblerror.Text = ex.Message;
                }
            }
        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        btnsend.Visible = true;
        DataSet ds = new DataSet();
        string fulldet = string.Empty;

        fulldet = "";
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_newsmails order by Pdate desc", sqlConnection);
        imgtext.Fill(ds, "wt_newsmails");

        string emid = string.Empty;
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                emid = "" + ds.Tables[0].Rows[i]["id"].ToString();
                string emlid = "Unsubscribe.aspx?eid=" + emid;
                fulldet = "<table width='100%'>";
                fulldet = fulldet + "<tr> <td colspan='2'> <img src='images/acs-globaltraining.png' border='0' alt='acsglobaltraining'/></td></tr>";
                fulldet = fulldet + "<tr> <td>Dear Student, </br> </td> </tr>";
                fulldet = fulldet + "<tr> <td>" + newscontent.Text.ToString() + "</td> </tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td>Your acsgit.net Member Support Team</td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td> </td></tr>";
                fulldet = fulldet + "<tr> <td>You are a acsgit.net Subscriber. This E-mail comes to you in accordance with acsgit.net Privacy Policy.<br/> To unsubscribe,<a href=" + emlid + " target='_blank'>Click here.</a> <br/>acsgit.net is not responsible for content other than this.</td></tr>";
                fulldet = fulldet + "</table>";
                maildata.InnerHtml = fulldet;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Home.aspx");
    }
}
