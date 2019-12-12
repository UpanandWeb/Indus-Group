using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_Pendingaccounts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

   // SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    exception es = new exception();
    string page = "Admin-Pendingaccounts.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataAdapter sscmd = new SqlDataAdapter("select  emp_id +' ' + '-' +' '+ cname as name ,* from EmpContacts order by cname", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                ddemp.DataTextField = "name";
                ddemp.DataValueField = "emp_id";

                ddemp.DataSource = das;
                ddemp.DataBind();
                ddemp.Items.Insert(0, "Select Employee");
            }
            lnk.Visible = false;
            lbhead.Visible = false;
            temp.Visible = false;

        }
    }
    protected void btnsearch_Click1(object sender, EventArgs e)
    {
        try
        {
            lbempinfo.Visible = true;
            lnk.Visible = true;
            gvEmployeePay.Visible = true;
            if (ddemp.SelectedItem.Text != "Select Employee")
            {
                binfirstgrid(ddemp.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter("select Cname from EmpContacts where emp_id='" + ddemp.SelectedValue + "'", con);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string name = dt.Rows[0]["cname"].ToString();
                    lbempinfo.Text = "Pending Account For " + "-" + name;
                }
                //binddeletegrid();
                bindbalance();
            }
        }

        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
    protected void binfirstgrid(string empid)
    {

        try
        {
            DataColumn dc = new DataColumn();
            DataTable d2 = new DataTable();


            dc = new DataColumn();
            dc.ColumnName = "actual";
            dc.Caption = "actual_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "total";
            dc.Caption = "total";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "empid";
            dc.Caption = "empid";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "mpid";
            dc.Caption = "mpid";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "mont";
            dc.Caption = "mont";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "totgross";
            dc.Caption = "totgross";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "emprate";
            dc.Caption = "emprate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "rate_insurance";
            dc.Caption = "rate_insurance";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "bepay";
            dc.Caption = "bepay";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "remark";
            dc.Caption = "remark";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "ottotal";
            dc.Caption = "ottotal";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "ot_rate";
            dc.Caption = "ot_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "month_year";
            dc.Caption = "month_year";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "empgross";
            dc.Caption = "empgross";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "pdium";
            dc.Caption = "pdium";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            SqlDataAdapter ad = new SqlDataAdapter("select * from monthpay where empid='" + ddemp.SelectedValue + "'", con);
            DataTable ds = new DataTable();
            ad.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                for (int i = 0; i < ds.Rows.Count; i++)
                {
                    DataRow row = d2.NewRow();
                    DataRow dr = ds.Rows[i];
                    string id = dr[0].ToString();
                    SqlDataAdapter ad1 = new SqlDataAdapter("select c.actual_rate,sum(hours) as total,c.ot_rate ,sum(hour_type) as ottotal,c.month_year, c.empid,c.mpid, a.mont,a.mpid,a.empgross,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,a.flag,a.pdium  from MonthPay a, emp_weekdetails c where c.mpid=a.mpid and a.mpid='" + id + "' and a.flag=0 group by c.actual_rate,c.ot_rate, c.empid,c.mpid, a.mont,a.mpid,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,c.month_year,a.flag,a.empgross,a.pdium", con);
                    DataTable dt = new DataTable();
                    ad1.Fill(dt);
                    for (int i1 = 0; i1 < dt.Rows.Count; i1++)
                    {
                        DataRow row1 = d2.NewRow();
                        DataRow dr1 = dt.Rows[i1];

                        row1["actual"] = dt.Rows[i1]["actual_rate"].ToString();
                        row1["total"] = dt.Rows[i1]["total"].ToString();
                        row1["empid"] = dt.Rows[i1]["empid"].ToString();
                        row1["mpid"] = dt.Rows[i1]["mpid"].ToString();
                        row1["mont"] = dt.Rows[i1]["mont"].ToString();
                        row1["totgross"] = dt.Rows[i1]["totgross"].ToString();
                        row1["emprate"] = dt.Rows[i1]["emprate"].ToString();
                        row1["rate_insurance"] = dt.Rows[i1]["rate_insurance"].ToString();
                        row1["bepay"] = dt.Rows[i1]["bepay"].ToString();
                        row1["ot_rate"] = dt.Rows[i1]["ot_rate"].ToString();
                        row1["ottotal"] = dt.Rows[i1]["ottotal"].ToString();
                        row1["remark"] = dt.Rows[i1]["remark"].ToString();
                        row1["month_year"] = dt.Rows[i1]["month_year"].ToString();
                        row1["empgross"] = dt.Rows[i1]["empgross"].ToString();
                        // IEnumerable<DataRow> newRows = dt.AsEnumerable().Skip(1);
                        //  DataTable dt2 = newRows.CopyToDataTable();

                        d2.Rows.Add(row1);
                        // d2.ImportRow(dr1);
                    }
                }
                DataTable d3 = new DataTable();
                d3 = d2;
                gvEmployeePay.DataSource = d3;
                gvEmployeePay.DataBind();
            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }




    protected void bindbalance()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from pending_acc where empid='" + ddemp.SelectedValue + "'", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        //GridView2.DataSource = dt;
        //GridView2.DataBind();
    }
    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        //gvEmployeePay.Visible = false;
        ////GridView2.Visible = false;
        //lb2.Visible = false;
        //lnk.Visible = false;
        //lbempinfo.Visible = false;

        try
        {
            lbempinfo.Visible = true;
            lnk.Visible = true;
            gvEmployeePay.Visible = true;
            if (ddemp.SelectedItem.Text != "Select Employee")
            {
                binfirstgrid(ddemp.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter("select Cname from EmpContacts where emp_id='" + ddemp.SelectedValue + "'", con);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string name = dt.Rows[0]["cname"].ToString();
                    lbempinfo.Text = "Pending Account For " + "-" + name;
                }
                //binddeletegrid();
                bindbalance();
            }
        }

        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
    protected void gvEmployeePay_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "delete")
            {
                string id = e.CommandArgument.ToString();
                int flag = 1;

                lbhead.Visible = true;
                temp.Visible = true;

                ViewState["id"] = id;
                //SqlCommand cmd = new SqlCommand("update monthpay  set flag='" + flag + "'    where mpid='" + id + "'", con);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                //string str = "alert('Pending Account Details Deleted.');";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                //binfirstgrid(id);
                //binddeletegrid();


            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }

    //protected void binddeletegrid()
    //{
    //    DataColumn dc = new DataColumn();
    //    DataTable d2 = new DataTable();


    //    dc = new DataColumn();
    //    dc.ColumnName = "actual";
    //    dc.Caption = "actual_rate";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "total";
    //    dc.Caption = "total";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "empid";
    //    dc.Caption = "empid";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "mpid";
    //    dc.Caption = "mpid";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "mont";
    //    dc.Caption = "mont";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "totgross";
    //    dc.Caption = "totgross";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "emprate";
    //    dc.Caption = "emprate";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "rate_insurance";
    //    dc.Caption = "rate_insurance";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "bepay";
    //    dc.Caption = "bepay";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "remark";
    //    dc.Caption = "remark";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);


    //    dc = new DataColumn();
    //    dc.ColumnName = "ottotal";
    //    dc.Caption = "ottotal";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "ot_rate";
    //    dc.Caption = "ot_rate";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    dc = new DataColumn();
    //    dc.ColumnName = "month_year";
    //    dc.Caption = "month_year";
    //    dc.DataType = Type.GetType("System.String");
    //    d2.Columns.Add(dc);

    //    DataRow row = d2.NewRow();
    //    //DataRow dr = ds.Rows[i];
    //    //string id1 = dr[0].ToString();
    //    SqlDataAdapter ad1 = new SqlDataAdapter("select c.actual_rate,sum(hours) as total,c.ot_rate ,sum(hour_type) as ottotal,c.month_year, c.empid,c.mpid, a.mont,a.mpid,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,a.flag  from MonthPay a, emp_weekdetails c where c.mpid=a.mpid  and a.flag=1 group by c.actual_rate,c.ot_rate, c.empid,c.mpid, a.mont,a.mpid,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,c.month_year,a.flag  ", con);
    //    DataTable dt = new DataTable();
    //    ad1.Fill(dt);
    //    if (dt.Rows.Count > 0)
    //    {
    //        for (int i1 = 0; i1 < dt.Rows.Count; i1++)
    //        {
    //            DataRow row1 = d2.NewRow();
    //            DataRow dr1 = dt.Rows[i1];

    //            row1["actual"] = dt.Rows[i1]["actual_rate"].ToString();
    //            row1["total"] = dt.Rows[i1]["total"].ToString();
    //            row1["empid"] = dt.Rows[i1]["empid"].ToString();
    //            row1["mpid"] = dt.Rows[i1]["mpid"].ToString();
    //            row1["mont"] = dt.Rows[i1]["mont"].ToString();
    //            row1["totgross"] = dt.Rows[i1]["totgross"].ToString();
    //            row1["emprate"] = dt.Rows[i1]["emprate"].ToString();
    //            row1["rate_insurance"] = dt.Rows[i1]["rate_insurance"].ToString();
    //            row1["bepay"] = dt.Rows[i1]["bepay"].ToString();
    //            row1["ot_rate"] = dt.Rows[i1]["ot_rate"].ToString();
    //            row1["ottotal"] = dt.Rows[i1]["ottotal"].ToString();
    //            row1["remark"] = dt.Rows[i1]["remark"].ToString();
    //            row1["month_year"] = dt.Rows[i1]["month_year"].ToString();
    //            // IEnumerable<DataRow> newRows = dt.AsEnumerable().Skip(1);
    //            //  DataTable dt2 = newRows.CopyToDataTable();

    //            d2.Rows.Add(row1);
    //            // d2.ImportRow(dr1);
    //        }

    //        DataTable d3 = new DataTable();
    //        d3 = d2;
    //        lb2.Visible = true;
    //        GridView1.Visible = true;
    //        GridView1.DataSource = d3;
    //        GridView1.DataBind();
    //    }
    //    else
    //    {
    //        GridView1.Visible = false;
    //        lb2.Visible = false;
    //    }
    //}


    protected void gvEmployeePay_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        try
        {
            DataColumn dc = new DataColumn();
            DataTable d2 = new DataTable();


            dc = new DataColumn();
            dc.ColumnName = "Empid";
            dc.Caption = "empid";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "QB Payroll Month";
            dc.Caption = "mont";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);



            dc = new DataColumn();
            dc.ColumnName = "Pay Roll Period(Week Range)";
            dc.Caption = "month_year";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "Reg. Total Hour";
            dc.Caption = "total";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);



            dc = new DataColumn();
            dc.ColumnName = "Actual Rate";
            dc.Caption = "actual_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "OT Total Hr";
            dc.Caption = "ottotal";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "OT Rate";
            dc.Caption = "ot_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "EmpRate";
            dc.Caption = "emprate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            //dc = new DataColumn();
            //dc.ColumnName = "mpid";
            //dc.Caption = "mpid";
            //dc.DataType = Type.GetType("System.String");
            //d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "TotalGross";
            dc.Caption = "totgross";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);



            dc = new DataColumn();
            dc.ColumnName = "Insurance";
            dc.Caption = "rate_insurance";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Balance";
            dc.Caption = "bepay";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remark";
            dc.Caption = "remark";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "Deduction";
            dc.Caption = "deduction";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "DeductionRemark";
            dc.Caption = "remark";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);



            dc = new DataColumn();
            dc.ColumnName = "Date";
            dc.Caption = "createddate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "QB Payroll";
            dc.Caption = "paymonth";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);



            dc = new DataColumn();
            dc.ColumnName = "BalanceAmount";
            dc.Caption = "balance";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            SqlDataAdapter ad = new SqlDataAdapter("select * from monthpay where empid='" + ddemp.SelectedValue + "'", con);
            DataTable ds = new DataTable();
            ad.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                for (int i = 0; i < ds.Rows.Count; i++)
                {
                    // DataRow row = d2.NewRow();
                    DataRow dr = ds.Rows[i];
                    string id = dr[0].ToString();
                    SqlDataAdapter ad1 = new SqlDataAdapter("select c.actual_rate,sum(hours) as total,c.ot_rate ,sum(hour_type) as ottotal,c.month_year, c.empid,c.mpid, a.mont,a.mpid,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,a.flag  from MonthPay a, emp_weekdetails c where c.mpid=a.mpid and a.mpid='" + id + "' and a.flag=0 group by c.actual_rate,c.ot_rate, c.empid,c.mpid, a.mont,a.mpid,a.totgross,a.emprate,a.rate_insurance,a.remark,a.bepay,c.month_year,a.flag", con);
                    DataTable dt = new DataTable();
                    ad1.Fill(dt);
                    for (int i1 = 0; i1 < dt.Rows.Count; i1++)
                    {
                        DataRow row = d2.NewRow();
                        DataRow dr1 = dt.Rows[i1];

                        row["empid"] = dt.Rows[i1]["empid"].ToString();
                        row["QB Payroll Month"] = dt.Rows[i1]["mont"].ToString();
                        row["Pay Roll Period(Week Range)"] = dt.Rows[i1]["month_year"].ToString();
                        row["Reg. Total Hour"] = dt.Rows[i1]["total"].ToString();
                        row["EmpRate"] = dt.Rows[i1]["emprate"].ToString();
                        row["Actual Rate"] = dt.Rows[i1]["actual_rate"].ToString();


                        //row1["mpid"] = dt.Rows[i1]["mpid"].ToString();

                        row["TotalGross"] = dt.Rows[i1]["totgross"].ToString();

                        row["Insurance"] = dt.Rows[i1]["rate_insurance"].ToString();
                        row["Balance"] = dt.Rows[i1]["bepay"].ToString();
                        row["OT Rate"] = dt.Rows[i1]["ot_rate"].ToString();
                        row["OT Total Hr"] = dt.Rows[i1]["ottotal"].ToString();
                        row["Remark"] = dt.Rows[i1]["remark"].ToString();

                        // IEnumerable<DataRow> newRows = dt.AsEnumerable().Skip(1);
                        //  DataTable dt2 = newRows.CopyToDataTable();
                        d2.Rows.Add(row);
                        SqlDataAdapter ad12 = new SqlDataAdapter("select  * from pending_acc where mpid='" + id + "'", con);
                        DataTable dt1 = new DataTable();
                        ad12.Fill(dt1);
                        if (dt1.Rows.Count > 0)
                        {
                            for (int i11 = 0; i11 < dt1.Rows.Count; i11++)
                            {
                                DataRow row1 = d2.NewRow();
                                DataRow dr11 = dt1.Rows[i11];

                                row1["Empid"] = dt1.Rows[i11]["empid"].ToString();
                                // row1["mpid"] = dt1.Rows[i11]["mpid"].ToString();
                                row1["QB Payroll"] = dt1.Rows[i1]["paymonth"].ToString();
                                row1["BalanceAmount"] = dt1.Rows[i1]["balance"].ToString();
                                row1["Deduction"] = dt1.Rows[i11]["deduction"].ToString();
                                row1["Deductionremark"] = dt1.Rows[i11]["balance_remark"].ToString();
                                row1["Date"] = dt1.Rows[i11]["createddate"].ToString();
                                //row1["OT Rate"] = dt1.Rows[i11]["ot_rate"].ToString();

                                //IEnumerable<DataRow> newRows = dt1.AsEnumerable().Skip(1);
                                // DataTable dt2 = newRows.CopyToDataTable();

                                d2.Rows.Add(dt1.Rows[i11]["empid"].ToString(), dt1.Rows[i11]["paymonth"].ToString(), dt1.Rows[i11]["balance"].ToString(), dt1.Rows[i11]["deduction"].ToString(), dt1.Rows[i11]["balance_remark"].ToString(), dt1.Rows[i11]["createddate"].ToString());
                                // d2.ImportRow(dr1);
                            }
                        }
                        else
                        {

                        }

                        // d2.ImportRow(dr1);
                    }
                }
                DataTable d3 = new DataTable();
                d3 = d2;
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Pending Accounts.xls"));
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
    protected void btn_Click(object sender, EventArgs e)
    {

        try
        {
            string id = Convert.ToString(ViewState["id"]);
            SqlDataAdapter ad = new SqlDataAdapter("select bepay,mont,empid from monthpay where mpid='" + id + "'", con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            SqlDataAdapter ad1 = new SqlDataAdapter("select top 1 * from pending_acc where mpid='" + id + "' order by pid desc", con);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                decimal balance = Convert.ToDecimal(dt1.Rows[0]["balance"].ToString());
                string empid = Convert.ToString(dt.Rows[0]["empid"].ToString());
                string month = Convert.ToString(dt.Rows[0]["mont"].ToString());
                decimal deduct = Convert.ToDecimal(txtdeduction.Text);
                decimal final = balance - deduct;
                string remark = txtremark.Text;
                string date = DateTime.Now.ToString();
                SqlCommand cmd = new SqlCommand(" insert into pending_acc (empid,paymonth,mpid,balance,deduction,balance_remark,createddate) values ('" + empid + "','" + month + "','" + id + "','" + final + "','" + deduct + "','" + remark.Replace("'", "''") + "','" + date + "')", con);
                // SqlCommand cmd1 = new SqlCommand("update monthpay set bepay='" + final + "',remark='"+remark.Replace("'","''")+"' where mpid='" + id + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                //cmd1.ExecuteNonQuery();
                con.Close();
                string str = "alert('Balance updated.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                binfirstgrid(id);
                txtdeduction.Text = "";
                txtremark.Text = "";
                temp.Visible = false;
                lbhead.Visible = false;
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    decimal balance = Convert.ToDecimal(dt.Rows[0]["bepay"].ToString());
                    string empid = Convert.ToString(dt.Rows[0]["empid"].ToString());
                    string month = Convert.ToString(dt.Rows[0]["mont"].ToString());
                    decimal deduct = Convert.ToDecimal(txtdeduction.Text);
                    decimal final = balance - deduct;
                    string remark = txtremark.Text;
                    string date = DateTime.Now.ToString();
                    SqlCommand cmd = new SqlCommand(" insert into pending_acc (empid,paymonth,mpid,balance,deduction,balance_remark,createddate) values ('" + empid + "','" + month + "','" + id + "','" + final + "','" + deduct + "','" + remark.Replace("'", "''") + "','" + date + "')", con);
                    // SqlCommand cmd1 = new SqlCommand("update monthpay set bepay='" + final + "',remark='"+remark.Replace("'","''")+"' where mpid='" + id + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    //cmd1.ExecuteNonQuery();
                    con.Close();

                }
                string str = "alert('Balance updated.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                binfirstgrid(id);
                txtdeduction.Text = "";
                txtremark.Text = "";
                temp.Visible = false;
                lbhead.Visible = false;

            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }

    }
    protected void clearbox()
    {
        txtdeduction.Text = "";
        txtremark.Text = "";
    }
    protected void gvEmployeePay_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
                {
                    string employeeId = gvEmployeePay.DataKeys[e.Row.RowIndex].Value.ToString();
                    ViewState["empid"] = employeeId;
                    GridView gvHours = e.Row.FindControl("gvHours") as GridView;
                    // string strQry = string.Format("select  * from pending_acc where mpid='{0}'", employeeId);


                    SqlDataAdapter ad1 = new SqlDataAdapter("select bepay from monthpay where mpid='" + employeeId + "'", con);
                    DataTable dt1 = new DataTable();
                    ad1.Fill(dt1);
                    SqlDataAdapter ad = new SqlDataAdapter("select * from pending_acc where mpid='" + employeeId + "'", con);
                    DataTable dt = new DataTable();
                    ad.Fill(dt);
                    gvHours.DataSource = dt;
                    gvHours.DataBind();

                    // dt = GetData(strQry);
                    if (dt.Rows.Count > 0)
                    {
                        Image ftb1 = e.Row.FindControl("imgchild") as Image;
                        ftb1.Visible = true;
                        decimal balance = Convert.ToDecimal(dt1.Rows[0]["bepay"].ToString());
                        int sum = Convert.ToInt32(dt.Compute("SUM(deduction)", string.Empty));
                        Label ftb = (Label)gvHours.Controls[0].Controls[gvHours.Controls[0].Controls.Count - 1].FindControl("lblTotal");
                        decimal sumfinal = Convert.ToDecimal(balance - sum);
                        if (sumfinal < 0)
                        {
                            ftb.Text = "Balance" + "-" + " " + "(" + Convert.ToString(sumfinal) + ")";
                        }
                        else
                        {
                            ftb.Text = "Balance" + "-" + " " + Convert.ToString(sumfinal);
                        }


                    }
                    else
                    {
                        Image ftb1 = e.Row.FindControl("imgchild") as Image;
                        ftb1.Visible = false;
                    }

                    // int sum = Convert.ToInt32(dt.Compute("SUM(deduction)", string.Empty));
                }

            }
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
    protected void gvHours_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {



        //decimal subtotal = 0 ;
        //decimal grandTotal = 0;
        //string id = ((HiddenField)e.Row.Parent.Parent.Parent.FindControl("HdnID")).Value;
        //// string employeeId = gvEmployeePay.DataKeys[e.Row.RowIndex].Value.ToString();
        // //GridViewRow row = e.Row;

        //     if (e.Row.RowType == DataControlRowType.DataRow)
        //     {
        //         SqlDataAdapter ad = new SqlDataAdapter("select * from pending_acc where mpid='" + id + "'", con);
        //         DataTable dt = new DataTable();
        //         ad.Fill(dt);
        //         //gvHours.DataSource = dt;
        //      // gvHours.DataBind();

        //         // dt = GetData(strQry);
        //         if (dt.Rows.Count > 0)
        //         {
        //             //object obj = dt.Compute("SUM(deduction)", string.Empty);
        //             //double value = (double)obj;
        //             subtotal = Convert.ToInt32(dt.Compute("SUM(deduction)", string.Empty));
        //              Label lbl1 = (Label)gv.FindControl("lb");
        //             // Label lb = (Label)e.Row.FindControl("lblTotal") as Label;
        //             // lb.Text = sum.ToString();
        //             //foreach (GridViewRow row in gvHours.Rows)
        //             //{
        //             //    if (row.RowType == DataControlRowType.Footer)
        //             //    {
        //             //        (e.Row.FindControl("lblTotal") as Label).Text = sum.ToString();
        //             //    }
        //             //}
        //         }


        //     }

        //     //(e.Row.FindControl("lblTotal") as Label).Text = subtotal.ToString();
        ////if (e.Row.RowType == DataControlRowType.Footer)
        ////{
        ////    (e.Row.FindControl("lblTotal") as Label).Text = subtotal.ToString();
        ////    subtotal = 0;
        ////}
        //if (e.Row.RowType == DataControlRowType.Footer)
        //{
        //    (e.Row.FindControl("lblTotal") as Label).Text = subtotal.ToString();

        //    //  Label lblTotal = (Label)e.Row.FindControl("lblTotal") as Label;
        //    //SqlDataAdapter ad = new SqlDataAdapter("select bepay from monthpay where mpid='" + id + "'", con);
        //    //DataTable dt = new DataTable();
        //    //ad.Fill(dt);
        //    //decimal balance = Convert.ToDecimal(dt.Rows[0]["bepay"].ToString());
        //    //(e.Row.FindControl("lblTotal") as Label).Text = "Balance" + "-" + Convert.ToString(balance - subtotal);
        //    //subtotal = 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //lnk.Visible = false;
        lbhead.Visible = false;
        temp.Visible = false;
    }
    protected void gvHours_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName.ToString() == "deletegv")
            {
                LinkButton lb = (LinkButton)e.CommandSource;
                GridViewRow gvr = (GridViewRow)lb.NamingContainer;
                GridView gridview = gvr.NamingContainer as GridView;
                int rowIndex = int.Parse(e.CommandArgument.ToString());

                SqlCommand cmd = new SqlCommand("delete from pending_acc where pid=" + rowIndex, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "alert('Balance deduction removed.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                binfirstgrid(ddemp.SelectedValue);
                // string stuID = gridview.DataKeys[rowIndex].Value.ToString();
            }
        }
        catch (Exception ex)
        {
            es.insert_exception(ex, page);
        }
    }
}



