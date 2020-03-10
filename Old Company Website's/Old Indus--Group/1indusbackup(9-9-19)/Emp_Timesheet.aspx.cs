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
using System.Net.Mail;

public partial class Emp_Timesheet : System.Web.UI.Page
{
    string emailid = string.Empty;
    public string schtimezone = "";
    private string schtime = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
             //   int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
             //   ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                //if ((Request.QueryString["userid"].ToString() != "") || (Session["userid"].ToString() != ""))
                //{
                //    Session["userid"] = Request.QueryString["userid"];
                    emailid = Session["userid"].ToString();
                    if (emailid == "accounts@1indus.com")
                    {
                        lnkdownload.Visible = true;
                        ddemp.Visible = true;
                        lnknew.Visible = false;
                        lnkleave.Visible = false;
                        SqlDataAdapter dad = new SqlDataAdapter("select lastname +' '+ firstname as name , * from employeereg1 where status=1 and empid like 'IGI%'  order by firstname asc", con);
                        DataSet dsd = new DataSet();
                        dad.Fill(dsd);
                        if (dsd.Tables[0].Rows.Count > 0)
                        {
                            ddemp.DataTextField = "name";
                            ddemp.DataValueField = "userid";
                            ddemp.DataSource = dsd;
                            ddemp.DataBind();
                            ddemp.Items.Insert(0, "Select Employee");
                        }
                    }
                    else
                    {
                        lnknew.Visible = true;
                        lnkleave.Visible = true;

                        lnkdownload.Visible = false;
                        ddemp.Visible = false;
                    }

                    GetEmpData();

                    // calculated total woked time

                    //SqlDataAdapter da = new SqlDataAdapter("select sum(cast(worktime as int)) as total from  IA_DailytimeSheet where empemail='" + emailid + "'", con);
                    //DataSet ds = new DataSet();
                    //da.Fill(ds);
                    //if (ds.Tables[0].Rows.Count > 0)
                    //{
                    //    string total = ds.Tables[0].Rows[0]["total"].ToString();

                    //    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + total + "')", con);
                    //    {
                    //        con.Open();

                    //        lblam.Visible = true;
                    //        txtamount.Visible = true;
                    //        txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                    //        con.Close();
                    //    }
                    //}


                    //    Updated yesterday work out time 

