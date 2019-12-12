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
using System.Globalization;
using System.Web.Configuration;
using System.Text.RegularExpressions;


public partial class admin_Admin_Daily_Timesheet : System.Web.UI.Page
{
    string uid = string.Empty;
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (!IsPostBack)
        {
            //lbltime.Text = DateTime.UtcNow.AddHours(-4).ToString("MM-dd-yyyy HH:mm:ss");

            //if (string.IsNullOrEmpty(Request.QueryString["lnk"].ToString()) )
            //{
            //    string email = Request.QueryString["email"].ToString();
            //    string lnk = Request.QueryString["lnk"].ToString();
            //    string year = Request.QueryString["year"].ToString();

            //    string email1 = Findemail(email);
            //    Binddata(lnk, year, email1);
            //}
            //else
            //{

            //}

            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                GetEmpData();

                SqlDataAdapter da = new SqlDataAdapter("select lastname +' '+ firstname as name , * from employeereg1 where status=1 and empid like 'IGI%'  order by firstname asc", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddemp.DataTextField = "name";
                    ddemp.DataValueField = "userid";
                    ddemp.DataSource = ds;
                    ddemp.DataBind();
                    ddemp.Items.Insert(0, "Select Employee");
                }

        }
    }


    public void GetEmpData()
    {
      //  string result = "";

        SqlDataAdapter da = new SqlDataAdapter("select case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'None' end as Remarks,  hrate as totalrate,reason,* from IA_DailytimeSheet  order by did desc,ddate desc", con); //worktime as worktime1,
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            DataTable dt1 = new DataTable();
            dt1 = dt;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strHr = dt.Rows[i][13].ToString();
                double totHrs = 0.0;
                if (strHr != null || strHr != "")
                {
                    totHrs = Convert.ToDouble(strHr) / 60;
                }
                SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                {
                    con.Open();
                    string result = Convert.ToString(cmd.ExecuteScalar());
                    con.Close();
                    if (result == "   0H 00M")
                    {
                        dt1.Rows[i][13] = "0H 00M";
                    }
                    else
                    {
                        dt1.Rows[i][13] = result;
                    }
                }

                //SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con);
                //{
                //    int diftime = 0;

                //    if (Convert.ToInt32(strHr) > 480)
                //    {
                //        diftime = Convert.ToInt32(strHr) - 480;

                //        con.Open();
                //        string result1 = Convert.ToString(cmd.ExecuteScalar());
                //        con.Close();

                //        dt1.Rows[i][13] = "8H 00M";
                //        SqlCommand cmd1 = new SqlCommand("SELECT dbo.minutesToHHMM('" + diftime + "')", con);
                //        {
                //            con.Open();
                //            string result2 = Convert.ToString(cmd1.ExecuteScalar());
                //            con.Close();
                //            if (result2 == "   0H 00M")
                //            {
                //                dt1.Rows[i][2] = "NILL";
                //            }
                //            else
                //            {
                //                dt1.Rows[i][2] = result2;
                //            }
                //        }
                //    }
                //    else
                //    {
                //        con.Open();
                //        string result1 = Convert.ToString(cmd.ExecuteScalar());
                //        con.Close();
                //        if (result1 == "   0H 00M")
                //        {
                //            dt1.Rows[i][13] = "0H 00M";
                //        }
                //        else
                //        {
                //            dt1.Rows[i][13] = result1;
                //            dt1.Rows[i][2] = "NILL";
                //        }
                //    }
                //}

                string strRate = dt.Rows[i][18].ToString();
                if (strRate != null || strRate != "")
                {
                    if (dt.Rows[i]["hrate"].ToString() != null || dt.Rows[i]["hrate"].ToString() != "")
                    {
                        double sss = Convert.ToDouble(dt.Rows[i]["hrate"].ToString()) * totHrs;
                        string ss = Convert.ToString(sss);
                        ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        if (ss == "$0.00")
                        {
                            dt1.Rows[i][18] = "$00.00";
                        }
                        else
                        {
                            dt1.Rows[i][18] = ss;
                        }

                    }
                }
            }

            empdata.DataSource = dt1;
            empdata.DataBind();
            empdata.Visible = true;
            lbltotalwork.Visible = true;
            txttotalwork.Visible = true;
        }
        else
        {
            empdata.Visible = false;
            lbltotalwork.Visible = false;
            txttotalwork.Visible = false;
        }
    }

    protected void empdata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        empdata.PageIndex = e.NewPageIndex;
        GetEmpData();
    }
    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(empdata.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IA_DailytimeSheet where did=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('TImesheet Details has been deleted Successfully');location.replace('Admin-Daily-Timesheet.aspx');", true);
        }
    }

    protected void lnkeditrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(empdata.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IA_DailytimeSheet where did=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        string did = das.Tables[0].Rows[0]["did"].ToString();

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-Daily-EditTimesheet.aspx?did=" + did);
        }
        con.Close();
    }

    protected void lnkdelrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IA_DailytimeSheet where did=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('TImesheet Details has been deleted Successfully');location.replace('Admin-Daily-Timesheet.aspx');", true);
        }
    }

    protected void lnkeditrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IA_DailytimeSheet where did=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        string did = das.Tables[0].Rows[0]["did"].ToString();

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-Daily-EditTimesheet.aspx?did=" + did);
        }
        con.Close();
    }


    private void Binddata(string lnk, string year, string email)
    {
        string result = "";
        SqlDataAdapter sscmd = new SqlDataAdapter("SELECT a.rsymbol,a.hrate,a.totalrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.worktime1,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did,a.reason FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'None' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,worktime as worktime1,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, hrate as totalrate,hrate as hrate ,rsymbol as rsymbol,reason as reason FROM   IA_DailytimeSheet) a WHERE  a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "' order by ddate desc", con);
        DataSet das = new DataSet();
        sscmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            Session["advancemail"] = email;
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

            double totHrs = 0.0;
            string newstr = "";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strHr = dt.Rows[i][8].ToString();
                if (strHr != null || strHr != "")
                {
                    totHrs = Convert.ToDouble(strHr) / 60;
                }

                //   DateTime t1 = DateTime.Parse(dt.Rows[i][16].ToString());
                //   DateTime t2 = DateTime.Parse(dt.Rows[i][15].ToString());
                //if ((dt.Rows[i][16].ToString() != "") && (dt.Rows[i][16].ToString() != "00:00") && (dt.Rows[i][15].ToString() != "") && (dt.Rows[i][15].ToString() != "00:00"))
                //{

                //    string diff1 = dt.Rows[i][16].ToString();
                //    string diff2 = dt.Rows[i][15].ToString();
                //    DateTime dt13 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                //    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                //    TimeSpan ts = dt2.Subtract(dt13);
                //    string dt3 = Convert.ToString(ts.TotalMinutes);
                //    dt3 = dt3.Trim();

                //    int lunch1 = Convert.ToInt32(strHr) - Convert.ToInt32(dt3);

                //    strHr = Convert.ToString(lunch1);
                //}

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
                Label7.Text = "Total Extra Hours of the " + ddmonth.SelectedItem.Text + " Month :";
            }

        //    sum1 = sum1 - diftime1;


            SqlCommand cmd21 = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
            {
                con.Open();
                result21 = Convert.ToString(cmd21.ExecuteScalar());
                con.Close();
                TextBox1.Text = result21;
            }

            //double tot = 0.0;
            //double tot1 = 0.0;

            //double totHrs1 = Convert.ToDouble(diftime1) / 60;
            //tot = totHrs - totHrs1;
            //tot1 = Convert.ToDouble(dt.Rows[0]["totalrate"].ToString()) * totHrs1;
            //sum2 = sum2 - tot1;

            // string extamount=tot


            GridView1.DataSource = dt1;
            GridView1.DataBind();
            GridView1.Visible = true;

            Tr3.Visible = true;

            Label1.Visible = true;
            TextBox1.Visible = true;

            Label1.Text = "Total Work Hours of the " + ddmonth.SelectedItem.Text + "  Month :";

            Tr2.Visible = true;

            double s33 = 0.0;
            double monthbal = 0.0;

            SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select  a.month1,a.year1,a.empemail,a.cheque,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate) as month1, datepart(year,paiddate) as year1,round(advance,2) as advance1 , * from IG_DailyTimesheetDetails )a  where   a.empemail='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc  ", con);
            // SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select a.month1,a.year1,a.empemail,a.cheque,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,ddate) as month1, datepart(year,ddate) as year1, round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a     where   a.empemail='" + email + "'   order by did desc  ", con);
            DataSet dssss1 = new DataSet();
            sdaaaaa1.Fill(dssss1);
            if (dssss1.Tables[0].Rows.Count > 0)
            {
                divgrid1.Visible = true;
                stategrid.DataSource = dssss1;
                stategrid.DataBind();

                //SqlDataAdapter s = new SqlDataAdapter("select round(sum(advance),2) as advance1 from IG_DailyTimesheetDetails  where  empemail='" + email + "' and ptype='Advance'   ", con);
                //DataSet d = new DataSet();
                //s.Fill(d);
                //if (d.Tables[0].Rows.Count > 0)
                //{
                //s33 = Convert.ToDouble(d.Tables[0].Rows[0]["advance1"].ToString());
                //txttotaladvance.Text = s33.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                //txttotaladvance.Visible = true;
                //Label7.Visible = true;

                SqlDataAdapter su = new SqlDataAdapter(" select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" + email + "'  and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc     ", con);
                DataSet du = new DataSet();
                su.Fill(du);
                if (du.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < du.Tables[0].Rows.Count; i++)
                    {
                        monthbal += Convert.ToDouble(du.Tables[0].Rows[i]["advance1"].ToString());
                    }
                }
                else
                {

                }
            }

            else
            {
                divgrid1.Visible = false;
                //txttotaladvance.Visible = false;
                //Label7.Visible = false;
                txtcheque.Text = "";
                txtdis.Text = "";

                txtadvanceamount.Text = "";
                txtadvpaid.Text = "";
            }


            lblam.Visible = false;
            txtamount.Visible = false;
            txttotalwork.Visible = false;
            lbltotalwork.Visible = false;
            empdata.Visible = false;


            if (das.Tables[0].Rows[0]["worktime"].ToString() != "")
            {
                SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + sum1 + "')", con);
                {
                    con.Open();
                    TextBox1.Text = Convert.ToString(cmd.ExecuteScalar());
                    ss = Convert.ToString(sum2);
                    ss = sum2.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                    TextBox2.Text = Convert.ToString(ss);
                    con.Close();


                    double bal = 0.0;
                    if (sum2 > monthbal)
                    {
                        bal = sum2 - monthbal;
                        string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        txtbalance.Text = bal1;
                        Tr4.Visible = true;
                        Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                    }
                    else
                    {
                        bal = sum2 - monthbal;
                        string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        txtbalance.Text = bal1;
                        Tr4.Visible = true;
                        Label5.Text = "Employee to be paid for " + ddmonth.SelectedItem.Text + " month " + year;


                        int lnk1 = Convert.ToInt32(lnk);
                        int year1 = Convert.ToInt32(year);
                        DateTime dt231 = new DateTime(year1, lnk1, 1);

                        DateTime dayone = new DateTime(dt231.AddMonths(1).Year, dt231.AddMonths(1).Month, 1);

                        string presentdate = System.DateTime.Now.ToString("MM-dd-yyyy");
                        DateTime presentdate1 = Convert.ToDateTime(presentdate, new CultureInfo("en-US"));

                        DateTime enddate = dayone.AddDays(-1);
                        string starting11 = Convert.ToString(enddate.ToString("MM-dd-yyyy"));

                        DateTime starting111 = Convert.ToDateTime(starting11, new CultureInfo("en-US"));


                        if (presentdate1 >= starting111)
                        {
                            string starting1 = Convert.ToString(dayone.ToString("MM-dd-yyyy"));

                            SqlDataAdapter su = new SqlDataAdapter(" select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" + email + "' and a.paiddate='" + starting1 + "' order by did desc     ", con);
                            DataSet du = new DataSet();
                            su.Fill(du);
                            if (du.Tables[0].Rows.Count == 0)
                            {
                                //DateTime dCalcDate = dayone;
                                //dCalcDate = new DateTime(dCalcDate.Year, dCalcDate.Month, 1);


                                string od = Regex.Replace(Convert.ToString(bal), "-", "");
                                double od1 = Convert.ToDouble(od);

                                string ptype1 = "Advance";
                                string dis1 = "Previous Balance Forwarded to this month";

                                con.Open();
                                string s1 = "insert into IG_DailyTimesheetDetails(empemail,discription,advance,paiddate,totalamount,ptype) values('" + email + "','" + dis1 + "','" + od1 + "','" + starting1 + "','1','" + ptype1 + "') ";
                                SqlCommand cmd1 = new SqlCommand(s1, con);
                                int i1 = cmd1.ExecuteNonQuery();
                                con.Close();
                                if (i1 == 1)
                                {
                                    txtcheque.Text = "";
                                    txtdis.Text = "";
                                    txtadvanceamount.Text = "";
                                    txtadvpaid.Text = "";

                                    //  string strscpt1 = "alert ('Data Saved');";
                                    //  Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt1, true);
                                }
                            }
                        }
                    }
                    TextBox2.Visible = true;
                    Label2.Visible = true;

                    Label2.Text = "Total Amount of the " + ddmonth.SelectedItem.Text + "  Month :";

                    Tr1.Visible = true;
                    Tr5.Visible = true;
                }
            }
            else
            {
                lblam.Visible = false;
                txtamount.Visible = false;
                txttotalwork.Visible = false;
                lbltotalwork.Visible = false;
                Tr1.Visible = false;
                Tr5.Visible = false;

                Tr2.Visible = false;
            }
        }
        else
        {
            total.Visible = false;
            GetEmpData();
            GridView1.Visible = false;

            string strscpt = "alert ('No Records found on selected Month and year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void lnkdelrecordadvance(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(stategrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IG_DailyTimesheetDetails where did=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            string strscpt = "alert ('Data Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);

            double s33 = 0.0;
            double monthbal = 0.0;
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;

            SqlDataAdapter sdaaaaa1 = new SqlDataAdapter(" select  a.month1,a.year1,a.empemail,a.cheque,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate) as month1, datepart(year,paiddate) as year1, round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a  where    a.empemail='" + Session["advancemail"].ToString() + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'   order by did desc  ", con);
            DataSet dssss1 = new DataSet();
            sdaaaaa1.Fill(dssss1);
            if (dssss1.Tables[0].Rows.Count > 0)
            {
                divgrid1.Visible = true;
                stategrid.DataSource = dssss1;
                stategrid.DataBind();

                //SqlDataAdapter s2 = new SqlDataAdapter("select round (sum(advance),2) as advance1 from IG_DailyTimesheetDetails  where  empemail='" + Session["advancemail"].ToString() + "' and ptype='Advance'   ", con);
                //DataSet d = new DataSet();
                //s2.Fill(d);
                //if (d.Tables[0].Rows.Count > 0)
                //{
                    // s33 = Convert.ToDouble(d.Tables[0].Rows[0]["advance1"].ToString());
                    //txttotaladvance.Text = s33.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                    //txttotaladvance.Visible = true;
                    //Label7.Visible = true;

                    SqlDataAdapter su = new SqlDataAdapter(" select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" +  Session["advancemail"].ToString() + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc     ", con);
                    DataSet du = new DataSet();
                    su.Fill(du);
                    if (du.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < du.Tables[0].Rows.Count; i++)
                        {
                            monthbal += Convert.ToDouble(du.Tables[0].Rows[i]["advance1"].ToString());
                        }

                      //  textbox1.text = textbox1.text.replace("*","").replace("&","")

                        string cleartextbox=TextBox2.Text.Replace("$","");
                        double sum2 = Convert.ToDouble(cleartextbox);

                        double bal = 0.0;
                        if (sum2 > monthbal)
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                        }
                        else
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Employee to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                        }

                    }
                    else
                    {

                    }
                //}
                //else
                //{

                //}
            }

            else
            {
                divgrid1.Visible = false;
                //txttotaladvance.Visible = false;
                //Label7.Visible = false;
                txtcheque.Text = "";
                txtdis.Text = "";

                txtadvanceamount.Text = "";
                txtadvpaid.Text = "";

                string cleartextbox = TextBox2.Text.Replace("$", "");
                double sum2 = Convert.ToDouble(cleartextbox);

                double bal = 0.0;
                if (sum2 > monthbal)
                {
                    bal = sum2 - monthbal;
                    string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                    txtbalance.Text = bal1;
                    Tr4.Visible = true;
                    Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                }
            }
        }
    }

    protected void empdata_DataBound(object sender, EventArgs e)
    {
        string s11 = Session["UserName"].ToString();

        if (s11 == "HR")
        {
            empdata.Columns[15].Visible = false;
            empdata.Columns[16].Visible = false;
        }
    }

    protected void empdata_DataBound1(object sender, EventArgs e)
    {
        empdata.Visible = false;
        GridView1.Visible = true;
        string s11 = Session["UserName"].ToString();

        if (s11 == "HR")
        {
            GridView1.Columns[15].Visible = false;
            GridView1.Columns[16].Visible = false;
        }

    }

    protected void ddmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddyear.SelectedItem.Text != "Year")
        {
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;
            string email = ddemp.SelectedValue;


            if (ddemp.SelectedItem.Text != "Select Employee")
            {
                email = Findemail(email);
                Binddata(lnk, year, email);
            }
        }
        else
        {
            ddmonth.SelectedIndex = -1;
            string strscpt = "alert ('Please select Year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    private string Findemail(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["emailid"].ToString();
    }

    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            string id = ddemp.SelectedValue;
            SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["emailid"] = ds.Tables[0].Rows[0]["emailid"].ToString();
            }
            ddmonth.SelectedIndex = -1;
            ddyear.SelectedIndex = -1;
            total.Visible = false;
        }
    }

    protected void lnkviewall_Click(object sender, EventArgs e)
    {
        ddmonth.SelectedIndex = -1;
        ddemp.SelectedIndex = -1;
        ddyear.SelectedIndex = -1;
        total.Visible = false;
        GetEmpData();
    }

    protected void lnkold_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-SaveTimesheet.aspx");
    }

    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Create-User.aspx");
    }

    protected void Label1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dds.SelectedItem.Text == "USA")
        {
            Response.Redirect("Admin-Daily-Timesheet.aspx");
        }
        else
        {
            Response.Redirect("Admin-IndDaily-Timesheet.aspx");
        }
    }

    protected void btnpaid_Click(object sender, EventArgs e)
    {
        string email = ddemp.SelectedValue;

        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            email = Findemail(email);
        }
        string chque = txtcheque.Text;
        string dis = txtdis.Text;
        string advance = txtadvanceamount.Text;
        string paiddate = txtadvpaid.Text;
        string ptype = ddtype.SelectedItem.Text;

        con.Open();
        string s = "insert into IG_DailyTimesheetDetails(empemail,cheque,discription,advance,paiddate,totalamount,ptype) values('" + email + "','" + chque + "','" + dis + "','" + advance + "','" + paiddate + "','0','"+ptype+"') ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            txtcheque.Text = "";
            txtdis.Text = "";
            txtadvanceamount.Text = "";
            txtadvpaid.Text = "";

            string strscpt = "alert ('Data Saved');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);

            double s33 = 0.0;
            double monthbal = 0.0;
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;

            SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select a.month1,a.year1,a.empemail,a.cheque,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate) as month1, datepart(year,paiddate) as year1, round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a  where    a.empemail='" + email + "'  and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc  ", con);
            DataSet dssss1 = new DataSet();
            sdaaaaa1.Fill(dssss1);
            if (dssss1.Tables[0].Rows.Count > 0)
            {
                divgrid1.Visible = true;
                stategrid.DataSource = dssss1;
                stategrid.DataBind();

                //SqlDataAdapter s2 = new SqlDataAdapter("select round (sum(advance),2) as advance1 from IG_DailyTimesheetDetails  where  empemail='" + email + "' and ptype='Advance'   ", con);
                //DataSet d = new DataSet();
                //s2.Fill(d);
                //if (d.Tables[0].Rows.Count > 0)
                //{
                    // s33 = Convert.ToDouble(  d.Tables[0].Rows[0]["advance1"].ToString()); 
                    //txttotaladvance.Text = s33.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                    //txttotaladvance.Visible = true;
                    //Label7.Visible = true;

                //    SqlDataAdapter su = new SqlDataAdapter("select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" + email + "'  and a.month1 = '" + lnk + "' and a.year1='" + year + "' and ptype='Advance'  order by did desc     ", con);
                    SqlDataAdapter su = new SqlDataAdapter("select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" + email + "'  and a.month1 = '" + lnk + "' and a.year1='" + year + "'   order by did desc     ", con);

                    DataSet du = new DataSet();
                    su.Fill(du);
                    if (du.Tables[0].Rows.Count > 0)
                    {
                        for (int i1 = 0; i1 < du.Tables[0].Rows.Count; i1++)
                        {
                            //if (du.Tables[0].Rows[i1]["ptype"].ToString() == "Salary")
                            //{

                            //}
                            //else
                            //{
                            monthbal += Convert.ToDouble(du.Tables[0].Rows[i1]["advance1"].ToString());
                            // }
                        }

                        string cleartextbox = TextBox2.Text.Replace("$", "");
                        double sum2 = Convert.ToDouble(cleartextbox);

                        //double bal = sum2 - monthbal;
                        //string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                        //txtbalance.Text = bal1;
                        //Tr4.Visible = true;
                        //Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;

                        double bal = 0.0;
                        if (sum2 > monthbal)
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                        }
                        else
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Employee to be paid for " + ddmonth.SelectedItem.Text + " month " + year;

                            string od = Regex.Replace(Convert.ToString(bal), "-", "");
                            double od1 = Convert.ToDouble(od);

                            string ptype1 = "Advance";
                            string dis1 = "Previous Balance Forwarded to this month";

                            string pdate = paiddate;
                            DateTime d = Convert.ToDateTime(pdate);
                                d = DateTime.UtcNow.AddDays(1);
                                string starting1 = Convert.ToString(d.ToString("MM-dd-yyyy"));

                            con.Open();
                            string s1 = "insert into IG_DailyTimesheetDetails(empemail,cheque,discription,advance,paiddate,totalamount,ptype) values('" + email + "','" + chque + "','" + dis1 + "','" + od1 + "','" + starting1 + "','0','" + ptype1 + "') ";
                            SqlCommand cmd1 = new SqlCommand(s1, con);
                            int i1 = cmd1.ExecuteNonQuery();
                            con.Close();
                            if (i1 == 1)
                            {
                                txtcheque.Text = "";
                                txtdis.Text = ""; 
                                txtadvanceamount.Text = "";
                                txtadvpaid.Text = "";

                              //  string strscpt1 = "alert ('Data Saved');";
                              //  Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt1, true);
                            }
                        }

                    }
                    else
                    {

                    }
                //}
                //else
                //{
                   
                //}
            }

            else
            {
                divgrid1.Visible = false;
                //txttotaladvance.Visible = false;
                //Label7.Visible = false;
                txtcheque.Text = "";
                txtdis.Text = "";

                txtadvanceamount.Text = "";
                txtadvpaid.Text = "";
            }
        }
    }

    protected void lnkeditrecord5(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(stategrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_DailyTimesheetDetails where did=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        string did = das.Tables[0].Rows[0]["did"].ToString();
        Session["did"] = did;
        if (das.Tables[0].Rows.Count > 0)
        {
            txtcheque.Text = das.Tables[0].Rows[0]["cheque"].ToString();
            txtdis.Text = das.Tables[0].Rows[0]["discription"].ToString();
           // txtadvanceamount.Text = das.Tables[0].Rows[0]["advance"].ToString();
            txtadvanceamount.Text =            string.Format(CultureInfo.CurrentCulture, "{0:C}", double.Parse(das.Tables[0].Rows[0]["advance"].ToString()));
            txtadvpaid.Text = das.Tables[0].Rows[0]["paiddate"].ToString();

           // ddtype.SelectedItem.Text = das.Tables[0].Rows[0]["ptype"].ToString();
            ddtype.SelectedValue= das.Tables[0].Rows[0]["ptype"].ToString();

           // ddtype.Items.FindByText(das.Tables[0].Rows[0]["ptype"].ToString()).Selected = true;

            btnpaid.Visible = false;
            btnupdate.Visible = true;
            btncancel.Visible = true;

        }
        con.Close();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string did = Session["did"].ToString();
        string chque = txtcheque.Text;
        string dis = txtdis.Text;
        string advance = txtadvanceamount.Text;
        string paiddate = txtadvpaid.Text;
        string ptype = ddtype.SelectedItem.Text;

        con.Open();
        string s = "Update IG_DailyTimesheetDetails set cheque='" + chque + "',discription='" + dis + "',advance='" + advance + "',paiddate='" + paiddate + "',ptype='" + ptype + "' where did='" + did + "' ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            txtcheque.Text = "";
            txtdis.Text = "";
            txtadvanceamount.Text = "";
            txtadvpaid.Text = "";

            string strscpt = "alert ('Data Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            btnpaid.Visible = true;
            btnupdate.Visible = false;
            btncancel.Visible = false;
            double s33 = 0.0;
            double monthbal = 0.0;
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;

            SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select a.month1,a.year1,a.empemail,a.cheque,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate) as month1, datepart(year,paiddate) as year1, round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a  where    a.empemail='" + Session["advancemail"].ToString() + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc  ", con);
            DataSet dssss1 = new DataSet();
            sdaaaaa1.Fill(dssss1);
            if (dssss1.Tables[0].Rows.Count > 0)
            {
                divgrid1.Visible = true;
                stategrid.DataSource = dssss1;
                stategrid.DataBind();

                //SqlDataAdapter s2 = new SqlDataAdapter("select round (sum(advance),2) as advance1 from IG_DailyTimesheetDetails  where  empemail='" + Session["advancemail"].ToString() + "'  and ptype='Advance'  ", con);
                //DataSet d = new DataSet();
                //s2.Fill(d);
                //if (d.Tables[0].Rows.Count > 0)
                //{
                    //s33 = Convert.ToDouble(d.Tables[0].Rows[0]["advance1"].ToString());
                    //txttotaladvance.Text = s33.ToString("C", CultureInfo.GetCultureInfo("en-US"));

                    //txttotaladvance.Visible = true;
                    //Label7.Visible = true;

                    SqlDataAdapter su = new SqlDataAdapter("select  a.month1,a.year1,a.empemail,a.cheque,a.ddate,a.amount1,a.discription,a.did,a.advance1,a.paiddate,a.ptype from ( select DATEPART(month,paiddate)  as month1, datepart(year,paiddate) as year1, round(amount,2) as amount1,round(advance,2) as advance1 ,* from IG_DailyTimesheetDetails )a      where   a.empemail='" + Session["advancemail"].ToString() + "'  and a.month1 = '" + lnk + "' and a.year1='" + year + "'  order by did desc     ", con);
                    DataSet du = new DataSet();
                    su.Fill(du);
                    if (du.Tables[0].Rows.Count > 0)
                    {
                        for (int i1 = 0; i1 < du.Tables[0].Rows.Count; i1++)
                        {
                            monthbal += Convert.ToDouble(du.Tables[0].Rows[i1]["advance1"].ToString());
                        }
                        string cleartextbox = TextBox2.Text.Replace("$", "");
                        double sum2 = Convert.ToDouble(cleartextbox);

                        double bal = 0.0;
                        if (sum2 > monthbal)
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                        }
                        else
                        {
                            bal = sum2 - monthbal;
                            string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                            txtbalance.Text = bal1;
                            Tr4.Visible = true;
                            Label5.Text = "Employee to be paid for " + ddmonth.SelectedItem.Text + " month " + year;

                            string  od = Regex.Replace(Convert.ToString(bal),"-","");
                            double od1 = Convert.ToDouble(od);
                            string ptype1 = "Advance";
                            string dis1 = "Previous Balance Forwarded to this month";

                            string pdate = paiddate;
                            DateTime d = Convert.ToDateTime(pdate);
                            d = DateTime.UtcNow.AddDays(1);
                            string starting1 = Convert.ToString(d.ToString("MM-dd-yyyy"));

                            con.Open();
                            string s1 = "insert into IG_DailyTimesheetDetails(empemail,cheque,discription,advance,paiddate,totalamount,ptype) values('" +Session["advancemail"].ToString() +"','" + chque + "','" + dis1 + "','" + od1 + "','" + starting1 + "','0','" + ptype1 + "') ";
                            SqlCommand cmd1 = new SqlCommand(s1, con);
                            int i1 = cmd1.ExecuteNonQuery();
                            con.Close();
                            if (i1 == 1)
                            {
                                txtcheque.Text = "";
                                txtdis.Text = "";
                                txtadvanceamount.Text = "";
                                txtadvpaid.Text = "";

                                //  string strscpt1 = "alert ('Data Saved');";
                                //  Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt1, true);
                            }
                        }
                      
                    }
                    else
                    {

                    }
                //}
                //else
                //{

                //}
            }

            else
            {
                divgrid1.Visible = false;
                //txttotaladvance.Visible = false;
                //Label7.Visible = false;
                txtcheque.Text = "";
                txtdis.Text = "";

                txtadvanceamount.Text = "";
                txtadvpaid.Text = "";

                string cleartextbox = TextBox2.Text.Replace("$", "");
                double sum2 = Convert.ToDouble(cleartextbox);

                double bal = 0.0;
                if (sum2 > monthbal)
                {
                    bal = sum2 - monthbal;
                    string bal1 = bal.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                    txtbalance.Text = bal1;
                    Tr4.Visible = true;
                    Label5.Text = "Balance amount to be paid for " + ddmonth.SelectedItem.Text + " month " + year;
                }
            }
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtcheque.Text = "";
        txtdis.Text = "";
        txtadvanceamount.Text = "";
        txtadvpaid.Text = "";

        btnpaid.Visible = true;
        btnupdate.Visible = false;
        btncancel.Visible = false;
    }
}