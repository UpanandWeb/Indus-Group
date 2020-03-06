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
using System.Net;
using System.Net.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Class1
/// </summary>
public class IGIIT
{
	public IGIIT()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    /// <summary>
    /// summary description to get employee data and fill in to dataset
    /// </summary>
    /// <returns></returns>
    public DataSet GetEmpData()
    {        
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 order by lastname asc", connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        connection.Close();
        return ds;
    }

    /// <summary>
    /// summary description to get employee details through email id and fill it into dataset.
    /// </summary>
    /// <param name="emailid">Email Id</param>
    /// <returns></returns>
    public DataSet GetEmpDet1(string emailid)
    {
        //Establish sql connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //open database connection to connect to sql server.
        connection.Open();

        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'", connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //close database connection to disconnect to sql server
        connection.Close();
        return ds;
    }
    /// <summary>
    /// for india
    /// </summary>
    /// <param name="emailid"></param>
    /// <returns></returns>
    public DataSet GetEmpDet2(string emailid)
    {
        //Establish sql connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
        //open database connection to connect to sql server.
        connection.Open();

        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'", connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //close database connection to disconnect to sql server
        connection.Close();
        return ds;
    }
    /// <summary>
    /// summary description to get employee details through userid and fill it into dataset.
    /// </summary>
    /// <param name="uid">User ID</param>
    /// <returns></returns>
    public DataSet GetEmpDetails(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        //SqlDataAdapter da = new SqlDataAdapter("select * from employeereg where userid=" + uid, connection);
        
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid=" + uid, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetEmpDet(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        //SqlDataAdapter da = new SqlDataAdapter("select * from employeereg where userid=" + uid, connection);

        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg where username='" + uid + "'", connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetTimeSheetDetails(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        //SqlDataAdapter da = new SqlDataAdapter("select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,t.pdate Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid", connection);
        //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,t.pdate Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid;
        string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetTaskSheetDetails(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        
        string qry = "select e.userid EmpID, e.firstname EmpName,e.deptname Department,e.supname Supervisor,e.projname Project,t.taskname Task,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours from employeereg e, tasksheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetTaskSheetView(string uid, string qr)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        string qry = "select e.userid EmpID, e.firstname EmpName,e.deptname Department,e.supname Supervisor,e.projname Project,t.taskname Task,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours from employeereg e, tasksheet t where t.userid=e.userid and t.userid=" + uid + " and " + qr + " order by t.pdate";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetTimeSheetView(string uid, string qr)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " and " + qr + " order by Date";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public bool UpdateEmpDet(string uid, string ename, string cname, string clname, string dname, string sname, string pname, string ptim)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        string qry = "update employeereg set consname=@cname, clientname=@clname, deptname=@dname, supname=@sname, projname=@pname, projtime=@ptime where userid=" + uid;

        SqlCommand cmd = new SqlCommand(qry, connection);

        cmd.Parameters.Add(new SqlParameter("@cname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@clname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@dname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@sname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@pname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@ptime", SqlDbType.NVarChar, 250));

        cmd.Parameters["@cname"].Value = cname;
        cmd.Parameters["@clname"].Value = clname;
        cmd.Parameters["@dname"].Value = dname;
        cmd.Parameters["@sname"].Value = sname;
        cmd.Parameters["@pname"].Value = pname;
        cmd.Parameters["@ptime"].Value = ptim;

        string str = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        
        return true;
    }
    public bool AddTimeSheet(string uid, string whr, string otxk, string rem, 
            string x1, string x2, string x3, string x4, string x5, string x6, string x7, string x8, string x9, string x10,
            string x11, string x12, string x13, string x14, string x15, string x16, string x17, string x18,
            string x19, string x20, string x21, string x22, string x23, string x24, string x25, string x26,
            string x27, string x28, string x29, string x30,
            string y1, string y2, string y3, string y4, string y5, string y6, string y7, string y8, string y9, string y10,
            string y11, string y12, string y13, string y14, string y15, string y16, string y17, string y18,
            string y19, string y20, string y21, string y22, string y23, string y24, string y25, string y26,
            string y27, string y28, string y29, string y30, string sdt)
    {
        string str = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "insert into timesheet(userid,pdate,workhrs,overtime,rd1,rd2,rd3,rd4,rd5,rd6,rd7,rd8,rd9,rd10,";
            qry = qry + "rd11,rd12,rd13,rd14,rd15,rd16,rd17,rd18,rd19,rd20,rd21,rd22,rd23,rd24,rd25,rd26,rd27,rd28,rd29,rd30,";
            qry = qry + "ot1,ot2,ot3,ot4,ot5,ot6,ot7,ot8,ot9,ot10,ot11,ot12,ot13,ot14,ot15,ot16,ot17,ot18,ot19,ot20,";
            qry = qry + "ot21,ot22,ot23,ot24,ot25,ot26,ot27,ot28,ot29,ot30,remarks) values(@uids,@pdt,@whrs,@ottk,";
            qry = qry + "@lx1k,@lx2k,@lx3k,@lx4k,@lx5k,@lx6k,@lx7k,@lx8k,@lx9k,@lx10k,@lx11k,@lx12k,@lx13k,@lx14k,@lx15k,@lx16k,@lx17k,@lx18k,@lx19k,@lx20k,@lx21k,@lx22k,@lx23k,@lx24k,@lx25k,@lx26k,@lx27k,@lx28k,@lx29k,@lx30k,";
            qry = qry + "@ly1k,@ly2k,@ly3k,@ly4k,@ly5k,@ly6k,@ly7k,@ly8k,@ly9k,@ly10k,@ly11k,@ly12k,@ly13k,@ly14k,@ly15k,@ly16k,@ly17k,@ly18k,@ly19k,@ly20k,@ly21k,@ly22k,@ly23k,@ly24k,@ly25k,@ly26k,@ly27k,@ly28k,@ly29k,@ly30k,";
            qry = qry + "@remk)";

            SqlCommand cmd = new SqlCommand(qry, connection);

            cmd.Parameters.Add(new SqlParameter("@uids", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@whrs", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@ottk", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@lx1k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx2k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx3k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx4k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx5k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx6k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx7k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx8k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx9k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx10k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx11k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx12k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx13k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx14k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx15k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx16k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx17k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx18k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx19k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx20k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx21k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx22k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx23k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx24k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx25k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx26k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx27k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx28k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx29k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx30k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly1k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly2k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly3k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly4k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly5k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly6k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly7k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly8k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly9k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly10k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly11k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly12k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly13k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly14k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly15k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly16k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly17k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly18k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly19k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly20k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly21k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly22k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly23k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly24k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly25k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly26k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly27k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly28k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly29k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly30k", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@remk", SqlDbType.NVarChar, 500));

            cmd.Parameters["@uids"].Value = Convert.ToInt32(uid);
            cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);
            cmd.Parameters["@whrs"].Value = whr;
            cmd.Parameters["@ottk"].Value = otxk;
            cmd.Parameters["@lx1k"].Value = x1;
            cmd.Parameters["@lx2k"].Value = x2;
            cmd.Parameters["@lx3k"].Value = x3;
            cmd.Parameters["@lx4k"].Value = x4;
            cmd.Parameters["@lx5k"].Value = x5;
            cmd.Parameters["@lx6k"].Value = x6;
            cmd.Parameters["@lx7k"].Value = x7;
            cmd.Parameters["@lx8k"].Value = x8;
            cmd.Parameters["@lx9k"].Value = x9;
            cmd.Parameters["@lx10k"].Value = x10;
            cmd.Parameters["@lx11k"].Value = x11;
            cmd.Parameters["@lx12k"].Value = x12;
            cmd.Parameters["@lx13k"].Value = x13;
            cmd.Parameters["@lx14k"].Value = x14;
            cmd.Parameters["@lx15k"].Value = x15;
            cmd.Parameters["@lx16k"].Value = x16;
            cmd.Parameters["@lx17k"].Value = x17;
            cmd.Parameters["@lx18k"].Value = x18;
            cmd.Parameters["@lx19k"].Value = x19;
            cmd.Parameters["@lx20k"].Value = x20;
            cmd.Parameters["@lx21k"].Value = x21;
            cmd.Parameters["@lx22k"].Value = x22;
            cmd.Parameters["@lx23k"].Value = x23;
            cmd.Parameters["@lx24k"].Value = x24;
            cmd.Parameters["@lx25k"].Value = x25;
            cmd.Parameters["@lx26k"].Value = x26;
            cmd.Parameters["@lx27k"].Value = x27;
            cmd.Parameters["@lx28k"].Value = x28;
            cmd.Parameters["@lx28k"].Value = x29;
            cmd.Parameters["@lx30k"].Value = x30;
            cmd.Parameters["@ly1k"].Value = y1;
            cmd.Parameters["@ly2k"].Value = y2;
            cmd.Parameters["@ly3k"].Value = y3;
            cmd.Parameters["@ly4k"].Value = y4;
            cmd.Parameters["@ly5k"].Value = y5;
            cmd.Parameters["@ly6k"].Value = y6;
            cmd.Parameters["@ly7k"].Value = y7;
            cmd.Parameters["@ly8k"].Value = y8;
            cmd.Parameters["@ly9k"].Value = y9;
            cmd.Parameters["@ly10k"].Value = y10;
            cmd.Parameters["@ly11k"].Value = y11;
            cmd.Parameters["@ly12k"].Value = y12;
            cmd.Parameters["@ly13k"].Value = y13;
            cmd.Parameters["@ly14k"].Value = y14;
            cmd.Parameters["@ly15k"].Value = y15;
            cmd.Parameters["@ly16k"].Value = y16;
            cmd.Parameters["@ly17k"].Value = y17;
            cmd.Parameters["@ly18k"].Value = y18;
            cmd.Parameters["@ly19k"].Value = y19;
            cmd.Parameters["@ly20k"].Value = y20;
            cmd.Parameters["@ly21k"].Value = y21;
            cmd.Parameters["@ly22k"].Value = y22;
            cmd.Parameters["@ly23k"].Value = y23;
            cmd.Parameters["@ly24k"].Value = y24;
            cmd.Parameters["@ly25k"].Value = y25;
            cmd.Parameters["@ly26k"].Value = y26;
            cmd.Parameters["@ly27k"].Value = y27;
            cmd.Parameters["@ly28k"].Value = y28;
            cmd.Parameters["@ly28k"].Value = y29;
            cmd.Parameters["@ly30k"].Value = y30;
            cmd.Parameters["@remk"].Value = rem;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;
    }
    public bool addts(string uid, string whr, string otxk, string rem, string sdt,
            string x1, string y1, string x2, string y2, string x3, string y3, string x4, string y4, string x5, string y5,
        string x6, string y6, string x7, string y7, string x8, string y8, string x9, string y9, string x10, string y10,
        string x11, string y11, string x12, string y12, string x13, string y13, string x14, string y14, string x15, string y15,
        string x16, string y16, string x17, string y17, string x18, string y18, string x19, string y19, string x20, string y20,
        string x21, string y21, string x22, string y22, string x23, string y23, string x24, string y24, string x25, string y25,
        string x26, string y26, string x27, string y27, string x28, string y28, string x29, string y29, string x30, string y30, string x31, string y31,
        string cname, string clname, string timeper, string frdate, string trdate)
    {
        string str = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "insert into timesheet(userid,pdate,workhrs,overtime,rd1,ot1,rd2,ot2,rd3,ot3,rd4,ot4,rd5,ot5,rd6,ot6,rd7,ot7,rd8,ot8,rd9,ot9,rd10,ot10,";
            qry = qry + "rd11,ot11,rd12,ot12,rd13,ot13,rd14,ot14,rd15,ot15,rd16,ot16,rd17,ot17,rd18,ot18,rd19,ot19,rd20,ot20,";
            qry = qry + "rd21,ot21,rd22,ot22,rd23,ot23,rd24,ot24,rd25,ot25,rd26,ot26,rd27,ot27,rd28,ot28,rd29,ot29,rd30,ot30,rd31,ot31,remarks,consname,clientname,timeperiod,fromdate,todate,flag) ";
            qry = qry + "values(@ud,@pd,@wh,@ovt,@lx1,@ly1,@lx2,@ly2,@lx3,@ly3,@lx4,@ly4,@lx5,@ly5,@lx6,@ly6,@lx7,@ly7,@lx8,@ly8,@lx9,@ly9,@lx10,@ly10,";
            qry = qry + "@lx11,@ly11,@lx12,@ly12,@lx13,@ly13,@lx14,@ly14,@lx15,@ly15,@lx16,@ly16,@lx17,@ly17,@lx18,@ly18,@lx19,@ly19,@lx20,@ly20,";
            qry = qry + "@lx21,@ly21,@lx22,@ly22,@lx23,@ly23,@lx24,@ly24,@lx25,@ly25,@lx26,@ly26,@lx27,@ly27,@lx28,@ly28,@lx29,@ly29,@lx30,@ly30,@lx31,@ly31,@rm,@cnm,@clnm,@timper,@frdt,@trdt,@flg)";
            SqlCommand cmd = new SqlCommand(qry, connection);

            cmd.Parameters.Add(new SqlParameter("@ud", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pd", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@wh", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@ovt", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@lx1", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly1", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx2", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly2", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx3", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly3", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx4", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly4", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx5", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly5", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx6", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly6", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx7", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly7", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx8", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly8", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx9", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly9", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx10", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly10", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@lx11", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly11", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx12", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly12", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx13", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly13", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx14", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly14", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx15", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly15", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx16", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly16", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx17", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly17", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx18", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly18", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx19", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly19", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx20", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly20", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@lx21", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly21", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx22", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly22", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx23", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly23", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx24", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly24", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx25", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly25", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx26", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly26", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx27", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly27", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx28", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly28", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx29", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly29", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx30", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly30", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx31", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly31", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@cnm", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@clnm", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@timper", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@frdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@trdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@rm", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@flg", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@empid", SqlDbType.NVarChar, 50));

            cmd.Parameters["@ud"].Value = Convert.ToInt32(uid);
            cmd.Parameters["@pd"].Value = Convert.ToDateTime(sdt);
            cmd.Parameters["@wh"].Value = whr;
            cmd.Parameters["@ovt"].Value = otxk;
            cmd.Parameters["@lx1"].Value = x1;
            cmd.Parameters["@ly1"].Value = y1;
            cmd.Parameters["@lx2"].Value = x2;
            cmd.Parameters["@ly2"].Value = y2;
            cmd.Parameters["@lx3"].Value = x3;
            cmd.Parameters["@ly3"].Value = y3;
            cmd.Parameters["@lx4"].Value = x4;
            cmd.Parameters["@ly4"].Value = y4;
            cmd.Parameters["@lx5"].Value = x5;
            cmd.Parameters["@ly5"].Value = y5;
            cmd.Parameters["@lx6"].Value = x6;
            cmd.Parameters["@ly6"].Value = y6;
            cmd.Parameters["@lx7"].Value = x7;
            cmd.Parameters["@ly7"].Value = y7;
            cmd.Parameters["@lx8"].Value = x8;
            cmd.Parameters["@ly8"].Value = y8;
            cmd.Parameters["@lx9"].Value = x9;
            cmd.Parameters["@ly9"].Value = y9;
            cmd.Parameters["@lx10"].Value = x10;
            cmd.Parameters["@ly10"].Value = y10;

            cmd.Parameters["@lx11"].Value = x11;
            cmd.Parameters["@ly11"].Value = y11;
            cmd.Parameters["@lx12"].Value = x12;
            cmd.Parameters["@ly12"].Value = y12;
            cmd.Parameters["@lx13"].Value = x13;
            cmd.Parameters["@ly13"].Value = y13;
            cmd.Parameters["@lx14"].Value = x14;
            cmd.Parameters["@ly14"].Value = y14;
            cmd.Parameters["@lx15"].Value = x15;
            cmd.Parameters["@ly15"].Value = y15;
            cmd.Parameters["@lx16"].Value = x16;
            cmd.Parameters["@ly16"].Value = y16;
            cmd.Parameters["@lx17"].Value = x17;
            cmd.Parameters["@ly17"].Value = y17;
            cmd.Parameters["@lx18"].Value = x18;
            cmd.Parameters["@ly18"].Value = y18;
            cmd.Parameters["@lx19"].Value = x19;
            cmd.Parameters["@ly19"].Value = y19;
            cmd.Parameters["@lx20"].Value = x20;
            cmd.Parameters["@ly20"].Value = y20;

            cmd.Parameters["@lx21"].Value = x21;
            cmd.Parameters["@ly21"].Value = y21;
            cmd.Parameters["@lx22"].Value = x22;
            cmd.Parameters["@ly22"].Value = y22;
            cmd.Parameters["@lx23"].Value = x23;
            cmd.Parameters["@ly23"].Value = y23;
            cmd.Parameters["@lx24"].Value = x24;
            cmd.Parameters["@ly24"].Value = y24;
            cmd.Parameters["@lx25"].Value = x25;
            cmd.Parameters["@ly25"].Value = y25;
            cmd.Parameters["@lx26"].Value = x26;
            cmd.Parameters["@ly26"].Value = y26;
            cmd.Parameters["@lx27"].Value = x27;
            cmd.Parameters["@ly27"].Value = y27;
            cmd.Parameters["@lx28"].Value = x28;
            cmd.Parameters["@ly28"].Value = y28;
            cmd.Parameters["@lx29"].Value = x29;
            cmd.Parameters["@ly29"].Value = y29;
            cmd.Parameters["@lx30"].Value = x30;
            cmd.Parameters["@ly30"].Value = y30;
            cmd.Parameters["@lx31"].Value = x31;
            cmd.Parameters["@ly31"].Value = y31;

            cmd.Parameters["@cnm"].Value = cname;
            cmd.Parameters["@clnm"].Value = clname;
            cmd.Parameters["@timper"].Value = timeper;
            cmd.Parameters["@frdt"].Value = Convert.ToDateTime(frdate);
            cmd.Parameters["@trdt"].Value = Convert.ToDateTime(trdate);
            cmd.Parameters["@rm"].Value = rem;
            cmd.Parameters["@flg"].Value = "0";
            //cmd.Parameters["@empid"].Value = empid;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;
    }

    public bool AddTaskSheet(string uid, string whr, string tnam, string pnam, string sdt)
    {
        string str = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();


            string qry = "insert into tasksheet(userid,pdate,projname,taskname,workhrs) values(@uid,@pdt,@pname,@tname,@whr)";

            SqlCommand cmd = new SqlCommand(qry, connection);

            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@whr", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@pname", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@tname", SqlDbType.NVarChar, 500));

            cmd.Parameters["@uid"].Value = Convert.ToInt32(uid);
            cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);
            cmd.Parameters["@whr"].Value = whr;
            cmd.Parameters["@pname"].Value = pnam;
            cmd.Parameters["@tname"].Value = tnam;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch

        {
        }
        if (str == "1")
        return true;
        else
            return false;
    }
    public bool editts(string uid, string whr, string otxk, string rem, string sdt,
           string x1, string y1, string x2, string y2, string x3, string y3, string x4, string y4, string x5, string y5,
       string x6, string y6, string x7, string y7, string x8, string y8, string x9, string y9, string x10, string y10,
       string x11, string y11, string x12, string y12, string x13, string y13, string x14, string y14, string x15, string y15,
       string x16, string y16, string x17, string y17, string x18, string y18, string x19, string y19, string x20, string y20,
       string x21, string y21, string x22, string y22, string x23, string y23, string x24, string y24, string x25, string y25,
       string x26, string y26, string x27, string y27, string x28, string y28, string x29, string y29, string x30, string y30, string x31, string y31,
       string cname, string clname, string timeper, string frdate, string trdate)
    {
        string str = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "update timesheet set pdate=@pd,workhrs=@wh,overtime=@ovt,rd1=@lx1,ot1=@ly1,rd2=@lx2,ot2=@ly2,rd3=@lx3,ot3=@ly3,rd4=@lx4,ot4=@ly4,rd5=@lx5,ot5=@ly5,rd6=@lx6,ot6=@ly6,rd7=@lx7,ot7=@ly7,rd8=@lx8,ot8=@ly8,rd9=@lx9,ot9=@ly9,rd10=@lx10,ot10=@ly10,";
            qry = qry + "rd11=@lx11,ot11=@ly11,rd12=@lx12,ot12=@ly12,rd13=@lx13,ot13=@ly13,rd14=@lx14,ot14=@ly14,rd15=@lx15,ot15=@ly15,rd16=@lx16,ot16=@ly16,rd17=@lx17,ot17=@ly17,rd18=@lx18,ot18=@ly18,rd19=@lx19,ot19=@ly19,rd20=@lx20,ot20=@ly20,";
            qry = qry + "rd21=@lx21,ot21=@ly21,rd22=@lx22,ot22=@ly22,rd23=@lx23,ot23=@ly23,rd24=@lx24,ot24=@ly24,rd25=@lx25,ot25=@ly25,rd26=@lx26,ot26=@ly26,rd27=@lx27,ot27=@ly27,rd28=@lx28,ot28=@ly28,rd29=@lx29,ot29=@ly29,rd30=@lx30,ot30=@ly30,rd31=@lx31,ot31=@ly31,";
            qry = qry + "remarks=@rm,consname=@cnm,clientname=@clnm,timeperiod=@timper,fromdate=@frdt,todate=@trdt,flag=@flg where id=" + uid;
            
            
            SqlCommand cmd = new SqlCommand(qry, connection);

            //cmd.Parameters.Add(new SqlParameter("@ud", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pd", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@wh", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@ovt", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@lx1", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly1", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx2", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly2", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx3", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly3", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx4", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly4", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx5", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly5", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx6", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly6", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx7", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly7", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx8", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly8", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx9", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly9", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx10", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly10", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@lx11", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly11", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx12", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly12", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx13", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly13", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx14", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly14", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx15", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly15", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx16", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly16", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx17", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly17", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx18", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly18", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx19", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly19", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx20", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly20", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@lx21", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly21", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx22", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly22", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx23", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly23", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx24", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly24", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx25", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly25", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx26", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly26", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx27", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly27", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx28", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly28", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx29", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly29", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx30", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly30", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@lx31", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ly31", SqlDbType.NVarChar, 50));

            cmd.Parameters.Add(new SqlParameter("@cnm", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@clnm", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@timper", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@frdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@trdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@rm", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@flg", SqlDbType.NVarChar, 50));

            //cmd.Parameters["@ud"].Value = Convert.ToInt32(uid);
            cmd.Parameters["@pd"].Value = Convert.ToDateTime(sdt);
            cmd.Parameters["@wh"].Value = whr;
            cmd.Parameters["@ovt"].Value = otxk;
            cmd.Parameters["@lx1"].Value = x1;
            cmd.Parameters["@ly1"].Value = y1;
            cmd.Parameters["@lx2"].Value = x2;
            cmd.Parameters["@ly2"].Value = y2;
            cmd.Parameters["@lx3"].Value = x3;
            cmd.Parameters["@ly3"].Value = y3;
            cmd.Parameters["@lx4"].Value = x4;
            cmd.Parameters["@ly4"].Value = y4;
            cmd.Parameters["@lx5"].Value = x5;
            cmd.Parameters["@ly5"].Value = y5;
            cmd.Parameters["@lx6"].Value = x6;
            cmd.Parameters["@ly6"].Value = y6;
            cmd.Parameters["@lx7"].Value = x7;
            cmd.Parameters["@ly7"].Value = y7;
            cmd.Parameters["@lx8"].Value = x8;
            cmd.Parameters["@ly8"].Value = y8;
            cmd.Parameters["@lx9"].Value = x9;
            cmd.Parameters["@ly9"].Value = y9;
            cmd.Parameters["@lx10"].Value = x10;
            cmd.Parameters["@ly10"].Value = y10;

            cmd.Parameters["@lx11"].Value = x11;
            cmd.Parameters["@ly11"].Value = y11;
            cmd.Parameters["@lx12"].Value = x12;
            cmd.Parameters["@ly12"].Value = y12;
            cmd.Parameters["@lx13"].Value = x13;
            cmd.Parameters["@ly13"].Value = y13;
            cmd.Parameters["@lx14"].Value = x14;
            cmd.Parameters["@ly14"].Value = y14;
            cmd.Parameters["@lx15"].Value = x15;
            cmd.Parameters["@ly15"].Value = y15;
            cmd.Parameters["@lx16"].Value = x16;
            cmd.Parameters["@ly16"].Value = y16;
            cmd.Parameters["@lx17"].Value = x17;
            cmd.Parameters["@ly17"].Value = y17;
            cmd.Parameters["@lx18"].Value = x18;
            cmd.Parameters["@ly18"].Value = y18;
            cmd.Parameters["@lx19"].Value = x19;
            cmd.Parameters["@ly19"].Value = y19;
            cmd.Parameters["@lx20"].Value = x20;
            cmd.Parameters["@ly20"].Value = y20;

            cmd.Parameters["@lx21"].Value = x21;
            cmd.Parameters["@ly21"].Value = y21;
            cmd.Parameters["@lx22"].Value = x22;
            cmd.Parameters["@ly22"].Value = y22;
            cmd.Parameters["@lx23"].Value = x23;
            cmd.Parameters["@ly23"].Value = y23;
            cmd.Parameters["@lx24"].Value = x24;
            cmd.Parameters["@ly24"].Value = y24;
            cmd.Parameters["@lx25"].Value = x25;
            cmd.Parameters["@ly25"].Value = y25;
            cmd.Parameters["@lx26"].Value = x26;
            cmd.Parameters["@ly26"].Value = y26;
            cmd.Parameters["@lx27"].Value = x27;
            cmd.Parameters["@ly27"].Value = y27;
            cmd.Parameters["@lx28"].Value = x28;
            cmd.Parameters["@ly28"].Value = y28;
            cmd.Parameters["@lx29"].Value = x29;
            cmd.Parameters["@ly29"].Value = y29;
            cmd.Parameters["@lx30"].Value = x30;
            cmd.Parameters["@ly30"].Value = y30;
            cmd.Parameters["@lx31"].Value = x31;
            cmd.Parameters["@ly31"].Value = y31;

            cmd.Parameters["@cnm"].Value = cname;
            cmd.Parameters["@clnm"].Value = clname;
            cmd.Parameters["@timper"].Value = timeper;
            cmd.Parameters["@frdt"].Value = Convert.ToDateTime(frdate);
            cmd.Parameters["@trdt"].Value = Convert.ToDateTime(trdate);
            cmd.Parameters["@rm"].Value = rem;
            cmd.Parameters["@flg"].Value = "1";

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;
    }
    public DataSet GetTimeSheet(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        
        //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
        string qry = "select * from timesheet where userid=" + uid;
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }

    public DataSet GetTimeSheetView(string uid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
        string qry = "select * from timesheet where userid=" + uid;
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
    public bool delts(string uid)
    {
        string str = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        try
        {
        
        string qry = "delete from timesheet where id=" + uid;
        SqlCommand cmd = new SqlCommand(qry, connection);
        str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;
    }
    public bool InsertEmp(string un, string eml, string pw,
           string uid, string fn, string ln, string mn, string ss1, string gn,
           string sn, string sb, string ssn2, string spg, string fatn, string motn,
           string k1, string k2, string k3, string k1b, string k2b, string k3b, string k1s, string k2s, string k3s,
           string k1g, string k2g, string k3g, string co, string str, string sta, string ci, string zp,
           string wp, string hp, string mb, string bd, string bco, string bsta, string bci, string cco,
           string pn, string pco, string idt, string exdt, string nco, string cpport, string cpn1,
           string cpph1, string cpml1, string cpadr1, string cpn2, string cpph2, string cpml2,
           string cpadr2, string exyr, string fnar, string cind, string sk1, string sk1yr, string sk1ex,
           string sk2, string sk2yr, string sk2ex, string sk3, string sk3yr, string sk3ex,
           string sk4, string sk4yr, string sk4ex, string sk5, string sk5yr, string sk5ex,
           string sk6, string sk6yr, string sk6ex, string ed1,
           string ed1bd, string ed1sb, string ed1y, string ed1pe, string ed2, string ed2bd, string ed2sb,
           string ed2y, string ed2pe, string ed3, string ed3bd, string ed3sb, string ed3y, string ed3pe,
           string ed4, string ed4bd, string ed4sb, string ed4y, string ed4pe,
           string ed5, string ed5bd, string ed5sb, string ed5y, string ed5pe,
           string ed6, string ed6bd, string ed6sb, string ed6y, string ed6pe,
           string ed7, string ed7bd, string ed7sb, string ed7y, string ed7pe,
           string rtit, string rfil, string rtxt, string exmn, string pplc, string sdt)
    {
        string strx = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();
            string strQry = "insert into employeereg (username,emailid,pwd,confirmpwd,firstname,middlename,lastname, fathername, mothername,spousename,";
            strQry = strQry + "kid1,kid2,kid3,country1,state1,street,city1,zip,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,";
            strQry = strQry + "birthstate,birthcountry,passportno,passportissuedat,dateofissue,doexp,nationality,countryofpassport,";
            strQry = strQry + "contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2,";
            strQry = strQry + "totexptrs,totexpmonths, rhead,functionalarea,currentindustrytype,";
            strQry = strQry + "skills1,sk1years,sk1exp,skills2,sk2years,sk2exp,skills3,sk3years,sk3exp,";
            strQry = strQry + "edu1,ed1brd,ed1sub,ed1year,ed1per,edu2,ed2brd,ed2sub,ed2year,ed2per,";
            strQry = strQry + "edu3,ed3brd,ed3sub,ed3year,ed3per,edu4,ed4brd,ed4sub,ed4year,ed4per,";
            strQry = strQry + "edu5,ed5brd,ed5sub,ed5year,ed5per,filename1,resumetxt,pdate,piss_place)";
            //username='" + uid + "'";
            strQry = strQry + "values(@un,@eml,@pw,@cpw,@fn,@mn,@ln,@fatn,@motn,@spn,@k1,@k2,@k3,@co,@sta,@str,@ci,@zp,@wp,@hp,@mb,@bdt,@cco,@bco,@bsta,@bco,@pn,@pco,";
            strQry = strQry + "@idt,@expd,@nco,@cpco,@cpn1,@cpph1,@cpml1,@cpadr1,@cpn2,@cpph2,@cpml2,@cpadr2,@exyr,@exmn,@rtit,@fnar,@cind,";
            strQry = strQry + "@sk1,@sk1yr,@sk1ex,@sk2,@sk2yr,@sk2ex,@sk3,@sk3yr,@sk3ex, @ed1,@ed1bd,@ed1sb,@ed1y,@ed1pe,";
            strQry = strQry + "@ed2,@ed2bd,@ed2sb,@ed2y,@ed2pe,@ed3,@ed3bd,@ed3sb,@ed3y,@ed3pe, @ed4,@ed4bd,@ed4sb,@ed4y,@ed4pe,";
            strQry = strQry + "@ed5,@ed5bd,@ed5sb,@ed5y,@ed5pe,@rfil,@rtxt,@pdt, @pplc)";

            SqlCommand cmd = new SqlCommand(strQry, connection);
            cmd.Parameters.Add(new SqlParameter("@un", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@eml", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pw", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpw", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ss1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@gn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spg", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ssn2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sb", SqlDbType.DateTime));

            cmd.Parameters.Add(new SqlParameter("@fatn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@motn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@k1s", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2s", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3s", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@k1b", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@k2b", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@k3b", SqlDbType.DateTime));

            cmd.Parameters.Add(new SqlParameter("@k1g", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2g", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3g", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@wp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@co", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sta", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@str", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ci", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@zp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@hp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bdt", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@cco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bci", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bsta", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bco", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@idt", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@expd", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@nco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpn1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpph1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpml1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpadr1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpn2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpph2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpml2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpadr2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@exyr", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@exmn", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@rtit", SqlDbType.NVarChar));
            //@functionalarea
            cmd.Parameters.Add(new SqlParameter("@fnar", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cind", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@sk1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk1yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk1ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk2yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk2ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk3", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk3yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk3ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk4", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk4yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk4ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk5", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk5yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk5ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk6", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk6yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk6ex", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ed1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed1bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed1sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed1y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed1pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2pe", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ed3", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed3bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed3sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed3y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed3pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7pe", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@rfil", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@pplc", SqlDbType.NVarChar));

            //cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));
            cmd.Parameters["@un"].Value = un;
            cmd.Parameters["@eml"].Value = eml;
            cmd.Parameters["@pw"].Value = pw;
            cmd.Parameters["@cpw"].Value = pw;

            cmd.Parameters["@fn"].Value = fn;
            cmd.Parameters["@mn"].Value = mn;
            cmd.Parameters["@ln"].Value = ln;
            cmd.Parameters["@gn"].Value = gn;
            cmd.Parameters["@ss1"].Value = ss1;
            cmd.Parameters["@fatn"].Value = fatn;
            cmd.Parameters["@motn"].Value = motn;
            cmd.Parameters["@spn"].Value = sn;
            cmd.Parameters["@spg"].Value = spg;

            //if (sb != "")
            //    cmd.Parameters["@sb"].Value = sb;
            //else
            //    cmd.Parameters["@sb"].Value = "";

            cmd.Parameters["@sb"].Value = sb;

            cmd.Parameters["@ssn2"].Value = ssn2;

            cmd.Parameters["@k1"].Value = k1;
            cmd.Parameters["@k2"].Value = k2;
            cmd.Parameters["@k3"].Value = k3;

            //if (k1b != "")
            //    cmd.Parameters["@k1b"].Value = Convert.ToDateTime(k1b);
            //else
            //    cmd.Parameters["@k1b"].Value = "";

            //if (k2b != "")
            //    cmd.Parameters["@k2b"].Value = Convert.ToDateTime(k2b);
            //else
            //    cmd.Parameters["@k2b"].Value = "";

            //if (k3b != "")
            //    cmd.Parameters["@k3b"].Value = Convert.ToDateTime(k3b);
            //else
            //    cmd.Parameters["@k3b"].Value = "";
            cmd.Parameters["@k1b"].Value = k1b;
            cmd.Parameters["@k2b"].Value = k2b;
            cmd.Parameters["@k3b"].Value = k3b;

            cmd.Parameters["@k1s"].Value = k1s;
            cmd.Parameters["@k2s"].Value = k2s;
            cmd.Parameters["@k3s"].Value = k3s;

            cmd.Parameters["@k1g"].Value = k1g;
            cmd.Parameters["@k2g"].Value = k2g;
            cmd.Parameters["@k3g"].Value = k3g;

            cmd.Parameters["@co"].Value = co;
            cmd.Parameters["@sta"].Value = sta;
            cmd.Parameters["@str"].Value = str;
            cmd.Parameters["@ci"].Value = ci;
            cmd.Parameters["@zp"].Value = zp;
            cmd.Parameters["@wp"].Value = wp;
            cmd.Parameters["@hp"].Value = hp;
            cmd.Parameters["@mb"].Value = mb;

            if (bd != "")
                cmd.Parameters["@bdt"].Value = Convert.ToDateTime(bd);
            else
                cmd.Parameters["@bdt"].Value = "";

            cmd.Parameters["@cco"].Value = cco;
            cmd.Parameters["@bci"].Value = bci;

            cmd.Parameters["@bsta"].Value = bsta;

            cmd.Parameters["@bco"].Value = bco;

            cmd.Parameters["@pn"].Value = pn;
            if (idt != "")
                cmd.Parameters["@idt"].Value = Convert.ToDateTime(idt);
            else
                cmd.Parameters["@idt"].Value = "";

            cmd.Parameters["@cpco"].Value = cpport;

            if (exdt != "")
                cmd.Parameters["@expd"].Value = Convert.ToDateTime(exdt);
            else
                cmd.Parameters["@expd"].Value = "";

            cmd.Parameters["@nco"].Value = nco;
            cmd.Parameters["@pco"].Value = pco;
            cmd.Parameters["@cpn1"].Value = cpn1;
            cmd.Parameters["@cpph1"].Value = cpph1;
            cmd.Parameters["@cpml1"].Value = cpml1;
            cmd.Parameters["@cpadr1"].Value = cpadr1;
            cmd.Parameters["@cpn2"].Value = cpn2;
            cmd.Parameters["@cpph2"].Value = cpph2;
            cmd.Parameters["@cpml2"].Value = cpml2;
            cmd.Parameters["@cpadr2"].Value = cpadr2;

            if (exyr != "")
                cmd.Parameters["@exyr"].Value = Convert.ToInt32(exyr);
            else
                cmd.Parameters["@exyr"].Value = 0;

            if (exmn != "")
                cmd.Parameters["@exmn"].Value = Convert.ToInt32(exmn);
            else
                cmd.Parameters["@exmn"].Value = 0;

            cmd.Parameters["@rtit"].Value = rtit;
            cmd.Parameters["@fnar"].Value = fnar;
            cmd.Parameters["@cind"].Value = cind;

            cmd.Parameters["@sk1"].Value = sk1;
            cmd.Parameters["@sk1yr"].Value = sk1yr;
            cmd.Parameters["@sk1ex"].Value = sk1ex;
            cmd.Parameters["@sk2"].Value = sk2;
            cmd.Parameters["@sk2yr"].Value = sk2yr;
            cmd.Parameters["@sk2ex"].Value = sk2ex;
            cmd.Parameters["@sk3"].Value = sk3;
            cmd.Parameters["@sk3yr"].Value = sk3yr;
            cmd.Parameters["@sk3ex"].Value = sk3ex;

            cmd.Parameters["@sk4"].Value = sk4;
            cmd.Parameters["@sk4yr"].Value = sk4yr;
            cmd.Parameters["@sk4ex"].Value = sk4ex;

            cmd.Parameters["@sk5"].Value = sk5;
            cmd.Parameters["@sk5yr"].Value = sk5yr;
            cmd.Parameters["@sk5ex"].Value = sk5ex;

            cmd.Parameters["@sk6"].Value = sk6;
            cmd.Parameters["@sk6yr"].Value = sk6yr;
            cmd.Parameters["@sk6ex"].Value = sk6ex;

            cmd.Parameters["@ed1"].Value = ed1;
            cmd.Parameters["@ed1bd"].Value = ed1bd;
            cmd.Parameters["@ed1sb"].Value = ed1sb;
            cmd.Parameters["@ed1y"].Value = ed1y;
            cmd.Parameters["@ed1pe"].Value = ed1pe;
            cmd.Parameters["@ed2"].Value = ed2;
            cmd.Parameters["@ed2bd"].Value = ed2bd;
            cmd.Parameters["@ed2sb"].Value = ed2sb;
            cmd.Parameters["@ed2y"].Value = ed2y;
            cmd.Parameters["@ed2pe"].Value = ed2pe;
            cmd.Parameters["@ed3"].Value = ed3;
            cmd.Parameters["@ed3bd"].Value = ed3bd;
            cmd.Parameters["@ed3sb"].Value = ed3sb;
            cmd.Parameters["@ed3y"].Value = ed3y;
            cmd.Parameters["@ed3pe"].Value = ed3pe;

            cmd.Parameters["@ed4"].Value = ed4;
            cmd.Parameters["@ed4bd"].Value = ed4bd;
            cmd.Parameters["@ed4sb"].Value = ed4sb;
            cmd.Parameters["@ed4y"].Value = ed4y;
            cmd.Parameters["@ed4pe"].Value = ed4pe;


            cmd.Parameters["@ed5"].Value = ed5;
            cmd.Parameters["@ed5bd"].Value = ed5bd;
            cmd.Parameters["@ed5sb"].Value = ed5sb;
            cmd.Parameters["@ed5y"].Value = ed5y;
            cmd.Parameters["@ed5pe"].Value = ed5pe;

            cmd.Parameters["@ed6"].Value = ed6;
            cmd.Parameters["@ed6bd"].Value = ed6bd;
            cmd.Parameters["@ed6sb"].Value = ed6sb;
            cmd.Parameters["@ed6y"].Value = ed6y;
            cmd.Parameters["@ed6pe"].Value = ed6pe;

            cmd.Parameters["@ed7"].Value = ed7;
            cmd.Parameters["@ed7bd"].Value = ed7bd;
            cmd.Parameters["@ed7sb"].Value = ed7sb;
            cmd.Parameters["@ed7y"].Value = ed7y;
            cmd.Parameters["@ed7pe"].Value = ed7pe;


            cmd.Parameters["@rtxt"].Value = rtxt;
            cmd.Parameters["@rfil"].Value = rfil;
            cmd.Parameters["@pplc"].Value = pplc;
            cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);

            strx = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (strx == "1")

            return true;
        else
            return false;
    }
    public bool UpdateEmp(string uid, string fn, string ln, string mn, string ss1, string gn,
           string sn, string sb, string ssn2, string spg, string fatn, string motn,
           string k1, string k2, string k3, string k1b, string k2b, string k3b, string k1s, string k2s, string k3s,
           string k1g, string k2g, string k3g, string co, string str, string sta, string ci, string zp,
           string wp, string hp, string mb, string bd, string bco, string bsta, string bci, string cco,
           string pn, string pco, string idt, string exdt, string nco, string cpport, string cpn1,
           string cpph1, string cpml1, string cpadr1, string cpn2, string cpph2, string cpml2,
           string cpadr2, string exyr, string fnar, string cind, string sk1, string sk1yr, string sk1ex,
           string sk2, string sk2yr, string sk2ex, string sk3, string sk3yr, string sk3ex,
           string sk4, string sk4yr, string sk4ex, string sk5, string sk5yr, string sk5ex,
           string sk6, string sk6yr, string sk6ex, string ed1,
           string ed1bd, string ed1sb, string ed1y, string ed1pe, string ed2, string ed2bd, string ed2sb,
           string ed2y, string ed2pe, string ed3, string ed3bd, string ed3sb, string ed3y, string ed3pe,
           string ed4, string ed4bd, string ed4sb, string ed4y, string ed4pe,
           string ed5, string ed5bd, string ed5sb, string ed5y, string ed5pe,
           string ed6, string ed6bd, string ed6sb, string ed6y, string ed6pe,
           string ed7, string ed7bd, string ed7sb, string ed7y, string ed7pe,
           string rtit, string rfil, string rtxt, string exmn, string sdt)
    {
        string strx = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();
            string strQry = "update employeereg set firstname=@fn,middlename=@mn,";
            strQry = strQry + "lastname=@ln,fathername=@fatn,mothername=@motn,spousename=@spn,";
            strQry = strQry + "gender=@gn,ssn=@ss1,spousegender=@spg,spousedob=@sb,spousessn=@ssn2,";
            strQry = strQry + "kid1=@k1,kid2=@k2,kid3=@k3,";
            strQry = strQry + "child1gender=@k1g,child2gender=@k2g,child3gender=@k3g,";
            strQry = strQry + "child1dob=@k1b,child2dob=@k2b,child3dob=@k3b,";
            strQry = strQry + "child1ssn=@k1s,child2ssn=@k2s,child3ssn=@k3s,";
            strQry = strQry + "country1=@co,state1=@sta,street=@str,city1=@ci,zip=@zp,workphone=@wp,";
            strQry = strQry + "homephone=@hp,mobile=@mb,birthdate=@bdt,cntryofcitizenship=@cco,birthcity=@bco,";
            strQry = strQry + "birthstate=@bsta,birthcountry=@bco,passportno=@pn,passportissuedat=@pco,";
            strQry = strQry + "dateofissue=@idt,doexp=@expd,nationality=@nco,countryofpassport=@cpco,";
            strQry = strQry + "contactpersonname1=@cpn1,cp1phone=@cpph1,cp1email=@cpml1,cpaddress1=@cpadr1,";
            strQry = strQry + "contactpersonname2=@cpn2,cp2phone2=@cpph2,cp2email=@cpml2,cpaddress2=@cpadr2,";
            strQry = strQry + "totexptrs=@exyr,totexpmonths=@exmn,rhead=@rtit,functionalarea=@fnar,currentindustrytype=@cind,";
            strQry = strQry + "skills1=@sk1,sk1years=@sk1yr,sk1exp=@sk1ex,skills2=@sk2,sk2years=@sk2yr,sk2exp=@sk2ex,";
            strQry = strQry + "skills3=@sk3,sk3years=@sk3yr,sk3exp=@sk3ex,skills4=@sk4,sk4years=@sk4yr,sk4exp=@sk4ex,";
            strQry = strQry + "skills5=@sk5,sk5years=@sk5yr,sk5exp=@sk5ex,";
            strQry = strQry + "skills6=@sk6,sk6years=@sk6yr,sk6exp=@sk6ex,edu1=@ed1,ed1brd=@ed1bd,ed1sub=@ed1sb,ed1year=@ed1y,ed1per=@ed1pe,";
            strQry = strQry + "edu2=@ed2,ed2brd=@ed2bd,ed2sub=@ed2sb,ed2year=@ed2y,ed2per=@ed2pe,";
            strQry = strQry + "edu3=@ed3,ed3brd=@ed3bd,ed3sub=@ed3sb,ed3year=@ed3y,ed3per=@ed3pe,";
            strQry = strQry + "edu4=@ed4,ed4brd=@ed4bd,ed4sub=@ed4sb,ed4year=@ed4y,ed4per=@ed4pe,";
            strQry = strQry + "edu5=@ed5,ed5brd=@ed5bd,ed5sub=@ed5sb,ed5year=@ed5y,ed5per=@ed5pe,";
            strQry = strQry + "edu6=@ed6,ed6brd=@ed6bd,ed6sub=@ed6sb,ed6year=@ed6y,ed6per=@ed6pe,";
            strQry = strQry + "edu7=@ed7,ed7brd=@ed7bd,ed7sub=@ed7sb,ed7year=@ed7y,ed7per=@ed7pe,filename1=@rfil,resumetxt=@rtxt,pdate=@pdt where username='" + uid + "'";

            SqlCommand cmd = new SqlCommand(strQry, connection);

            cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ss1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@gn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spg", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ssn2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sb", SqlDbType.DateTime));

            cmd.Parameters.Add(new SqlParameter("@fatn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@motn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@k1s", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2s", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3s", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@k1b", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@k2b", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@k3b", SqlDbType.DateTime));

            cmd.Parameters.Add(new SqlParameter("@k1g", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k2g", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@k3g", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@wp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@co", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sta", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@str", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ci", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@zp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@hp", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bdt", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@cco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bci", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bsta", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@bco", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@idt", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@expd", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@nco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pco", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpn1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpph1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpml1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpadr1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpn2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpph2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpml2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpadr2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@exyr", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@exmn", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@rtit", SqlDbType.NVarChar));
            //@functionalarea
            cmd.Parameters.Add(new SqlParameter("@fnar", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cind", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@sk1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk1yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk1ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk2yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk2ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk3", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk3yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk3ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk4", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk4yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk4ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk5", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk5yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk5ex", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk6", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@sk6yr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("sk6ex", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ed1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed1bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed1sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed1y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed1pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed2bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed2sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed2y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed2pe", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@ed3", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed3bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed3sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed3y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed3pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed4bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed4sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed4y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed4pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed5bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed5sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed5y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed5pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed6bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed6sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed6y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed6pe", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ed7bd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed7sb", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed7y", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("ed7pe", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@rfil", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime));

            //cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));
            // cmd.Parameters["@uname"].Value = fn;

            cmd.Parameters["@fn"].Value = fn;
            cmd.Parameters["@mn"].Value = mn;
            cmd.Parameters["@ln"].Value = ln;
            cmd.Parameters["@gn"].Value = gn;
            cmd.Parameters["@ss1"].Value = ss1;
            cmd.Parameters["@fatn"].Value = fatn;
            cmd.Parameters["@motn"].Value = motn;
            cmd.Parameters["@spn"].Value = sn;
            cmd.Parameters["@spg"].Value = spg;

            if (sb != "")
                cmd.Parameters["@sb"].Value = Convert.ToDateTime(sb);
            else
                cmd.Parameters["@sb"].Value = "";


            //cmd.Parameters["@sb"].Value = sb;

            cmd.Parameters["@ssn2"].Value = ssn2;

            cmd.Parameters["@k1"].Value = k1;
            cmd.Parameters["@k2"].Value = k2;
            cmd.Parameters["@k3"].Value = k3;

            if (k1b != "")
                cmd.Parameters["@k1b"].Value = Convert.ToDateTime(k1b);
            else
                cmd.Parameters["@k1b"].Value = "";

            if (k2b != "")
                cmd.Parameters["@k2b"].Value = Convert.ToDateTime(k2b);
            else
                cmd.Parameters["@k2b"].Value = "";


            if (k3b != "")
                cmd.Parameters["@k3b"].Value = Convert.ToDateTime(k3b);
            else
                cmd.Parameters["@k3b"].Value = "";
            //cmd.Parameters["@k1b"].Value = k1b;
            //cmd.Parameters["@k2b"].Value = k2b;
            //cmd.Parameters["@k3b"].Value = k3b;

            cmd.Parameters["@k1s"].Value = k1s;
            cmd.Parameters["@k2s"].Value = k2s;
            cmd.Parameters["@k3s"].Value = k3s;

            cmd.Parameters["@k1g"].Value = k1g;
            cmd.Parameters["@k2g"].Value = k2g;
            cmd.Parameters["@k3g"].Value = k3g;


            cmd.Parameters["@co"].Value = co;
            cmd.Parameters["@sta"].Value = sta;
            cmd.Parameters["@str"].Value = str;
            cmd.Parameters["@ci"].Value = ci;
            cmd.Parameters["@zp"].Value = zp;
            cmd.Parameters["@wp"].Value = wp;
            cmd.Parameters["@hp"].Value = hp;
            cmd.Parameters["@mb"].Value = mb;

            if (bd != "")
                cmd.Parameters["@bdt"].Value = Convert.ToDateTime(bd);
            else
                cmd.Parameters["@bdt"].Value = "";

            cmd.Parameters["@cco"].Value = cco;
            cmd.Parameters["@bci"].Value = bci;

            cmd.Parameters["@bsta"].Value = bsta;

            cmd.Parameters["@bco"].Value = bco;

            cmd.Parameters["@pn"].Value = pn;
            if (idt != "")
                cmd.Parameters["@idt"].Value = Convert.ToDateTime(idt);
            else
                cmd.Parameters["@idt"].Value = "";

            cmd.Parameters["@cpco"].Value = cpport;

            if (exdt != "")
                cmd.Parameters["@expd"].Value = Convert.ToDateTime(exdt);
            else
                cmd.Parameters["@expd"].Value = "";

            cmd.Parameters["@nco"].Value = nco;
            cmd.Parameters["@pco"].Value = pco;
            cmd.Parameters["@cpn1"].Value = cpn1;
            cmd.Parameters["@cpph1"].Value = cpph1;
            cmd.Parameters["@cpml1"].Value = cpml1;
            cmd.Parameters["@cpadr1"].Value = cpadr1;
            cmd.Parameters["@cpn2"].Value = cpn2;
            cmd.Parameters["@cpph2"].Value = cpph2;
            cmd.Parameters["@cpml2"].Value = cpml2;
            cmd.Parameters["@cpadr2"].Value = cpadr2;

            if (exyr != "")
                cmd.Parameters["@exyr"].Value = Convert.ToInt32(exyr);
            else
                cmd.Parameters["@exyr"].Value = 0;

            if (exmn != "")
                cmd.Parameters["@exmn"].Value = Convert.ToInt32(exmn);
            else
                cmd.Parameters["@exmn"].Value = 0;

            cmd.Parameters["@rtit"].Value = rtit;
            cmd.Parameters["@fnar"].Value = fnar;
            cmd.Parameters["@cind"].Value = cind;

            cmd.Parameters["@sk1"].Value = sk1;
            cmd.Parameters["@sk1yr"].Value = sk1yr;
            cmd.Parameters["sk1ex"].Value = sk1ex;
            cmd.Parameters["@sk2"].Value = sk2;
            cmd.Parameters["@sk2yr"].Value = sk2yr;
            cmd.Parameters["sk2ex"].Value = sk2ex;
            cmd.Parameters["@sk3"].Value = sk3;
            cmd.Parameters["@sk3yr"].Value = sk3yr;
            cmd.Parameters["sk3ex"].Value = sk3ex;

            cmd.Parameters["@sk4"].Value = sk4;
            cmd.Parameters["@sk4yr"].Value = sk4yr;
            cmd.Parameters["sk4ex"].Value = sk4ex;

            cmd.Parameters["@sk5"].Value = sk5;
            cmd.Parameters["@sk5yr"].Value = sk5yr;
            cmd.Parameters["sk5ex"].Value = sk5ex;

            cmd.Parameters["@sk6"].Value = sk6;
            cmd.Parameters["@sk6yr"].Value = sk6yr;
            cmd.Parameters["sk6ex"].Value = sk6ex;

            cmd.Parameters["@ed1"].Value = ed1;
            cmd.Parameters["@ed1bd"].Value = ed1bd;
            cmd.Parameters["ed1sb"].Value = ed1sb;
            cmd.Parameters["ed1y"].Value = ed1y;
            cmd.Parameters["ed1pe"].Value = ed1pe;
            cmd.Parameters["@ed2"].Value = ed2;
            cmd.Parameters["@ed2bd"].Value = ed2bd;
            cmd.Parameters["ed2sb"].Value = ed2sb;
            cmd.Parameters["ed2y"].Value = ed2y;
            cmd.Parameters["ed2pe"].Value = ed2pe;
            cmd.Parameters["@ed3"].Value = ed3;
            cmd.Parameters["@ed3bd"].Value = ed3bd;
            cmd.Parameters["ed3sb"].Value = ed3sb;
            cmd.Parameters["ed3y"].Value = ed3y;
            cmd.Parameters["ed3pe"].Value = ed3pe;

            cmd.Parameters["@ed4"].Value = ed4;
            cmd.Parameters["@ed4bd"].Value = ed4bd;
            cmd.Parameters["ed4sb"].Value = ed4sb;
            cmd.Parameters["ed4y"].Value = ed4y;
            cmd.Parameters["ed4pe"].Value = ed4pe;

            cmd.Parameters["@ed5"].Value = ed5;
            cmd.Parameters["@ed5bd"].Value = ed5bd;
            cmd.Parameters["ed5sb"].Value = ed5sb;
            cmd.Parameters["ed5y"].Value = ed5y;
            cmd.Parameters["ed5pe"].Value = ed5pe;

            cmd.Parameters["@ed6"].Value = ed6;
            cmd.Parameters["@ed6bd"].Value = ed6bd;
            cmd.Parameters["ed6sb"].Value = ed6sb;
            cmd.Parameters["ed6y"].Value = ed6y;
            cmd.Parameters["ed6pe"].Value = ed6pe;

            cmd.Parameters["@ed7"].Value = ed7;
            cmd.Parameters["@ed7bd"].Value = ed7bd;
            cmd.Parameters["ed7sb"].Value = ed7sb;
            cmd.Parameters["ed7y"].Value = ed7y;
            cmd.Parameters["ed7pe"].Value = ed7pe;

            cmd.Parameters["@rtxt"].Value = rtxt;
            cmd.Parameters["@rfil"].Value = rfil;
            cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);

            strx = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {

        }
        if (strx == "1")

            return true;
        else
            return false;
    }
    public bool UpdateEmpID(string Fname,string Lname, string eid,string A_eml,string A_pwdd,string Aa_cpwd)
    {
        int strx = 0;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string strQry = "update employeereg1 set empid=@eid, username=@A_eml, emailid=@A_eml,pwd=@A_pwdd,confirmpwd=@cpwd where status=1 and firstname='" + Fname + "' and lastname='" + Lname + "' ;update users_information set UserId=@uemail,Password=@upwd where Status=1 and Fname='" + Fname + "' and Lname='" + Lname + "'";

            SqlCommand cmd = new SqlCommand(strQry, connection);

            cmd.Parameters.Add(new SqlParameter("@eid", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@A_eml", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@A_pwdd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpwd", SqlDbType.NVarChar));   
         
            cmd.Parameters["@eid"].Value = eid;
            cmd.Parameters["@A_eml"].Value = A_eml;
            cmd.Parameters["@A_pwdd"].Value = A_pwdd;
            cmd.Parameters["@cpwd"].Value = Aa_cpwd;

            cmd.Parameters.Add(new SqlParameter("@uemail", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@upwd", SqlDbType.NVarChar));

            cmd.Parameters["@uemail"].Value = A_eml;
            cmd.Parameters["@upwd"].Value = A_pwdd;
            strx = Convert.ToInt32(cmd.ExecuteNonQuery());

            connection.Close();
        }
        catch
        {

        }
        if (strx !=0)

            return true;
        else
            return false;
    }
    public DataSet Get_EmpTimeSheetView(string usid, string Id)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
        string qry = "select * from timesheet where ID=" + Id + " and  userid=" + usid;
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();

        da.Fill(ds);
        connection.Close();
        return ds;
    }
}
public class StateCountry
{
    public DataSet GetCounty()
    {
        DataSet ds = new DataSet();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from Country_Master order by txtcountry_name asc", connection);
        sqlda.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetCounty_Usa()
    {
        DataSet ds = new DataSet();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from Country_Master except (select * from Country_Master where txtCountry_name='India')", connection);
        sqlda.Fill(ds);
        connection.Close();
        return ds;
    }

    public DataSet GetState(string id)
    {
        DataSet ds = new DataSet();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from State_Master where intCountryId = '" + id + "' order by txtstate", connection);
        sqlda.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetCity(string id1)
    {
        DataSet ds1 = new DataSet();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter sqlda1 = new SqlDataAdapter("select * from City_Master where SID = " + id1, connection);
        sqlda1.Fill(ds1);
        connection.Close();
        return ds1;
    }
}

    //public class clsIGIIT
    //{
    //    DAL.DataLayer objdataapplication = new DAL.DataLayer();

    //    public bool AddEmpForm1(string fmnm, string fnm, string mnm, string anm, string pradd,
    //         string peadd, string peaddf, string dob, string bpl, string cct, string ssno,
    //         string aregno, string dtaxno, string ncstat, string dtadm, string i94no)
    //    {
    //        try
    //        {
    //            DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[16];

    //            Param[0].ParamName = "@fmname";
    //            Param[0].ParamValue = fmnm.ToString();
    //            Param[0].ParamType = SqlDbType.VarChar;
    //            Param[0].ParamDirection = ParameterDirection.Input;

    //            Param[1].ParamName = "fname";
    //            Param[1].ParamValue = fnm.ToString();
    //            Param[1].ParamType = SqlDbType.VarChar;
    //            Param[1].ParamDirection = ParameterDirection.Input;

    //            Param[2].ParamName = "@mname";
    //            Param[2].ParamValue = mnm.ToString();
    //            Param[2].ParamType = SqlDbType.VarChar;
    //            Param[2].ParamDirection = ParameterDirection.Input;

    //            Param[3].ParamName = "aname";
    //            Param[3].ParamValue = anm.ToString();
    //            Param[3].ParamType = SqlDbType.VarChar;
    //            Param[3].ParamDirection = ParameterDirection.Input;

    //            Param[4].ParamName = "presaddr";
    //            Param[4].ParamValue = pradd.ToString();
    //            Param[4].ParamType = SqlDbType.VarChar;
    //            Param[4].ParamDirection = ParameterDirection.Input;

    //            Param[5].ParamName = "permaddr";
    //            Param[5].ParamValue = peadd.ToString();
    //            Param[5].ParamType = SqlDbType.VarChar;
    //            Param[5].ParamDirection = ParameterDirection.Input;

    //            Param[6].ParamName = "permaddr_F";
    //            Param[6].ParamValue = peaddf.ToString();
    //            Param[6].ParamType = SqlDbType.VarChar;
    //            Param[6].ParamDirection = ParameterDirection.Input;

    //            Param[7].ParamName = "dob";
    //            Param[7].ParamValue = dob.ToString();
    //            Param[7].ParamType = SqlDbType.DateTime;
    //            Param[7].ParamDirection = ParameterDirection.Input;

    //            Param[8].ParamName = "bplace";
    //            Param[8].ParamValue = bpl.ToString();
    //            Param[8].ParamType = SqlDbType.VarChar;
    //            Param[8].ParamDirection = ParameterDirection.Input;

    //            Param[9].ParamName = "c_citizen";
    //            Param[9].ParamValue = cct.ToString();
    //            Param[9].ParamType = SqlDbType.VarChar;
    //            Param[9].ParamDirection = ParameterDirection.Input;

    //            Param[10].ParamName = "ssno";
    //            Param[10].ParamValue = ssno.ToString();
    //            Param[10].ParamType = SqlDbType.VarChar;
    //            Param[10].ParamDirection = ParameterDirection.Input;

    //            Param[11].ParamName = "aregno";
    //            Param[11].ParamValue = aregno.ToString();
    //            Param[11].ParamType = SqlDbType.VarChar;
    //            Param[11].ParamDirection = ParameterDirection.Input;

    //            Param[12].ParamName = "Dtaxid";
    //            Param[12].ParamValue = dtaxno.ToString();
    //            Param[12].ParamType = SqlDbType.VarChar;
    //            Param[12].ParamDirection = ParameterDirection.Input;

    //            Param[13].ParamName = "nimgr";
    //            Param[13].ParamValue = ncstat.ToString();
    //            Param[13].ParamType = SqlDbType.VarChar;
    //            Param[13].ParamDirection = ParameterDirection.Input;

    //            Param[14].ParamName = "rdt";
    //            Param[14].ParamValue = dtadm.ToString();
    //            Param[14].ParamType = SqlDbType.DateTime;
    //            Param[14].ParamDirection = ParameterDirection.Input;

    //            Param[15].ParamName = "i94no";
    //            Param[15].ParamValue = i94no.ToString();
    //            Param[15].ParamType = SqlDbType.VarChar;
    //            Param[15].ParamDirection = ParameterDirection.Input;

    //            DAL.DataLayer objdataapplication = new DAL.DataLayer();
    //            objdataapplication.WithOut_ExecuteStoredProcedure("empform1", Param);
    //            return true;
    //        }
    //        catch (Exception Ex)
    //        {
    //            throw Ex;
    //        }
    //    }
    //    public string GetEmpForm()
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();
    //        string qry = "select max(id) from EmpForm";
    //        SqlCommand cmd = new SqlCommand(qry, connection);
    //        string x = cmd.ExecuteScalar().ToString();
    //        connection.Close();
    //        return x;
    //    }
    //    public bool AddEmpForm2(
    //           string eid, string exdt, string psno, string pss, string dtiss, string dtex,
    //           string vs1, string dtda1,
    //           string dtdd1, string vs2, string dtda2, string dtdd2, string vs3, string dtda3, string dtdd3,
    //           string usc, string yfadd, string h1b, string nm1, string nvs1, string in91, string pn1,
    //           string cp1, string nm2, string nvs2, string in92, string pn2, string cp2, string nm3,
    //           string nvs3, string in93, string pn3, string cp3, string nm4, string nvs4, string in94,
    //           string pn4, string cp4
    //           )
    //    {
    //        try
    //        {
    //            DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[38];

    //            Param[0].ParamName = "@eid";
    //            Param[0].ParamValue = eid.ToString();
    //            Param[0].ParamType = SqlDbType.Int;
    //            Param[0].ParamDirection = ParameterDirection.Input;

    //            Param[1].ParamName = "exdt_i94";
    //            Param[1].ParamValue = exdt.ToString();
    //            Param[1].ParamType = SqlDbType.DateTime;
    //            Param[1].ParamDirection = ParameterDirection.Input;

    //            Param[2].ParamName = "@passno";
    //            Param[2].ParamValue = psno.ToString();
    //            Param[2].ParamType = SqlDbType.VarChar;
    //            Param[2].ParamDirection = ParameterDirection.Input;

    //            Param[3].ParamName = "country_iss";
    //            Param[3].ParamValue = pss.ToString();
    //            Param[3].ParamType = SqlDbType.VarChar;
    //            Param[3].ParamDirection = ParameterDirection.Input;

    //            Param[4].ParamName = "dt_iss";
    //            Param[4].ParamValue = dtiss.ToString();
    //            Param[4].ParamType = SqlDbType.DateTime;
    //            Param[4].ParamDirection = ParameterDirection.Input;

    //            Param[5].ParamName = "dt_exp";
    //            Param[5].ParamValue = dtex.ToString();
    //            Param[5].ParamType = SqlDbType.DateTime;
    //            Param[5].ParamDirection = ParameterDirection.Input;

    //            Param[6].ParamName = "vt1";
    //            Param[6].ParamValue = vs1.ToString();
    //            Param[6].ParamType = SqlDbType.VarChar;
    //            Param[6].ParamDirection = ParameterDirection.Input;

    //            Param[7].ParamName = "dt_adm1";
    //            Param[7].ParamValue = dtda1.ToString();
    //            Param[7].ParamType = SqlDbType.DateTime;
    //            Param[7].ParamDirection = ParameterDirection.Input;

    //            Param[8].ParamName = "dt_dep1";
    //            Param[8].ParamValue = dtdd1.ToString();
    //            Param[8].ParamType = SqlDbType.DateTime;
    //            Param[8].ParamDirection = ParameterDirection.Input;

    //            Param[9].ParamName = "vt2";
    //            Param[9].ParamValue = vs2.ToString();
    //            Param[9].ParamType = SqlDbType.VarChar;
    //            Param[9].ParamDirection = ParameterDirection.Input;

    //            Param[10].ParamName = "dt_adm2";
    //            Param[10].ParamValue = dtda2.ToString();
    //            Param[10].ParamType = SqlDbType.DateTime;
    //            Param[10].ParamDirection = ParameterDirection.Input;

    //            Param[11].ParamName = "dt_dep2";
    //            Param[11].ParamValue = dtdd2.ToString();
    //            Param[11].ParamType = SqlDbType.DateTime;
    //            Param[11].ParamDirection = ParameterDirection.Input;

    //            Param[12].ParamName = "vt3";
    //            Param[12].ParamValue = vs3.ToString();
    //            Param[12].ParamType = SqlDbType.VarChar;
    //            Param[12].ParamDirection = ParameterDirection.Input;

    //            Param[13].ParamName = "dt_adm3";
    //            Param[13].ParamValue = dtda3.ToString();
    //            Param[13].ParamType = SqlDbType.DateTime;
    //            Param[13].ParamDirection = ParameterDirection.Input;

    //            Param[14].ParamName = "dt_dep3";
    //            Param[14].ParamValue = dtdd3.ToString();
    //            Param[14].ParamType = SqlDbType.DateTime;
    //            Param[14].ParamDirection = ParameterDirection.Input;

    //            Param[15].ParamName = "usa_cons";
    //            Param[15].ParamValue = usc.ToString();
    //            Param[15].ParamType = SqlDbType.VarChar;
    //            Param[15].ParamDirection = ParameterDirection.Input;

    //            Param[16].ParamName = "addr_F";
    //            Param[16].ParamValue = yfadd.ToString();
    //            Param[16].ParamType = SqlDbType.VarChar;
    //            Param[16].ParamDirection = ParameterDirection.Input;

    //            Param[17].ParamName = "h1bclass";
    //            Param[17].ParamValue = h1b.ToString();
    //            Param[17].ParamType = SqlDbType.VarChar;
    //            Param[17].ParamDirection = ParameterDirection.Input;

    //            Param[18].ParamName = "nm1";
    //            Param[18].ParamValue = nm1.ToString();
    //            Param[18].ParamType = SqlDbType.VarChar;
    //            Param[18].ParamDirection = ParameterDirection.Input;

    //            Param[19].ParamName = "vtt1";
    //            Param[19].ParamValue = nvs1.ToString();
    //            Param[19].ParamType = SqlDbType.VarChar;
    //            Param[19].ParamDirection = ParameterDirection.Input;

    //            Param[20].ParamName = "i94no1";
    //            Param[20].ParamValue = in91.ToString();
    //            Param[20].ParamType = SqlDbType.VarChar;
    //            Param[20].ParamDirection = ParameterDirection.Input;

    //            Param[21].ParamName = "passno1";
    //            Param[21].ParamValue = pn1.ToString();
    //            Param[21].ParamType = SqlDbType.VarChar;
    //            Param[21].ParamDirection = ParameterDirection.Input;

    //            Param[22].ParamName = "country_p1";
    //            Param[22].ParamValue = cp1.ToString();
    //            Param[22].ParamType = SqlDbType.VarChar;
    //            Param[22].ParamDirection = ParameterDirection.Input;


    //            Param[23].ParamName = "nm2";
    //            Param[23].ParamValue = nm2.ToString();
    //            Param[23].ParamType = SqlDbType.VarChar;
    //            Param[23].ParamDirection = ParameterDirection.Input;

    //            Param[24].ParamName = "vtt2";
    //            Param[24].ParamValue = nvs2.ToString();
    //            Param[24].ParamType = SqlDbType.VarChar;
    //            Param[24].ParamDirection = ParameterDirection.Input;

    //            Param[25].ParamName = "i94no2";
    //            Param[25].ParamValue = in92.ToString();
    //            Param[25].ParamType = SqlDbType.VarChar;
    //            Param[25].ParamDirection = ParameterDirection.Input;

    //            Param[26].ParamName = "passno2";
    //            Param[26].ParamValue = pn2.ToString();
    //            Param[26].ParamType = SqlDbType.VarChar;
    //            Param[26].ParamDirection = ParameterDirection.Input;

    //            Param[27].ParamName = "country_p2";
    //            Param[27].ParamValue = cp2.ToString();
    //            Param[27].ParamType = SqlDbType.VarChar;
    //            Param[27].ParamDirection = ParameterDirection.Input;

    //            Param[28].ParamName = "nm3";
    //            Param[28].ParamValue = nm3.ToString();
    //            Param[28].ParamType = SqlDbType.VarChar;
    //            Param[28].ParamDirection = ParameterDirection.Input;

    //            Param[29].ParamName = "vtt3";
    //            Param[29].ParamValue = nvs3.ToString();
    //            Param[29].ParamType = SqlDbType.VarChar;
    //            Param[29].ParamDirection = ParameterDirection.Input;

    //            Param[30].ParamName = "i94no3";
    //            Param[30].ParamValue = in93.ToString();
    //            Param[30].ParamType = SqlDbType.VarChar;
    //            Param[30].ParamDirection = ParameterDirection.Input;

    //            Param[31].ParamName = "passno3";
    //            Param[31].ParamValue = pn3.ToString();
    //            Param[31].ParamType = SqlDbType.VarChar;
    //            Param[31].ParamDirection = ParameterDirection.Input;

    //            Param[32].ParamName = "country_p3";
    //            Param[32].ParamValue = cp3.ToString();
    //            Param[32].ParamType = SqlDbType.VarChar;
    //            Param[32].ParamDirection = ParameterDirection.Input;

    //            Param[33].ParamName = "nm4";
    //            Param[33].ParamValue = nm4.ToString();
    //            Param[33].ParamType = SqlDbType.VarChar;
    //            Param[33].ParamDirection = ParameterDirection.Input;

    //            Param[34].ParamName = "vtt4";
    //            Param[34].ParamValue = nvs4.ToString();
    //            Param[34].ParamType = SqlDbType.VarChar;
    //            Param[34].ParamDirection = ParameterDirection.Input;

    //            Param[35].ParamName = "i94no4";
    //            Param[35].ParamValue = in94.ToString();
    //            Param[35].ParamType = SqlDbType.VarChar;
    //            Param[35].ParamDirection = ParameterDirection.Input;

    //            Param[36].ParamName = "passno4";
    //            Param[36].ParamValue = pn4.ToString();
    //            Param[36].ParamType = SqlDbType.VarChar;
    //            Param[36].ParamDirection = ParameterDirection.Input;

    //            Param[37].ParamName = "country_p4";
    //            Param[37].ParamValue = cp4.ToString();
    //            Param[37].ParamType = SqlDbType.VarChar;
    //            Param[37].ParamDirection = ParameterDirection.Input;

    //            DAL.DataLayer objdataapplication = new DAL.DataLayer();
    //            objdataapplication.WithOut_ExecuteStoredProcedure("empform2", Param);
    //            return true;
    //        }
    //        catch (Exception Ex)
    //        {
    //            throw Ex;
    //        }
    //    }
    //    public bool AddEmpForm3(
    //          string eid, string conno, string conno1, string emailid, string pdt
    //          )
    //    {
    //        try
    //        {
    //            DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[5];

    //            Param[0].ParamName = "@eid";
    //            Param[0].ParamValue = eid.ToString();
    //            Param[0].ParamType = SqlDbType.Int;
    //            Param[0].ParamDirection = ParameterDirection.Input;

    //            Param[1].ParamName = "conno";
    //            Param[1].ParamValue = conno.ToString();
    //            Param[1].ParamType = SqlDbType.VarChar;
    //            Param[1].ParamDirection = ParameterDirection.Input;

    //            Param[2].ParamName = "@conno1";
    //            Param[2].ParamValue = conno1.ToString();
    //            Param[2].ParamType = SqlDbType.VarChar;
    //            Param[2].ParamDirection = ParameterDirection.Input;

    //            Param[3].ParamName = "emailid";
    //            Param[3].ParamValue = emailid.ToString();
    //            Param[3].ParamType = SqlDbType.VarChar;
    //            Param[3].ParamDirection = ParameterDirection.Input;

    //            Param[4].ParamName = "pdt";
    //            Param[4].ParamValue = pdt.ToString();
    //            Param[4].ParamType = SqlDbType.DateTime;
    //            Param[4].ParamDirection = ParameterDirection.Input;

    //            DAL.DataLayer objdataapplication = new DAL.DataLayer();
    //            objdataapplication.WithOut_ExecuteStoredProcedure("empform3", Param);
    //            return true;
    //        }
    //        catch (Exception Ex)
    //        {
    //            throw Ex;
    //        }
    //    }
    //    public DataSet GetEmpFormDet(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();

    //        //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
    //        string qry = "select * from EmpForm where id=" + uid;
    //        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
    //        DataSet ds = new DataSet();

    //        da.Fill(ds);
    //        connection.Close();
    //        return ds;
    //    }


    //    public DataSet GetEmpClientDet(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();

    //        string qry = "select * from clientform where id=" + uid;
    //        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
    //        DataSet ds = new DataSet();

    //        da.Fill(ds);
    //        connection.Close();
    //        return ds;
    //    }

    //    public DataSet GetEmpClientDetall(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();

    //        string qry = "select * from clientform where userid=" + uid;
    //        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
    //        DataSet ds = new DataSet();

    //        da.Fill(ds);
    //        connection.Close();
    //        return ds;
    //    }
    //    public string ClientIdMax(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();
    //        string qry = "select max(id) from clientform where userid=" + uid;
    //        SqlCommand cmd = new SqlCommand(qry, connection);
    //        string x = cmd.ExecuteScalar().ToString();
    //        connection.Close();
    //        return x;
    //    }
    //    public DataSet GetEmpVendorDet(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();

    //        string qry = "select * from vendorform where id=" + uid;
    //        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
    //        DataSet ds = new DataSet();

    //        da.Fill(ds);
    //        connection.Close();
    //        return ds;
    //    }
    //    public DataSet GetEmpVendorDetall(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();

    //        string qry = "select * from vendorform where userid=" + uid;
    //        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
    //        DataSet ds = new DataSet();

    //        da.Fill(ds);
    //        connection.Close();
    //        return ds;
    //    }
    //    public string VendorIdMax(string uid)
    //    {
    //        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        connection.Open();
    //        string qry = "select max(id) from vendorform where userid=" + uid;
    //        SqlCommand cmd = new SqlCommand(qry, connection);
    //        string x = cmd.ExecuteScalar().ToString();
    //        connection.Close();
    //        return x;
    //    }
    //}
  