                    //    SqlDataAdapter da123 = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + emailid + "' and remark1=''  order by did desc", con);
                    SqlDataAdapter da123 = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + emailid + "' and  remark1 is NULL order by did desc", con);

                    DataSet ds123 = new DataSet();
                    da123.Fill(ds123);

                    if (ds123.Tables[0].Rows.Count > 0)
                    {
                        string ddcont = ds123.Tables[0].Rows[0]["country"].ToString();
                        DateTime d = new DateTime();
                        if (ddcont == "USA")
                        {
                            d = DateTime.UtcNow.AddHours(-4);
                            //  d = DateTime.UtcNow.AddMinutes(-243);
                        }
                        else
                        {
                            d = DateTime.UtcNow.AddMinutes(330);
                        }

                        txtdate.Text = d.ToString("MM-dd-yyyy");

                        string diff1 = "18:00";
                        string diff2 = ds123.Tables[0].Rows[0]["intime"].ToString();
                        DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt1.Subtract(dt2);
                        string dt3 = Convert.ToString(ts.TotalMinutes);
                        dt3 = dt3.Trim();

                        string did = ds123.Tables[0].Rows[0]["did"].ToString();
                        if (ds123.Tables[0].Rows[0]["ddate"].ToString() != txtdate.Text)
                        {
                            if (ds123.Tables[0].Rows[0]["status"].ToString() == "1")
                            {
                                con.Open();
                                // string s = "update  IA_DailytimeSheet  set outtime1='" + diff1 + "',outtime='12:30',lunch='0Hours30Minutes',intime1='13:00',worktime='" + dt3 + "',status='4',posteddate='"+d+"' where did='" + did + "' ";
                                string s = "update  IA_DailytimeSheet  set posteddate='4',status='4',worktime='0' where did='" + did + "' ";

                                SqlCommand cmd = new SqlCommand(s, con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();

                                if (i == 1)
                                {
                                    string msg = "You are not Punched Lunch out, Lunch in, Work out Yesterday.. Send Mail to HR";
                                    sendmail(msg, emailid);
                                    string strscpt = "alert ('You are not Punched Lunch out, Lunch in, Work out Yesterday.. Send Mail to HR');location.replace('Emp_Timesheet.aspx');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                }
                            }

                            if (ds123.Tables[0].Rows[0]["status"].ToString() == "2")
                            {
                                string diff22 = ds123.Tables[0].Rows[0]["outtime"].ToString();
                                DateTime dt22 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                                DateTime ts11 = Convert.ToDateTime(dt22.AddMinutes(30));
                                string s111 = ts11.ToString("HH:mm");

                                con.Open();
                                //   string s = "update  IA_DailytimeSheet  set outtime1='" + diff1 + "',lunch='0Hours30Minutes',intime1='" + s111 + "',worktime='" + dt3 + "',status='4',posteddate='" + d + "' where did='" + did + "' ";
                                string s = "update  IA_DailytimeSheet  set posteddate='5',status='4',worktime='0' where did='" + did + "' ";

                                SqlCommand cmd = new SqlCommand(s, con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();

                                if (i == 1)
                                {
                                    string msg = "You are not Punched Lunch in, Work out Yesterday... Send Mail to HR";
                                    sendmail(msg, emailid);
                                    string strscpt = "alert ('You are not Punched Lunch in, Work out Yesterday... Send Mail to HR');location.replace('Emp_Timesheet.aspx');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                }
                            }

                            if (ds123.Tables[0].Rows[0]["status"].ToString() == "3")
                            {
                                con.Open();
                                //   string s = "update  IA_DailytimeSheet  set outtime1='" + diff1 + "',worktime='" + dt3 + "',status='4',posteddate='" + d + "' where did='" + did + "' ";
                                string s = "update  IA_DailytimeSheet  set posteddate='6',status='4',worktime='0' where did='" + did + "' ";

                                SqlCommand cmd = new SqlCommand(s, con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();

                                if (i == 1)
                                {
                                    string msg = "You are not Punched Work out Yesterday.. Send Mail to HR";
                                    sendmail(msg, emailid);
                                    string strscpt = "alert ('You are not Punched Work out Yesterday.. Send Mail to HR');location.replace('Emp_Timesheet.aspx');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                }
                            }
                        }
                    }

                    //   Update Today luch in , lunch out time

                    SqlDataAdapter sda32 = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + emailid + "' and remark1 is NULL order by did desc", con);
                    DataSet ds32 = new DataSet();
                    sda32.Fill(ds32);

                    if (ds32.Tables[0].Rows.Count > 0)
                    {
                        string ddcont = ds32.Tables[0].Rows[0]["country"].ToString();
                        DateTime d = new DateTime();
                        if (ddcont == "USA")
                        {
                            d = DateTime.UtcNow.AddHours(-4);
                            //d = DateTime.UtcNow.AddMinutes(-243);

                        }
                        else
                        {
                            d = DateTime.UtcNow.AddMinutes(330);
                        }

                        txtdate.Text = d.ToString("MM-dd-yyyy");
                        string nowtime = d.ToString("HH:mm");

                        DateTime t1 = DateTime.Parse(nowtime);
                        //    DateTime t1 = DateTime.Parse("13:58");  // Tested for condition t1>t2

                        DateTime t2 = DateTime.Parse("14:00");

                        string diff1 = "18:00";
                        string diff2 = ds32.Tables[0].Rows[0]["intime"].ToString();
                        DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt1.Subtract(dt2);
                        string dt3 = Convert.ToString(ts.TotalMinutes);
                        dt3 = dt3.Trim();

                        string did = ds32.Tables[0].Rows[0]["did"].ToString();
                        if (ds32.Tables[0].Rows[0]["ddate"].ToString() == txtdate.Text)
                        {
                            if (t1 > t2)
                            {
                                if (ds32.Tables[0].Rows[0]["status"].ToString() == "1")
                                {
                                    con.Open();
                                    //  string s = "update  IA_DailytimeSheet  set outtime='12:30',lunch='0Hours30Minutes',intime1='13:00',status='3' where did='" + did + "' ";
                                    string s = "update  IA_DailytimeSheet  set posteddate='1',status='3',worktime='0' where did='" + did + "' ";

                                    SqlCommand cmd = new SqlCommand(s, con);
                                    int i = cmd.ExecuteNonQuery();
                                    con.Close();

                                    if (i == 1)
                                    {
                                        string msg = "You are not Punched Lunch out  Today";
                                        sendmail(msg, emailid);
                                        string strscpt = "alert ('You are not Punched Lunch out Today.. Send Mail to HR');location.replace('Emp_Timesheet.aspx');";
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                    }
                                }

                                if (ds32.Tables[0].Rows[0]["status"].ToString() == "2")
                                {
                                    string diff22 = ds32.Tables[0].Rows[0]["outtime"].ToString();
                                    DateTime dt22 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                                    DateTime ts11 = Convert.ToDateTime(dt22.AddMinutes(30));
                                    string s111 = ts11.ToString("HH:mm");

                                    con.Open();
                                    //  string s = "update  IA_DailytimeSheet  set lunch='0Hours30Minutes',intime1='" + s111 + "',status='3' where did='" + did + "' ";
                                    string s = "update  IA_DailytimeSheet  set posteddate='2',status='3',worktime='0' where did='" + did + "' ";

                                    SqlCommand cmd = new SqlCommand(s, con);
                                    int i = cmd.ExecuteNonQuery();
                                    con.Close();

                                    if (i == 1)
                                    {
                                        string msg = "You are not Punched Lunch in  Today";
                                        sendmail(msg,emailid);
                                        string strscpt = "alert ('You are not Punched Lunch in  Today... Send Mail to HR');location.replace('Emp_Timesheet.aspx');";
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                    }
                                }
                            }
                        }
                    }
                //}
                //else
                //{
                //    string strscpt = "alert ('Email id is not registered');location.replace('Emp_Home.aspx');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //}
            }
        }
    }
    public void sendmail(string msg,string email)
    {
        try
        {
            MailMessage msgs = new MailMessage();

            MailAddress address = new MailAddress("hr@1indus.com");
            msgs.From = address;
            string to = email;
            msgs.CC.Add( "hr@1indus.com");

            string Msg = "";
            Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            Msg = Msg + "<tr><td colspan='3' style='background:url(http://www.1indus.com/images/logo2.png) no-repeat;height:100px;width:330px'></td></tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td valign='top'><strong></strong></td>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='left'>" + msg + "</td>";
            Msg = Msg + "</tr></table>";
            msgs.Subject = "Message From Indus Group";
            string htmlBody = Msg;
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("svadapalliwar@aceindus.in", "Indusgroup1");
            client.Send(msgs);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your Details Sent Successfull.');", true);
        }
        catch (Exception ex)
        {
            Response.Write("Exception in send Email:" + ex.Message);
        }
    }

    public void GetEmpData()
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (Session["userid"] != null)
            {
                emailid = Session["userid"].ToString();
                DateTime d = new DateTime();
                d = DateTime.UtcNow.AddHours(-4);
                string m = Convert.ToString(d.Month);
                string y = Convert.ToString(d.Year);

                SqlDataAdapter da = new SqlDataAdapter("SELECT a.rsymbol,a.hrate,a.totalrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.worktime1,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did,a.reason FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'Lunch not taken' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'None' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,worktime as worktime1,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol,reason as reason FROM   IA_DailytimeSheet) a WHERE  a.email='" + emailid + "' and a.month1 = '" + m + "' and a.year1='" + y + "'  order by ddate desc", con);
                //   SqlDataAdapter da = new SqlDataAdapter("select case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NILL' end as Remarks,  hrate as totalrate,* from IA_DailytimeSheet where empemail='" + emailid + "'  order by ddate desc", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    DataTable dt1 = new DataTable();
                    dt1 = dt;
                    int sum1 = 0;

                    double sum2 = 0.0;
                    string ss = "";
                    double sss = 0.0;

                    string result2 = "";
                    string result21 = "";

                    int diftime = 0;
                    int diftime1 = 0;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string strHr = dt.Rows[i][8].ToString();
                        double totHrs = 0.0;
                        if (strHr != null || strHr != "")
                        {
                            totHrs = Convert.ToDouble(strHr) / 60;
                        }

                            //SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                            //{
                            //    con.Open();
                            //    string result = Convert.ToString(cmd.ExecuteScalar());
                            //    con.Close();
                            //    if (result == "   0H 00M")
                            //    {
                            //        dt1.Rows[i][8] = "0H 00M";
                            //    }
                            //    else
                            //    {
                            //        dt1.Rows[i][8] = result;
                            //    }
                            //}
                            //sum1 += Convert.ToInt32(strHr);

                        if (strHr != "0")
                        {
                            diftime = 0;
                            string dt3 = "";
                            string dt31 = "";
                            string dt311 = "0";

                            if ((dt.Rows[i][17].ToString() != "") && (dt.Rows[i][17].ToString() != "00:00"))
                            {
                                string diff1 = dt.Rows[i][17].ToString();
                                string diff2 = "17:00";
                                DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                                DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                                TimeSpan ts = dt11.Subtract(dt2);
                                dt31 = Convert.ToString(ts.TotalMinutes);
                                if (Convert.ToInt32(dt31) >= 0)
                                {
                                    dt311 = dt31.Trim();
                                    diftime = Convert.ToInt32(dt311);
                                    int newstr1 = Convert.ToInt32(strHr) - diftime;
                                    strHr = Convert.ToString(newstr1);
                                }
                            }

                            if ((dt.Rows[i][14].ToString() != "") && (dt.Rows[i][14].ToString() != "00:00"))
                            {
                                string diff1 = "09:00";
                                string diff2 = dt.Rows[i][14].ToString();
                                DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                                DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                                TimeSpan ts = dt11.Subtract(dt2);
                                dt3 = Convert.ToString(ts.TotalMinutes);
                                if (Convert.ToInt32(dt3) >= 0)
                                {
                                    dt3 = dt3.Trim();
                                    diftime = Convert.ToInt32(dt3);
                                    int newstr1 = Convert.ToInt32(strHr) - diftime;
                                    strHr = Convert.ToString(newstr1);
                                    diftime = Convert.ToInt32(dt3) + Convert.ToInt32(dt311);
                                }
                            }
                        }
                        

                        SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                        {
                            if (Convert.ToInt32(strHr) > 480)
                            {
                                diftime = Convert.ToInt32(strHr) - 480;
                                con.Open();
                                string result1 = Convert.ToString(cmd.ExecuteScalar());
                                con.Close();
                                dt1.Rows[i][8] = "8H 00M";
                                SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                                {
                                    int newstr1 = Convert.ToInt32(strHr) - diftime;
                                   strHr = Convert.ToString(newstr1);
                                    con.Open();
                                    result2 = Convert.ToString(cmd1.ExecuteScalar());
                                    con.Close();
                                    if (result2 == "   0H 00M")
                                    {
                                        dt1.Rows[i][9] = "00:00";
                                    }
                                    else
                                    {
                                        dt1.Rows[i][9] = result2;
                                    }
                                }
                                diftime1 += diftime;
                            }
                            else
                            {
                                con.Open();
                                string result1 = Convert.ToString(cmd.ExecuteScalar());
                                con.Close();
                                if (result1 == "   0H 00M")
                                {
                                    dt1.Rows[i][8] = "0H 00M";
                                    dt1.Rows[i][9] = "00:00";
                                }
                                else
                                {
                                    dt1.Rows[i][8] = result1;
                                    SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                                    {
                                        con.Open();
                                        result2 = Convert.ToString(cmd1.ExecuteScalar());
                                        con.Close();
                                        if (result2 == "   0H 00M")
                                        {
                                            dt1.Rows[i][9] = "00:00";
                                        }
                                        else
                                        {
                                            dt1.Rows[i][9] = result2;
                                        }
                                    }
                                   diftime1 += diftime;
                                }
                            }
                        }

                        sum1 += Convert.ToInt32(strHr);

                        string strRate = dt.Rows[i][1].ToString();
                        if (strRate != null || strRate != "")
                        {
                            if (dt.Rows[i]["hrate"].ToString() != null || dt.Rows[i]["hrate"].ToString() != "")
                            {
                                sss = Convert.ToDouble(dt.Rows[i]["hrate"].ToString()) * Convert.ToDouble(strHr) / 60;
                                ss = Convert.ToString(sss);
                                ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                                if (ss == "$0.00")
                                {
                                    dt1.Rows[i][1] = "$00.00";
                                }
                                else
                                {
                                    dt1.Rows[i][1] = ss;
                                }
                                sum2 += Convert.ToDouble(sss);
                            }
                        }
                    }

                    SqlCommand cmd2 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime1 + "')", con);
                    {
                        con.Open();
                        result2 = Convert.ToString(cmd2.ExecuteScalar());
                        con.Close();
                        Tr1.Visible = true;
                        txtextratime.Text = result2;
                        Label7.Text = "Total Extra Hours of the " + ddmonth.SelectedItem.Text + " Month :";
                    }

                    empdata.DataSource = dt1;
                    empdata.DataBind();

                    if (ds.Tables[0].Rows[0]["worktime"].ToString() != "")
                    {
                        SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
                        {
                            con.Open();
                            txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                            ss = Convert.ToString(sum2);
                            ss = sum2.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                            txtamount.Text = Convert.ToString(ss);
                            txtamount.Visible = true;
                            lblam.Visible = true;
                            lbltotalwork.Visible = true;
                            lblam.Visible = true;
                            //txtamount.Visible = true;
                            //txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                            con.Close();
                        }
                    }
                    else
                    {
                        lblam.Visible = false;
                        txtamount.Visible = false;
                        txttotalwork.Visible = false;
                        lbltotalwork.Visible = false;
                    }
                }
                else
                {
                    lblam.Visible = false;
                    txtamount.Visible = false;
                    empdata.Visible = false;
                    lbltotalwork.Visible = false;
                    txttotalwork.Visible = false;
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }

    protected void empdata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        empdata.PageIndex = e.NewPageIndex;
        GetEmpData();
    }

    protected void lnknew_Click(object sender, EventArgs e)
    {
        ddemp.SelectedIndex = -1;
        ddmonth.SelectedIndex = -1;
        ddyear.SelectedIndex = -1;
        empdata.Visible = false;
        lbltotalwork.Visible = false;
        txttotalwork.Visible = false;
        createtime.Visible = true;
        lnknew.Visible = false;
        lnkshow.Visible = true;
        lblam.Visible = false;
        txtamount.Visible = false;
        Tr1.Visible = false;

        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (Session["userid"] != null)
            {
                emailid = Session["userid"].ToString();
                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'  order by userid asc", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);
                if (dssss.Tables[0].Rows.Count > 0)
                {
                    txtempname.Text = dssss.Tables[0].Rows[0]["lastname"].ToString() + "  " + dssss.Tables[0].Rows[0]["firstname"].ToString();
                    txtid.Text = dssss.Tables[0].Rows[0]["empid"].ToString();
                    txtemail.Text = dssss.Tables[0].Rows[0]["emailid"].ToString();
                    string ddcont = dssss.Tables[0].Rows[0]["country1"].ToString();
                    Session["contry"] = ddcont;
                    Session["rate"] = dssss.Tables[0].Rows[0]["hrate"].ToString();
                    Session["symbol"] = dssss.Tables[0].Rows[0]["ratesymbol"].ToString();

                    DateTime d = new DateTime();
                    if (ddcont == "USA")
                    {
                        DateTime d33 = new DateTime();
                        //   d33 = DateTime.UtcNow.AddHours(-4);
                        //d = DateTime.UtcNow.AddMinutes(-243);
			            d = DateTime.UtcNow.AddMinutes(-240);
                    }
                    else
                    {
                        d = DateTime.UtcNow.AddMinutes(330);
                    }

                    txtdate.Text = d.ToString("MM-dd-yyyy");
                    txtin.Text = d.ToString("HH:mm");

                    SqlDataAdapter sda = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + emailid + "' and remark1 is NULL order by did desc,ddate desc ", con);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (ds.Tables[0].Rows[0]["status"].ToString() == "1")
                        {
                            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
                            Session["Did"] = ds.Tables[0].Rows[0]["did"].ToString();

                            DateTime d1 = new DateTime();

                            if (ddcont == "USA")
                            {
                                d1 = DateTime.UtcNow.AddHours(-4);
                                //  d1 = DateTime.UtcNow.AddMinutes(-243);
                            }
                            else
                            {
                                d1 = DateTime.UtcNow.AddMinutes(330);
                            }
                            txtout.Text = d1.ToString("HH:mm");

                            lblin.Visible = true;
                            out1.Visible = true;
                            txtin.Visible = true;

                            lblout.Visible = true;
                            out2.Visible = true;
                            txtout.Visible = true;
                            btnsaveout.Visible = true;

                            btnsavein.Visible = false;

                            llblin.Visible = false;
                            Td1.Visible = false;
                            ltxtin.Visible = false;
                            lbtnsave1.Visible = false;

                            llbnout.Visible = false;
                            Td2.Visible = false;
                            ltxtout.Visible = false;
                            lbtnsave2.Visible = false;
                        }
                        if (ds.Tables[0].Rows[0]["status"].ToString() == "2")
                        {
                            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
                            txtout.Text = ds.Tables[0].Rows[0]["outtime"].ToString();
                            Session["Did"] = ds.Tables[0].Rows[0]["did"].ToString();

                            DateTime d1 = new DateTime();
                            if (ddcont == "USA")
                            {
                                //d1 = DateTime.UtcNow.AddHours(-4);
			                	d1 = DateTime.UtcNow.AddHours(-4);					
                                // d1 = DateTime.UtcNow.AddMinutes(-243);
                            }
                            else
                            {
                                //d1 = DateTime.UtcNow.AddMinutes(330);
			                	d1 = DateTime.UtcNow.AddMinutes(330);	
                            }

                            ltxtin.Text = d1.ToString("HH:mm");

                            lblin.Visible = true;
                            out1.Visible = true;
                            txtin.Visible = true;

                            lblout.Visible = true;
                            out2.Visible = true;
                            txtout.Visible = true;

                            llblin.Visible = true;
                            Td1.Visible = true;
                            ltxtin.Visible = true;
                            lbtnsave1.Visible = true;

                            btnsavein.Visible = false;
                            btnsaveout.Visible = false;

                            llbnout.Visible = false;
                            Td2.Visible = false;
                            ltxtout.Visible = false;
                            lbtnsave2.Visible = false;
                        }
                        if (ds.Tables[0].Rows[0]["status"].ToString() == "3")
                        {
                            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
                            txtout.Text = ds.Tables[0].Rows[0]["outtime"].ToString();
                            ltxtin.Text = ds.Tables[0].Rows[0]["intime1"].ToString();
                            txtlunch.Text = ds.Tables[0].Rows[0]["lunch"].ToString();

                            Session["Did"] = ds.Tables[0].Rows[0]["did"].ToString();

                            DateTime d1 = new DateTime();
                            if (ddcont == "USA")
                            {
                                d1 = DateTime.UtcNow.AddHours(-4);
                                //  d1 = DateTime.UtcNow.AddMinutes(-243);

                            }
                            else
                            {
                                d1 = DateTime.UtcNow.AddMinutes(330);
                            }
                            ltxtout.Text = d1.ToString("HH:mm");

                            lblin.Visible = true;
                            out1.Visible = true;
                            txtin.Visible = true;

                            lblout.Visible = true;
                            out2.Visible = true;
                            txtout.Visible = true;

                            llblin.Visible = true;
                            Td1.Visible = true;
                            ltxtin.Visible = true;

                            llbnout.Visible = true;
                            Td2.Visible = true;
                            ltxtout.Visible = true;
                            lbtnsave2.Visible = true;

                            btnsavein.Visible = false;
                            btnsaveout.Visible = false;
                            lbtnsave1.Visible = false;
                        }
                        if (ds.Tables[0].Rows[0]["status"].ToString() == "4")
                        {
                            lblout.Visible = false;
                            out2.Visible = false;
                            txtout.Visible = false;
                            btnsaveout.Visible = false;

                            llblin.Visible = false;
                            Td1.Visible = false;
                            ltxtin.Visible = false;
                            lbtnsave1.Visible = false;

                            llbnout.Visible = false;
                            Td2.Visible = false;
                            ltxtout.Visible = false;
                            lbtnsave2.Visible = false;
                        }
                    }
                    else
                    {
                        lblout.Visible = false;
                        out2.Visible = false;
                        txtout.Visible = false;
                        btnsaveout.Visible = false;

                        llblin.Visible = false;
                        Td1.Visible = false;
                        ltxtin.Visible = false;
                        lbtnsave1.Visible = false;

                        llbnout.Visible = false;
                        Td2.Visible = false;
                        ltxtout.Visible = false;
                        lbtnsave2.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }

    protected void lnkshow_Click(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            emailid = Session["userid"].ToString();
            if (emailid == "accounts@1indus.com")
            {
                ddmonth.SelectedIndex = -1;
                ddyear.SelectedIndex = -1;
                ddemp.SelectedIndex = -1;
                empdata.Visible = false;
                lbltotalwork.Visible = false;
                txttotalwork.Visible = false;
                lblam.Visible = false;
                txtamount.Visible = false;

                createtime.Visible = false;
                lnknew.Visible = true;
                lnkshow.Visible = false;
            }
            else
            {
                GetEmpData();
                ddmonth.SelectedIndex = -1;
                ddyear.SelectedIndex = -1;
                ddemp.SelectedIndex = -1;
                empdata.Visible = true;
                lbltotalwork.Visible = true;
                txttotalwork.Visible = true;
                createtime.Visible = false;
                lnknew.Visible = true;
                lnkshow.Visible = false;
                Tr1.Visible = true;
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnsavein_Click(object sender, EventArgs e)
    {
        emailid = Session["userid"].ToString();

        //SqlDataAdapter da = new SqlDataAdapter("select  top (1)convert(datetime, ddate, 110) as  ddate1,convert(nvarchar, ddate, 101) as  ddate from IA_DailytimeSheet where empemail='" + emailid + "' order by ddate1 desc", con);
        SqlDataAdapter da = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + txtdate.Text + "' and empemail='" + emailid + "'  ", con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        //if (ds.Tables[0].Rows.Count > 0)
        if (ds.Tables[0].Rows[0]["count"].ToString() == "1") //given date ia availble in database or not if 1
        {
            string strscpt = "alert ('Already Punched Given date');location.replace('Emp_Timesheet.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);

            //string name = txtempname.Text;
            //string empid = txtid.Text;
            //string email = txtemail.Text;
            //string wdate = txtdate.Text;
            //string in1 = txtin.Text;
            //int st = 1;
            //string rate = Session["rate"].ToString();
            //string rate1 = Session["symbol"].ToString();

            //checking for  date is not same to today

            //else
            //{
            //    string strscpt = "alert ('Already Punched Today');location.replace('Emp_Timesheet.aspx');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            //}
        }
        else
        {
            string name = txtempname.Text;
            string empid = txtid.Text;
            string email = txtemail.Text;
            string wdate = txtdate.Text;
            string in1 = txtin.Text;
            int st = 1;
            string rate = Session["rate"].ToString();
            string rate1 = Session["symbol"].ToString();
            string ddcont = Session["contry"].ToString();


            // getting previous day  

            //  if (ds.Tables[0].Rows[0]["ddate"].ToString() != wdate)
            //  {
            DateTime dd = Convert.ToDateTime(wdate);
            string starting1 = Convert.ToString(dd.ToString("MM-dd-yyyy"));
            DateTime date = Convert.ToDateTime(starting1);
            DateTime date11 = Convert.ToDateTime(dd.AddDays(-1));
            string starting11 = Convert.ToString(date11.ToString("MM-dd-yyyy"));

            SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + starting11 + "' and empemail='" + email + "'  ", con);
            DataSet dssss = new DataSet();
            sdaaaaa.Fill(dssss);

            if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
            {
                //// string ddcont = Session["contry"].ToString();
                //con.Open();
                ////   string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','1','0','" + rate + "','"+rate1+"') ";
                //string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','0','0','" + rate + "','" + rate1 + "') ";
                //SqlCommand cmd = new SqlCommand(s, con);
                //int i = cmd.ExecuteNonQuery();
                //con.Close();
                //if (i == 1)
                //{
                //    btnsavein.Visible = false;

                //    string strscpt = "alert ('Data Saved');location.replace('Emp_Timesheet.aspx');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //}
                //else
                //{
                //    string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp_Timesheet.aspx');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //}
                string strscpt = "alert ('Please enter Previous Days');location.replace('Timesheet-Remarks.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
            else
            {
                //    string strscpt = "alert ('Please enter Previous Days');location.replace('Timesheet-Remarks.aspx');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //}
                //  }

              //  in1 = "08:59";
                //DateTime t1 =Convert.ToDateTime("09:00");
                //DateTime t2 = Convert.ToDateTime(in1);
                //int i = DateTime.Compare(t1, t2);

                //if (i == 1)
                //{
                //    in1 = "09:00";

                    con.Open();
                    //   string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','1','0','" + rate + "','" + rate1 + "') ";
                    string s3 = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','0','0','" + rate + "','" + rate1 + "') ";

                    SqlCommand cmd3 = new SqlCommand(s3, con);
                    int i3 = cmd3.ExecuteNonQuery();
                    con.Close();
                    if (i3 == 1)
                    {
                        btnsavein.Visible = false;

                        string strscpt = "alert ('Data Saved');location.replace('Emp_Timesheet.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                    else
                    {
                        string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp_Timesheet.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                //}
                //else
                //{
                //    con.Open();
                //    //   string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','1','0','" + rate + "','" + rate1 + "') ";
                //    string s3 = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','0','0','" + rate + "','" + rate1 + "') ";

                //    SqlCommand cmd3 = new SqlCommand(s3, con);
                //    int i3 = cmd3.ExecuteNonQuery();
                //    con.Close();
                //    if (i3 == 1)
                //    {
                //        btnsavein.Visible = false;

                //        string strscpt = "alert ('Data Saved');location.replace('Emp_Timesheet.aspx');";
                //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //    }
                //    else
                //    {
                //        string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp_Timesheet.aspx');";
                //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                //    }
                //}
            }
        }
    }

    protected void btnsaveout_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + txtemail.Text + "' and  status=1 order by ddate desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
        }
        string did = Session["Did"].ToString();
        string ddcont = Session["contry"].ToString();


        string pdate = System.DateTime.Now.ToString();
        DateTime d = new DateTime();
        if (ddcont == "USA")
        {
            d = DateTime.UtcNow.AddHours(-4);
          //  d = DateTime.UtcNow.AddMinutes(-243);

        }
        else
        {
            d = DateTime.UtcNow.AddMinutes(330);
        }

        txtout.Text = d.ToString("HH:mm");
        con.Open();
  //      string s = "update  IA_DailytimeSheet  set outtime='" + txtout.Text + "',status='2',posteddate ='0' where did='" + did + "' ";
        string s = "update  IA_DailytimeSheet  set outtime='" + txtout.Text + "',status='2',posteddate ='2' where did='" + did + "' ";

        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();

        if (i == 1)
        {
            string strscpt = "alert ('Your Details Saved..');location.replace('Emp_Timesheet.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strscpt = "alert ('Problem Occured Please Tryagain....');location.replace('Emp_Timesheet.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void lbtnsave1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + txtemail.Text + "' and  status=2 order by ddate desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
            txtout.Text = ds.Tables[0].Rows[0]["outtime"].ToString();
        }
        string did = Session["Did"].ToString();
        string ddcont = Session["contry"].ToString();

        string pdate = System.DateTime.Now.ToString();
        DateTime d = new DateTime();
        if (ddcont == "USA")
        {
            d = DateTime.UtcNow.AddHours(-4);
          //  d = DateTime.UtcNow.AddMinutes(-243);
        }
        else
        {
            d = DateTime.UtcNow.AddMinutes(330);
        }

        ltxtin.Text = d.ToString("HH:mm");

        //Calculated Lunch Time

        string diff1 = ltxtin.Text;
        string diff2 = txtout.Text;
        DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
        TimeSpan ts = dt1.Subtract(dt2);
        string dt3 = Convert.ToString(ts.Hours + "Hours" + ts.Minutes + "Minutes");
        dt3 = dt3.Trim();
        con.Open();
        string s = "update  IA_DailytimeSheet  set intime1='" + ltxtin.Text + "',lunch='" + dt3 + "',status='3',posteddate ='3' where did='" + did + "' ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();

        if (i == 1)
        {
            string strscpt = "alert ('Your Details Saved..');location.replace('Emp_Timesheet.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strscpt = "alert ('Problem Occured Please Tryagain....');location.replace('Emp_Timesheet.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void lbtnsave2_Click(object sender, EventArgs e)
    {
        // Updating work out time
        SqlDataAdapter da = new SqlDataAdapter("select top(1) * from IA_DailytimeSheet where empemail='" + txtemail.Text + "' and  status=3 order by did desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
            txtout.Text = ds.Tables[0].Rows[0]["outtime"].ToString();
            ltxtin.Text = ds.Tables[0].Rows[0]["intime1"].ToString();
        }
        string did = Session["Did"].ToString();
        string ddcont = Session["contry"].ToString();

        string pdate = System.DateTime.Now.ToString();
        DateTime d = new DateTime();
        if (ddcont == "USA")
        {
            d = DateTime.UtcNow.AddHours(-4);
            //   d = DateTime.UtcNow.AddMinutes(-243);
        }
        else
        {
            d = DateTime.UtcNow.AddMinutes(330);
        }

        ltxtout.Text = d.ToString("HH:mm");

     //   ltxtout.Text = "17:15";
        //DateTime t1 = Convert.ToDateTime(ltxtout.Text);
        //DateTime t2 = Convert.ToDateTime("17:00");
        //int i1 = DateTime.Compare(t1, t2);

        ////Calculated Work Time

        //if (i1 == 1)
        //{
        //    ltxtout.Text = "17:00";

        //    string diff1 = ltxtout.Text;
        //    string diff2 = txtin.Text;

        //    DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
        //    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
        //    TimeSpan ts = dt1.Subtract(dt2);
        //    //   string dt3 = Convert.ToString(ts.Hours + "Hours" + ts.Minutes + "Minutes");
        //    //  string dt3 = Convert.ToString(ts.Hours + ts.Minutes);
        //    string dt3 = Convert.ToString(ts.TotalMinutes);
        //    dt3 = dt3.Trim();

        //    //calculated lunch time for subtarct total time
        //    if ((ds.Tables[0].Rows[0]["outtime"].ToString() != "") && (ds.Tables[0].Rows[0]["outtime"].ToString() != "00:00") && (ds.Tables[0].Rows[0]["intime1"].ToString() != "") && (ds.Tables[0].Rows[0]["intime1"].ToString() != "00:00"))
        //    {
        //        string diff12 = ds.Tables[0].Rows[0]["outtime"].ToString();
        //        string diff22 = ds.Tables[0].Rows[0]["intime1"].ToString();
        //        DateTime dt13 = DateTime.ParseExact(diff12, "HH:mm", new DateTimeFormatInfo());
        //        DateTime dt21 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
        //        TimeSpan ts1 = dt21.Subtract(dt13);
        //        string dt31 = Convert.ToString(ts1.TotalMinutes);
        //        dt31 = dt31.Trim();
        //        int lunch1 = Convert.ToInt32(dt3) - Convert.ToInt32(dt31);
        //        dt3 = Convert.ToString(lunch1);
        //    }

        //    con.Open();
        //    string s = "update  IA_DailytimeSheet  set outtime1='" + ltxtout.Text + "',worktime='" + dt3 + "',status='4',posteddate ='0' where did='" + did + "' ";
        //    SqlCommand cmd = new SqlCommand(s, con);
        //    int i = cmd.ExecuteNonQuery();
        //    con.Close();

        //    if (i == 1)
        //    {
        //        string strscpt = "alert ('Your Details Saved and Mail sent Successfully');location.replace('Emp_Timesheet.aspx');";
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        //    }
        //    else
        //    {
        //        string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp_Timesheet.aspx');";
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        //    }
        //}
      //  else
      //  {
            string diff1 = ltxtout.Text;
            string diff2 = txtin.Text;

            DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
            DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
            TimeSpan ts = dt1.Subtract(dt2);
            //   string dt3 = Convert.ToString(ts.Hours + "Hours" + ts.Minutes + "Minutes");
            //  string dt3 = Convert.ToString(ts.Hours + ts.Minutes);
            string dt3 = Convert.ToString(ts.TotalMinutes);
            dt3 = dt3.Trim();

            //calculated lunch time for subtarct total time
            if ((ds.Tables[0].Rows[0]["outtime"].ToString() != "") && (ds.Tables[0].Rows[0]["outtime"].ToString() != "00:00") && (ds.Tables[0].Rows[0]["intime1"].ToString() != "") && (ds.Tables[0].Rows[0]["intime1"].ToString() != "00:00"))
            {
                string diff12 = ds.Tables[0].Rows[0]["outtime"].ToString();
                string diff22 = ds.Tables[0].Rows[0]["intime1"].ToString();
                DateTime dt13 = DateTime.ParseExact(diff12, "HH:mm", new DateTimeFormatInfo());
                DateTime dt21 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                TimeSpan ts1 = dt21.Subtract(dt13);
                string dt31 = Convert.ToString(ts1.TotalMinutes);
                dt31 = dt31.Trim();
                int lunch1 = Convert.ToInt32(dt3) - Convert.ToInt32(dt31);
                dt3 = Convert.ToString(lunch1);
            }


            string lunchreason = txtreason.Text;
            con.Open();
            string s = "update  IA_DailytimeSheet  set outtime1='" + ltxtout.Text + "',worktime='" + dt3 + "',status='4',posteddate ='0',reason='" + lunchreason + "' where did='" + did + "' ";
            SqlCommand cmd = new SqlCommand(s, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                string strscpt = "alert ('Your Details Saved and Mail sent Successfully');location.replace('Emp_Timesheet.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
            else
            {
                string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp_Timesheet.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
      //  }
    }

    private void Binddata(string lnk, string year)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            emailid = Session["userid"].ToString();
            string result = "";
            SqlDataAdapter sscmd = new SqlDataAdapter("SELECT a.rsymbol,a.hrate,a.totalrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.worktime1,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did,a.reason FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'Lunch not taken' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'None' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime, worktime as worktime1,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol,reason as reason FROM   IA_DailytimeSheet) a WHERE  a.email='" + emailid + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by ddate desc", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                DataTable dt = das.Tables[0];
                DataTable dt1 = new DataTable();
                dt1 = dt;
                int sum1 = 0;
                double sum2 = 0.0;
                string ss = "";
                double sss = 0.0;
                string result2 = "";
                string result21 = "";

                int diftime = 0;
                int diftime1 = 0;


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string strHr = dt.Rows[i][8].ToString();
                    double totHrs = 0.0;
                    if (strHr != null || strHr != "")
                    {
                        totHrs = Convert.ToDouble(strHr) / 60;
                    }
                    //SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                    //{
                    //    con.Open();
                    //    string result1 = Convert.ToString(cmd.ExecuteScalar());
                    //    con.Close();
                    //    if (result == "   0H 00M")
                    //    {
                    //        dt1.Rows[i][8] = "0H 00M";
                    //    }
                    //    else
                    //    {
                    //        dt1.Rows[i][8] = result1;
                    //    }
                    //}

                    //sum1 += Convert.ToInt32(strHr);

                    diftime = 0;
                    string dt3 = "";
                    string dt31 = "";
                    string dt311 = "0";
                    if ((dt.Rows[i][17].ToString() != "") && (dt.Rows[i][17].ToString() != "00:00"))
                    {
                        string diff1 = dt.Rows[i][17].ToString();
                        string diff2 = "17:00";
                        DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt11.Subtract(dt2);
                         dt31 = Convert.ToString(ts.TotalMinutes);
                        if (Convert.ToInt32(dt31) >= 0)
                        {
                            dt311 = dt31.Trim();
                            diftime = Convert.ToInt32(dt311);

                            int newstr1 = Convert.ToInt32(strHr) - diftime;
                            strHr = Convert.ToString(newstr1);
                        }
                    }

                    if ((dt.Rows[i][14].ToString() != "") && (dt.Rows[i][14].ToString() != "00:00"))
                    {
                        string diff1 = "09:00";
                        string diff2 = dt.Rows[i][14].ToString();
                        DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt11.Subtract(dt2);
                         dt3 = Convert.ToString(ts.TotalMinutes);
                        if (Convert.ToInt32(dt3) >= 0)
                        {
                            dt3 = dt3.Trim();
                            diftime = Convert.ToInt32(dt3);

                            int newstr1 = Convert.ToInt32(strHr) - diftime;
                            strHr = Convert.ToString(newstr1);

                            diftime =  Convert.ToInt32(dt3)+Convert.ToInt32(dt311);

                        }
                    }



                    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                    {
                        if (Convert.ToInt32(strHr) > 480)
                        {
                            diftime = Convert.ToInt32(strHr) - 480;

                            con.Open();
                            string result1 = Convert.ToString(cmd.ExecuteScalar());
                            con.Close();

                            dt1.Rows[i][8] = "8H 00M";
                            SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                            {
                                int newstr1 = Convert.ToInt32(strHr) - diftime;
                                strHr = Convert.ToString(newstr1);
                                con.Open();
                                result2 = Convert.ToString(cmd1.ExecuteScalar());
                                con.Close();
                                if (result2 == "   0H 00M")
                                {
                                    dt1.Rows[i][9] = "00:00";
                                }
                                else
                                {
                                    dt1.Rows[i][9] = result2;
                                }
                            }

                            diftime1 += diftime;
                        }
                        else
                        {
                            con.Open();
                            string result1 = Convert.ToString(cmd.ExecuteScalar());
                            con.Close();
                            if (result1 == "   0H 00M")
                            {
                                dt1.Rows[i][8] = "0H 00M";
                                dt1.Rows[i][9] = "00:00";
                            }
                            else
                            {
                                dt1.Rows[i][8] = result1;
                                SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                                {
                                    //  int newstr1 = Convert.ToInt32(strHr) - diftime;
                                    // strHr = Convert.ToString(newstr1);
                                    con.Open();
                                    result2 = Convert.ToString(cmd1.ExecuteScalar());
                                    con.Close();
                                    if (result2 == "   0H 00M")
                                    {
                                        dt1.Rows[i][9] = "00:00";
                                    }
                                    else
                                    {
                                        dt1.Rows[i][9] = result2;
                                    }
                                }

                                diftime1 += diftime;
                            }
                        }
                    }

                    sum1 += Convert.ToInt32(strHr);


                    string strRate = dt.Rows[i][1].ToString();
                    if (strRate != null || strRate != "")
                    {
                        if (dt.Rows[i]["hrate"].ToString() != null || dt.Rows[i]["hrate"].ToString() != "")
                        {
                            sss = Convert.ToDouble(dt.Rows[i]["hrate"].ToString()) * Convert.ToDouble(strHr) / 60;
                            ss = Convert.ToString(sss);
                            ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            dt1.Rows[i][1] = ss;
                        }
                    }
                    sum2 += Convert.ToDouble(sss);
                }

                SqlCommand cmd2 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime1 + "')", con);
                {
                    con.Open();
                    result2 = Convert.ToString(cmd2.ExecuteScalar());
                    con.Close();
                    txtextratime.Text = result2;
                    Tr1.Visible = true;
                    Label7.Text = "Total Extra Hours of the " + ddmonth.SelectedItem.Text + " Month :";
                }

             //   sum1 = sum1 - diftime1;


                //SqlCommand cmd21 = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
                //{
                //    con.Open();
                //    result21 = Convert.ToString(cmd21.ExecuteScalar());
                //    con.Close();
                //    TextBox1.Text = result21;
                //}

                empdata.DataSource = dt1;
                empdata.DataBind();
                empdata.Visible = true;
                lbltotalwork.Visible = true;
                txttotalwork.Visible = true;

                if (das.Tables[0].Rows[0]["worktime"].ToString() != "")
                {
                    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
                    {
                        con.Open();
                        txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                        ss = Convert.ToString(sum2);
                        ss = sum2.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        txtamount.Text = Convert.ToString(ss);
                        txtamount.Visible = true;
                        lblam.Visible = true;
                        con.Close();
                    }
                }
                else
                {
                    lblam.Visible = false;
                    txtamount.Visible = false;
                    txttotalwork.Visible = false;
                    lbltotalwork.Visible = false;
                }
            }
            else
            {
                GetEmpData();
                empdata.Visible = true;
                txttotalwork.Visible = true;
                string strscpt = "alert ('No Records found on selected Month and year');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
    }

    private void Binddata1(string lnk, string year, string mail)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string result = "";
            SqlDataAdapter sscmd = new SqlDataAdapter("SELECT a.rsymbol,a.hrate,a.totalrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.worktime1,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did,a.reason FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'None' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime, worktime as worktime1,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol,reason as reason FROM   IA_DailytimeSheet) a WHERE  a.email='" + mail + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "' order by ddate desc", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                DataTable dt = das.Tables[0];
                DataTable dt1 = new DataTable();
                dt1 = dt;
                int sum1 = 0;
                double sum2 = 0.0;
                string ss = "";
                double sss = 0.0;
                string result2 = "";
                string result21 = "";

                int diftime = 0;
                int diftime1 = 0;

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string strHr = dt.Rows[i][8].ToString();
                    double totHrs = 0.0;
                    if (strHr != null || strHr != "")
                    {
                        totHrs = Convert.ToDouble(strHr) / 60;
                    }
                //    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                //    {
                //        con.Open();
                //        string result1 = Convert.ToString(cmd.ExecuteScalar());
                //        con.Close();
                //        if (result == "   0H 00M")
                //        {
                //            dt1.Rows[i][8] = "0H 00M";
                //        }
                //        else
                //        {
                //            dt1.Rows[i][8] = result1;
                //        }
                //    }

                //    sum1 += Convert.ToInt32(strHr);

                //    string strRate = dt.Rows[i][1].ToString();
                //    if (strRate != null || strRate != "")
                //    {
                //        if (dt.Rows[i]["hrate"].ToString() != null || dt.Rows[i]["hrate"].ToString() != "")
                //        {
                //            sss = Convert.ToDouble(dt.Rows[i]["hrate"].ToString()) * totHrs;
                //            ss = Convert.ToString(sss);
                //            ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                //            dt1.Rows[i][1] = ss;
                //        }
                //    }
                //    sum2 += Convert.ToDouble(sss);
                //}
                    diftime = 0;
                    string dt3 = "";
                    string dt31 = "";
                    string dt311 = "0";
                    if ((dt.Rows[i][17].ToString() != "") && (dt.Rows[i][17].ToString() != "00:00"))
                    {
                        string diff1 = dt.Rows[i][17].ToString();
                        string diff2 = "17:00";
                        DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt11.Subtract(dt2);
                        dt31 = Convert.ToString(ts.TotalMinutes);
                        if (Convert.ToInt32(dt31) >= 0)
                        {
                            dt311 = dt31.Trim();
                            diftime = Convert.ToInt32(dt311);

                            int newstr1 = Convert.ToInt32(strHr) - diftime;
                            strHr = Convert.ToString(newstr1);
                        }
                    }

                    if ((dt.Rows[i][14].ToString() != "") && (dt.Rows[i][14].ToString() != "00:00"))
                    {
                        string diff1 = "09:00";
                        string diff2 = dt.Rows[i][14].ToString();
                        DateTime dt11 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                        DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                        TimeSpan ts = dt11.Subtract(dt2);
                        dt3 = Convert.ToString(ts.TotalMinutes);
                        if (Convert.ToInt32(dt3) >= 0)
                        {
                            dt3 = dt3.Trim();
                            diftime = Convert.ToInt32(dt3);

                            int newstr1 = Convert.ToInt32(strHr) - diftime;
                            strHr = Convert.ToString(newstr1);

                            diftime = Convert.ToInt32(dt3) + Convert.ToInt32(dt311);

                        }
                    }



                    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                    {
                        if (Convert.ToInt32(strHr) > 480)
                        {
                            diftime = Convert.ToInt32(strHr) - 480;

                            con.Open();
                            string result1 = Convert.ToString(cmd.ExecuteScalar());
                            con.Close();

                            dt1.Rows[i][8] = "8H 00M";
                            SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                            {
                                int newstr1 = Convert.ToInt32(strHr) - diftime;
                                strHr = Convert.ToString(newstr1);
                                con.Open();
                                result2 = Convert.ToString(cmd1.ExecuteScalar());
                                con.Close();
                                if (result2 == "   0H 00M")
                                {
                                    dt1.Rows[i][9] = "00:00";
                                }
                                else
                                {
                                    dt1.Rows[i][9] = result2;
                                }
                            }

                            diftime1 += diftime;
                        }
                        else
                        {
                            con.Open();
                            string result1 = Convert.ToString(cmd.ExecuteScalar());
                            con.Close();
                            if (result1 == "   0H 00M")
                            {
                                dt1.Rows[i][8] = "0H 00M";
                                dt1.Rows[i][9] = "00:00";
                            }
                            else
                            {
                                dt1.Rows[i][8] = result1;
                                SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                                {
                                    //  int newstr1 = Convert.ToInt32(strHr) - diftime;
                                    // strHr = Convert.ToString(newstr1);
                                    con.Open();
                                    result2 = Convert.ToString(cmd1.ExecuteScalar());
                                    con.Close();
                                    if (result2 == "   0H 00M")
                                    {
                                        dt1.Rows[i][9] = "00:00";
                                    }
                                    else
                                    {
                                        dt1.Rows[i][9] = result2;
                                    }
                                }

                                diftime1 += diftime;
                                //if()
                            }
                        }
                    }

                    sum1 += Convert.ToInt32(strHr);


                    string strRate = dt.Rows[i][1].ToString();
                    if (strRate != null || strRate != "")
                    {
                        if (dt.Rows[i]["hrate"].ToString() != null || dt.Rows[i]["hrate"].ToString() != "")
                        {
                            sss = Convert.ToDouble(dt.Rows[i]["hrate"].ToString()) * Convert.ToDouble(strHr) / 60;
                            ss = Convert.ToString(sss);
                            ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            dt1.Rows[i][1] = ss;
                        }
                    }
                    sum2 += Convert.ToDouble(sss);
                }

                SqlCommand cmd2 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime1 + "')", con);
                {
                    con.Open();
                    result2 = Convert.ToString(cmd2.ExecuteScalar());
                    con.Close();
                    txtextratime.Text = result2;
                    Tr1.Visible = true;
                    Label7.Text = "Total Extra Hours of the " + ddmonth.SelectedItem.Text + " Month :";
                }

                empdata.DataSource = dt1;
                empdata.DataBind();
                empdata.Visible = true;
                lbltotalwork.Visible = true;
                txttotalwork.Visible = true;

                if (das.Tables[0].Rows[0]["worktime"].ToString() != "")
                {
                    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
                    {
                        con.Open();
                        txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                        ss = Convert.ToString(sum2);
                        ss = sum2.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        txtamount.Text = Convert.ToString(ss);
                        txtamount.Visible = true;
                        lblam.Visible = true;
                        con.Close();
                    }
                }
                else
                {
                    lblam.Visible = false;
                    txtamount.Visible = false;
                    txttotalwork.Visible = false;
                    lbltotalwork.Visible = false;
                }
            }
            else
            {
                ddmonth.SelectedIndex = -1;
                string strscpt = "alert ('No Records Found');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
    }


    //protected void lnkjan_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "1";
    //        lnkjan.ForeColor = System.Drawing.Color.Green;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkfeb_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "2";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Green;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkmar_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "3";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Green;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkapr_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "4";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Green;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkmay_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "5";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Green;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkjun_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "6";
    //        lnkjun.ForeColor = System.Drawing.Color.Green;
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkjul_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "7";
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Green;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkaug_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "8";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Green;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnksep_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "9";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Green;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkoct_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "10";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Green;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnknov_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "11";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Green;
    //        lnkdec.ForeColor = System.Drawing.Color.Black;
    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkdec_Click(object sender, EventArgs e)
    //{
    //    if (ddyear.SelectedItem.Text != "Year")
    //    {
    //        string year = ddyear.SelectedItem.Text;
    //        string lnk = "12";
    //        lnkjan.ForeColor = System.Drawing.Color.Black;
    //        lnkfeb.ForeColor = System.Drawing.Color.Black;
    //        lnkmar.ForeColor = System.Drawing.Color.Black;
    //        lnkapr.ForeColor = System.Drawing.Color.Black;
    //        lnkmay.ForeColor = System.Drawing.Color.Black;
    //        lnkjun.ForeColor = System.Drawing.Color.Black;
    //        lnkjul.ForeColor = System.Drawing.Color.Black;
    //        lnkaug.ForeColor = System.Drawing.Color.Black;
    //        lnksep.ForeColor = System.Drawing.Color.Black;
    //        lnkoct.ForeColor = System.Drawing.Color.Black;
    //        lnknov.ForeColor = System.Drawing.Color.Black;
    //        lnkdec.ForeColor = System.Drawing.Color.Green;

    //        emailid = Session["userid"].ToString();

    //        if (emailid == "accounts@1indus.com")
    //        {
    //            if (ddemp.SelectedItem.Text != "Select Employee")
    //            {
    //                string mail = Session["emailid"].ToString();
    //                Binddata1(lnk, year, mail);
    //            }
    //        }
    //        else
    //        {
    //            Binddata(lnk, year);
    //        }
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}

    protected void ddmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddyear.SelectedItem.Text != "Year")
        {
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;
            if (Session["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                emailid = Session["userid"].ToString();

                if (emailid == "accounts@1indus.com")
                {
                    if (ddemp.SelectedItem.Text != "Select Employee")
                    {
                        string mail = Session["emailid"].ToString();
                        Binddata1(lnk, year, mail);
                    }
                    else
                    {
                        ddmonth.SelectedIndex = -1;
                        string strscpt = "alert ('Please select Employee');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
                else
                {
                    Binddata(lnk, year);
                }
            }
        }
        else
        {
            ddmonth.SelectedIndex = -1;

            string strscpt = "alert ('Please select Year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void lnkleave_Click(object sender, EventArgs e)
    {
        Response.Redirect("Timesheet-Remarks.aspx");
    }

    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txtamount.Text = "";
        //txttotalwork.Text = "";
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            empdata.Visible = false;
            lbltotalwork.Visible = false;
            txttotalwork.Visible = false;
            lblam.Visible = false;
            txtamount.Visible = false;
            createtime.Visible = false;

            string id = ddemp.SelectedValue;
            SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["emailid"] = ds.Tables[0].Rows[0]["emailid"].ToString();
            }
        }
        else
        {
            GetEmpData();
        }
    }

    protected void lnkdownload_Click(object sender, EventArgs e)
    {
        if ((ddemp.SelectedItem.Text != "Select Employee") && (ddyear.SelectedItem.Text != "Year") && (ddmonth.SelectedItem.Text != "Month"))
        {
            string mail = Session["emailid"].ToString();
            string m = ddmonth.SelectedItem.Value;
            string year = ddyear.SelectedItem.Text;
          //  SqlDataAdapter cmd = new SqlDataAdapter("SELECT a.rsymbol,a.hrate,a.totalrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol FROM   IA_DailytimeSheet) a WHERE  a.email='" + mail + "' and a.month1 = '" + m + "' and a.year1='" + year + "' order by ddate desc", con);
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT a.empid as Employee_ID,a.empname as Employee_Name,a.email as Email_Id,a.ddate as Work_Date,a.intime as Work_In,a.intime1 as Lunch_Out,a.outtime as Lunch_In,a.lunch as Lunch_Time,a.outtime1 as Work_Out,a.hrate as Hour_Rate,a.remark1 as Leave,a.remarks as Remarks,a.month1 as Month,a.year1 as Year,a.worktime as Work_Hours,a.totalrate as Total_Amount FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol FROM   IA_DailytimeSheet) a WHERE  a.email='" + mail + "' and a.month1 = '" + m + "' and a.year1='" + year + "' order by ddate desc", con);

            DataSet ds = new DataSet();
            cmd.Fill(ds);

            DataTable dt = ds.Tables[0];
            DataTable dt1 = new DataTable();
            dt1 = dt;
            int sum1 = 0;

            double sum2 = 0.0;
            string ss = "";
            double sss = 0.0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strHr = dt.Rows[i][14].ToString();
                double totHrs = 0.0;
                if (strHr != null || strHr != "")
                {
                    totHrs = Convert.ToDouble(strHr) / 60;
                }
                SqlCommand cmdg = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                {
                    con.Open();
                    string result = Convert.ToString(cmdg.ExecuteScalar());
                    con.Close();
                    if (result == "   0H 00M")
                    {
                        dt1.Rows[i][14] = "0H 00M";
                    }
                    else
                    {
                        dt1.Rows[i][14] = result;
                    }
                }
                sum1 += Convert.ToInt32(strHr);

                string strRate = dt.Rows[i][15].ToString();
                if (strRate != null || strRate != "")
                {
                    if (dt.Rows[i]["Hour_Rate"].ToString() != null || dt.Rows[i]["Hour_Rate"].ToString() != "")
                    {
                        sss = Convert.ToDouble(dt.Rows[i]["Hour_Rate"].ToString()) * totHrs;
                        ss = Convert.ToString(sss);
                        ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        if (ss == "$0.00")
                        {
                            dt1.Rows[i][15] = "$00.00";
                        }
                        else
                        {
                            dt1.Rows[i][15] = ss;
                        }
                        sum2 += Convert.ToDouble(sss);

                    }
                }
            }
            
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "" + ddemp.SelectedItem.Text + ".xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;
            DataTable dt2 = dt1;
            foreach (DataColumn dtcol in dt2.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt2.Rows)
            {
                str = "";
                for (int j = 0; j < dt2.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
        else
        {
            string strscpt = "alert ('Please select Employee Name,Year and Month');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void ddyear_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddyear.SelectedItem.Text != "Year")
        {
            empdata.Visible = false;
            lbltotalwork.Visible = false;
            txttotalwork.Visible = false;
            lblam.Visible = false;
            txtamount.Visible = false;
            createtime.Visible = false;
         //   ddemp.SelectedIndex = -1;
            ddmonth.SelectedIndex = -1;
            Tr1.Visible = false;

        }
    }
}
