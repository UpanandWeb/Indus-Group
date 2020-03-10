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

public partial class Timesheet_Remarks : System.Web.UI.Page
{
    string emailid = string.Empty;
    public string schtimezone = "";
    private string schtime = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        ccal.EndDate = DateTime.UtcNow.AddHours(-4);

        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string emailid = Session["userid"].ToString();
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
                    Session["symbol"] = dssss.Tables[0].Rows[0]["ratesymbol"].ToString();
                    Session["rate"] = dssss.Tables[0].Rows[0]["hrate"].ToString();
                }
            }
        }
    }

    protected void btnsaveout_Click(object sender, EventArgs e)
    {
        if (ddtype.SelectedItem.Text != "Select")
        {
            if (ddtype.SelectedItem.Text != "Leave")
            {
                string did = Session["userid"].ToString();
                string name = txtempname.Text;
                string empid = txtid.Text;
                string email = txtemail.Text;
                string date = txtdate.Text;
                string remark = ddtype.SelectedItem.Text;
                string ddcont = Session["contry"].ToString();

                string rate = Session["rate"].ToString();
                string symbol = Session["symbol"].ToString();

                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from IA_DailytimeSheet where  ddate='" + date + "' and empemail='" + email + "'  ", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);

                if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
                {
                    con.Open();
                    string s = "insert into IA_DailytimeSheet(empname,empid,empemail,ddate,status,country,posteddate,remark1,worktime,intime,outtime,Lunch,intime1,outtime1,hrate,rsymbol) values ('" + name + "','" + empid + "','" + email + "','" + date + "','4','" + ddcont + "','0','" + remark + "','0','00:00','00:00','00:00','00:00','00:00','" + rate + "','" + symbol + "') ";
                    SqlCommand cmd = new SqlCommand(s, con);
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i == 1)
                    {
                        string strscpt = "alert ('Leave Details Saved');location.replace('Emp_Timesheet.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
                else
                {
                    string strscpt = "alert ('Already given date is filled');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }

        }
        if (ddtype.SelectedItem.Text == "Leave")
        {
            if ((txtfrom.Text != "") && (txtto.Text != ""))
            {
                string remark = ddtype.SelectedItem.Text;
                string did = Session["userid"].ToString();
                string name = txtempname.Text;
                string empid = txtid.Text;
                string email = txtemail.Text;
                string ddcont = Session["contry"].ToString();
                string rate = Session["rate"].ToString();
                string symbol = Session["symbol"].ToString();
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
                                string strscpt = "alert ('Leave Details Saved');location.replace('Emp_Timesheet.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                            }
                        }
                        else
                        {
                            string strscpt = "alert ('The Given Date is filled');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                            goto BREAK;

                        }
                        
                    }
                BREAK: ;
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
            string strscpt = "alert ('Please Select Leave Type');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void ddtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddtype.SelectedItem.Text == "Leave")
        {
            leave.Visible = true;
            leave1.Visible = false;

        }
        else
        {
            leave.Visible = false;
            leave1.Visible = true;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp_Timesheet.aspx?userid=" + Session["userid"].ToString());
    }
}