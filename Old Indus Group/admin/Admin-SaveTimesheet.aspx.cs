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
using System.Collections.Generic;
using System.Web.Configuration;

public partial class admin_Admin_SaveTimesheet : System.Web.UI.Page
{
    string uid = string.Empty;
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        txtin.Focus();
        ccal.EndDate = DateTime.UtcNow.AddHours(-4);

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

            if (ddtype.SelectedItem.Text != "Select")
            {
                lunch1.Visible = false;
                lunch2.Visible = false;
                lunch3.Visible = false;
                lunch4.Visible = false;
                if (ddtype.SelectedItem.Text == "Leave")
                {
                    leave.Visible = true;
                    noleave.Visible = false;

                }
                else
                {
                    leave.Visible = false;
                    noleave.Visible = true;

                }
            }
            else
            {
                lunch1.Visible = true;
                lunch2.Visible = true;
                lunch3.Visible = true;
                lunch4.Visible = true;

                leave.Visible = false;
                noleave.Visible = true;
            }


        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            if ((txtdate.Text != "")||(txtfrom.Text!=""))
            {
                string ddcont = Session["cont"].ToString();
                string rate = Session["rate"].ToString();
                string symbol = Session["symbol"].ToString();
           
                string name = ddemp.SelectedItem.Text;
                string empid = txtid.Text;
                string email = txtemail.Text;
                string wdate = txtdate.Text;

                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + wdate + "' and empemail='" + email + "'  ", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);
                if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
                {
                     string ltype = ddtype.SelectedItem.Text;
                     if (ltype == "Select")
                     {
                         string in1 = txtin.Text;
                         string out1 = txtout.Text;

                         string diff11 = ltxtin.Text;
                         string diff22 = txtout.Text;

                         string pdate = System.DateTime.Now.ToString();
                         DateTime d = new DateTime();
                         if (ddcont == "USA")
                         {
                             d = DateTime.UtcNow.AddHours(-4);
                         }
                         else
                         {
                             d = DateTime.UtcNow.AddMinutes(330);
                         }

                         //Calculated Work Time

                         string diff1 = ltxtout.Text;
                         string diff2 = txtin.Text;
                         DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                         DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                         TimeSpan ts = dt1.Subtract(dt2);
                         string dt3 = Convert.ToString(ts.TotalMinutes);
                         dt3 = dt3.Trim();
                         string in2 = ltxtin.Text;
                         string out2 = ltxtout.Text;
                         string work = dt3;
                         int st = 4;

                         if ((txtout.Text == "") && (ltxtin.Text == ""))
                         {
                             string lunch = "0Hours 0Minutes";
                             string a = "00:00";
                             con.Open();
                             string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,outtime,intime1,outtime1,lunch,hrate,rsymbol) values   ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','0','" + work + "','" + a + "','" + a + "','" + out2 + "','" + lunch + "','"+rate+"','"+symbol+"') ";
                             SqlCommand cmd = new SqlCommand(s, con);
                             int i = cmd.ExecuteNonQuery();
                             con.Close();
                             if (i == 1)
                             {
                                 string strscpt = "alert ('Data Saved');location.replace('Admin-Daily-Timesheet.aspx');";
                                 Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                             }
                         }

                         if ((txtout.Text != "") && (ltxtin.Text != "") && (txtin.Text != "") && (ltxtout.Text != ""))
                         {
                             DateTime dt11 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                             DateTime dt22 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                             TimeSpan ts1 = dt11.Subtract(dt22);
                             string dt33 = Convert.ToString(ts1.Hours + "Hours" + ts1.Minutes + "Minutes");
                             dt33 = dt33.Trim();
                             txtlunch.Text = dt33;

                             con.Open();
                             string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,intime,status,country,posteddate,worktime,outtime,intime1,outtime1,lunch,hrate,rsymbol) values   ('" + name + "','" + empid + "','" + email + "','" + wdate + "','" + in1 + "','" + st + "','" + ddcont + "','0','" + work + "','" + out1 + "','" + in2 + "','" + out2 + "','" + dt33 + "','" + rate + "','" + symbol + "') ";
                             SqlCommand cmd = new SqlCommand(s, con);
                             int i = cmd.ExecuteNonQuery();
                             con.Close();
                             if (i == 1)
                             {
                                 string strscpt = "alert ('Data Saved');location.replace('Admin-Daily-Timesheet.aspx');";
                                 Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                             }
                         }
                     }
                     else
                     {
                         string remark = ddtype.SelectedItem.Text;

                         if (ddtype.SelectedItem.Text == "Leave")
                         {

                             DateTime starting = new DateTime();
                             // starting=DateTime.ParseExact(datepicker.Value,"dd-MM-yyyy",null);

                             DateTime ending = new DateTime();
                             // ending=DateTime.ParseExact(date2.Value,"dd-MM-yyyy",null);

                             starting = Convert.ToDateTime(this.txtfrom.Text.Trim(), new CultureInfo("en-US"));
                             ending = Convert.ToDateTime(this.txtto.Text.Trim(), new CultureInfo("en-US"));

                             string starting1 = Convert.ToString(starting.ToString("MM-dd-yyyy"));
                             string ending1 = Convert.ToString(ending.ToString("MM-dd-yyyy"));


                             List<DateTime> allDates = new List<DateTime>();
                             for (DateTime date = Convert.ToDateTime(starting1); date <= Convert.ToDateTime(ending1); date = date.AddDays(1))
                             {
                                 string date1 = date.ToString("MM-dd-yyyy");
                                 SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + date1 + "' and empemail='" + email + "'  ", con);
                                 DataSet dssss1 = new DataSet();
                                 sdaaaaa1.Fill(dssss1);
                                 if (dssss1.Tables[0].Rows[0]["count"].ToString() == "0")
                                 {

                                     con.Open();
                                     string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,status,country,posteddate,remark1,worktime,intime,outtime,Lunch,intime1,outtime1,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + date1 + "','4','" + ddcont + "','0','" + remark + "','0','00:00','00:00','00:00','00:00','00:00','" + rate + "','" + symbol + "') ";
                                     SqlCommand cmd = new SqlCommand(s, con);
                                     int i = cmd.ExecuteNonQuery();
                                     con.Close();
                                     if (i == 1)
                                     {
                                         string strscpt = "alert ('Leave Details Saved');location.replace('Admin-Daily-Timesheet.aspx');";
                                         Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                     }
                                 }
                                 else
                                 {
                                     string strscpt = "alert ('The Given Date is filled');location.replace('Admin-SaveTimesheet.aspx');";
                                     Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                                     goto BREAK;

                                 }

                             }
                         BREAK: ;
                         }
                         else
                         {

                             con.Open();
                             string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,status,country,posteddate,remark1,worktime,intime,outtime,Lunch,intime1,outtime1,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + wdate + "','4','" + ddcont + "','0','" + remark + "','0','00:00','00:00','00:00','00:00','00:00','" + rate + "','" + symbol + "') ";
                             SqlCommand cmd = new SqlCommand(s, con);
                             int i = cmd.ExecuteNonQuery();
                             con.Close();
                             if (i == 1)
                             {
                                 string strscpt = "alert ('Leave Details Saved');location.replace('Admin-Daily-Timesheet.aspx');";
                                 Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                             }
                         }
                     }
                }
                else
                {
                    string strscpt = "alert ('Already given date is filled');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
            else
            {
                string strscpt = "alert ('Please Select Date ');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please Select Employee ');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
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
                txtid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                Session["cont"]=ds.Tables[0].Rows[0]["country1"].ToString();
                Session["symbol"] = ds.Tables[0].Rows[0]["ratesymbol"].ToString();
                Session["rate"] = ds.Tables[0].Rows[0]["hrate"].ToString();
            }
        }
    }

    protected void ddtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddtype.SelectedItem.Text != "Select")
        {
            lunch1.Visible = false;
            lunch2.Visible = false;
            lunch3.Visible = false;
            lunch4.Visible = false;
            if (ddtype.SelectedItem.Text == "Leave")
            {
                leave.Visible = true;
                noleave.Visible = false;

            }
            else
            {
                leave.Visible = false;
                noleave.Visible = true;

            }
        }
        else
        {
            lunch1.Visible = true;
            lunch2.Visible = true;
            lunch3.Visible = true;
            lunch4.Visible = true;

            leave.Visible = false;
            noleave.Visible = true;
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Daily-Timesheet.aspx");
    }
    protected void txtin_TextChanged(object sender, EventArgs e)
    {
        if (txtin.Text != "")
        {
            double value;
            value = Convert.ToDouble(txtin.Text);
            txtin.Text = value.ToString("00:00", CultureInfo.InvariantCulture);
        }
        ScriptManager.GetCurrent(this.Page).SetFocus(this.txtin);
        //txtin.Focus();
    }
    protected void txtout_TextChanged(object sender, EventArgs e)
    {
        if (txtout.Text != "")
        {
            double value;
            value = Convert.ToDouble(txtout.Text);
            txtout.Text = value.ToString("00:00", CultureInfo.InvariantCulture);
        }
    }
    protected void ltxtin_TextChanged(object sender, EventArgs e)
    {
        if (ltxtin.Text != "")
        {
            double value;
            value = Convert.ToDouble(ltxtin.Text);
            ltxtin.Text = value.ToString("00:00", CultureInfo.InvariantCulture);
        }
    }
    protected void ltxtout_TextChanged(object sender, EventArgs e)
    {
        if (ltxtout.Text != "")
        {
            double value;
            value = Convert.ToDouble(ltxtout.Text);
            ltxtout.Text = value.ToString("00:00", CultureInfo.InvariantCulture);
        }
    }
}