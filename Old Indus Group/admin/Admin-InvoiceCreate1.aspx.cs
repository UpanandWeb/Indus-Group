using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

public partial class admin_Admin_InvoiceCreate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string uid;
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

            if (Request.QueryString["sno"] != null)
            {
                uid = Request.QueryString["sno"].ToString();
                if (uid != "")
                {
                    string empid = "";
                    SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ddtype.SelectedItem.Text = ds.Tables[0].Rows[0]["ctype"].ToString();
                        txtcompany.Text = ds.Tables[0].Rows[0]["cname"].ToString();
                        txtempname.Text = ds.Tables[0].Rows[0]["efname"].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0]["elname"].ToString();
                        ddtimesheet.SelectedItem.Text = ds.Tables[0].Rows[0]["timesheet"].ToString();
                        ddinvoice.SelectedItem.Text = ds.Tables[0].Rows[0]["invoice"].ToString();
                        ddrid.SelectedItem.Text = ds.Tables[0].Rows[0]["rinvoiceduration"].ToString();
                        txtinvoicedate.SelectedItem.Text = ds.Tables[0].Rows[0]["invoicedates"].ToString();
                        txtfrom.Text = ds.Tables[0].Rows[0]["invoiceperiod"].ToString();
                        txtto.Text = ds.Tables[0].Rows[0]["invoiceperiod1"].ToString();
                        empid = ds.Tables[0].Rows[0]["emp_id"].ToString();


                      //  tstxtfrom.Text = ds.Tables[0].Rows[0]["tspendingperiod"].ToString();
                      //  tstxtto.Text = ds.Tables[0].Rows[0]["tspendingperiod1"].ToString();

                        System.Globalization.Calendar calendar = CultureInfo.CurrentCulture.Calendar;
                        DateTime datevalue = (Convert.ToDateTime(txtfrom.Text.ToString()));

                        string dy = datevalue.Day.ToString();
                        string mn = datevalue.Month.ToString();
                        string yy = datevalue.Year.ToString();

                        int yr = Convert.ToInt32(yy);
                        int month = Convert.ToInt32(mn);
                        int day2 = Convert.ToInt32(dy);


                        DateTime datevalueto = (Convert.ToDateTime(txtto.Text.ToString()));
                        string mn1 = datevalueto.Month.ToString();
                        string yy1 = datevalueto.Year.ToString();
                        string dd1 = datevalueto.Day.ToString();

                        int yr1 = Convert.ToInt32(yy1);
                        int month1 = Convert.ToInt32(mn1);
                        int day1 = Convert.ToInt32(dd1);


                        if (mn == mn1)
                        {
                            IEnumerable<int> daysInMonth = Enumerable.Range(1, calendar.GetDaysInMonth(yr, month));

                            List<Tuple<DateTime, DateTime>> weeks = daysInMonth.Select(day => new DateTime(yr, month, day).Date)
                                .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                                .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                                .ToList();
                            weeks.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            for (int i = 0; i < weeks.Count; i++)
                            {
                                tstxtfrom.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());
                            }


                            if (mn1 == "1")
                            {
                                mn1 = "January";
                            }
                            if (mn1 == "2")
                            {
                                mn1 = "February";
                            }
                            if (mn1 == "3")
                            {
                                mn1 = "March";
                            }
                            if (mn1 == "4")
                            {
                                mn1 = "April";
                            }
                            if (mn1 == "5")
                            {
                                mn1 = "May";
                            }
                            if (mn1 == "6")
                            {
                                mn1 = "June";
                            }
                            if (mn1 == "7")
                            {
                                mn1 = "July";
                            }
                            if (mn1 == "8")
                            {
                                mn1 = "August";
                            }
                            if (mn1 == "9")
                            {
                                mn1 = "September";
                            }
                            if (mn1 == "10")
                            {
                                mn1 = "October";
                            }
                            if (mn1 == "11")
                            {
                                mn1 = "November";
                            }
                            if (mn1 == "12")
                            {
                                mn1 = "December";
                            }

                            string year = yy1;
                            string str1 = mn1.Substring(0, 3);

                            string qry = empid + "-" + str1 + "-" + year;

                            DataSet ds1 = new DataSet();
                            SqlDataAdapter sqlda1 = new SqlDataAdapter(" select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where month_year = '" + qry + "'", con);
                            sqlda1.Fill(ds1);
                            if (ds1.Tables[0].Rows.Count > 0)
                            {
                                divgrid1.Visible = true;
                                GridView1.DataSource = ds1;
                                GridView1.DataBind();
                            }
                            else
                            {
                                divgrid1.Visible = false;
                            }
                        }
                        else
                        {
                            //DateTime from=Convert.ToDateTime(txtfrom.Text);
                            //DateTime to = Convert.ToDateTime(txtto.Text);

                            //TimeSpan interval = to - from;

                            //int totalWeek = interval.Days / 7;
                            //int totalWorkingDays = 5 * totalWeek;

                            //int remainingDays = interval.Days % 7;


                            //for (int i = 0; i <= remainingDays; i++)
                            //{
                            //    DayOfWeek test = (DayOfWeek)(((int)from.DayOfWeek + i) % 7);
                            //    if (test >= DayOfWeek.Monday && test <= DayOfWeek.Friday)
                            //        totalWorkingDays++;
                            //}

                            ////return totalWorkingDays;

                            //totalWorkingDays.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            //for (int i = 0; i < weeks.Count; i++)
                            //{
                            //    tstxtfrom.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());
                            //}

                            //IEnumerable<int> daysInMonth = Enumerable.Range(1, calendar.GetDaysInMonth(yr, month));

                            //List<Tuple<DateTime, DateTime>> weeks = daysInMonth.Select(day => new DateTime(yr, month, day2).Date)
                            //    .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                            //    .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                            //    .ToList();
                            //weeks.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            //for (int i = 0; i < weeks.Count; i++)
                            //{
                            //    tstxtfrom.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());
                            //}

                            //IEnumerable<int> daysInMonth1 = Enumerable.Range(1, calendar.GetDaysInMonth(yr1, month1));

                            //List<Tuple<DateTime, DateTime>> weeks1 = daysInMonth1.Select(day => new DateTime(yr1, month1, day1).Date)
                            //    .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                            //    .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                            //    .ToList();
                            //weeks1.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            //for (int i = 0; i < weeks1.Count; i++)
                            //{
                            //    tstxtfrom.Items.Add(weeks1[i].Item1.ToShortDateString() + "-" + weeks1[i].Item2.ToShortDateString());
                            //}

                            IEnumerable<int> daysInMonth = Enumerable.Range(1, calendar.GetDaysInMonth(yr, month));

                            List<Tuple<DateTime, DateTime>> weeks = daysInMonth.Select(day => new DateTime(yr, month, day).Date)
                                .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                                .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                                .ToList();
                            weeks.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            for (int i = 0; i < weeks.Count; i++)
                            {
                                tstxtfrom.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());
                            }

                            IEnumerable<int> daysInMonth1 = Enumerable.Range(1, calendar.GetDaysInMonth(yr1, month1));

                            List<Tuple<DateTime, DateTime>> weeks1 = daysInMonth1.Select(day => new DateTime(yr1, month1, day).Date)
                                .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                                .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                                .ToList();
                            weeks1.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                            for (int i = 0; i < weeks1.Count; i++)
                            {
                                tstxtfrom.Items.Add(weeks1[i].Item1.ToShortDateString() + "-" + weeks1[i].Item2.ToShortDateString());
                            }
                        }

                        txtemail.Text = ds.Tables[0].Rows[0]["cemail"].ToString();
                        txtremarks.Text = ds.Tables[0].Rows[0]["remarks"].ToString();
                        txtidate.Text = ds.Tables[0].Rows[0]["idate"].ToString();
                        txtot.Text = ds.Tables[0].Rows[0]["ot"].ToString();
                        txtrate.Text = ds.Tables[0].Rows[0]["hrate"].ToString();

                        txtactualhours.Text = ds.Tables[0].Rows[0]["actualhours"].ToString();
                        txtothours.Text = ds.Tables[0].Rows[0]["othours"].ToString();

                        if (ds.Tables[0].Rows[0]["rinvoiceduration"].ToString() == "Other")
                        {
                            //visible1.Visible = true;
                            visible2.Visible = true;
                            txtoher1.Text = ds.Tables[0].Rows[0]["id1"].ToString();
                            txtoher2.Text = ds.Tables[0].Rows[0]["id2"].ToString();

                        }
                        if (ds.Tables[0].Rows[0]["invoicedates"].ToString() == "Other")
                        {
                          //  visible3.Visible = true;
                            visible4.Visible = true;
                            txtoher3.Text = ds.Tables[0].Rows[0]["id3"].ToString();
                            txtoher4.Text = ds.Tables[0].Rows[0]["id4"].ToString();
                        }

                        if (ds.Tables[0].Rows[0]["ipc1"].ToString() != "")
                        {
                            txtcolor1.Text = ds.Tables[0].Rows[0]["ipc1"].ToString();
                            txtcolor1.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["ipc1"].ToString());
                        }
                        else
                        {
                            txtcolor1.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["tspc1"].ToString() != "")
                        {
                            txtcolor2.Text = ds.Tables[0].Rows[0]["tspc1"].ToString();
                            txtcolor2.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["tspc1"].ToString());
                        }
                        else
                        {
                            txtcolor2.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["idc1"].ToString() != "")
                        {
                            txtcolor3.Text = ds.Tables[0].Rows[0]["idc1"].ToString();
                            txtcolor3.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["idc1"].ToString());
                        }
                        else
                        {
                            txtcolor3.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["remarcksc1"].ToString() != "")
                        {
                            txtcolor4.Text = ds.Tables[0].Rows[0]["remarcksc1"].ToString();
                            txtcolor4.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["remarcksc1"].ToString());
                        }
                        else
                        {
                            txtcolor4.ForeColor = System.Drawing.Color.Black;
                        }


                        //if (ds.Tables[0].Rows[0]["ipc"].ToString() == "1")
                        //{
                        //    ddipc.ClearSelection();
                        //    ddipc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddipc.ClearSelection();
                        //    ddipc.Items.FindByValue("2").Selected = true;
                        //}

                        //if (ds.Tables[0].Rows[0]["tspc"].ToString() == "1")
                        //{
                        //    ddtspc.ClearSelection();
                        //    ddtspc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddtspc.ClearSelection();
                        //    ddtspc.Items.FindByValue("2").Selected = true;
                        //}

                        //if (ds.Tables[0].Rows[0]["idc"].ToString() == "1")
                        //{
                        //    ddidc.ClearSelection();
                        //    ddidc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddidc.ClearSelection();
                        //    ddidc.Items.FindByValue("2").Selected = true;
                        //}
                        //if (ds.Tables[0].Rows[0]["remarcksc"].ToString() == "1")
                        //{
                        //    ddremarkc.ClearSelection();
                        //    ddremarkc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddremarkc.ClearSelection();
                        //    ddremarkc.Items.FindByValue("2").Selected = true;
                        //}

                        Button1.Visible = true;
                        btnsaveout.Visible = false;
                    }
                }
                else
                {
                    Button1.Visible = false;
                    btnsaveout.Visible = true;
                }
            }

            if (Request.QueryString["sno1"] != null)
            {
                uid = Request.QueryString["sno1"].ToString();
                if (uid != "")
                {
                    SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ddtype.SelectedItem.Text = ds.Tables[0].Rows[0]["ctype"].ToString();
                        txtcompany.Text = ds.Tables[0].Rows[0]["cname"].ToString();
                        txtempname.Text = ds.Tables[0].Rows[0]["efname"].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0]["elname"].ToString();
                        ddtimesheet.SelectedItem.Text = ds.Tables[0].Rows[0]["timesheet"].ToString();
                        ddinvoice.SelectedItem.Text = ds.Tables[0].Rows[0]["invoice"].ToString();
                        ddrid.SelectedItem.Text = ds.Tables[0].Rows[0]["rinvoiceduration"].ToString();
                        txtinvoicedate.SelectedItem.Text = ds.Tables[0].Rows[0]["invoicedates"].ToString();
                        txtfrom.Text = ds.Tables[0].Rows[0]["invoiceperiod"].ToString();
                        txtto.Text = ds.Tables[0].Rows[0]["invoiceperiod1"].ToString();

                    //    tstxtfrom.Text = ds.Tables[0].Rows[0]["tspendingperiod"].ToString();
                       // tstxtto.Text = ds.Tables[0].Rows[0]["tspendingperiod1"].ToString();

                        System.Globalization.Calendar calendar = CultureInfo.CurrentCulture.Calendar;
                        DateTime datevalue = (Convert.ToDateTime(txtfrom.Text.ToString()));

                        string dy = datevalue.Day.ToString();
                        string mn = datevalue.Month.ToString();
                        string yy = datevalue.Year.ToString();

                        int yr = Convert.ToInt32(yy);
                        int month = Convert.ToInt32(mn);

                        IEnumerable<int> daysInMonth = Enumerable.Range(1, calendar.GetDaysInMonth(yr, month));

                        List<Tuple<DateTime, DateTime>> weeks = daysInMonth.Select(day => new DateTime(yr, month, day).Date)
                            .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
                            .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
                            .ToList();
                        weeks.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

                        for (int i = 0; i < weeks.Count; i++)
                        {
                            tstxtfrom.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());

                        }  

                        txtemail.Text = ds.Tables[0].Rows[0]["cemail"].ToString();
                        txtremarks.Text = ds.Tables[0].Rows[0]["remarks"].ToString();

                        txtidate.Text = ds.Tables[0].Rows[0]["idate"].ToString();
                        txtot.Text = ds.Tables[0].Rows[0]["ot"].ToString();
                        txtrate.Text = ds.Tables[0].Rows[0]["hrate"].ToString();

                        txtactualhours.Text = ds.Tables[0].Rows[0]["actualhours"].ToString();
                        txtothours.Text = ds.Tables[0].Rows[0]["othours"].ToString();

                        if (ds.Tables[0].Rows[0]["rinvoiceduration"].ToString() == "Other")
                        {
                         //   visible1.Visible = true;
                            visible2.Visible = true;
                            txtoher1.Text = ds.Tables[0].Rows[0]["id1"].ToString();
                            txtoher2.Text = ds.Tables[0].Rows[0]["id2"].ToString();

                        }
                        if (ds.Tables[0].Rows[0]["invoicedates"].ToString() == "Other")
                        {
                           // visible3.Visible = true;
                            visible4.Visible = true;
                            txtoher3.Text = ds.Tables[0].Rows[0]["id3"].ToString();
                            txtoher4.Text = ds.Tables[0].Rows[0]["id4"].ToString();
                        }

                        if (ds.Tables[0].Rows[0]["ipc1"].ToString() != "")
                        {
                            txtcolor1.Text = ds.Tables[0].Rows[0]["ipc1"].ToString();
                            txtcolor1.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["ipc1"].ToString());
                        }
                        else
                        {
                            txtcolor1.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["tspc1"].ToString() != "")
                        {
                            txtcolor2.Text = ds.Tables[0].Rows[0]["tspc1"].ToString();
                            txtcolor2.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["tspc1"].ToString());
                        }
                        else
                        {
                            txtcolor2.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["idc1"].ToString() != "")
                        {
                            txtcolor3.Text = ds.Tables[0].Rows[0]["idc1"].ToString();
                            txtcolor3.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["idc1"].ToString());
                        }
                        else
                        {
                            txtcolor3.ForeColor = System.Drawing.Color.Black;
                        }

                        if (ds.Tables[0].Rows[0]["remarcksc1"].ToString() != "")
                        {
                            txtcolor4.Text = ds.Tables[0].Rows[0]["remarcksc1"].ToString();
                            txtcolor4.BackColor = System.Drawing.ColorTranslator.FromHtml(ds.Tables[0].Rows[0]["remarcksc1"].ToString());
                        }
                        else
                        {
                            txtcolor4.ForeColor = System.Drawing.Color.Black;
                        }
                        //if (ds.Tables[0].Rows[0]["ipc"].ToString() == "1")
                        //{
                        //    ddipc.ClearSelection();
                        //    ddipc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddipc.ClearSelection();
                        //    ddipc.Items.FindByValue("2").Selected = true;
                        //}

                        //if (ds.Tables[0].Rows[0]["tspc"].ToString() == "1")
                        //{
                        //    ddtspc.ClearSelection();
                        //    ddtspc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddtspc.ClearSelection();
                        //    ddtspc.Items.FindByValue("2").Selected = true;
                        //}

                        //if (ds.Tables[0].Rows[0]["idc"].ToString() == "1")
                        //{
                        //    ddidc.ClearSelection();
                        //    ddidc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddidc.ClearSelection();
                        //    ddidc.Items.FindByValue("2").Selected = true;
                        //}
                        //if (ds.Tables[0].Rows[0]["remarcksc"].ToString() == "1")
                        //{
                        //    ddremarkc.ClearSelection();
                        //    ddremarkc.Items.FindByValue("1").Selected = true;
                        //}
                        //else
                        //{
                        //    ddremarkc.ClearSelection();
                        //    ddremarkc.Items.FindByValue("2").Selected = true;
                        //}

                        ddtype.Attributes.Add("disabled", "disabled");
                        txtcompany.Enabled = false;
                        txtempname.Enabled = false;

                        txtrate.Enabled = false;
                        txtot.Enabled = false;

                        txtoher1.Enabled = false;
                        txtoher2.Enabled = false;
                        txtoher3.Enabled = false;

                        txtoher4.Enabled = false;
                        txtlast.Enabled = false;
                        ddtimesheet.Attributes.Add("disabled", "disabled");
                        ddinvoice.Attributes.Add("disabled", "disabled");
                        ddrid.Attributes.Add("disabled", "disabled");
                        txtinvoicedate.Attributes.Add("disabled", "disabled");
                        //ddipc.Attributes.Add("disabled", "disabled");
                        //ddtspc.Attributes.Add("disabled", "disabled");
                        //ddidc.Attributes.Add("disabled", "disabled");
                        //ddremarkc.Attributes.Add("disabled", "disabled");
                        txtidate.Enabled = false;

                        txtfrom.Enabled = false;
                        txtto.Enabled = false;
                        tstxtfrom.Enabled = false;
                     //   tstxtto.Enabled = false;
                        txtemail.Enabled = false;
                        txtremarks.Enabled = false;

                        txtactualhours.Enabled = false;
                        txtothours.Enabled = false;

                        Button1.Visible = false;
                        btnsaveout.Visible = false;
                        btncancel.Visible = true;

                    }
                }
                else
                {
                    Button1.Visible = false;
                    btnsaveout.Visible = false;
                    btncancel.Visible = true;
                }
            }
        }
    }

    protected void btnsaveout_Click(object sender, EventArgs e)
    {
        string ctype = ddtype.SelectedItem.Text;
        string company = txtcompany.Text;
        string efname = txtempname.Text;
        string elname = txtlast.Text;
        string timesheet = ddtimesheet.SelectedItem.Text;
        string invoice = ddinvoice.SelectedItem.Text;
        string rid = ddrid.SelectedItem.Text;
        string invoicedae = txtinvoicedate.SelectedItem.Text;
		
		  string range = tstxtfrom.SelectedItem.Text;
                string[] temp = range.Split('-');
                DateTime week1 = Convert.ToDateTime(temp[0]);
                DateTime week2 = Convert.ToDateTime(temp[1]);

                string from2 = week1.ToString("MM/dd/yyyy");
                string to2 = week2.ToString("MM/dd/yyyy");
				
				
        string from1 = txtfrom.Text;
        string to1 = txtto.Text;
       // string from2 = tstxtfrom.Text;
      //  string to2 = tstxtto.Text;
        string email = txtemail.Text;
        string remarks = txtremarks.Text;
        string idate = txtidate.Text;
        string hrate = txtrate.Text;
        string ot = txtot.Text;

        string actualhours = txtactualhours.Text;
        string othours = txtothours.Text;


        int idc = 1;
        //if (ddidc.SelectedItem.Text == "Black")
        //{
        //    idc = 1;
        //}
        //else
        //{
        //    idc = 2;
        //}

        int tsrd = 1;
        //if (ddtspc.SelectedItem.Text == "Black")
        //{
        //    tsrd = 1;
        //}
        //else
        //{
        //    tsrd = 2;
        //}
        int idc1 = 1;
        //if (ddidc.SelectedItem.Text == "Black")
        //{
        //    idc1 = 1;
        //}
        //else
        //{
        //    idc1 = 2;
        //}

        int rc = 1;
        //if (ddremarkc.SelectedItem.Text == "Black")
        //{
        //    rc = 1;
        //}
        //else
        //{
        //    rc = 2;
        //}

        string nid = "";
        string nid1 = "";
        string nid2 = "";
        string nid3 = "";

        if (ddrid.SelectedItem.Text == "Other")
        {
            nid = txtoher1.Text;
            nid1 = txtoher2.Text;
        }


        if (txtinvoicedate.SelectedItem.Text == "Other")
        {
            nid2 = txtoher3.Text;
            nid3 = txtoher4.Text;
        }

        string date = DateTime.UtcNow.ToString("MM-dd-yyyy");
        con.Open();
        string s = "insert into IG_Invoice(ctype ,Cname ,efname,elname,timesheet,invoice,rinvoiceduration,invoicedates,invoiceperiod,invoiceperiod1 ,tspendingperiod,tspendingperiod1,remarks,status,pdate,cemail,idate,hrate,ipc,tspc,idc,remarcksc,ot,id1,id2,id3,id4,ipc1,tspc1,idc1,remarcksc1,actualhours,othours) values ('" + ctype + "','" + company + "','" + efname + "','" + elname + "', '" + timesheet + "','" + invoice + "','" + rid + "','" + invoicedae + "','" + from1 + "','" + to1 + "','" + from2 + "','" + to2 + "','" + remarks + "',1,'" + date + "','" + email + "','" + idate + "','" + hrate + "','" + idc + "','" + tsrd + "','" + idc1 + "','" + rc + "','" + ot + "','" + nid + "','" + nid1 + "','" + nid2 + "','" + nid3 + "','" + txtcolor1.Text + "','" + txtcolor2.Text + "','" + txtcolor3.Text + "','" + txtcolor4.Text + "','"+actualhours+"','"+othours+"') ";

      //  string s = "insert into IG_Invoice(ctype ,Cname ,efname,elname,timesheet,invoice,rinvoiceduration,invoicedates,invoiceperiod,invoiceperiod1 ,tspendingperiod,tspendingperiod1,remarks,status,pdate,cemail,idate,hrate,ipc,tspc,idc,remarcksc,ot,id1,id2,id3,id4) values ('" + ctype + "','" + company + "','" + efname + "','" + elname + "', '" + timesheet + "','" + invoice + "','" + rid + "','" + invoicedae + "','" + from1 + "','" + to1 + "','" + from2 + "','" + to2 + "','" + remarks + "',1,'" + date + "','" + email + "','" + idate + "','" + hrate + "','" + idc + "','" + tsrd + "','" + idc1 + "','" + rc + "','" + ot + "','" + nid + "','" + nid1 + "','" + nid2 + "','" + nid3 + "') ";
        //   string s = "insert into IG_Invoice(ctype ,Cname ,efname,elname,timesheet,invoice,rinvoiceduration,invoicedates,invoiceperiod,invoiceperiod1 ,tspendingperiod,tspendingperiod1,remarks,status,pdate,cemail,idate,ipc,tspc,idc,remarcksc) values ('" + ctype + "','" + company + "','" + efname + "','" + elname + "', '" + timesheet + "','" + invoice + "','" + rid + "','" + invoicedae + "','" + from1 + "','" + to1 + "','" + from2 + "','" + to2 + "','" + remarks + "',1,'" + date + "','" + email + "','" + idate + "','" + idc + "','" + tsrd + "','" + idc1 + "','" + rc + "') ";

        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string strscpt = "alert ('Invoice Details Saved');location.replace('Admin-Invoice.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Invoice.aspx");
    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Invoice.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        uid = Request.QueryString["sno"].ToString();

        SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string presentdate = System.DateTime.Now.ToString("MM-dd-yyyy");

            DateTime presentdate1 = Convert.ToDateTime(ds.Tables[0].Rows[0]["tspendingperiod"].ToString(), new CultureInfo("en-US"));

            DateTime enddate = Convert.ToDateTime( tstxtfrom.Text);
            string starting11 = Convert.ToString(enddate.ToString("MM-dd-yyyy"));

            DateTime starting111 = Convert.ToDateTime(starting11, new CultureInfo("en-US"));


            if (presentdate1 <= starting111)
            {
                string ctype = ds.Tables[0].Rows[0]["ctype"].ToString();
                string company = ds.Tables[0].Rows[0]["cname"].ToString();
                string efname = ds.Tables[0].Rows[0]["efname"].ToString();
                string elname = ds.Tables[0].Rows[0]["elname"].ToString();
                string timesheet = ds.Tables[0].Rows[0]["timesheet"].ToString();
                string invoice = ds.Tables[0].Rows[0]["invoice"].ToString();
                string rid = ds.Tables[0].Rows[0]["rinvoiceduration"].ToString();
                string invoicedae = ds.Tables[0].Rows[0]["invoicedates"].ToString();
                string from1 = ds.Tables[0].Rows[0]["invoiceperiod"].ToString();
                string to1 = ds.Tables[0].Rows[0]["invoiceperiod1"].ToString();

                string from2 = ds.Tables[0].Rows[0]["tspendingperiod"].ToString();
                string to2 = ds.Tables[0].Rows[0]["tspendingperiod1"].ToString();
                string email = ds.Tables[0].Rows[0]["cemail"].ToString();
                string remarks = ds.Tables[0].Rows[0]["remarks"].ToString();
                string idate = ds.Tables[0].Rows[0]["idate"].ToString();
                string hrate = ds.Tables[0].Rows[0]["hrate"].ToString();
                string ot = ds.Tables[0].Rows[0]["ot"].ToString();

                string actualhours = ds.Tables[0].Rows[0]["actualhours"].ToString();
                string othours = ds.Tables[0].Rows[0]["othours"].ToString();



                int idc = 1;
              
                int tsrd = 1;
               
                int idc1 = 1;
                
                int rc = 1;

                string nid = "";
                string nid1 = "";
                string nid2 = "";
                string nid3 = "";

                if (ddrid.SelectedItem.Text == "Other")
                {
                    nid = ds.Tables[0].Rows[0]["id1"].ToString();
                    nid1 = ds.Tables[0].Rows[0]["id2"].ToString();
                }


                if (txtinvoicedate.SelectedItem.Text == "Other")
                {
                    nid2 = ds.Tables[0].Rows[0]["id3"].ToString();
                    nid3 = ds.Tables[0].Rows[0]["id4"].ToString();
                }

                string range = tstxtfrom.SelectedItem.Text;
                string[] temp = range.Split('-');
                DateTime week1 = Convert.ToDateTime(temp[0]);
                DateTime week2 = Convert.ToDateTime(temp[1]);

                string finalweek = week1.ToString("MM/dd/yyyy");
                string finalweek2 = week2.ToString("MM/dd/yyyy");

                string date = DateTime.UtcNow.ToString("MM-dd-yyyy");
                con.Open();
                string s = "insert into IG_History_Invoice(sno,ctype ,Cname ,efname,elname,timesheet,invoice,rinvoiceduration,invoicedates,invoiceperiod,invoiceperiod1 ,tspendingperiod,tspendingperiod1,remarks,status,pdate,cemail,idate,hrate,ipc,tspc,idc,remarcksc,ot,id1,id2,id3,id4,ipc1,tspc1,idc1,remarcksc1,actualhours,othours,updateddate) values ('"+uid+"','" + ctype + "','" + company + "','" + efname + "','" + elname + "', '" + timesheet + "','" + invoice + "','" + rid + "','" + invoicedae + "','" + from1 + "','" + to1 + "','" + from2 + "','" + to2 + "','" + remarks + "',1,'" + date + "','" + email + "','" + idate + "','" + hrate + "','" + idc + "','" + tsrd + "','" + idc1 + "','" + rc + "','" + ot + "','" + nid + "','" + nid1 + "','" + nid2 + "','" + nid3 + "','" + txtcolor1.Text + "','" + txtcolor2.Text + "','" + txtcolor3.Text + "','" + txtcolor4.Text + "','" + actualhours + "','" + othours + "','"+presentdate+"') ";
                SqlCommand cmd = new SqlCommand(s, con);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    SqlCommand cmd1 = new SqlCommand("update IG_Invoice set ctype='" + ddtype.SelectedItem.Text + "',Cname='" + txtcompany.Text + "',efname='" + txtempname.Text + "', elname='" + txtlast.Text + "',timesheet='" + ddtimesheet.SelectedItem.Text + "',invoice='" + ddinvoice.SelectedItem.Text + "',rinvoiceduration='" + ddrid.SelectedItem.Text + "',        invoicedates='" + txtinvoicedate.SelectedItem.Text + "',invoiceperiod='" + txtfrom.Text + "',invoiceperiod1='" + txtto.Text + "',        tspendingperiod='" + finalweek + "',tspendingperiod1='" + finalweek2 + "',remarks='" + txtremarks.Text + "',cemail='" + txtemail.Text + "',idate='" + txtidate.Text + "',hrate='" + txtrate.Text + "',ipc1='" + txtcolor1.Text + "',tspc1='" + txtcolor2.Text + "',idc1='" + txtcolor3.Text + "',remarcksc1='" + txtcolor4.Text + "',ot='" + txtot.Text + "',id1='" + txtoher1.Text + "',id2='" + txtoher2.Text + "',id3='" + txtoher3.Text + "',id4='" + txtoher4.Text + "',actualhours='" + txtactualhours.Text + "',othours='" + txtothours.Text + "' where sno=" + uid + "", con);
                    con.Open();
                    int i1 = cmd1.ExecuteNonQuery();
                    con.Close();
                    if (i1 == 1)
                    {
                        string strscpt = "alert ('Invoice Details Saved');location.replace('Admin-Invoice.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
            }
            else
            {
				   string range = tstxtfrom.SelectedItem.Text;
                string[] temp = range.Split('-');
                DateTime week1 = Convert.ToDateTime(temp[0]);
                DateTime week2 = Convert.ToDateTime(temp[1]);

                string finalweek = week1.ToString("MM/dd/yyyy");
                string finalweek2 = week2.ToString("MM/dd/yyyy");

				
                SqlCommand cmd = new SqlCommand("update IG_Invoice set ctype='" + ddtype.SelectedItem.Text + "',Cname='" + txtcompany.Text + "',efname='" + txtempname.Text + "', elname='" + txtlast.Text + "',timesheet='" + ddtimesheet.SelectedItem.Text + "',invoice='" + ddinvoice.SelectedItem.Text + "',rinvoiceduration='" + ddrid.SelectedItem.Text + "',        invoicedates='" + txtinvoicedate.SelectedItem.Text + "',invoiceperiod='" + txtfrom.Text + "',invoiceperiod1='" + txtto.Text + "',        tspendingperiod='" + finalweek + "',tspendingperiod1='" + finalweek2 + "',remarks='" + txtremarks.Text + "',cemail='" + txtemail.Text + "',idate='" + txtidate.Text + "',hrate='" + txtrate.Text + "',ipc1='" + txtcolor1.Text + "',tspc1='" + txtcolor2.Text + "',idc1='" + txtcolor3.Text + "',remarcksc1='" + txtcolor4.Text + "',ot='" + txtot.Text + "',id1='" + txtoher1.Text + "',id2='" + txtoher2.Text + "',id3='" + txtoher3.Text + "',id4='" + txtoher4.Text + "',actualhours='" + txtactualhours.Text + "',othours='" + txtothours.Text + "' where sno=" + uid + "", con);

                //   SqlCommand cmd = new SqlCommand("update IG_Invoice set ctype='" + ddtype.SelectedItem.Text + "',Cname='" + txtcompany.Text + "',efname='" + txtempname.Text + "', elname='" + txtlast.Text + "',timesheet='" + ddtimesheet.SelectedItem.Text + "',invoice='" + ddinvoice.SelectedItem.Text + "',rinvoiceduration='" + ddrid.SelectedItem.Text + "',        invoicedates='" + txtinvoicedate.SelectedItem.Text + "',invoiceperiod='" + txtfrom.Text + "',invoiceperiod1='" + txtto.Text + "',        tspendingperiod='" + tstxtfrom.Text + "',tspendingperiod1='" + tstxtto.Text + "',remarks='" + txtremarks.Text + "',cemail='" + txtemail.Text + "',idate='" + txtidate.Text + "',hrate='" + txtrate.Text + "',ipc='" + ddipc.SelectedValue + "',tspc='" + ddtspc.SelectedValue + "',idc='" + ddidc.SelectedValue + "',remarcksc='" + ddremarkc.SelectedValue + "',ot='" + txtot.Text + "',id1='" + txtoher1.Text + "',id2='" + txtoher2.Text + "',id3='" + txtoher3.Text + "',id4='" + txtoher4.Text + "'  where sno=" + uid + "", con);
                // SqlCommand cmd = new SqlCommand("update IG_Invoice set ctype='" + ddtype.SelectedItem.Text + "',Cname='" + txtcompany.Text + "',efname='" + txtempname.Text + "', elname='" + txtlast.Text + "',timesheet='" + ddtimesheet.SelectedItem.Text + "',invoice='" + ddinvoice.SelectedItem.Text + "',rinvoiceduration='" + ddrid.SelectedItem.Text + "',        invoicedates='" + txtinvoicedate.SelectedItem.Text + "',invoiceperiod='" + txtfrom.Text + "',invoiceperiod1='" + txtto.Text + "',        tspendingperiod='" + tstxtfrom.Text + "',tspendingperiod1='" + tstxtto.Text + "',remarks='" + txtremarks.Text + "',cemail='" + txtemail.Text + "',idate='" + txtidate.Text + "',ipc='" + ddipc.SelectedValue + "',tspc='" + ddtspc.SelectedValue + "',idc='" + ddidc.SelectedValue + "',remarcksc='" + ddremarkc.SelectedValue + "'  where sno=" + uid + "", con);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string strscpt = "alert ('Invoice Details Updated');location.replace('Admin-Invoice.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
        }
    }

    protected void ddrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddrid.SelectedItem.Text == "Other")
        {
            //   visible1.Visible = true;
            visible2.Visible = true;
        }
        else
        {
            //   visible1.Visible = false;
            visible2.Visible = false;
        }
    }

    protected void txtinvoicedate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtinvoicedate.SelectedItem.Text == "Other")
        {
            //  visible1.Visible = true;
            visible4.Visible = true;
        }
        else
        {
            // visible1.Visible = false;
            visible4.Visible = false;
        }
    }
    protected void add_Click(object sender, EventArgs e)
    {
        uid = Request.QueryString["sno"].ToString();
        string empid = "";
        string hrate = "";
        string ot = "";
        if (uid != "")
        {
            SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                empid = ds.Tables[0].Rows[0]["emp_id"].ToString();
                 hrate = ds.Tables[0].Rows[0]["hrate"].ToString();
                 ot = ds.Tables[0].Rows[0]["ot"].ToString();
            }
        }

        string acthours= txtactualhours.Text;
        string othours = txtothours.Text;

        string range = tstxtfrom.SelectedItem.Text;
        string[] temp = range.Split('-');
        DateTime week1 = Convert.ToDateTime(temp[0]);
        DateTime week2 = Convert.ToDateTime(temp[1]);

        string finalweek = week1.ToString("MM/dd/yyyy");
        string finalweek2 = week2.ToString("MM/dd/yyyy");

        string date = DateTime.UtcNow.ToString("MM-dd-yyyy");

        DateTime datevalue = (Convert.ToDateTime(finalweek));

        string mn = datevalue.Month.ToString();
        if(mn=="1")
        {
            mn = "January";
        }
        if (mn == "2")
        {
            mn = "February";
        } 
        if (mn == "3")
        {
            mn = "March";
        }
        if (mn == "4")
        {
            mn = "April";
        } 
        if (mn == "5")
        {
            mn = "May";
        }
        if (mn == "6")
        {
            mn = "June";
        } 
        if (mn == "7")
        {
            mn = "July";
        }
        if (mn == "8")
        {
            mn = "August";
        } 
        if (mn == "9")
        {
            mn = "September";
        } 
        if (mn == "10")
        {
            mn = "October";
        }
        if (mn == "11")
        {
            mn = "November";
        } 
        if (mn == "12")
        {
            mn = "December";
        }
        string yy = datevalue.Year.ToString();
        string str1 = mn.Substring(0, 3);


        string ym = empid + "-" + str1+ "-" + yy;
        con.Open();
        string s = "insert into emp_weekdetails(empid,hours,hour_type,week_rangefrom,week_rangeto,month_year,actual_rate,ot_rate,mpid,createddate) values ('" + empid + "','" +acthours  + "','" +othours  + "','" + finalweek + "','" + finalweek2 + "', '" + ym + "','" +hrate  + "','" + ot + "','" + uid + "','" + date + "') ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            DataSet ds1 = new DataSet();
            SqlDataAdapter sqlda1 = new SqlDataAdapter(" select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where  month_year = '" + ym + "'", con);
            sqlda1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                divgrid1.Visible = true;
                GridView1.DataSource = ds1;
                GridView1.DataBind();
                ddmonth.SelectedIndex=-1;
                ddyear.SelectedIndex = -1;
            }
            else
            {
                divgrid1.Visible = false;
            }
        }
    }
    protected void imgbtndel_Click(object sender, EventArgs e)
    {
        uid = Request.QueryString["sno"].ToString();
        string empid = "";
        string hrate = "";
        string ot = "";
        if (uid != "")
        {
            SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                empid = ds.Tables[0].Rows[0]["emp_id"].ToString();
            }

        }
        Button imgbtndel = sender as Button;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from emp_weekdetails where wid=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            if ((ddmonth.SelectedItem.Text != "Month") && (ddyear.SelectedItem.Text != "Year"))
            {
                string year = ddyear.SelectedItem.Text;
                string str1 = ddmonth.SelectedItem.Text.Substring(0, 3);


                string qry = empid + "-" + str1 + "-" + year;

                DataSet ds1 = new DataSet();
                SqlDataAdapter sqlda1 = new SqlDataAdapter(" select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where month_year = '" + qry + "'", con);
                sqlda1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    divgrid1.Visible = true;
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                }
                else
                {
                    divgrid1.Visible = false;
                }
            }
            else
            {

            }
        }
    }
    protected void ddmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddyear.SelectedItem.Text!="Year")
        {
            if (ddmonth.SelectedItem.Text != "Month")
            {
                uid = Request.QueryString["sno"].ToString();
                string empid = "";
                string hrate = "";
                string ot = "";
                if (uid != "")
                {
                    SqlDataAdapter da = new SqlDataAdapter("select  * from IG_Invoice where sno='" + uid + "'", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        empid = ds.Tables[0].Rows[0]["emp_id"].ToString();
                        hrate = ds.Tables[0].Rows[0]["hrate"].ToString();
                        ot = ds.Tables[0].Rows[0]["ot"].ToString();
                    }
                }
                string year = ddyear.SelectedItem.Text;
                string str1 = ddmonth.SelectedItem.Text.Substring(0, 3);


                string qry = empid + "-" + str1 + "-" + year;

                DataSet ds1 = new DataSet();
                SqlDataAdapter sqlda1 = new SqlDataAdapter(" select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where month_year = '" + qry + "'", con);
                sqlda1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    divgrid1.Visible = true;
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                }
                else
                {
                    divgrid1.Visible = false;
                }
               
            }
            else
            {
                string strscpt = "alert ('Please select Month');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please select Year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }
    protected void ddyear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddmonth.SelectedIndex = -1;
    }
}