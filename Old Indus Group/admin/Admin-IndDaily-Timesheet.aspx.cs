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

public partial class admin_Admin_IndDaily_Timesheet : System.Web.UI.Page
{
    string uid = string.Empty;
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);


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


            GetEmpData();
            SqlDataAdapter da = new SqlDataAdapter("select lastname +' '+ firstname as name , * from employeereg1 where status=1   order by firstname asc", con);
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
        else
            GetEmpData();
    }


    public void GetEmpData()
    {
        SqlDataAdapter da = new SqlDataAdapter("select case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,  mrate as totalrate,case remark1 when 'Leave' then '1' else 'NIL' end as remark2,* from IA_DailytimeSheet  order by ddate desc", con);
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

                SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con1);
                {
                    con1.Open();
                    string result = Convert.ToString(cmd.ExecuteScalar());
                    con1.Close();
                    if (result == "   0H 00M")
                    {
                        dt1.Rows[i][13] = "0H 00M";
                    }
                    else
                    {
                        dt1.Rows[i][13] = result;
                    }
                }

                //string strRate = dt.Rows[i][17].ToString();
                //if (strRate != null || strRate != "")
                //{
                //    if (dt.Rows[i]["mrate"].ToString() != null || dt.Rows[i]["mrate"].ToString() != "")
                //    {
                //        double sss = Convert.ToDouble(dt.Rows[i]["mrate"].ToString()) * totHrs;
                //        string ss = Convert.ToString(sss);

                //        ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                //        if (ss == "$0.00")
                //        {
                //            dt1.Rows[i][17] = "$00.00";
                //        }
                //        else
                //        {

                //            dt1.Rows[i][17] = ss;
                //        }
                //    }
                //}
            }

            empdata.DataSource = dt1;
            empdata.DataBind();
            empdata.Visible = true;
            lbltotalwork.Visible = true;
            txttotalwork.Visible = true;

            //lnkjan.ForeColor = System.Drawing.Color.Black;
            //lnkfeb.ForeColor = System.Drawing.Color.Black;
            //lnkmar.ForeColor = System.Drawing.Color.Black;
            //lnkapr.ForeColor = System.Drawing.Color.Black;
            //lnkmay.ForeColor = System.Drawing.Color.Black;
            //lnkjun.ForeColor = System.Drawing.Color.Black;
            //lnkjul.ForeColor = System.Drawing.Color.Black;
            //lnkaug.ForeColor = System.Drawing.Color.Black;
            //lnksep.ForeColor = System.Drawing.Color.Black;
            //lnkoct.ForeColor = System.Drawing.Color.Black;
            //lnknov.ForeColor = System.Drawing.Color.Black;
            //lnkdec.ForeColor = System.Drawing.Color.Black;
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
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('TImesheet Details has been deleted Successfully');location.replace('Admin-IndDaily-Timesheet.aspx');", true);
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
            Response.Redirect("Admin-IndDaily-EditTimesheet.aspx?did=" + did);
        }
        con.Close();
    }


    private void Binddata(string lnk, string year, string email)
    {
        string result = "";
        SqlDataAdapter sscmd = new SqlDataAdapter("SELECT a.remark2, a.rsymbol,a.mrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, mrate as totalrate,mrate as mrate ,rsymbol as rsymbol,case remark1 when 'Leave' then '1' else 'NIL' end as remark2 FROM   IA_DailytimeSheet) a WHERE  a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "' order by ddate desc", con);
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
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strHr = dt.Rows[i][8].ToString();
                double totHrs = 0.0;
                if (strHr != null || strHr != "")
                {
                    totHrs = Convert.ToDouble(strHr) / 60;
                }

                SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + strHr + "')", con1);
                {
                    con1.Open();
                    string result1 = Convert.ToString(cmd.ExecuteScalar());
                    con1.Close();
                    if (result == "   0H 00M")
                    {
                        dt1.Rows[i][8] = "0H 00M";
                    }
                    else
                    {
                        dt1.Rows[i][8] = result1;
                    }
                }

                sum1 += Convert.ToInt32(strHr);

                if (Convert.ToInt32(strHr) <= 480)
                {
                    sum1 += Convert.ToInt32(strHr);
                }
                else
                {
                    sum1 += Convert.ToInt32(480);
                }

                //string strRate = dt.Rows[i][1].ToString();
                //if (strRate != null || strRate != "")
                //{
                //    if (dt.Rows[i]["mrate"].ToString() != null || dt.Rows[i]["mrate"].ToString() != "")
                //    {
                //        sss = Convert.ToDouble(dt.Rows[i]["mrate"].ToString()) * totHrs;
                //        ss = Convert.ToString(sss);
                //        ss = sss.ToString("C", CultureInfo.GetCultureInfo("en-US"));
                //        dt1.Rows[i][1] = ss;
                //    }
                //}
                //sum2 += Convert.ToDouble(sss);
            }

            empdata.DataSource = dt1;
            empdata.DataBind();
            empdata.Visible = true;
            lbltotalwork.Visible = true;
            txttotalwork.Visible = true;

            int m = Convert.ToInt32(lnk);
            int y = Convert.ToInt32(year);
            int days = DateTime.DaysInMonth(y, m);

            if (das.Tables[0].Rows[0]["worktime"].ToString() != "")
            {

                SqlCommand cmd = new SqlCommand(" select count(*)  as work  from(SELECT a.remark2, a.rsymbol,a.mrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, mrate as totalrate,mrate as mrate ,rsymbol as rsymbol,case remark1 when 'Leave' then '1' else 'NIL' end as remark2 FROM   IA_DailytimeSheet) a WHERE  a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  and status=4 aND   remark2 = 'NIL'  )b", con);
                {
                    con.Open();
                    txttotalwork.Text = Convert.ToString(cmd.ExecuteScalar());
                    txttotalwork.Visible = true;
                    lbltotalwork.Visible = true;
                    con.Close();
                }
                SqlCommand cmd1 = new SqlCommand("  select count(b.remark2)  as leaves  from(SELECT a.remark2, a.rsymbol,a.mrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, mrate as totalrate,mrate as mrate ,rsymbol as rsymbol,case remark1 when 'Leave' then '1' else 'NIL' end as remark2 FROM   IA_DailytimeSheet) a WHERE a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  and a.remark2 not in('NIL') )b  ", con);
                {
                    con.Open();
                    txtamount.Text = Convert.ToString(cmd1.ExecuteScalar());
                    txtamount.Visible = true;
                    lblam.Visible = true;
                    con.Close();
                }


                double totHrs1 = sum1 / 60;
                double day1 = Convert.ToDouble(das.Tables[0].Rows[0]["mrate"].ToString()) / days;
                double minsal = day1 / 480;
                txtsal.Text = "Rs . " + Math.Round((minsal * sum1), 2);

                int leaves1 = Convert.ToInt32(txttotalwork.Text) + Convert.ToInt32(txtamount.Text);
                //int tdays = days - leaves1;
                //// int workdays = ((Convert.ToInt32(das.Tables[0].Rows[0]["mrate"].ToString()) / days) * Convert.ToInt32(txttotalwork.Text)) - ((Convert.ToInt32(das.Tables[0].Rows[0]["mrate"].ToString()) / days) * (Convert.ToInt32(txtamount.Text)));
                double workdays = (Convert.ToDouble(das.Tables[0].Rows[0]["mrate"].ToString()) / days) * Convert.ToDouble(txttotalwork.Text);

                lblsal.Visible = true;
                txtsal.Visible = true;

                //string ename = das.Tables[0].Rows[0]["empname"].ToString();
                //string eemail = das.Tables[0].Rows[0]["email"].ToString();
                //string emonth = lnk;
                //string eyear = year;
                //string ewdays = txttotalwork.Text;
                //string eldays = txtamount.Text;
                //string etdays = Convert.ToString(leaves1);
                //string esal = das.Tables[0].Rows[0]["mrate"].ToString();
                //string egsal = Convert.ToString(workdays);


                //SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from Ind_EmpSal where  eemail='" + eemail + "' and smonth='" + lnk + "' and syear='" + year + "' and status=1", con);
                //DataSet dssss = new DataSet();
                //sdaaaaa.Fill(dssss);

                //if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
                //{
                //    con.Open();
                //    string s = "insert into Ind_EmpSal(EName,Eemail,smonth,syear,wdays,ldays,tdays,salary,gainsal,status) values ('" + ename + "','" + eemail + "','" + emonth + "','" + eyear + "','" + ewdays + "','" + eldays + "','" + etdays + "','" + esal + "','" + egsal + "','1') ";
                //    SqlCommand cmd3 = new SqlCommand(s, con);
                //    int i = cmd3.ExecuteNonQuery();
                //    con.Close();
                //    if (i == 1)
                //    {

                //    }
                //}
                //else
                //{
                //    con.Open();
                //    string s = "update Ind_EmpSal set EName='" + ename + "',Eemail='" + eemail + "',smonth='" + emonth + "',syear='" + eyear + "',wdays='" + ewdays + "',ldays='" + eldays + "',tdays='" + etdays + "',gainsal='" + egsal + "' where  where  eemail='" + eemail + "' and smonth='" + lnk + "' and syear='" + year + "'";
                //    SqlCommand cmd3 = new SqlCommand(s, con);
                //    int i = cmd3.ExecuteNonQuery();
                //    con.Close();
                //    if (i == 1)
                //    {

                //    }
                //}
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
            total.Visible = false;
            GetEmpData();
            string strscpt = "alert ('No Records found on selected Month and year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
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

    protected void empdata_DataBound(object sender, EventArgs e)
    {
        string result = "";
        string s11 = Session["UserName"].ToString();

        if (s11 == "Accounts")
        {
            empdata.Columns[14].Visible = false;
            empdata.Columns[15].Visible = false;
        }
    }

    //protected void lnkjan_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    
    //protected void lnkfeb_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkmar_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkapr_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkmay_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkjun_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkjul_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkaug_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnksep_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkoct_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnknov_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";

    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}
    //protected void lnkdec_Click(object sender, EventArgs e)
    //{
    //    if ((ddyear.SelectedItem.Text != "Year") && (ddemp.SelectedItem.Text != "Select Employee"))
    //    {
    //        string email = ddemp.SelectedValue;
    //        email = Findemail(email);
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

    //        Binddata(lnk, year, email);
    //    }
    //    else
    //    {
    //        string strscpt = "alert ('Please select Year and Employee Name');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //    }
    //}

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
        Response.Redirect("Admin-IndSaveTimesheet.aspx");
    }

    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-IndCreate-User.aspx");
    }

    protected void Label1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dds.SelectedItem.Text == "India")
        {
            Response.Redirect("Admin-IndDaily-Timesheet.aspx");
        }
        else
        {
            Response.Redirect("Admin-Daily-Timesheet.aspx");
        }
    }
}