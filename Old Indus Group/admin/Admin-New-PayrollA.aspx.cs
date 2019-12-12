using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
//using System.Drawing;
using System.Web.Configuration;

public partial class Admin_New_PayrollA : System.Web.UI.Page
{
    exception es = new exception();
    string page = "admin_payrolla.aspx";
    Double tEmpRate;
    Double tIGIRate;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            // SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            // int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            // ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            txtBonus.Attributes.Add("onkeyup", "CalcGrossAfterDeduction()");
            if (Session["Editid"] != null)
            {
                string id = Convert.ToString(Session["Editid"]);
                SqlDataAdapter ad = new SqlDataAdapter("select * from monthpay where weekdetail_month='" + id + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                SqlDataAdapter ad1 = new SqlDataAdapter(" select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails  where month_year='" + id + "'", con);
                DataSet ds1 = new DataSet();
                ad1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    string year = ds.Tables[0].Rows[0]["mont"].ToString();
                    string yeardelweek = ds.Tables[0].Rows[0]["weekdetail_month"].ToString();
                    string[] wkrange = yeardelweek.Split('-');
                    string wkmn = wkrange[1];
                    string wkyr = wkrange[2];
                    string[] temp = year.Split('-');






                    string month = temp[0];
                    string year1 = temp[1];
                    ViewState["qbmonth"] = month;
                    ViewState["year1"] = year1;
                    string yearweek = ds1.Tables[0].Rows[0]["month_year"].ToString();
                    string color = Convert.ToString(ds.Tables[0].Rows[0]["colorremark"].ToString());
                    string colorbalance = Convert.ToString(ds.Tables[0].Rows[0]["balancecolor"].ToString());
                    string[] temp1 = yearweek.Split('-');

                    string month1 = temp1[0];
                    string yearweek1 = temp1[1];

                    for (int i = 0; i < ddlPayrollYr.Items.Count; i++)
                    {
                        if (ddlPayrollYr.Items[i].Text == year1)
                        {
                            ddlPayrollYr.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }

                    if (txtremark.Text == "")
                    {
                        for (int i = 0; i < ddlclor.Items.Count; i++)
                        {
                            if (ddlclor.Items[i].Value == "0")
                            {
                                ddlclor.Items[i].Selected = true;

                                // DropDownList1.Items.Insert(0, "Select");
                                break;

                            }

                        }
                    }
                    else
                    {
                        for (int i = 0; i < ddlclor.Items.Count; i++)
                        {
                            if (ddlclor.Items[i].Value == color)
                            {
                                ddlclor.Items[i].Selected = true;

                                // DropDownList1.Items.Insert(0, "Select");
                                break;

                            }

                        }
                    }

                    for (int i = 0; i < ddlbalance.Items.Count; i++)
                    {
                        if (ddlbalance.Items[i].Value == colorbalance)
                        {
                            ddlbalance.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlYear.Items.Count; i++)
                    {
                        if (ddlYear.Items[i].Text == wkyr)
                        {
                            ddlYear.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlMonth.Items.Count; i++)
                    {
                        if (ddlMonth.Items[i].Value == wkmn)
                        {
                            ddlMonth.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    string minus = ds.Tables[0].Rows[0]["minuspercent"].ToString();
                    for (int i = 0; i < ddlMinusPercentage.Items.Count; i++)
                    {
                        if (ddlMinusPercentage.Items[i].Value == minus)
                        {
                            ddlMinusPercentage.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }

                    MonthName1(month);
                    MonthName(month1);
                    bindempid();

                    string emp = ds.Tables[0].Rows[0]["empid"].ToString();
                    string monthtype = ds.Tables[0].Rows[0]["monthtype"].ToString();
                    txtLCASalary.Text = ds.Tables[0].Rows[0]["lcasal"].ToString();
                    txtMonthSalary.Text = ds.Tables[0].Rows[0]["lcasalprev"].ToString();
                    txtH1UpdateInfo.Text = ds.Tables[0].Rows[0]["h1update"].ToString();
                    TextBox6.Text = ds.Tables[0].Rows[0]["CurrentYTD"].ToString();

                    txtEmployeeRate.Text = ds.Tables[0].Rows[0]["EmpRate"].ToString();
                    txtEmployeeGross.Text = ds.Tables[0].Rows[0]["empgross"].ToString();
                    txtIGIGross.Text = ds.Tables[0].Rows[0]["IGIGross"].ToString();
                    txtGrossAfterDeduction.Text = ds.Tables[0].Rows[0]["totgross"].ToString();
                    txtPeridium.Text = ds.Tables[0].Rows[0]["pDium"].ToString();
                    txtDEDBPayNewRate.Text = ds.Tables[0].Rows[0]["Rate_Insurance"].ToString();
                    txtDescriptionofDeduction.Text = ds.Tables[0].Rows[0]["DespofDeduct"].ToString();
                    txtSalary.Text = ds.Tables[0].Rows[0]["salary"].ToString();
                    txtBonus.Text = ds.Tables[0].Rows[0]["bonus"].ToString();
                    txtPayAdvance.Text = ds.Tables[0].Rows[0]["advapay"].ToString();
                    txtActualQBDeduc.Text = ds.Tables[0].Rows[0]["actualqbdeuduct"].ToString();
                    txtPayAdv.Text = ds.Tables[0].Rows[0]["payadva_balance"].ToString();
                    //txtBalance.Text = ds.Tables[0].Rows[0]["bepay"].ToString();

                    SqlDataAdapter adp = new SqlDataAdapter("select top 1 * from pending_acc where mpid='" + id + "' order by pid desc", con);
                    DataTable dtp = new DataTable();
                    adp.Fill(dtp);
                    if (dtp.Rows.Count > 0)
                    {
                        txtBalance.Text = dtp.Rows[0]["balance"].ToString();
                    }
                    else
                    {
                        txtBalance.Text = ds.Tables[0].Rows[0]["bepay"].ToString();
                    }
                    txtremark.Text = ds.Tables[0].Rows[0]["remark"].ToString();
                    string immi = ds.Tables[0].Rows[0]["visatype"].ToString();

                    double ac = Convert.ToDouble(ds1.Tables[0].Rows[0]["actualrate"].ToString());
                    double ot = Convert.ToDouble(ds1.Tables[0].Rows[0]["otrate"].ToString());
                    ViewState["ac"] = ac;
                    ViewState["ot"] = ot;
                    adddatatogrid();
                    //calculateminus();
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    ViewState["currtable"] = ds1;
                    //adddatatogrid();

                    DataTable table = ds1.Tables[0];
                    int sum = Convert.ToInt32(table.Compute("SUM(reghours)", string.Empty));
                    this.lbactutot.Text = sum.ToString();

                    int sum1 = Convert.ToInt32(table.Compute("SUM(totalregamount)", string.Empty));
                    this.txtPayPeriod.Text = sum1.ToString();

                    //txtBillingGross.Text=

                    int sum3 = Convert.ToInt32(table.Compute("SUM(totalotamount)", string.Empty));
                    this.txtOTHrs.Text = sum3.ToString();
                    calculateminus();
                    string ot1 = Convert.ToString(ds1.Tables[0].Rows[0]["othours"]);
                    //  if(ds1.tables)
                    int sumot = 0;
                    foreach (DataRow dr in table.Rows)
                    {
                        sumot += Convert.ToInt32(dr["othours"]);
                    }
                    this.lblottot.Text = sumot.ToString();
                    for (int i = 0; i < txtImmiStatus.Items.Count; i++)
                    {
                        if (txtImmiStatus.Items[i].Value == immi)
                        {
                            txtImmiStatus.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }



                    string sec = ds.Tables[0].Rows[0]["secpay"].ToString();
                    for (int i = 0; i < txtSecondPay.Items.Count; i++)
                    {
                        if (txtSecondPay.Items[i].Value == sec)
                        {
                            txtSecondPay.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }

                    //lbactutot.Text

                    for (int i = 0; i < ddlMonthType.Items.Count; i++)
                    {
                        if (ddlMonthType.Items[i].Value == monthtype)
                        {
                            ddlMonthType.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlempid.Items.Count; i++)
                    {
                        if (ddlempid.Items[i].Value == emp)
                        {
                            ddlempid.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    bindbelowdata();
                    btn.Visible = false;
                    Button1.Visible = true;
                    grid.Visible = false;
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    pn1.Visible = true;
                }

                else
                {
                    string year = ds.Tables[0].Rows[0]["mont"].ToString();
                    string[] temp = year.Split('-');

                    string month = temp[0];
                    string year1 = temp[1];
                    ViewState["qbmonth"] = month;
                    ViewState["year1"] = year1;
                    //string yearweek = ds1.Tables[0].Rows[0]["month_year"].ToString();
                    string color = Convert.ToString(ds.Tables[0].Rows[0]["colorremark"].ToString());
                    string colorbalance = Convert.ToString(ds.Tables[0].Rows[0]["balancecolor"].ToString());
                    //string[] temp1 = yearweek.Split('-');

                    // string month1 = temp1[0];
                    // string yearweek1 = temp1[1];

                    for (int i = 0; i < ddlPayrollYr.Items.Count; i++)
                    {
                        if (ddlPayrollYr.Items[i].Text == year1)
                        {
                            ddlPayrollYr.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlclor.Items.Count; i++)
                    {
                        if (ddlclor.Items[i].Value == color)
                        {
                            ddlclor.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlbalance.Items.Count; i++)
                    {
                        if (ddlbalance.Items[i].Value == colorbalance)
                        {
                            ddlbalance.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    //for (int i = 0; i < ddlYear.Items.Count; i++)
                    //{
                    //    if (ddlYear.Items[i].Text == yearweek1)
                    //    {
                    //        ddlYear.Items[i].Selected = true;

                    //        // DropDownList1.Items.Insert(0, "Select");
                    //        break;

                    //    }

                    //}

                    string minus = ds.Tables[0].Rows[0]["minuspercent"].ToString();
                    for (int i = 0; i < ddlMinusPercentage.Items.Count; i++)
                    {
                        if (ddlMinusPercentage.Items[i].Value == minus)
                        {
                            ddlMinusPercentage.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }

                    MonthName1(month);
                    // MonthName(month1);
                    bindempid();

                    string emp = ds.Tables[0].Rows[0]["empid"].ToString();
                    string monthtype = ds.Tables[0].Rows[0]["monthtype"].ToString();
                    txtLCASalary.Text = ds.Tables[0].Rows[0]["lcasal"].ToString();
                    txtMonthSalary.Text = ds.Tables[0].Rows[0]["lcasalprev"].ToString();
                    txtH1UpdateInfo.Text = ds.Tables[0].Rows[0]["h1update"].ToString();
                    TextBox6.Text = ds.Tables[0].Rows[0]["CurrentYTD"].ToString();

                    txtEmployeeRate.Text = ds.Tables[0].Rows[0]["EmpRate"].ToString();
                    txtEmployeeGross.Text = ds.Tables[0].Rows[0]["empgross"].ToString();
                    txtIGIGross.Text = ds.Tables[0].Rows[0]["IGIGross"].ToString();
                    txtGrossAfterDeduction.Text = ds.Tables[0].Rows[0]["totgross"].ToString();
                    txtPeridium.Text = ds.Tables[0].Rows[0]["pDium"].ToString();
                    txtDEDBPayNewRate.Text = ds.Tables[0].Rows[0]["Rate_Insurance"].ToString();
                    txtDescriptionofDeduction.Text = ds.Tables[0].Rows[0]["DespofDeduct"].ToString();
                    txtSalary.Text = ds.Tables[0].Rows[0]["salary"].ToString();
                    txtBonus.Text = ds.Tables[0].Rows[0]["bonus"].ToString();
                    txtPayAdvance.Text = ds.Tables[0].Rows[0]["advapay"].ToString();
                    txtActualQBDeduc.Text = ds.Tables[0].Rows[0]["actualqbdeuduct"].ToString();
                    txtPayAdv.Text = ds.Tables[0].Rows[0]["payadva_balance"].ToString();
                    txtBalance.Text = ds.Tables[0].Rows[0]["bepay"].ToString();
                    txtremark.Text = ds.Tables[0].Rows[0]["remark"].ToString();
                    string immi = ds.Tables[0].Rows[0]["visatype"].ToString();

                    //double ac = Convert.ToDouble(ds1.Tables[0].Rows[0]["actualrate"].ToString());
                    // double ot = Convert.ToDouble(ds1.Tables[0].Rows[0]["otrate"].ToString());
                    ViewState["ac"] = 0;
                    ViewState["ot"] = 0;
                    adddatatogrid();
                    //calculateminus();
                    //  GridView1.DataSource = ds1;
                    // GridView1.DataBind();
                    // GridView1.Visible = true;
                    ViewState["currtable"] = ds1;
                    //adddatatogrid();

                    //DataTable table = ds1.Tables[0];
                    //int sum = Convert.ToInt32(table.Compute("SUM(reghours)", string.Empty));
                    //this.lbactutot.Text = sum.ToString();

                    //int sum1 = Convert.ToInt32(table.Compute("SUM(totalregamount)", string.Empty));
                    //this.txtPayPeriod.Text = sum1.ToString();

                    ////txtBillingGross.Text=

                    //int sum3 = Convert.ToInt32(table.Compute("SUM(totalotamount)", string.Empty));
                    //this.txtOTHrs.Text = sum3.ToString();
                    calculateminus();
                    //  string ot=ds1.Tables[0].Rows[0]["hour_type"]
                    //  if(ds1.tables)
                    //int sum1 = Convert.ToInt32(table.Compute("SUM(othours)", string.Empty));
                    //this.lblottot.Text = sum1.ToString();
                    // this.lblottot.Text = table.Compute("Sum(othours)", "").ToString();
                    for (int i = 0; i < txtImmiStatus.Items.Count; i++)
                    {
                        if (txtImmiStatus.Items[i].Value == immi)
                        {
                            txtImmiStatus.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }



                    string sec = ds.Tables[0].Rows[0]["secpay"].ToString();
                    for (int i = 0; i < txtSecondPay.Items.Count; i++)
                    {
                        if (txtSecondPay.Items[i].Value == sec)
                        {
                            txtSecondPay.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }

                    //lbactutot.Text

                    for (int i = 0; i < ddlMonthType.Items.Count; i++)
                    {
                        if (ddlMonthType.Items[i].Value == monthtype)
                        {
                            ddlMonthType.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    for (int i = 0; i < ddlempid.Items.Count; i++)
                    {
                        if (ddlempid.Items[i].Value == emp)
                        {
                            ddlempid.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                    bindbelowdata();
                    btn.Visible = false;
                    Button1.Visible = true;
                    grid.Visible = false;
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    pn1.Visible = true;
                }
            }


            else
            {
                bindmaindata();
            }

        }
    }

    protected void bindmaindata()
    {
        try
        {
            bindempid();

            lb1.Visible = false;
            lb.Visible = false;
            pn1.Visible = false;
            grid.Visible = false;
            string Year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();
            // ddlPayrollYr.SelectedItem.Text=Year;
            for (int i = 0; i < ddlPayrollYr.Items.Count; i++)
            {
                if (ddlPayrollYr.Items[i].Text == Year)
                {
                    ddlPayrollYr.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
            for (int i = 0; i < ddlYear.Items.Count; i++)
            {
                if (ddlYear.Items[i].Text == Year)
                {
                    ddlYear.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }



    public void MonthName(string m)
    {
        try
        {
            string month = "";
            string res;
            switch (m)
            {
                case "Jan":
                    res = "January";
                    break;
                case "Feb":
                    res = "February";
                    break;
                case "Mar":
                    res = "March";
                    break;
                case "Apr":
                    res = "April";
                    break;
                case "May":
                    res = "May";
                    break;
                case "Jun":
                    res = "June";
                    break;
                case "Jul":
                    res = "July";
                    break;
                case "Aug":
                    res = "August";
                    break;
                case "Sep":
                    res = "September";
                    break;
                case "Oct":
                    res = "October";
                    break;
                case "Nov":
                    res = "November";
                    break;
                case "Dec":
                    res = "December";
                    break;
                default:
                    res = "Null";
                    break;
            }
            month = res;

            for (int i = 0; i < ddlMonth.Items.Count; i++)
            {
                if (ddlMonth.Items[i].Text == month)
                {
                    ddlMonth.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }
    public void MonthName1(string m)
    {
        try
        {
            string month = "";
            string res;
            switch (m)
            {
                case "Jan":
                    res = "January";
                    break;
                case "Feb":
                    res = "February";
                    break;
                case "Mar":
                    res = "March";
                    break;
                case "Apr":
                    res = "April";
                    break;
                case "May":
                    res = "May";
                    break;
                case "June":
                    res = "June";
                    break;
                case "Jul":
                    res = "July";
                    break;
                case "Aug":
                    res = "August";
                    break;
                case "Sep":
                    res = "September";
                    break;
                case "Oct":
                    res = "October";
                    break;
                case "Nov":
                    res = "November";
                    break;
                case "Dec":
                    res = "December";
                    break;
                default:
                    res = "Null";
                    break;
            }
            month = res;
            for (int i = 0; i < ddlPayMonth.Items.Count; i++)
            {
                if (ddlPayMonth.Items[i].Text == month)
                {
                    ddlPayMonth.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
            ViewState["month"] = month;
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }


    }
    private static DataTable GetData(string query)
    {
        // string strConnString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

    protected void bindempid()
    {
        try
        {
            SqlDataAdapter ad = new SqlDataAdapter("select emp_id, cname+''+'-'+''+emp_id as empid,cemail,cphone from [dbo].[EmpContacts]  where emp_id is not null order by cname ", con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            ddlempid.DataTextField = "empid";
            ddlempid.DataValueField = "emp_id";
            ddlempid.DataSource = dt;
            ddlempid.DataBind();
            ddlempid.Items.Insert(0, "Select");
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }



    protected void adddatatogrid()
    {
        try
        {
            double total;
            double totalMarks = 0;
            double total1;
            double totalMarks1 = 0;

            double hours;
            double totalhours = 0;

            double hours1;
            double totalhours1 = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {

                hours = Convert.ToDouble(row.Cells[1].Text);

                totalhours = totalhours + hours;



            }
            foreach (GridViewRow row in GridView1.Rows)
            {

                hours1 = Convert.ToDouble(row.Cells[4].Text);

                totalhours1 = totalhours1 + hours1;



            }

            foreach (GridViewRow row in GridView1.Rows)
            {

                total = Convert.ToDouble(row.Cells[3].Text);

                totalMarks = totalMarks + total;



            }
            foreach (GridViewRow row1 in GridView1.Rows)
            {

                total1 = Convert.ToDouble(row1.Cells[6].Text);

                totalMarks1 = totalMarks1 + total1;



            }

            lbactutot.Text = Convert.ToString(totalhours);
            lblottot.Text = Convert.ToString(totalhours1);
            // lblottot.Text = Convert.ToString(totalMarks1);
            //lbactutot.Text = Convert.ToString(totalMarks);
            this.txtPayPeriod.Text = Convert.ToString(totalMarks);
            this.txtOTHrs.Text = Convert.ToString(totalMarks1);
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }


    //protected void calculateminus()
    //{


    //    int sId = Convert.ToInt16(ddlMinusPercentage.SelectedValue);
    //    Double tEmpRate = 0.0;
    //    Double tIGIRate = 0.0;
    //    Double totregGross = 0.0;
    //    Double tototGross = 0.0;

    //    Double actualRate = Convert.ToDouble(txtActualRate.Text);
    //    Double otRate = Convert.ToDouble(txtOTRate.Text);
    //    Double totHrs = Convert.ToDouble(lbactutot.Text);
    //    Double otHrs = Convert.ToDouble(lblottot.Text);

    //    //this.txtPayPeriod.Text = (actualRate * totHrs).ToString();
    //   // totregGross = (actualRate * totHrs);
    //   // txtOTHrs.Text = (otRate * otHrs).ToString();
    //     tototGross = (otRate * otHrs);
    //     double empPercent = 0;
    //    switch (sId)
    //    {


    //        case 1:
    //            tEmpRate = actualRate * 75 / 100;
    //            empPercent = 75;
    //            //tIGIRate = actualRate * 25 / 100;
    //            break;
    //        case 2:
    //            tEmpRate = actualRate * 80 / 100;
    //            empPercent = 80;
    //            //tIGIRate = actualRate * 20 / 100;
    //            break;
    //        case 3:
    //            tEmpRate = actualRate * 70 / 100;
    //            empPercent = 70;
    //           // tIGIRate = actualRate * 30 / 100;
    //            break;

    //    }
    //    txtEmployeeRate.Text = tEmpRate.ToString();

    //    //double dblTotalGross = Convert.ToDouble(txtBillingGross.Text);

    //   // txtBillingGross.Text = dblTotalGross.ToString();
    //    double payreg = Convert.ToDouble(txtPayPeriod.Text);
    //    double payot = Convert.ToDouble(txtOTHrs.Text);
    //    txtBillingGross.Text = (payreg + payot).ToString();
    //    double dblTotalGross = 0.0;
    //    dblTotalGross = payreg + payot;
    //    txtEmployeeGross.Text = ((dblTotalGross * empPercent) / 100).ToString();
    //    txtIGIGross.Text = (Convert.ToDouble(txtBillingGross.Text) - Convert.ToDouble(txtEmployeeGross.Text)).ToString();

    //}



    protected void calculateminus()
    {
        try
        {

            int sId = Convert.ToInt16(ddlMinusPercentage.SelectedValue);
            Double tEmpRate = 0.0;
            Double tIGIRate = 0.0;
            Double totregGross = 0.0;
            Double tototGross = 0.0;
            if (sId == 4)
            {
                txtBillingGross.Text = Convert.ToString(txtSalary.Text);
                txtEmployeeGross.Text = "0";
                txtIGIGross.Text = "0";

            }
            else
            {

                Double actualRate = Double.Parse(ViewState["ac"].ToString());
                Double otRate = Double.Parse(ViewState["ot"].ToString());
                Double totHrs = Convert.ToDouble(lbactutot.Text);
                Double otHrs = Convert.ToDouble(lblottot.Text);

                //this.txtPayPeriod.Text = (actualRate * totHrs).ToString();
                // totregGross = (actualRate * totHrs);
                // txtOTHrs.Text = (otRate * otHrs).ToString();
                tototGross = (otRate * otHrs);
                double empPercent = 0;
                switch (sId)
                {


                    case 1:
                        tEmpRate = actualRate * 75 / 100;
                        empPercent = 75;
                        //tIGIRate = actualRate * 25 / 100;
                        break;
                    case 2:
                        tEmpRate = actualRate * 80 / 100;
                        empPercent = 80;
                        //tIGIRate = actualRate * 20 / 100;
                        break;
                    case 3:
                        tEmpRate = actualRate * 70 / 100;
                        empPercent = 70;
                        // tIGIRate = actualRate * 30 / 100;
                        break;

                }
                txtEmployeeRate.Text = tEmpRate.ToString();

                //double dblTotalGross = Convert.ToDouble(txtBillingGross.Text);

                // txtBillingGross.Text = dblTotalGross.ToString();
                double payreg = Convert.ToDouble(txtPayPeriod.Text);
                double payot = Convert.ToDouble(txtOTHrs.Text);
                txtBillingGross.Text = (payreg + payot).ToString();
                double dblTotalGross = 0.0;
                dblTotalGross = payreg + payot;
                txtEmployeeGross.Text = ((dblTotalGross * empPercent) / 100).ToString();
                txtIGIGross.Text = (Convert.ToDouble(txtBillingGross.Text) - Convert.ToDouble(txtEmployeeGross.Text)).ToString();
            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }

    protected void lnkdownload_Click(object sender, EventArgs e)
    {
        try
        {
            bindmaingrid();
            string str1 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
            //string yer = ddlYear.SelectedItem.Text;
            string yer = ddlPayrollYr.SelectedItem.Text;


            string value = str1 + "-" + yer;
            SqlDataAdapter ad = new SqlDataAdapter("select CASE WHEN minusPercent=1 THEN '75% X 25%' WHEN minusPercent=2 THEN '80% X 20%' WHEN minusPercent=3 THEN '70% X 30%' ELSE 'Salary' END as MINUS, case when visatype=1 then 'H1-B' else 'NA' end as visa, b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId and a.mont='" + value + "' order by b.cname asc", con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DataTable d2 = new DataTable();

                DataColumn dc = new DataColumn();
                dc.ColumnName = "Employee Id";
                dc.Caption = "empid";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Employee Name";
                dc.Caption = "cname";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Employee Rate";
                dc.Caption = "emprate";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Employee Gross";
                dc.Caption = "igigross";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "IGI Gross";
                dc.Caption = "empgross";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Total Gross";
                dc.Caption = "totgross";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Lca Salary";
                dc.Caption = "lcasal";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Current YTD";
                dc.Caption = "CurrentYTD";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Salary";
                dc.Caption = "Salary";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Bonus";
                dc.Caption = "Bonus";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Peridium";
                dc.Caption = "pdium";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Pay Adv. Deduct";
                dc.Caption = "advaPay";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);


                dc = new DataColumn();
                dc.ColumnName = "Minus Percentage";
                dc.Caption = "minus";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Pay New Rate(Insurance)";
                dc.Caption = "Rate_Insurance";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Desp. of Deduction";
                dc.Caption = "DespofDeduct";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);


                dc = new DataColumn();
                dc.ColumnName = "Balance";
                dc.Caption = "bepay";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Visa Type";
                dc.Caption = "visa";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Remarks";
                dc.Caption = "remark";
                dc.DataType = Type.GetType("System.String");

                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "test";
                dc.Caption = "ytd";
                dc.DataType = Type.GetType("System.String");

                d2.Columns.Add(dc);
                dc = new DataColumn();
                dc.ColumnName = "Week From";
                dc.Caption = "week_rangefrom";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Week To";
                dc.Caption = "week_rangeto";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Reg. Hours";
                dc.Caption = "hours";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "OT Hours";
                dc.Caption = "hour_type";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "Actual Rate";
                dc.Caption = "actual_rate";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                dc = new DataColumn();
                dc.ColumnName = "OT Rate";
                dc.Caption = "ot_rate";
                dc.DataType = Type.GetType("System.String");
                d2.Columns.Add(dc);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow row = d2.NewRow();
                    DataRow dr = dt.Rows[i];
                    string id = dr[41].ToString();

                    row["Employee Id"] = dt.Rows[i]["empid"].ToString();

                    row["Employee Name"] = dt.Rows[i]["cname"].ToString();
                    row["Employee Rate"] = dt.Rows[i]["emprate"].ToString();
                    row["Employee Gross"] = dt.Rows[i]["empgross"].ToString();
                    row["IGI Gross"] = dt.Rows[i]["igigross"].ToString();
                    row["Total Gross"] = dt.Rows[i]["totgross"].ToString();
                    row["Lca Salary"] = dt.Rows[i]["lcasal"].ToString();
                    row["Current YTD"] = dt.Rows[i]["CurrentYTD"].ToString();
                    row["Salary"] = dt.Rows[i]["Salary"].ToString();
                    row["Bonus"] = dt.Rows[i]["Bonus"].ToString();
                    row["Peridium"] = dt.Rows[i]["pdium"].ToString();
                    row["Pay Adv. Deduct"] = dt.Rows[i]["advaPay"].ToString();
                    row["Balance"] = dt.Rows[i]["bepay"].ToString();

                    row["Pay New Rate(Insurance)"] = dt.Rows[i]["Rate_Insurance"].ToString();
                    row["Minus Percentage"] = dt.Rows[i]["minus"].ToString();
                    row["Visa Type"] = dt.Rows[i]["visa"].ToString();
                    row["Desp. of Deduction"] = dt.Rows[i]["DespofDeduct"].ToString();
                    row["Remarks"] = dt.Rows[i]["remark"].ToString();

                    // row["test"] = String.Format("This is line one{0}This is line two{0}This is line three", "<br/>");


                    d2.Rows.Add(row);
                    // d2.ImportRow(dr);  

                    SqlDataAdapter ad1 = new SqlDataAdapter("select  * from emp_weekdetails where month_year='" + id + "'", con);
                    DataTable dt1 = new DataTable();
                    ad1.Fill(dt1);
                    for (int i1 = 0; i1 < dt1.Rows.Count; i1++)
                    {
                        DataRow row1 = d2.NewRow();
                        DataRow dr1 = dt1.Rows[i1];

                        row1["Week From"] = dt1.Rows[3]["week_rangefrom"].ToString();
                        row1["Week To"] = dt1.Rows[3]["week_rangeto"].ToString();
                        row1["Reg. Hours"] = dt1.Rows[3]["Hours"].ToString();
                        row1["Ot Hours"] = dt1.Rows[3]["hour_type"].ToString();
                        row1["Actual Rate"] = dt1.Rows[3]["actual_rate"].ToString();
                        row1["OT Rate"] = dt1.Rows[3]["ot_rate"].ToString();

                        IEnumerable<DataRow> newRows = dt1.AsEnumerable().Skip(1);
                        DataTable dt2 = newRows.CopyToDataTable();

                        d2.Rows.Add("Date :", dt1.Rows[i1]["week_rangefrom"].ToString(), dt1.Rows[i1]["week_rangeto"].ToString(), dt1.Rows[i1]["Hours"].ToString(), dt1.Rows[3]["hour_type"].ToString(), dt1.Rows[i1]["actual_rate"].ToString(), dt1.Rows[i1]["ot_rate"].ToString());
                        // d2.ImportRow(dr1);
                    }
                }

                DataTable d3 = new DataTable();
                d3 = d2;

                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "PayRoll.xls"));
                Response.ContentType = "application/ms-excel";
                string str = string.Empty;

                foreach (DataColumn dtcol in d3.Columns)
                {
                    Response.Write(str + dtcol.ColumnName);
                    str = "\t";
                }
                Response.Write("\n");
                foreach (DataRow dr in d3.Rows)
                {
                    str = "";
                    for (int j = 0; j < d3.Columns.Count; j++)
                    {
                        Response.Write(str + Convert.ToString(dr[j]));
                        str = "\t";
                    }
                    Response.Write("\n");
                }
                Response.End();

            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }

    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlWeekRanges.SelectedIndex = 0;
        //ddlWeekRanges.Items.Clear();
        //UpdatePanel1.Update();
        //DateTime reference = DateTime.Now;
        //System.Globalization.Calendar calendar = CultureInfo.CurrentCulture.Calendar;

        //int yr = Convert.ToInt32(ddlYear.SelectedItem.Text);
        //int month = Convert.ToInt32(ddlMonth.SelectedValue);

        //IEnumerable<int> daysInMonth = Enumerable.Range(1, calendar.GetDaysInMonth(yr, month));



        //List<Tuple<DateTime, DateTime>> weeks = daysInMonth.Select(day => new DateTime(yr, month, day).Date)
        //    .GroupBy(d => calendar.GetWeekOfYear(d, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday))
        //    .Select(g => new Tuple<DateTime, DateTime>(g.First(), g.Last()))
        //    .ToList();
        //weeks.ForEach(x => Console.WriteLine("{0:MM/dd/yyyy} - {1:MM/dd/yyyy}", "-", x.Item1, x.Item2));

        //for (int i = 0; i < weeks.Count; i++)
        //{
        //    ddlWeekRanges.Items.Add(weeks[i].Item1.ToShortDateString() + "-" + weeks[i].Item2.ToShortDateString());

        //}  

        //ddlWeekRanges.Items.Add("3/3/2019-3/9/2019");
        string month = ddlMonth.SelectedItem.Text.Substring(0, 3);
        string year = ddlYear.SelectedItem.Text;
        string id = ddlempid.SelectedValue;
        string final1 = id + "-" + month + "-" + year;
        string ids = Convert.ToString(Session["Editid"]);
        GridView1.Visible = true;
        SqlDataAdapter ad = new SqlDataAdapter("select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where month_year='" + final1 + "'", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Visible = true;
            divgrid1.Visible = true;
            wkdetails.Visible = true;
            DataTable table = ds.Tables[0];
            int sum = Convert.ToInt32(table.Compute("SUM(reghours)", string.Empty));
            this.lbactutot.Text = sum.ToString();
            int sum1 = Convert.ToInt32(table.Compute("SUM(othours)", string.Empty));
            this.lblottot.Text = sum1.ToString();
            lb1.Visible = true;
            lb.Visible = true;
            string ac = ds.Tables[0].Rows[0]["actualrate"].ToString();
            ViewState["ac"] = ac;
            string ot = ds.Tables[0].Rows[0]["otrate"].ToString();
            ViewState["ot"] = ot;
            adddatatogrid();
            // ddlWeekRanges.SelectedIndex = 0;
            //txtNoOfHours.Text = "";
            bindmaingrid();
            calculateminus();

        }
        else
        {
            SqlDataAdapter ad1 = new SqlDataAdapter("select wid,empid,hours as reghours,hour_type as othours,month_year,actual_rate as actualrate,ot_rate as otrate,createddate, CAST((CAST(hours as DECIMAL(18,2)) * CAST(actual_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalregamount , CAST((CAST(hour_type as DECIMAL(18,2)) * CAST(ot_rate as DECIMAL(18,2))) as DECIMAL(18,2)) as totalotamount,  convert (nvarchar(10), week_rangefrom, 101)+'-'+convert (nvarchar(10), week_rangeto, 101) as week from  emp_weekdetails where mpid='" + ids + "'", con);
            DataSet ds1 = new DataSet();
            ad1.Fill(ds1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();
            GridView1.Visible = true;
            divgrid1.Visible = true;
            wkdetails.Visible = true;
            DataTable table = ds1.Tables[0];
            int sum = Convert.ToInt32(table.Compute("SUM(reghours)", string.Empty));
            this.lbactutot.Text = sum.ToString();
            int sum1 = Convert.ToInt32(table.Compute("SUM(othours)", string.Empty));
            this.lblottot.Text = sum1.ToString();
            lb1.Visible = true;
            lb.Visible = true;
            string ac = ds1.Tables[0].Rows[0]["actualrate"].ToString();
            ViewState["ac"] = ac;
            string ot = ds1.Tables[0].Rows[0]["otrate"].ToString();
            ViewState["ot"] = ot;
            adddatatogrid();
            // ddlWeekRanges.SelectedIndex = 0;
            //txtNoOfHours.Text = "";
            bindmaingrid();
            calculateminus();
        }



        ViewState["currtable"] = ds;

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int index = Convert.ToInt32(e.RowIndex);
            // GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            //int index = gvRow.RowIndex;
            if (ViewState["currtable"] != null)
            {
                //DataTable dt = ViewState["CurrentTable"] as DataTable;
                //dt.Rows[index].Delete();
                //ViewState["CurrentTable"] = dt;
                //GridView1.DataSource = dt;
                //GridView1.DataBind();
                //adddatatogrid();
                //calculateminus();

                if ((ViewState["CurrentTable"] != null))
                {
                    DataTable dt = ViewState["CurrentTable"] as DataTable;
                    dt.Rows[index].Delete();
                    ViewState["CurrentTable"] = dt;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    adddatatogrid();
                    calculateminus();
                    //DataSet ds = ViewState["currtable"] as DataSet;

                    //DataTable dt = new DataTable();
                    //dt = ds.Tables[0];
                    //DataTable dt1 = ViewState["CurrentTable"] as DataTable;
                    // dt = dt1.Copy();
                    // dt.Merge(dt1);
                }
                else
                {
                    DataSet ds = ViewState["currtable"] as DataSet;
                    DataTable dt = new DataTable();
                    dt = ds.Tables[0];
                    //dt.Rows[index].Delete();
                    dt.Rows.RemoveAt(index);
                    ViewState["currtable"] = ds;

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    adddatatogrid();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        int sum = Convert.ToInt32(dt.Compute("SUM(reghours)", string.Empty));
                        this.lbactutot.Text = sum.ToString();
                        int sum1 = Convert.ToInt32(dt.Compute("SUM(totalregamount)", string.Empty));
                        this.txtPayPeriod.Text = sum1.ToString();
                        int sum2 = Convert.ToInt32(dt.Compute("SUM(totalotamount)", string.Empty));
                        this.txtOTHrs.Text = sum2.ToString();
                        //int sum3 = Convert.ToInt32(dt.Compute("SUM(othours)", string.Empty));

                        //lblottot.Text = sum3.ToString();
                        //ViewState["ac"] = actualrate;
                        //ViewState["ot"] = otrate;
                    }
                    calculateminus();
                    //bindmaingrid();
                }


            }
            else
            {
                DataTable dt = ViewState["CurrentTable"] as DataTable;
                dt.Rows[index].Delete();
                ViewState["CurrentTable"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                adddatatogrid();
                calculateminus();
                bindmaingrid();
            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                }
            }
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
        //TextBox txtname=(TextBox)gr.cell[].control[];  
        TextBox textName = (TextBox)row.Cells[0].Controls[0];
        TextBox textadd = (TextBox)row.Cells[1].Controls[0];

        GridView1.EditIndex = -1;
        //conn.Open();
        //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
        //SqlCommand cmd = new SqlCommand("update detail set name='" + textName.Text + "',address='" + textadd.Text + "',country='" + textc.Text + "'where id='" + userid + "'", conn);
        //cmd.ExecuteNonQuery();
        //conn.Close();
        //gvbind();  
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataTable dt = new DataTable();
        GridView1.EditIndex = e.NewEditIndex;
        //gvbind();  
        ViewState["CurrentTable"] = dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btn_Click(object sender, EventArgs e)
    {

        try
        {
            string empid1 = ddlempid.SelectedValue;
            string empfname = txtEmpName.Text;

            string emlname = TextBox1.Text;
            int month_type = Convert.ToInt32(ddlMonthType.SelectedValue);

            string lcasal = txtLCASalary.Text;
            string lcamonth = txtMonthSalary.Text;
            string h1update = txtH1UpdateInfo.Text;
            string curytd = TextBox6.Text;
            string year = ddlPayrollYr.SelectedItem.Text;
            string month = ddlPayMonth.SelectedItem.Text.Substring(0, 3);



            string mon = month + "-" + year;
            string payperiod = lbactutot.Text;

            string totalbillgross = txtBillingGross.Text;
            int i = Convert.ToInt32(ddlMinusPercentage.SelectedValue);
            if (1 == 4)
            {
                string sal = txtSalary.Text;
                txtBillingGross.Text = sal;
            }
            string totbill = txtTotalBilling.Text;
            string actualratee = "";
            string minusper = ddlMinusPercentage.SelectedValue;
            string emprate = txtEmployeeRate.Text;
            if (emprate == "")
            {
                emprate = "0";
            }
            string empgross = txtEmployeeGross.Text;
            if (empgross == "")
            {
                empgross = "0";
            }
            string igigross = txtIGIGross.Text;
            if (igigross == "")
            {
                igigross = "0";
            }
            string peridium = txtPeridium.Text;
            string newinsurance = txtDEDBPayNewRate.Text;
            string despdeduct = txtDescriptionofDeduction.Text;

            string salary = txtSalary.Text;
            string bonus = txtBonus.Text;
            string payadvancededuct = txtPayAdvance.Text;//advapay
            string grossdafterdeduct = txtGrossAfterDeduction.Text;
            string actualqbdeduct = txtActualQBDeduc.Text;
            //string 
            string payadvance2 = txtPayAdv.Text;

            string immiastatus = txtImmiStatus.SelectedValue;

            string balance = txtBalance.Text;
            string secondpay = txtSecondPay.SelectedItem.Text;
            string insurance = txtDEDBPayNewRate.Text;
            string remark = txtremark.Text;
            string billdate = DateTime.Now.ToString();
            string prebal = "";
            string netpay = "";
            string bepay = "";
            string totadvapy = "";



            string final = "";
            int flag = 0;
            string str1 = ddlMonth.SelectedItem.Text.Substring(0, 3);
            string yer = ddlYear.SelectedItem.Text;
            string final1 = empid1 + "-" + str1 + "-" + yer;
            SqlCommand cmd1 = new SqlCommand("insert into monthpay(empid,mont,tothours,actualrate,emprate,pdium,bepay,totgross,minuspercent,igigross,empgross,netpay,salary,bonus,advapay,totadva,prebal,visatype,finalpay,flag,billdate,despofdeduct,lcasal,currentytd,remark,secpay,monthtype,Rate_Insurance,actualqbdeuduct,lcasalprev,h1update,payadva_balance,colorremark,balancecolor,weekdetail_month)values('" + empid1 + "','" + mon + "','" + payperiod + "','" + actualratee + "','" + emprate + "','" + peridium + "','" + balance + "','" + grossdafterdeduct + "','" + minusper + "','" + igigross + "','" + empgross + "','" + netpay + "','" + salary + "','" + bonus + "','" + payadvancededuct + "','" + totadvapy + "','" + prebal + "','" + immiastatus + "','" + final + "','" + flag + "','" + billdate + "','" + despdeduct.Replace("'", "''") + "','" + lcasal + "','" + curytd + "','" + remark.Replace("'", "''") + "','" + secondpay + "'," + month_type + ",'" + insurance + "','" + actualqbdeduct + "','" + txtMonthSalary.Text + "','" + txtH1UpdateInfo.Text + "','" + txtPayAdv.Text + "','" + ddlclor.SelectedValue + "','" + ddlbalance.SelectedValue + "','" + final1 + "')", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            SqlDataAdapter ad = new SqlDataAdapter("select Top 1 * from monthpay order by mpid desc", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string id = ds.Tables[0].Rows[0]["mpid"].ToString();
            string date = DateTime.Now.ToString();

            foreach (GridViewRow g1 in GridView1.Rows)
            {
                //string empid = Convert.ToString(ViewState["em"]);
                //string type = ddlHrType.SelectedValue;

                //string range = g1.Cells[0].Text;

                //string ac = g1.Cells[2].Text;
                //string ot = g1.Cells[5].Text;

                //string[] temp = range.Split('-');

                //string week1 = temp[0];
                //string week2 = temp[1];

                //string str1 = ddlMonth.SelectedItem.Text.Substring(0, 3);
                //string yer = ddlYear.SelectedItem.Text;
                //SqlCommand cmd = new SqlCommand("insert into emp_weekdetails(empid ,hours,hour_type,week_rangefrom,week_rangeto,month_year,actual_rate,ot_rate,mpid,createddate ) values ('" + empid + "', '" + g1.Cells[1].Text + "','" + g1.Cells[4].Text + "','" + week1 + "','" + week2 + "','" + str1 + "-" + yer + "','" + ac + "','" + ot + "'," + id + ",'" + date + "')", con);



                //cmd.ExecuteNonQuery();


            }
            con.Close();





            string str = "alert('Pay Roll Details Added.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            Session["Editid"] = null;
            clearbox();
            pn1.Visible = false;
            ddlempid.SelectedValue = "0";
            bindmaingrid();
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
    protected void ddlempid_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Editid"] = null;
        ddlMonth.SelectedIndex = 0;
        GridView1.Visible = false;
        lbactutot.Text = "0";
        lblottot.Text = "0";
        txtPayPeriod.Text = "";
        txtIGIGross.Text = "";
        txtTotalBilling.Text = "";
        txtBillingGross.Text = "";

        //Session.Remove("Editid");
        //earbox();
        // DropDownList1.ClearSelection();
        string Year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();
        string id = ddlempid.SelectedValue;
        if (id != "Select" || id != "")
        {
            for (int i = 0; i < ddlYear.Items.Count; i++)
            {
                if (ddlYear.Items[i].Text == Year)
                {
                    ddlYear.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
            pn1.Visible = true;
            SqlDataAdapter ad = new SqlDataAdapter("select * from  [EmpContacts] where emp_id='" + id + "'", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string name = ds.Tables[0].Rows[0]["cname"].ToString();
                string email = ds.Tables[0].Rows[0]["cemail"].ToString();
                //ViewState["em"] = email;
                ViewState["em"] = id;
                string[] temp = name.Split(' ');

                txtEmpName.Text = temp[0];
                TextBox1.Text = temp[1];

                SqlDataAdapter ad1 = new SqlDataAdapter("select hrate,ot from ig_invoice where cemail='" + email + "'", con);
                DataSet ds1 = new DataSet();
                ad1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    //txtActualRate.Text = ds1.Tables[0].Rows[0]["hrate"].ToString();

                    // txtOTRate.Text = ds1.Tables[0].Rows[0]["ot"].ToString();
                }
                else
                {
                    // txtActualRate.Text = "0";
                    // txtOTRate.Text = "0";
                }
                // ViewState["ac"] = txtActualRate.Text;
                // ViewState["ot"] = txtOTRate.Text;
                bindmaingrid();
                string month = Convert.ToString(ddlPayMonth.SelectedValue);
                if (month == "1")
                {
                    TextBox6.Text = "0";
                }
                else
                {

                    SqlDataAdapter ad12 = new SqlDataAdapter("select top 1 * from  monthpay where empid='" + id + "' order by mpid desc ", con);
                    DataSet ds12 = new DataSet();
                    ad12.Fill(ds12);
                    if (ds12.Tables[0].Rows.Count > 0)
                    {
                        double ytd = Convert.ToDouble(ds12.Tables[0].Rows[0]["CurrentYTD"].ToString());
                        double gross = Convert.ToDouble(ds12.Tables[0].Rows[0]["totgross"].ToString());
                        TextBox6.Text = (ytd + gross).ToString();
                    }
                }
                //grid.Visible = false;
            }

        }
        else
        {
            // pn1.Visible = false;
        }
    }

    protected void clearbox()
    {
        ddlempid.SelectedIndex = 0;
        // ddlempid.SelectedValue = "";

        GridView1.DataSource = null;
        GridView1.DataBind();
        lb1.Visible = false;
        lb.Visible = false;
        lbactutot.Visible = false;
        lblottot.Visible = false;
        ddlMonthType.SelectedIndex = 0;
        txtLCASalary.Text = "";
        txtMonthSalary.Text = "";
        txtH1UpdateInfo.Text = "";
        TextBox6.Text = "";
        ddlMonth.SelectedIndex = 0;
        // ddlWeekRanges.Items.Clear();
        // txtNoOfHours.Text = "";
        GridView1.Visible = false;
        txtPayPeriod.Text = "";
        txtOTHrs.Text = "";
        txtActualQBDeduc.Text = "";
        //txtActualRate.Text = "";
        //txtOTRate.Text="";
        ddlMinusPercentage.SelectedIndex = 0;
        txtEmployeeGross.Text = "";
        txtIGIGross.Text = "";
        txtPeridium.Text = "";
        txtDEDBPayNewRate.Text = "";
        txtDescriptionofDeduction.Text = "";
        txtSalary.Text = "";
        txtBonus.Text = "";
        txtPayAdvance.Text = "";
        txtGrossAfterDeduction.Text = "";
        txtPayAdv.Text = "";
        txtImmiStatus.SelectedIndex = 0;
        txtBalance.Text = "";

        txtremark.Text = "";
        txtBillingGross.Text = "";

    }
    protected void ddlMinusPercentage_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindmaingrid();
        calculateminus();
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
            {
                string employeeId = gvEmployeePay.DataKeys[e.Row.RowIndex].Value.ToString();
                ViewState["empid"] = employeeId;
                SqlDataAdapter ad0 = new SqlDataAdapter("select * from monthpay where mpid='" + employeeId + "'", con);
                DataSet ds3 = new DataSet();
                ad0.Fill(ds3);
                string mnnew = Convert.ToString(ds3.Tables[0].Rows[0]["weekdetail_month"]);

                GridView gvHours = e.Row.FindControl("gvHours") as GridView;
                // string strQry = string.Format("select  * from emp_weekdetails where mpid='{0}'", employeeId);
                SqlDataAdapter ad1 = new SqlDataAdapter("select  * from emp_weekdetails where mpid='" + employeeId + "'", con);
                SqlDataAdapter ad2 = new SqlDataAdapter("select  * from emp_weekdetails where month_year='" + mnnew + "'", con);
                DataTable dt = new DataTable();
                if (mnnew == null || mnnew == "")
                {
                    ad1.Fill(dt);
                }
                else
                {
                    ad2.Fill(dt);
                }

                gvHours.DataSource = dt;
                gvHours.DataBind();
                if (dt.Rows.Count > 0)
                {
                    int sum = Convert.ToInt32(dt.Compute("SUM(hours)", string.Empty));
                    int sum1 = Convert.ToInt32(dt.Compute("SUM(hour_type)", string.Empty));
                    Label ftb = (Label)gvHours.Controls[0].Controls[gvHours.Controls[0].Controls.Count - 1].FindControl("tothorreg");
                    Label ftb1 = (Label)gvHours.Controls[0].Controls[gvHours.Controls[0].Controls.Count - 1].FindControl("tothorregot");
                    ftb.Text = sum.ToString();
                    ftb1.Text = sum1.ToString();
                }
                else
                {
                }
                foreach (TableCell cell in e.Row.Cells)
                {

                    Label name = (Label)e.Row.FindControl("Label1");
                    Label emprate = (Label)e.Row.FindControl("Label2");
                    Label empgross = (Label)e.Row.FindControl("Label3");
                    Label totalgross = (Label)e.Row.FindControl("Label5");
                    Label empid = (Label)e.Row.FindControl("Label1emp");
                    Label month = (Label)e.Row.FindControl("Label1month");
                    Label igigross = (Label)e.Row.FindControl("Label4");
                    Label visa = (Label)e.Row.FindControl("Label11");
                    Label lca = (Label)e.Row.FindControl("Label12");
                    Label ytd = (Label)e.Row.FindControl("Label14");
                    Label sal = (Label)e.Row.FindControl("Label6");
                    Label bonus = (Label)e.Row.FindControl("Label7");
                    Label pdium = (Label)e.Row.FindControl("Label8");
                    Label remark = (Label)e.Row.FindControl("Labelremark");

                    Label payadva = (Label)e.Row.FindControl("Labelpay");
                    Label insurance = (Label)e.Row.FindControl("Labelinsurance");

                    Label insurancedesp = (Label)e.Row.FindControl("Labelinsurancedesp");
                    Label lblminusper = (Label)e.Row.FindControl("lblminusper");

                    Label balance = (Label)e.Row.FindControl("Label10");
                    SqlDataAdapter adapter1 = new SqlDataAdapter("select colorremark,balancecolor from monthpay where mpid=" + employeeId, con);
                    DataSet ds1 = new DataSet();
                    adapter1.Fill(ds1);
                    string color1 = ds1.Tables[0].Rows[0]["colorremark"].ToString();
                    string color2 = ds1.Tables[0].Rows[0]["balancecolor"].ToString();
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        if (color1 == "1")
                        {
                            remark.ForeColor = System.Drawing.Color.Red;
                        }
                        if (color1 == "2")
                        {
                            remark.ForeColor = System.Drawing.Color.Black;
                        }
                        if (color1 == "3")
                        {
                            remark.ForeColor = System.Drawing.Color.Blue;
                        }
                        //else
                        //{
                        //    remark.ForeColor = System.Drawing.Color.Black;
                        //}
                    }
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        if (color2 == "1")
                        {
                            balance.ForeColor = System.Drawing.Color.Red;
                        }
                        if (color2 == "2")
                        {
                            balance.ForeColor = System.Drawing.Color.Black;
                        }
                        if (color2 == "3")
                        {
                            balance.ForeColor = System.Drawing.Color.Blue;
                        }
                        //else
                        //{
                        //    balance.ForeColor = System.Drawing.Color.Black;
                        //}
                    }
                    SqlDataAdapter adapter = new SqlDataAdapter("select colorcode from monthpay where mpid=" + employeeId, con);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    string color = ds.Tables[0].Rows[0]["colorcode"].ToString();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (color == "1")
                        {

                            //remark.ForeColor = System.Drawing.Color.Red;
                            month.ForeColor = System.Drawing.Color.Red;
                            name.ForeColor = System.Drawing.Color.Red;
                            emprate.ForeColor = System.Drawing.Color.Red;
                            empgross.ForeColor = System.Drawing.Color.Red;
                            totalgross.ForeColor = System.Drawing.Color.Red;
                            visa.ForeColor = System.Drawing.Color.Red;
                            empid.ForeColor = System.Drawing.Color.Red;
                            month.ForeColor = System.Drawing.Color.Red;
                            igigross.ForeColor = System.Drawing.Color.Red;
                            lca.ForeColor = System.Drawing.Color.Red;
                            ytd.ForeColor = System.Drawing.Color.Red;
                            sal.ForeColor = System.Drawing.Color.Red;
                            bonus.ForeColor = System.Drawing.Color.Red;
                            pdium.ForeColor = System.Drawing.Color.Red;
                            payadva.ForeColor = System.Drawing.Color.Red;
                            insurance.ForeColor = System.Drawing.Color.Red;
                            insurancedesp.ForeColor = System.Drawing.Color.Red;
                            lblminusper.ForeColor = System.Drawing.Color.Red;
                            balance.ForeColor = System.Drawing.Color.Red;
                            //ddlempid.SelectedItem
                            //empid
                            //e.Row.ForeColor = System.Drawing.Color.Red;// This will make row back color red
                        }
                        if (color == "2")
                        {


                            month.ForeColor = System.Drawing.Color.Black;
                            name.ForeColor = System.Drawing.Color.Black;
                            emprate.ForeColor = System.Drawing.Color.Black;
                            empgross.ForeColor = System.Drawing.Color.Black;
                            totalgross.ForeColor = System.Drawing.Color.Black;
                            visa.ForeColor = System.Drawing.Color.Black;
                            empid.ForeColor = System.Drawing.Color.Black;
                            month.ForeColor = System.Drawing.Color.Black;
                            igigross.ForeColor = System.Drawing.Color.Black;
                            lca.ForeColor = System.Drawing.Color.Black;
                            ytd.ForeColor = System.Drawing.Color.Black;
                            sal.ForeColor = System.Drawing.Color.Black;
                            bonus.ForeColor = System.Drawing.Color.Black;
                            pdium.ForeColor = System.Drawing.Color.Black;
                            payadva.ForeColor = System.Drawing.Color.Black;
                            insurance.ForeColor = System.Drawing.Color.Black;
                            insurancedesp.ForeColor = System.Drawing.Color.Black;
                            lblminusper.ForeColor = System.Drawing.Color.Black;
                            balance.ForeColor = System.Drawing.Color.Black;
                            //remark.ForeColor = System.Drawing.Color.Black;
                        }
                        if (color == "3")
                        {

                            //remark.ForeColor = System.Drawing.Color.Blue;
                            month.ForeColor = System.Drawing.Color.Blue;
                            name.ForeColor = System.Drawing.Color.Blue;
                            emprate.ForeColor = System.Drawing.Color.Blue;
                            empgross.ForeColor = System.Drawing.Color.Blue;
                            totalgross.ForeColor = System.Drawing.Color.Blue;
                            visa.ForeColor = System.Drawing.Color.Blue;
                            empid.ForeColor = System.Drawing.Color.Blue;
                            month.ForeColor = System.Drawing.Color.Blue;
                            igigross.ForeColor = System.Drawing.Color.Blue;
                            lca.ForeColor = System.Drawing.Color.Blue;
                            ytd.ForeColor = System.Drawing.Color.Blue;
                            sal.ForeColor = System.Drawing.Color.Blue;
                            bonus.ForeColor = System.Drawing.Color.Blue;
                            pdium.ForeColor = System.Drawing.Color.Blue;
                            payadva.ForeColor = System.Drawing.Color.Blue;
                            insurance.ForeColor = System.Drawing.Color.Blue;
                            insurancedesp.ForeColor = System.Drawing.Color.Blue;
                            lblminusper.ForeColor = System.Drawing.Color.Blue;
                            balance.ForeColor = System.Drawing.Color.Blue;

                        }
                    }
                    else
                    {
                    }
                }

                //if (e.Row.RowState != DataControlRowState.Edit)
                //{
                //    Label lblGvPengumuman = e.Row.Cells[5].FindControl("Label2") as Label;
                //    Label lbl2 = e.Row.Cells[5].FindControl("Label3") as Label;
                //    Label lbl3 = e.Row.Cells[5].FindControl("Label4") as Label;
                //    Label lbl4 = e.Row.Cells[5].FindControl("Label5") as Label;
                //    if (lblGvPengumuman.Text == "0" || lblGvPengumuman.Text == "" )
                //    {z9-z99   8                                                                                                                   
                //        lblGvPengumuman.Text = "Salary";
                //    }
                //    if (lbl2.Text == "0" || lbl2.Text == "" )
                //    {
                //        lbl2.Text = "Salary";
                //    }
                //    if (lbl3.Text == "0" || lbl3.Text == "" )
                //    {
                //        lbl3.Text = "Salary";
                //    }
                //    if (lbl4.Text == "0" || lbl4.Text == "NaN" || lbl4.Text == "" )
                //    {
                //        lbl4.Text = "Salary";
                //    }
                //}

            }
        }
    }

    protected void ddlPayMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayMonth.SelectedItem.Text != "Select" || ddlPayMonth.SelectedItem.Text != "" || ddlPayrollYr.SelectedItem.Text != "Select" || ddlPayrollYr.SelectedItem.Text != "")
        {
            Session.Remove("Editid");
            bindmaingrid();
            pn1.Visible = false;
            string month = ddlPayMonth.SelectedItem.Text;
            string year = ddlPayrollYr.SelectedItem.Text;
            hrnew.Text = "Pay Roll For " + month + "-" + year;
        }
        else
        {
            grid.Visible = false;
        }
    }



    protected void bindmaingrid()
    {
        Div1.Visible = true;
        grid.Visible = true;

        string str1 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
        string yer = ddlPayrollYr.SelectedItem.Text;

        string value = str1 + "-" + yer;
        //SqlDataAdapter ad = new SqlDataAdapter("select, case when a.colorcode=1 then 'Red' when a.colorcode=2 then 'Black' when a.colorcode=3 then 'Blue' end as colorcode,  b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId and a.mont='" + value + "' order by b.cname", con);
        SqlDataAdapter ad = new SqlDataAdapter("select CASE WHEN minusPercent=1 THEN '75% X 25%' WHEN minusPercent=2 THEN '80% X 20%' WHEN minusPercent=3 THEN '70% X 30%' ELSE 'Salary' END as minus, case when a.visatype=1 then 'H1-B' else 'NA' end as visa, case when a.colorcode=1 then 'Red' when a.colorcode=2 then 'Black' when a.colorcode=3 then 'Blue' end as color,  b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId and a.mont='" + value + "' order by b.cname", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvEmployeePay.Visible = true;
            gvEmployeePay.DataSource = dt;
            gvEmployeePay.DataBind();
            Label8.Visible = false;
        }
        else
        {
            gvEmployeePay.Visible = false;
            grid.Visible = true;
            Label8.Visible = true;
        }
    }
    protected void gvEmployeePay_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEmployeePay.PageIndex = e.NewPageIndex;
        bindmaingrid();
    }
    protected void gvEmployeePay_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            SqlDataAdapter ad = new SqlDataAdapter("select * from MonthPay where weekdetail_month= '" + id + "'", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string empid = ds.Tables[0].Rows[0]["EmpID"].ToString();
            string month = ds.Tables[0].Rows[0]["mont"].ToString();

            // SqlCommand cmd1 = new SqlCommand("delete from emp_weekdetails where weekdetail_month= '"+ id+"' ", con);
            SqlCommand cmd = new SqlCommand("delete from monthpay where weekdetail_month= '" + id + "'", con);
            //SqlCommand cmd1 = new SqlCommand("delete from emp_weekdetails where empid='" + id + "' and ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            //cmd1.ExecuteNonQuery();
            con.Close();
            string str = "alert('Pay Roll Details Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bindmaingrid();
        }
        if (e.CommandName == "Edit")
        {
            string id = e.CommandArgument.ToString();
            Session["Editid"] = id;
            Response.Redirect("admin_payrolla.aspx");
        }
    }
    protected void gvEmployeePay_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    //protected void ExportExcel(object sender, EventArgs e)
    //{
    //    DataTable dt = new DataTable("GridView_Data");
    //    //SqlDataAdapter ad = new SqlDataAdapter("select b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId", con);
    //    //ad.Fill(dt);

    //    GridView gvOrders = (GridView)gvEmployeePay.Rows[1].FindControl("gvHours");
    //    foreach (TableCell cell in gvEmployeePay.HeaderRow.Cells)
    //    {
    //        dt.Columns.Add(cell.Text);
    //    }
    //    foreach (TableCell cell in gvOrders.HeaderRow.Cells)
    //    {
    //        dt.Columns.Add(cell.Text);
    //    }
    //    dt.Columns.RemoveAt(0);
    //    foreach (GridViewRow row in gvEmployeePay.Rows)
    //    {
    //        GridView gvOrderscell = (row.FindControl("gvHours") as GridView);
    //        for (int j = 0; j < gvOrderscell.Rows.Count; j++)
    //        {
    //            dt.Rows.Add(row.Cells[1].Text, row.Cells[2].Text, gvOrderscell.Rows[j].Cells[0].Text, gvOrderscell.Rows[j].Cells[1].Text);
    //        }
    //    }
    //    using (XLWorkbook wb = new XLWorkbook())
    //    {
    //        wb.Worksheets.Add(dt);

    //        Response.Clear();
    //        Response.Buffer = true;
    //        Response.Charset = "";
    //        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    //        Response.AddHeader("content-disposition", "attachment;filename=GridView.xlsx");
    //        using (MemoryStream MyMemoryStream = new MemoryStream())
    //        {
    //            wb.SaveAs(MyMemoryStream);
    //            MyMemoryStream.WriteTo(Response.OutputStream);
    //            Response.Flush();
    //            Response.End();
    //        }
    //    }
    //}


    protected void GridView1_RowEditing1(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {

        if (ViewState["currtable"] != null)
        {

            GridView1.EditIndex = e.NewEditIndex;
            bindfirstweekgrid1();
            //GridView1.EditIndex = e.NewEditIndex;
        }
        else
        {
            GridView1.EditIndex = e.NewEditIndex;

            bindfirstweekgrid();

        }
    }
    protected void GridView1_RowUpdating1(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        TextBox txtFName = (TextBox)gvEmployeePay.Rows[e.RowIndex].FindControl("txtempgross");
    }


    protected void bindfirstweekgrid()
    {
        GridView1.DataSource = ViewState["CurrentTable"] as DataTable;
        GridView1.DataBind();

    }
    protected void bindfirstweekgrid1()
    {
        GridView1.DataSource = ViewState["currtable"] as DataSet;
        GridView1.DataBind();

    }
    protected void OnUpdate(object sender, EventArgs e)
    {
        GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        string week = ((TextBox)row.Cells[0].Controls[0]).Text;
        double reghours = Convert.ToDouble(((TextBox)row.Cells[1].Controls[0]).Text);
        //int reghours = Convert.ToInt32(((TextBox)row.Cells[1].Controls[0]).Text);
        double actualrate = Convert.ToDouble(((TextBox)row.Cells[2].Controls[0]).Text);
        double total = Convert.ToDouble(((TextBox)row.Cells[3].Controls[0]).Text);
        double othour = Convert.ToDouble(((TextBox)row.Cells[4].Controls[0]).Text);
        double otrate = Convert.ToDouble(((TextBox)row.Cells[5].Controls[0]).Text);
        double ottotal = Convert.ToDouble(((TextBox)row.Cells[6].Controls[0]).Text);

        double regtotal = 0;
        double ottot = 0;

        if (ViewState["currtable"] != null)
        {
            DataSet ds = ViewState["currtable"] as DataSet;
            DataTable dt = ds.Tables[0];
            // DataTable dt = ViewState["CurrentTable"] as DataTable;
            dt.Rows[row.RowIndex]["week"] = week;
            dt.Rows[row.RowIndex]["reghours"] = reghours;
            dt.Rows[row.RowIndex]["actualrate"] = actualrate;

            regtotal = reghours * actualrate;
            dt.Rows[row.RowIndex]["totalregamount"] = regtotal;

            dt.Rows[row.RowIndex]["othours"] = othour;
            dt.Rows[row.RowIndex]["otrate"] = otrate;
            ottot = othour * otrate;
            dt.Rows[row.RowIndex]["totalotamount"] = ottot;
            ViewState["grid"] = ds;
            if (dt.Rows.Count > 0)
            {
                int sum = Convert.ToInt32(dt.Compute("SUM(reghours)", string.Empty));
                this.lbactutot.Text = sum.ToString();
                int sum1 = Convert.ToInt32(dt.Compute("SUM(totalregamount)", string.Empty));
                this.txtPayPeriod.Text = sum1.ToString();
                int sum2 = Convert.ToInt32(dt.Compute("SUM(totalotamount)", string.Empty));
                this.txtOTHrs.Text = sum2.ToString();
                int sum3 = Convert.ToInt32(dt.Compute("SUM(othours)", string.Empty));
                this.lblottot.Text = sum3.ToString();
            }
            //lblottot.Text = sum3.ToString();
            ViewState["ac"] = actualrate;
            ViewState["ot"] = otrate;
            calculateminus();

            //lbactutot.Text = Convert.ToString(ottotal);
            //this.txtPayPeriod.Text = lbactutot.Text;
            //this.txtOTHrs.Text = lblottot.Text;
            //adddatatogrid();
            GridView1.EditIndex = -1;
            bindfirstweekgrid1();
            grid.Visible = false;
            // bindmaingrid();
        }
        else
        {

            DataTable dt = ViewState["CurrentTable"] as DataTable;
            dt.Rows[row.RowIndex]["week"] = week;
            dt.Rows[row.RowIndex]["reghours"] = reghours;
            dt.Rows[row.RowIndex]["actualrate"] = actualrate;
            regtotal = reghours * actualrate;
            dt.Rows[row.RowIndex]["totalregamount"] = regtotal;
            dt.Rows[row.RowIndex]["othours"] = othour;
            dt.Rows[row.RowIndex]["otrate"] = otrate;
            ottot = othour * otrate;
            dt.Rows[row.RowIndex]["totalotamount"] = ottot;
            //int sum = Convert.ToInt32(dt.Compute("SUM(reghours)", string.Empty));
            //this.lbactutot.Text = sum.ToString();
            // int sum1 = Convert.ToInt32(dt.Compute("SUM(totalregamount)", string.Empty));
            //this.txtPayPeriod.Text = sum1.ToString();
            //int sum2 = Convert.ToInt32(dt.Compute("SUM(totalotamount)", string.Empty));
            // this.txtOTHrs.Text = sum2.ToString();

            //int sum3 = Convert.ToInt32(dt.Compute("SUM(othours)", string.Empty));

            // lblottot.Text = sum3.ToString();
            ViewState["CurrentTable"] = dt;
            ViewState["CurrentTable"] = dt;
            if (dt.Rows.Count > 0)
            {

                //int sum = Convert.ToInt32(dt.Compute("SUM(reghours)", string.Empty));
                //this.lbactutot.Text = sum.ToString();

                //int sum1 = Convert.ToInt32(dt.Compute("SUM(othours)", string.Empty));
                //lblottot.Text = sum1.ToString();

                //int sum2 = Convert.ToInt32(dt.Compute("SUM(totalregamount)", string.Empty));
                //this.txtPayPeriod.Text = sum2.ToString();
                //int sum3 = Convert.ToInt32(dt.Compute("SUM(totalotamount)", string.Empty));
                //this.txtOTHrs.Text = sum3.ToString();

                //int sumot = 0;
                //int sumreg = 0;
                //int totalreg = 0;
                //int totalot = 0;

                //foreach (DataRow dr in dt.Rows)
                //{
                //    sumot += Convert.ToInt32(dr["othours"]);
                //    sumreg += Convert.ToInt32(dr["reghours"]);
                //    totalreg += Convert.ToInt32(dr["totalregamount"]);
                //    totalot += Convert.ToInt32(dr["totalotamount"]);
                //}
                //this.lbactutot.Text = sumot.ToString();
                //this.txtPayPeriod.Text = totalreg.ToString();
                //this.txtOTHrs.Text = totalot.ToString();
                //lbactutot.Text = sumreg.ToString();
                //int sum3 = Convert.ToInt32(dt.Compute("SUM(othours)", string.Empty));
                //lblottot.Text = Convert.ToString(total);
                //lbactutot.Text = Convert.ToString(ottotal);
                //this.txtPayPeriod.Text = lbactutot.Text;
                //this.txtOTHrs.Text = lblottot.Text;
                //adddatatogrid();
                ViewState["ac"] = actualrate;
                ViewState["ot"] = otrate;
                calculateminus();
                GridView1.EditIndex = -1;
                bindfirstweekgrid();
                bindmaingrid();
            }
        }
        double payreg = Convert.ToDouble(txtPayPeriod.Text);
        double payot = Convert.ToDouble(txtOTHrs.Text);
        txtBillingGross.Text = (payreg + payot).ToString();
    }
    protected void OnCancel(object sender, EventArgs e)
    {
        if (ViewState["currtable"] != null)
        {
            GridView1.EditIndex = -1;
            bindfirstweekgrid1();
        }
        else
        {
            GridView1.EditIndex = -1;
            bindfirstweekgrid();
            bindmaingrid();
        }
    }


    protected void Update1(object sender, EventArgs e)
    {
        //  int index = int.Parse(e.CommandArgument.ToString());
        GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        LinkButton myButton = sender as LinkButton;
        string user = myButton.CommandArgument;
        TextBox empname = (TextBox)row.FindControl("txtempname");
        TextBox emprate = (TextBox)row.FindControl("txtemprate");
        TextBox empgross = (TextBox)row.FindControl("txtempgross");
        TextBox igigross = (TextBox)row.FindControl("txtigigross");
        TextBox totalgross = (TextBox)row.FindControl("txttotalgross");
        TextBox salary = (TextBox)row.FindControl("txtsalary");
        TextBox bonus = (TextBox)row.FindControl("txtbonus");
        TextBox peri = (TextBox)row.FindControl("txtperi");
        // TextBox minus = (TextBox)row.FindControl("txtminus");

        DropDownList minus = (DropDownList)row.FindControl("DropDownList4");


        TextBox balance = (TextBox)row.FindControl("txtbalance");
        //TextBox visatype = (TextBox)row.FindControl("txtvisatype");

        DropDownList visatype = (DropDownList)row.FindControl("DropDownList2");
        TextBox lcbalance = (TextBox)row.FindControl("txtlsalary");
        //TextBox visatype = (TextBox)row.FindControl("txtvisatype");
        TextBox ytd = (TextBox)row.FindControl("txtlytdsalary");
        TextBox emp = (TextBox)row.FindControl("txtempid");
        DropDownList color = (DropDownList)row.FindControl("DropDownListclor");
        TextBox month = (TextBox)row.FindControl("txtmonth");
        TextBox payadva = (TextBox)row.FindControl("txtpay");
        TextBox insu = (TextBox)row.FindControl("txtinsurance");
        TextBox insudesp = (TextBox)row.FindControl("txtinsurancedesp");
        TextBox remark = (TextBox)row.FindControl("txtremark");
        DropDownList rm = (DropDownList)row.FindControl("DropDownListclorremark");
        con.Open();

        if (rm.Text != "0" || rm.Text != "Select")
        {
            SqlDataAdapter ad = new SqlDataAdapter("select * from monthpay where weekdetail_month='" + user + "' ", con);


            //lab.text = minus.SelectedValue;
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string empid = ds.Tables[0].Rows[0]["empid"].ToString();
            SqlCommand cmd = new SqlCommand("update empcontacts set cname='" + empname.Text + "'where emp_id='" + empid + "'", con);

            SqlCommand cmd1 = new SqlCommand("update monthpay set remark='" + remark.Text + "', DespofDeduct='" + insudesp.Text + "' ,Rate_Insurance='" + insu.Text + "', advaPay='" + payadva.Text + "', mont='" + month.Text + "', EmpRate='" + emprate.Text + "',pDium='" + peri.Text + "',bepay='" + balance.Text + "',totgross='" + totalgross.Text + "',minuspercent='" + minus.SelectedValue + "',igigross='" + igigross.Text + "',empgross='" + empgross.Text + "',salary='" + salary.Text + "',bonus='" + bonus.Text + "',visatype='" + visatype.SelectedValue + "',Lcasal='" + lcbalance.Text + "',CurrentYTD='" + ytd.Text + "',EmpId='" + emp.Text + "',colorcode='" + color.SelectedValue + "',colorremark='" + rm.SelectedValue + "' where weekdetail_month='" + user + "'", con);
            //SqlCommand cmd = new SqlCommand("update monthpay set ")
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            string str = "alert('Pay Roll Details Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bindmaingrid();


            gvEmployeePay.EditIndex = -1;
            bindmaingrid();
        }

        else
        {
            SqlDataAdapter ad = new SqlDataAdapter("select * from monthpay where weekdetail_month='" + user + "' ", con);


            //lab.text = minus.SelectedValue;
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string empid = ds.Tables[0].Rows[0]["empid"].ToString();
            SqlCommand cmd = new SqlCommand("update empcontacts set cname='" + empname.Text + "'where emp_id='" + empid + "'", con);

            SqlCommand cmd1 = new SqlCommand("update monthpay set remark='" + remark.Text + "', DespofDeduct='" + insudesp.Text + "' ,Rate_Insurance='" + insu.Text + "', advaPay='" + payadva.Text + "', mont='" + month.Text + "', EmpRate='" + emprate.Text + "',pDium='" + peri.Text + "',bepay='" + balance.Text + "',totgross='" + totalgross.Text + "',minuspercent='" + minus.SelectedValue + "',igigross='" + igigross.Text + "',empgross='" + empgross.Text + "',salary='" + salary.Text + "',bonus='" + bonus.Text + "',visatype='" + visatype.SelectedValue + "',Lcasal='" + lcbalance.Text + "',CurrentYTD='" + ytd.Text + "',EmpId='" + emp.Text + "',colorcode='" + color.SelectedValue + "' where weekdetail_month='" + user + "'", con);
            //SqlCommand cmd = new SqlCommand("update monthpay set ")
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            string str = "alert('Pay Roll Details Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bindmaingrid();


            gvEmployeePay.EditIndex = -1;
            bindmaingrid();
        }
    }
    protected void Cancel1(object sender, EventArgs e)
    {
        gvEmployeePay.EditIndex = -1;
        bindmaingrid();
    }
    protected void gvEmployeePay_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        LinkButton myButton = sender as LinkButton;
        string user = myButton.CommandArgument;
        Session["Editid"] = user;
        Response.Redirect("admin_payrolla.aspx");
        // gvEmployeePay.EditIndex = e.NewEditIndex;

        //bindmaingrid();
    }
    protected void gvEmployeePay_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gvEmployeePay.EditIndex = -1;

        bindmaingrid();
    }
    protected void gvEmployeePay_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
    }
    protected void gvHours_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Row is row in nested GridView2
            //Find the label and DataList in that row
            string id = Convert.ToString(ViewState["empid"]);
            GridViewRow row = e.Row;
            foreach (TableCell cell in e.Row.Cells)
            {
                Label lbl1 = (Label)row.FindControl("smallgridlabel1");
                Label lbl2 = (Label)row.FindControl("smallgridlabel2");
                Label lbl3 = (Label)row.FindControl("smallgridlabel3");
                Label lbl4 = (Label)row.FindControl("smallgridlabel4");
                Label lbl5 = (Label)row.FindControl("smallgridlabel5");
                Label lbl6 = (Label)row.FindControl("smallgridlabel6");
                Label reghr = (Label)row.FindControl("tothorreg");
                SqlDataAdapter adapter = new SqlDataAdapter("select colorcode from monthpay where mpid=" + id, con);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                string color = ds.Tables[0].Rows[0]["colorcode"].ToString();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (color == "1")
                    {

                        lbl1.ForeColor = System.Drawing.Color.Red;

                        lbl2.ForeColor = System.Drawing.Color.Red;
                        lbl3.ForeColor = System.Drawing.Color.Red;
                        lbl4.ForeColor = System.Drawing.Color.Red;
                        lbl5.ForeColor = System.Drawing.Color.Red;
                        lbl6.ForeColor = System.Drawing.Color.Red;
                        //DataList DataList2 = (DataList)row.FindControl("DataList2");
                    }
                    if (color == "2")
                    {

                        lbl1.ForeColor = System.Drawing.Color.Black;

                        lbl2.ForeColor = System.Drawing.Color.Black;
                        lbl3.ForeColor = System.Drawing.Color.Black;
                        lbl4.ForeColor = System.Drawing.Color.Black;
                        lbl5.ForeColor = System.Drawing.Color.Black;
                        lbl6.ForeColor = System.Drawing.Color.Black;
                        //DataList DataList2 = (DataList)row.FindControl("DataList2");
                    }
                    if (color == "3")
                    {

                        lbl1.ForeColor = System.Drawing.Color.Blue;

                        lbl2.ForeColor = System.Drawing.Color.Blue;
                        lbl3.ForeColor = System.Drawing.Color.Blue;
                        lbl4.ForeColor = System.Drawing.Color.Blue;
                        lbl5.ForeColor = System.Drawing.Color.Blue;
                        lbl6.ForeColor = System.Drawing.Color.Blue;
                        //DataList DataList2 = (DataList)row.FindControl("DataList2");
                    }
                }
            }
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        try
        {
            string id = Convert.ToString(Session["Editid"]);
            //SqlCommand cmd = new SqlCommand("delete from emp_weekdetails where mpid= " + id, con);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
            string str12 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
            string yer12 = ddlPayrollYr.SelectedItem.Text;
            SqlCommand cmd1 = new SqlCommand("update monthpay set   remark='" + txtremark.Text.Replace("'", "''") + "', DespofDeduct='" + txtDescriptionofDeduction.Text.Replace("'", "''") + "' ,Rate_Insurance='" + txtDEDBPayNewRate.Text + "', advaPay='" + txtPayAdvance.Text + "', mont='" + str12 + "-" + yer12 + "', EmpRate='" + txtEmployeeRate.Text + "',pDium='" + txtPeridium.Text + "',bepay='" + txtBalance.Text + "',totgross='" + txtGrossAfterDeduction.Text + "',minuspercent='" + ddlMinusPercentage.SelectedValue + "',igigross='" + txtIGIGross.Text + "',empgross='" + txtEmployeeGross.Text + "',salary='" + txtSalary.Text + "',bonus='" + txtBonus.Text + "',visatype='" + txtImmiStatus.SelectedValue + "',Lcasal='" + txtLCASalary.Text + "',CurrentYTD='" + TextBox6.Text + "',EmpId='" + ddlempid.SelectedValue + "',actualqbdeuduct='" + txtActualQBDeduc.Text + "',lcasalprev='" + txtMonthSalary.Text + "',h1update='" + txtH1UpdateInfo.Text + "',monthtype='" + ddlMonthType.SelectedValue + "',colorremark='" + ddlclor.SelectedValue + "',balancecolor='" + ddlbalance.SelectedValue + "' where weekdetail_month='" + id + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            foreach (GridViewRow g1 in GridView1.Rows)
            {
                //string empid = Convert.ToString(ViewState["em"]);
                //string type = ddlHrType.SelectedValue;

                //string range = g1.Cells[0].Text;

                //string ac = g1.Cells[2].Text;
                //string ot = g1.Cells[5].Text;

                //string[] temp = range.Split('-');

                //string week1 = temp[0];
                //string week2 = temp[1];

                //string str1 = ddlMonth.SelectedItem.Text.Substring(0, 3);
                //string yer = ddlYear.SelectedItem.Text;
                //string date = DateTime.Now.ToString();
                //string monthyear = empid + "-" + str1 + "-" + yer;
                //SqlCommand cmd2 = new SqlCommand("insert into emp_weekdetails(empid ,hours,hour_type,week_rangefrom,week_rangeto,month_year,actual_rate,ot_rate,mpid,createddate ) values ('" + empid + "', '" + g1.Cells[1].Text + "','" + g1.Cells[4].Text + "','" + week1 + "','" + week2 + "','" + monthyear+ "','" + ac + "','" + ot + "'," + id + ",'" + date + "')", con);

                //con.Open();

                //cmd2.ExecuteNonQuery();

                //con.Close();
            }
            string str = "alert('Pay Roll Details Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Session.Remove("Editid");
            bindcanceldata();
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Home.aspx");
    }

    public void bindbelowdata()
    {
        //clearbox();
        string id = ddlempid.SelectedValue;
        pn1.Visible = true;
        SqlDataAdapter ad = new SqlDataAdapter("select * from  [EmpContacts] where emp_id='" + id + "'", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string name = ds.Tables[0].Rows[0]["cname"].ToString();
            string email = ds.Tables[0].Rows[0]["cemail"].ToString();
            //ViewState["em"] = email;
            ViewState["em"] = id;
            string[] temp = name.Split(' ');

            txtEmpName.Text = temp[0];
            TextBox1.Text = temp[1];

            double hour = 0;
            double ot = 0;

            SqlDataAdapter ad1 = new SqlDataAdapter("select hourrate,otrate from vendors where Emp_Id='" + id + "'", con);
            DataSet ds1 = new DataSet();
            ad1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                // hour = Convert.ToDouble( ds1.Tables[0].Rows[0]["hourrate"].ToString());

                // ot = Convert.ToDouble(ds1.Tables[0].Rows[0]["otrate"].ToString());
            }
            else
            {
                // txtActualRate.Text = "0";
                // txtOTRate.Text = "0";
            }
            //ViewState["ac"] = hour;
            //  ViewState["ot"] = ot;
            // bindmaingrid();
            divgrid1.Visible = true;
            SqlDataAdapter ad12 = new SqlDataAdapter("select top 1 * from  monthpay where empid='" + id + "' order by billdate desc ", con);
            DataSet ds12 = new DataSet();
            ad12.Fill(ds12);
            string month = Convert.ToString(ddlPayMonth.SelectedValue);
            if (month == "1")
            {
                TextBox6.Text = "0";
            }
            else
            {
                if (ds12.Tables[0].Rows.Count > 0)
                {
                    double ytd = Convert.ToDouble(ds12.Tables[0].Rows[0]["CurrentYTD"].ToString());
                    double gross = Convert.ToDouble(ds12.Tables[0].Rows[0]["totgross"].ToString());
                    TextBox6.Text = (ytd + gross).ToString();
                }
                //grid.Visible = false;
            }
        }

    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        //  Response.Redirect("admin_payroll.aspx");
        //bindmaingrid();
        bindcanceldata();
        Session.Remove("Editid");
        // Request.QueryString.Remove("Editid");
    }
    protected void bindcanceldata()
    {

        try
        {
            grid.Visible = true;
            string month = Convert.ToString(ViewState["month"]);
            string year = Convert.ToString(ViewState["year1"]);
            if (month == "" || year == "")
            {
                Response.Redirect("admin_payrolla.aspx");
            }
            else
            {

                for (int i = 0; i < ddlPayMonth.Items.Count; i++)
                {
                    if (ddlPayMonth.Items[i].Text == month)
                    {
                        ddlPayMonth.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;

                    }

                }
                for (int i = 0; i < ddlPayrollYr.Items.Count; i++)
                {
                    if (ddlPayrollYr.Items[i].Text == year)
                    {
                        ddlPayrollYr.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;

                    }

                }
                Div1.Visible = true;
                grid.Visible = true;
                string str1 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
                string yer = ddlPayrollYr.SelectedItem.Text;

                string value = str1 + "-" + yer;
                //SqlDataAdapter ad = new SqlDataAdapter("select, case when a.colorcode=1 then 'Red' when a.colorcode=2 then 'Black' when a.colorcode=3 then 'Blue' end as colorcode,  b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId and a.mont='" + value + "' order by b.cname", con);
                SqlDataAdapter ad = new SqlDataAdapter("select CASE WHEN minusPercent=1 THEN '75% X 25%' WHEN minusPercent=2 THEN '80% X 20%' WHEN minusPercent=3 THEN '70% X 30%' ELSE 'Salary' END as minus, case when a.visatype=1 then 'H1-B' else 'NA' end as visa, case when a.colorcode=1 then 'Red' when a.colorcode=2 then 'Black' when a.colorcode=3 then 'Blue' end as color,  b.CName,a.* from MonthPay a, EmpContacts b  where b.Emp_id =a.EmpId and a.mont='" + value + "' order by b.cname", con);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gvEmployeePay.Visible = true;
                    gvEmployeePay.DataSource = dt;
                    gvEmployeePay.DataBind();
                    Label8.Visible = false;
                    pn1.Visible = false;
                    ddlempid.SelectedIndex = 0;
                    ddlMonthType.SelectedIndex = 0;
                    txtEmpName.Text = "";
                    TextBox1.Text = "";
                    txtEmployeeRate.Text = "";
                    Button2.Visible = true;
                    Button1.Visible = false;
                    btn.Visible = true;

                }
                else
                {
                    gvEmployeePay.Visible = false;
                    grid.Visible = true;
                    Label8.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
    protected void txtBonus_TextChanged(object sender, EventArgs e)
    {
        double sal = Convert.ToDouble(txtSalary.Text);
        double bonus = Convert.ToDouble(txtBonus.Text);
        double pay = Convert.ToDouble(txtPayAdvance.Text);
        double gafter = (sal + bonus) - pay;
        gafter = Convert.ToDouble(txtGrossAfterDeduction.Text);

    }
    protected void txtDEDBPayNewRate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            double pay;
            double sal = Convert.ToDouble(txtSalary.Text);
            double bonus = Convert.ToDouble(txtBonus.Text);
            if (txtPayAdvance.Text == "")
            {
                pay = 0;
            }
            else
            {
                pay = Convert.ToDouble(txtPayAdvance.Text);
            }
            double gafter = (sal + bonus + pay);

            double empgross = Convert.ToDouble(txtEmployeeGross.Text);

            txtGrossAfterDeduction.Text = Convert.ToString(gafter);

            //txtBalance.Text = Convert.ToDecimal(empgross - gafter);

            double bal = Convert.ToDouble(empgross - gafter);
            double insu = Convert.ToDouble(txtDEDBPayNewRate.Text);



            decimal test2 = Convert.ToDecimal(bal);
            Double dc = Math.Round((Double)test2, 2);
            txtBalance.Text = dc.ToString();
            //decimal test2 = Convert.ToDecimal(bal);
            //gafter = Convert.ToDouble(txtGrossAfterDeduction.Text);
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
    protected void txtBonus_TextChanged1(object sender, EventArgs e)
    {
        try
        {
            double pay;
            double insu = Convert.ToDouble(txtDEDBPayNewRate.Text);
            double sal = Convert.ToDouble(txtSalary.Text);
            double bonus = Convert.ToDouble(txtBonus.Text);
            if (txtPayAdvance.Text == "")
            {
                pay = 0;
            }
            else
            {
                pay = Convert.ToDouble(txtPayAdvance.Text);
            }
            double gafter = (sal + bonus + pay);

            double empgross = Convert.ToDouble(txtEmployeeGross.Text);
            double bal = (empgross - insu - sal - bonus - pay);
            //txtBalance.Text = bal.ToString();

            // string id = String.Format("{0:0.00}", bal);
            decimal test2 = Convert.ToDecimal(bal);
            Double dc = Math.Round((Double)test2, 2);
            txtBalance.Text = dc.ToString();
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

    }
    protected void txtPayAdvance_TextChanged(object sender, EventArgs e)
    {
        try
        {
            double pay;
            double insu = Convert.ToDouble(txtDEDBPayNewRate.Text);
            double sal = Convert.ToDouble(txtSalary.Text);
            double bonus = Convert.ToDouble(txtBonus.Text);
            if (txtPayAdvance.Text == "")
            {
                pay = 0;
            }
            else
            {
                pay = Convert.ToDouble(txtPayAdvance.Text);
            }
            double gafter = (sal + bonus + pay);

            double empgross = Convert.ToDouble(txtEmployeeGross.Text);
            double bal = (empgross - insu - sal - bonus - pay);
            //txtBalance.Text = bal.ToString();

            // string id = String.Format("{0:0.00}", bal);
            decimal test2 = Convert.ToDecimal(bal);
            Double dc = Math.Round((Double)test2, 2);
            txtBalance.Text = dc.ToString();
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}






