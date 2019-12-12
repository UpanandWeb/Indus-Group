﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_Admin_IndDaily_EditTimesheet : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);


    protected void Page_Load(object sender, EventArgs e)
    {
        ccal.EndDate = DateTime.UtcNow.AddHours(-4);
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            string id = Request.QueryString["did"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select  * from IA_DailytimeSheet where did='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtempname.Text = ds.Tables[0].Rows[0]["empname"].ToString();
                txtid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["empemail"].ToString();
                txtdate.Text = ds.Tables[0].Rows[0]["ddate"].ToString();
                txtin.Text = ds.Tables[0].Rows[0]["intime"].ToString();
                txtout.Text = ds.Tables[0].Rows[0]["outtime"].ToString();
                txtlunch.Text = ds.Tables[0].Rows[0]["lunch"].ToString();
                ltxtin.Text = ds.Tables[0].Rows[0]["intime1"].ToString();
                ltxtout.Text = ds.Tables[0].Rows[0]["outtime1"].ToString();

                if (ds.Tables[0].Rows[0]["remark1"].ToString() != "")
                {
                    lunch1.Visible = false;
                    lunch2.Visible = false;
                    lunch3.Visible = false;
                    lunch4.Visible = false;

                    ddtype.ClearSelection();
                    ddtype.Items.FindByText(ds.Tables[0].Rows[0]["remark1"].ToString()).Selected = true;

                }
                else
                {
                    lunch1.Visible = true;
                    lunch2.Visible = true;
                    lunch3.Visible = true;
                    lunch4.Visible = true;
                }

                SqlDataAdapter da1 = new SqlDataAdapter("select * from  IA_DailytimeSheet where did='" + id + "'", con);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    string total = ds1.Tables[0].Rows[0]["worktime"].ToString();

                    SqlCommand cmd = new SqlCommand("SELECT dbo.minutesToHHMM('" + total + "')", con1);
                    {
                        con1.Open();
                        txtworktime.Text = Convert.ToString(cmd.ExecuteScalar());
                        con1.Close();
                    }
                }
            }
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["did"].ToString();
        SqlDataAdapter sda32 = new SqlDataAdapter("select  * from IA_DailytimeSheet where did='" + id + "'  order by did desc", con);
        DataSet ds = new DataSet();
        sda32.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {

        }
        string ddcont = ds.Tables[0].Rows[0]["country"].ToString();
        string email = ds.Tables[0].Rows[0]["empemail"].ToString();
        string olddate = ds.Tables[0].Rows[0]["ddate"].ToString();

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
        string dddate = txtdate.Text;

        string s = "";

        if (ddtype.SelectedItem.Text != "Select")
        {
            string tpe = ddtype.SelectedItem.Text;
            s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='00:00', outtime='00:00',lunch='00:00',intime1='00:00',outtime1='00:00',worktime='0',status='4',posteddate='0',remark1='" + ddtype.SelectedItem.Text + "' where did='" + id + "' ";
            con.Open();
            SqlCommand cmd = new SqlCommand(s, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                string strscpt = "alert ('Details Updated and Mail Sent Successfully to HR');location.replace('Admin-IndDaily-Timesheet.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {

            if ((txtin.Text != "") && (txtout.Text == "") && (ltxtin.Text == "") && (ltxtout.Text == ""))
            {
                s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='" + txtin.Text + "', outtime='00:00',lunch='00:00',intime1='00:00',outtime1='00:00',worktime='0',status='1',posteddate='1' where did='" + id + "' ";
            }

            if ((txtin.Text != "") && (txtout.Text == "") && (ltxtin.Text == "") && (ltxtout.Text != ""))
            {
                //Calculated Work Time
                string diff1 = ltxtout.Text;
                string diff2 = txtin.Text;
                //DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                //DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                //TimeSpan ts = dt1.Subtract(dt2);
                //string dt3 = Convert.ToString(ts.TotalMinutes);
                //dt3 = dt3.Trim();

                string d1 = diff1.Substring(0, 2);
                int d2 = Convert.ToInt32(d1);

                string d3 = diff2.Substring(3, 2);
                int d4 = Convert.ToInt32(d3);

                string dt3 = "";

                if ((d2 < 23) && (d4 < 59))
                {
                    DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                    dt1 = dt1.AddDays(1);
                    TimeSpan ts = dt1.Subtract(dt2);
                    dt3 = Convert.ToString(ts.TotalMinutes);
                    dt3 = dt3.Trim();
                }
                else
                {
                    DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                    TimeSpan ts = dt1.Subtract(dt2);
                    dt3 = Convert.ToString(ts.TotalMinutes);
                    dt3 = dt3.Trim();
                }


                string out1 = ltxtout.Text;
                string work = dt3;
                s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='" + txtin.Text + "',outtime='00:00',lunch='00:00',intime1='00:00',outtime1='" + out1 + "',worktime='" + work + "',status='4',posteddate='0' where did='" + id + "' ";
            }

            if ((txtin.Text != "") && (txtout.Text != "") && (ltxtin.Text != "") && (ltxtout.Text == ""))
            {
                string diff11 = ltxtin.Text;
                string diff22 = txtout.Text;
                DateTime dt11 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                DateTime dt22 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                TimeSpan ts1 = dt11.Subtract(dt22);


                string dt33 = Convert.ToString(ts1.Hours + "Hours" + ts1.Minutes + "Minutes");
                dt33 = dt33.Trim();

                //string d1 = diff11.Substring(0, 2);
                //int d2 = Convert.ToInt32(d1);

                //string d3 = diff22.Substring(3, 2);
                //int d4 = Convert.ToInt32(d3);

                //string dt3 = ""; 

                //if ((d2 < 23) && (d4 < 59))
                //{
                //    DateTime dt1 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                //    DateTime dt2 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                //    dt1 = dt1.AddDays(1);
                //    TimeSpan ts = dt1.Subtract(dt2);
                //    dt3 = Convert.ToString(ts.TotalMinutes);
                //    dt3 = dt3.Trim();
                //}
                //else
                //{
                //    DateTime dt1 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                //    DateTime dt2 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                //    TimeSpan ts = dt1.Subtract(dt2);
                //    dt3 = Convert.ToString(ts.TotalMinutes);
                //    dt3 = dt3.Trim();
                //}

                  
                s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='" + txtin.Text + "',outtime='" + txtout.Text + "',lunch='" + dt33 + "',intime1='" + diff11 + "',outtime1='00:00',worktime='0', status='3',posteddate='3' where did='" + id + "' ";
            }

            if ((txtin.Text != "") && (txtout.Text != "") && (ltxtin.Text == "") && (ltxtout.Text == ""))
            {
                s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='" + txtin.Text + "', outtime='" + txtout.Text + "',lunch='00:00',intime1='00:00',outtime1='00:00',worktime='0',status='2',posteddate='2' where did='" + id + "' ";
            }

            if ((ltxtout.Text != "") && (ltxtin.Text != "") && (txtout.Text != "") && (txtin.Text != ""))
            {
                string diff11 = ltxtin.Text;
                string diff22 = txtout.Text;
                //DateTime dt11 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                //DateTime dt22 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                //TimeSpan ts1 = dt11.Subtract(dt22);
                //string dt33 = Convert.ToString(ts1.Hours + "Hours" + ts1.Minutes + "Minutes");
                //dt33 = dt33.Trim();

                string d11 = diff11.Substring(0, 2);
                int d21 = Convert.ToInt32(d11);

                string d31 = diff22.Substring(3, 2);
                int d41 = Convert.ToInt32(d31);

                string dt33 = "";
                string dt331 = "";


                if ((d21 < 23) && (d41 < 59))
                {
                    DateTime dt1 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                    dt1 = dt1.AddDays(1);
                    TimeSpan ts = dt1.Subtract(dt2);
                    dt33 = Convert.ToString(ts.TotalMinutes);
                     dt331 = Convert.ToString(ts.Hours + "Hours" + ts.Minutes + "Minutes");
                   // dt33 = dt33.Trim();
                }
                else
                {
                    DateTime dt1 = DateTime.ParseExact(diff11, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff22, "HH:mm", new DateTimeFormatInfo());
                    TimeSpan ts = dt1.Subtract(dt2);
                    dt33 = Convert.ToString(ts.TotalMinutes);
                     dt331 = Convert.ToString(ts.Hours + "Hours" + ts.Minutes + "Minutes");

                   // dt33 = dt33.Trim();
                }

                string diff1 = ltxtout.Text;
                string diff2 = txtin.Text;
                //DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                //DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                //TimeSpan ts = dt1.Subtract(dt2);
                //string dt3 = Convert.ToString(ts.TotalMinutes);
                //dt3 = dt3.Trim();

                string d1 = diff1.Substring(0, 2);
                int d2 = Convert.ToInt32(d1);

                string d3 = diff2.Substring(3, 2);
                int d4 = Convert.ToInt32(d3);

                string dt3 = "";

                if ((d2 < 23) && (d4 < 59))
                {
                    DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                    dt1 = dt1.AddDays(1);
                    TimeSpan ts1 = dt1.Subtract(dt2);
                    dt3 = Convert.ToString(ts1.TotalMinutes);
                    dt3 = dt3.Trim();
                }
                else
                {
                    DateTime dt1 = DateTime.ParseExact(diff1, "HH:mm", new DateTimeFormatInfo());
                    DateTime dt2 = DateTime.ParseExact(diff2, "HH:mm", new DateTimeFormatInfo());
                    TimeSpan ts1 = dt1.Subtract(dt2);
                    dt3 = Convert.ToString(ts1.TotalMinutes);
                    dt3 = dt3.Trim();
                }

                string out1 = ltxtout.Text;
                string work = dt3;

                int a = Convert.ToInt32(work) - Convert.ToInt32(dt33);
                work = Convert.ToString(a);

                s = "update  IA_DailytimeSheet  set ddate='" + dddate + "',intime='" + txtin.Text + "', outtime='" + txtout.Text + "',lunch='" + dt331 + "',intime1='" + diff11 + "',outtime1='" + out1 + "',worktime='" + work + "',status='4',posteddate='0',remark1=NULL where did='" + id + "' ";
            }


            con.Open();
            SqlCommand cmd = new SqlCommand(s, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                string strscpt = "alert ('Work time Updated and Mail Sent Successfully to HR');location.replace('Admin-IndDaily-Timesheet.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-IndDaily-Timesheet.aspx");
    }


    protected void txtdate_TextChanged(object sender, EventArgs e)
    {
        string email = txtemail.Text;
        string dddate = txtdate.Text;

        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + dddate + "' and empemail='" + email + "'  ", con);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if ((dssss.Tables[0].Rows[0]["count"].ToString() == "0"))
        {

        }
        else
        {
            string strscpt = "alert ('Already given date is filled');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
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
        }
        else
        {
            lunch1.Visible = true;
            lunch2.Visible = true;
            lunch3.Visible = true;
            lunch4.Visible = true;
        }
    }
}