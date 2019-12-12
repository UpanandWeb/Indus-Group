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

public partial class admin_Admin_Salary_Statement : System.Web.UI.Page
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
    }

    public void GetEmpData()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Ind_EmpSal order by eid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            empdata.DataSource = ds;
            empdata.DataBind();
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
        SqlCommand cmd = new SqlCommand("delete from Ind_EmpSal where eid=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Salary Details has been deleted Successfully');location.replace('Admin-Salary-Statement.aspx');", true);
        }
    }

    private void Binddata(string lnk, string year, string email,string sal,string name)
    {
        int m = Convert.ToInt32(lnk);
        int y = Convert.ToInt32(year);
        int days = DateTime.DaysInMonth(y, m);

        string work = "";
        SqlCommand cmd = new SqlCommand(" select count(*)  as work  from(SELECT a.remark2, a.rsymbol,a.mrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, mrate as totalrate,mrate as mrate ,rsymbol as rsymbol,case remark1 when 'Leave' then '1' else 'NIL' end as remark2 FROM   IA_DailytimeSheet) a WHERE  a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  and status=4 aND  worktime not in (0)  )b", con);
        {
            con.Open();
            work = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
        }
        string leave = "";
        SqlCommand cmd1 = new SqlCommand("  select count(b.remark2)  as leaves  from(SELECT a.remark2, a.rsymbol,a.mrate,a.remark1,a.remarks,a.month1,a.year1,a.email,a.worktime,a.status,a.empid,a.empname,a.ddate,a.intime,a.intime1,a.outtime,a.outtime1,a.lunch,a.did FROM (  SELECT  case posteddate when 1 then 'NO Lunch Out Punch' when 2 then 'NO Lunch in Punch' when 3 then 'NO Work Out Punch' when 4 then 'NO Lunch Out, Lunch in, Work Out Punch in Previous Day' when 5 then 'NO Lunch in, Work Out  Punch in Previous Day' when 6 then 'NO Work Out Punch in Previous Day' else 'NO' end as Remarks,remark1 as remark1,lunch as lunch,intime as intime, outtime as outtime,intime1 as intime1, outtime1 as outtime1,ddate as ddate,empid as empid,empname as empname, worktime as worktime,DATEPART(month,ddate) as month1, datepart(year,ddate) as year1,did as did,empemail as email,status as status, mrate as totalrate,mrate as mrate ,rsymbol as rsymbol,case remark1 when 'Leave' then '1' else 'NIL' end as remark2 FROM   IA_DailytimeSheet) a WHERE a.email='" + email + "' and a.month1 = '" + lnk + "' and a.year1='" + year + "'  and a.remark2 not in('NIL') )b  ", con);
        {
            con.Open();
            leave = Convert.ToString(cmd1.ExecuteScalar());
            con.Close();
        }

        int leaves1 = Convert.ToInt32(work) + Convert.ToInt32(leave);
        int tdays = days - leaves1;
        int workdays = (Convert.ToInt32(sal) / days) * Convert.ToInt32(work);

        string ename = name;
        string eemail = email;
        string emonth = lnk;
        string eyear = year;
        string ewdays = work;
        string eldays = leave;
        string etdays = Convert.ToString(leaves1);
        string esal = sal;
        string egsal = Convert.ToString(workdays);

        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from Ind_EmpSal where  eemail='" + eemail + "' and smonth='" + lnk + "' and syear='" + year + "' and status=1", con);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
        {
            con.Open();
            string s = "insert into Ind_EmpSal(EName,Eemail,smonth,syear,wdays,ldays,tdays,salary,gainsal,status) values ('" + ename + "','" + eemail + "','" + emonth + "','" + eyear + "','" + ewdays + "','" + eldays + "','" + etdays + "','" + esal + "','" + egsal + "','1') ";
            SqlCommand cmd3 = new SqlCommand(s, con);
            int i = cmd3.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {

            }
        }


        SqlDataAdapter sdaaaaa1 = new SqlDataAdapter("select * from Ind_EmpSal where  eemail='" + eemail + "' and smonth='" + lnk + "' and syear='" + year + "' and status=1", con);
        DataSet dssss1 = new DataSet();
        sdaaaaa1.Fill(dssss1);
        if (dssss1.Tables[0].Rows.Count > 0 )
        {
            string id = dssss1.Tables[0].Rows[0]["eid"].ToString();
            con.Open();
            string s = "update Ind_EmpSal set EName='" + ename + "',Eemail='" + eemail + "',smonth='" + emonth + "',syear='" + eyear + "',wdays='" + ewdays + "',ldays='" + eldays + "',tdays='" + etdays + "',gainsal='" + egsal + "' where  eid='"+id+"' and  eemail='" + eemail + "' and smonth='" + lnk + "' and syear='" + year + "'";
            SqlCommand cmd3 = new SqlCommand(s, con);
              int i = cmd3.ExecuteNonQuery();
            con.Close();
               if (i == 1)
               {

               }
        }

        SqlDataAdapter sscmd = new SqlDataAdapter("select * from Ind_EmpSal where  eemail='" + email + "' and smonth = '" + lnk + "' and syear='" + year + "' order by eid desc", con);
        DataSet das = new DataSet();
        sscmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            empdata.DataSource = das;
            empdata.DataBind();
        }
        else
        {
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
                string sal = Findemail1(email);
                string name = Findemail2(email);

                if (sal != "")
                {
                    Binddata(lnk, year, email,sal,name);
                }
                else
                {
                    string strscpt = "alert ('Please select Year');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
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

    private string Findemail(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["emailid"].ToString();
    }

    private string Findemail1(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["hrate"].ToString();
    }

    private string Findemail2(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string l= ds.Tables[0].Rows[0]["lastname"].ToString();
        string f = ds.Tables[0].Rows[0]["firstname"].ToString();
        return l +' '+ f;
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
        GetEmpData();
    }

}