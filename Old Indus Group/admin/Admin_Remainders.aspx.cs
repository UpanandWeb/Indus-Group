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
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;
using System.Web.Configuration;

public partial class admin_Admin_Remainders : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    List<timedet> utime = new List<timedet>();
    string lbtime;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            lbUserName.Text = Session["UserName"].ToString();
            try
            {
                string date = Request.QueryString["date"].ToString();
                lblFullDate.Text = Convert.ToDateTime(date).ToLongDateString();
            }
            catch
            {
                lblFullDate.Text = DateTime.Now.ToLongDateString();
            }

            bindCalendar();
        }
    }
    void bindCalendar()
    {
        utime = gettime();
        grd1.DataSource = utime;
        grd1.DataBind();
    }
    protected List<timedet> gettime()
    {
        DateTime time = new DateTime(0);
        DateTime ti1 = new DateTime(0);
        for (int i = 0; i < 48; i++)
        {
            time = time.AddMinutes(30);
            ti1 = time.AddMinutes(30);
            timedet td = new timedet();
            td.times1 = time.ToString("HH:mm") + " - " + ti1.ToString("HH:mm");
            td.id = i + 1;
            utime.Add(td);
        }
        return utime;
    }
    public class timedet
    {
        string stime = string.Empty;
        int ids;
        public string times1
        {
            get { return stime; }
            set { stime = value; }
        }
        public int id
        {
            get { return ids; }
            set { ids = value; }
        }
    }
    protected void txt_Changed(object sender, CommandEventArgs e)
    {
        int id = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        Label lbtim = (Label)grd1.Rows[id].FindControl("lblEst");
        TextBox txNote = (TextBox)grd1.Rows[id].FindControl("txtNote");
        rbSch.Items.Clear();
        if (txNote.Text != "")
        {
            //con.Open(); 
            DateTime dlbtime = Convert.ToDateTime(lblFullDate.Text);
            TimeSpan dif = dlbtime.Date - DateTime.Now.Date;
            int diff = Convert.ToInt32(dif.TotalDays);
            if (diff != 0)
            {
                rbSch.Visible = true;
                lblScheduleTime.Visible = false;
                rbSch.Items.Insert(0, "No need");
                rbSch.Items.Insert(1, "1 Day Before");
                if (diff > 1)
                {
                    string s = "";
                    for (int i = 2; i <= diff; i++)
                    {
                        if (i != 6)
                        {
                            s = Convert.ToString(i) + " Day(s) Before";
                            rbSch.Items.Insert(i, s);
                        }
                        else
                        { break; }
                    }
                }                
                rbSch.SelectedIndex = 0;
            }
            else
            {
                rbSch.Visible = false;
                lblScheduleTime.Visible = true;
            }
            Session["lbtime"] = lbtim.Text;
            Session["note"] = txNote.Text;
            //string sda1 = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
            mdpop.Show();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Add Remainder Note !!!');</script>");
            txNote.Focus();
        }
    }
    protected void grd1_bound(object sender, GridViewRowEventArgs e)
    {        
        string sda = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox tb = (TextBox)e.Row.FindControl("txtNote");
            LinkButton lb = (LinkButton)e.Row.FindControl("lnkNote");
            Label lbltime = (Label)e.Row.FindControl("lblEst");
            Label lbNote = (Label)e.Row.FindControl("lblNote"); 
            lbtime = lbltime.Text;
            SqlDataAdapter sscmd = new SqlDataAdapter("select Rem_note from Calendar where Rem_time='" + lbtime + "' and Rem_date='" + sda + "' and r_name='" + lbUserName.Text + "'", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                lbNote.Visible = true;
                lbNote.Text = das.Tables[0].Rows[0]["Rem_note"].ToString();
                tb.Visible = false;
                lb.Enabled = false;
                lb.ForeColor = System.Drawing.Color.LightGray;
            }
            else
            {
                tb.Visible = true;
                lbNote.Visible = false;
                lb.Enabled = true;
            }
            DateTime dt = Convert.ToDateTime(sda);
            if (dt < DateTime.Now.Date)
            {
                lbNote.Visible = true;                
                tb.Visible = false;                
                lb.Visible = false;
                divHint.Visible = false;
                //lb.ForeColor = System.Drawing.Color.LightGray;
            }        
        }
    }
    //void schedule(Object sender, EventArgs e)
    //{
    //    DateTime DateIs;
    //    DateTime DateIsd;
    //    DateIs = DateTime.Now;
    //    string email = "";
    //    string datein = "";
    //    string aptdate = "";
    //    string apttime = "";
    //    string apttitle = "";
    //    int stat = 0;
    //    Int id = 0;
    //    datein = DateIs.ToShortDateString();
    //    //Sqlconection con = new Sqlconection("Data Source=<your server>; database=CalCon;uid=xxxx;pwd=xxxx");
    //    SqlCommand cmd = new SqlCommand("Select * from Calendar", con);
    //    con.Open();
    //    SqlDataReader myReader = cmd.ExecuteReader();
    //    while (myReader.Read())
    //    {
    //        id = myReader.GetInt32(0);
    //        email = myReader.GetString(3);// no column
    //        DateIsd = myReader.GetDateTime(4);
    //        stat = myReader.GetInt32(5); // no column
    //        aptdate = myReader.GetString(6); // no column
    //        apttime = myReader.GetString(7);
    //        apttitle = myReader.GetString(8);
    //        string dateisx = "";
    //        dateisx = DateIsd.ToShortDateString();
    //        if ((datein == dateisx) && (stat == 0))
    //        {
    //            Sqlconection con2 = new Sqlconection("Data Source=<your server >;database=CalCon;uid=xxxxx;pwd=xxxxxx");
    //            SqlCommand commandx = new SqlCommand("Update Calendar Set stat = 1 Where Cal_Id = " + id, con2);
    //            con2.Open();
    //            commandx.ExecuteNonQuery();
    //            con2.Close();
    //            MailMessage msg = new MailMessage();
    //            msg.To = email;
    //            msg.From = "youremail@yourdomain.com";
    //            msg.Subject = "Just a Reminder for " + apttitle;
    //            msg.BodyFormat = MailFormat.Html;
    //            msg.Body = "Here is your reminder not to miss " + apttitle + " on " + aptdate + " at " + apttime;
    //            SmtpMail.Send(msg);
    //        }
    //    }
    //    myReader.Close();
    //con.Close();
    //}

    //protected void cal1_Changed(object sender, EventArgs e)
    //{
    //    lblFullDate.Text = cal1.SelectedDate.ToLongDateString();
    //    bindCalendar();        
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime datUntill;
        string mail = rbMlist.SelectedValue.ToString();
        if ((rbSch.Visible == true) && (rbSch.SelectedIndex != 0))
        {
            double udate = Convert.ToDouble(rbSch.SelectedIndex);
            datUntill = Convert.ToDateTime(lblFullDate.Text);
            datUntill = datUntill.AddDays(udate);
        }
        else
        {
            datUntill = DateTime.Now.AddDays(-1);
        }
        //int id = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        con.Open();
        string lbtim = Session["lbtime"].ToString();
        string txNote = Session["note"].ToString();
        string sda1 = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
        string query = "insert into Calendar (Rem_time,Rem_date,Rem_note,Rem_Untill,Rem_For,R_name) values (@tim,@dat,@note,@udat,@rfor,@rname)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@tim", lbtim);
        cmd.Parameters.AddWithValue("@dat", sda1);
        cmd.Parameters.AddWithValue("@note", txNote);
        cmd.Parameters.AddWithValue("@udat", datUntill.ToShortDateString());
        cmd.Parameters.AddWithValue("@rfor", mail);
        cmd.Parameters.AddWithValue("@rname", lbUserName.Text);
        int i = cmd.ExecuteNonQuery();
        if (i == 1)
        {
            SendMail(mail, sda1, lbtim, lbUserName.Text, txNote);
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Remainder add sucessfully !! Remainder mail sent');</script>");
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Failed to save remainder');</script>");

        con.Close();
        Session["lbtime"] = "";
        Session["note"] = "";
        bindCalendar();
    }

    void SendMail(string mail, string date, string time, string name, string note)
    {
        string Msg = "";
        //MailMessage mm = new MailMessage();
        //mm.From = new MailAddress("info@1indus.com");
        //mm.To.Add(mail);
        //if (mail != "ravi_iginc@yahoo.com")
        //    mm.Bcc.Add("ravi_iginc@yahoo.com");
        Msg += "<br/> Hello Mr/Mrs.  <br/><br/>" +
            "<u><strong>" + name + " schedule a remainder for you</strong></u><br/><br/> Here is your reminder : <br/>" + note +
                 "<br>not to miss on " + date + " in between " + time + " <font style='font-size:8pt'>(Time format in 24 hrs.)</font>" +
                 "<br/>";
        //mm.Subject = "Just a Reminder from " + name + " (Indusgroup)";
        //mm.IsBodyHtml = true;
        //mm.Body = Msg;
        //SmtpClient smtp = new SmtpClient();
        //try
        //{
        //    smtp.Send(mm);
        //}
        //catch { }

        string from = "info@1indus.com";
        string fromName = "Indus Group";
        //string to = "vyarramsetty@1indus.com";
        string to = Session["email"].ToString();

        string subject = "Indus Group Calender Reminders of " + name + "";
        SendEmail(to, subject, Msg, from, fromName);
    }

    public static string SendEmail(string to, string subject, string bodyText, string from, string fromName)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", bodyText);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }
}
