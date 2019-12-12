using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for home
/// </summary>
public class homemn
{
  
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public homemn()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void inserthome(string title, string cat, string imagename, string content, string date, int status,string sub)
    {
        SqlCommand cmd = new SqlCommand("insert into mncom_home values('" + title.Replace("'", "''") + "','" + cat.Replace("'", "''") + "','" + imagename.Replace("'", "''") + "','" + content.Replace("'", "''") + "','" + date + "','" + status + "','" + sub.Replace("'", "''") + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataTable bindhomefirst()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 3 * from mncom_home where caetgory=1 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;

    }
    public DataTable bindhomesecond()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from mncom_home where caetgory=2 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;

    }
    public DataTable bindpr1()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=12 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr2()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=13 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr3()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=14 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr4()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=15 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr5()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=16 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr6()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=17 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr7()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=18 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr8()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=19 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpr9()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  top 1 * from mncom_home where caetgory=3 and subcat=20 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindpart()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select   * from mncom_home where caetgory=4  order by id asc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void insertclient(string fname,string lname,string email,string pwd,string cpwd ,string ph,string address,int sts,string date)
    {
        SqlCommand cmd = new SqlCommand("insert into mncm_userclient values('" + fname.Replace("'", "''") + "','" + lname.Replace("'", "''") + "','" + email + "','" + pwd + "','" + cpwd + "','" + ph + "','" + address + "'," + sts + ",'" + date + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindclient(string emaiil, string pwd)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from mncm_userclient where email='" + emaiil + "' and pwd='" + pwd + "' ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Web Hosting' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb1()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Design & Development' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb2()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Graphic Designing' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb3()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Biz Infomation' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb4()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Ecommerce' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb5()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Tax & Payroll' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb6()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Book Keeping' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb7()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Request a Quote' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindweb8()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mncom_home where title='Schedule a Demo' and caetgory='5' order by id desc ", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }
    public DataTable bindadmin()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select id,title,substring(content,1,50)as content,caetgory,imagename,date,status,subcat  from mncom_home order by id desc ", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void deletehome(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from mncom_home where id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindhomeperid(string id)
    {
       
        SqlDataAdapter ad = new SqlDataAdapter("select * from mncom_home  where id= " + id,con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updatehomewithimg(string title,string cat,string img,string content,int st,string subcat,string id)
    {
        SqlCommand cmd = new SqlCommand("update mncom_home set title='" + title.Replace("'", "''") + "',caetgory='" + cat + "',imagename='" + img.Replace("'", "''") + "',content='" + content.Replace("'", "''") + "',status=" + st + ",subcat='" + subcat + "' where id="+id , con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatehomewithoutimg(string title, string cat, string content, int st, string subcat,string id)
    {
        SqlCommand cmd = new SqlCommand("update mncom_home set title='" + title.Replace("'", "''") + "',caetgory='" + cat + "',content='" + content.Replace("'", "''") + "',status=" + st + ",subcat='" + subcat + "' where id="+id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}

