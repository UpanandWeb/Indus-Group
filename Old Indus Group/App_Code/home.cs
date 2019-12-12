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
/// 

public class home
{
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
	public home()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void inserthome(string title,string image,string content,string date,int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into mnnet_home values('" + title.Replace("'", "''") + "','" + image.Replace("'", "''") + "','" + content.Replace("'", "''") + "','" + date + "'," + sts + ")", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable bindhome()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 8 * from  mnnet_home where title not in('Welcome to M & H','Business Consulting','Risk Management','Market Research','Quality Services') order by id asc", con1);
        ad.Fill(dt);
        return dt;
    }
    public void inserttopit(string comp,string comp_name,string desc,string date,int sts,string cat)
    {
        SqlCommand cmd = new SqlCommand("insert into Intl_Company values('" + comp.Replace("'", "''") + "','" + comp_name.Replace("'", "''") + "','" + desc.Replace("'", "''") + "','" + date + "'," + sts + ",'" + cat.Replace("'", "''") + "')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public void deletefromhome(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from mnnet_home where id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet bindperdata(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from mnnet_home where id= " + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updatehome(string title,string imagename,string content,string id)
    {
        SqlCommand cm = new SqlCommand("update mnnet_home set title='" + title.Replace("'", "''") + "',imagename='" + imagename.Replace("'", "''") + "',content='" + content.Replace("'", "''") + "' where id= " + id, con1);
        con1.Open();
        cm.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable bindwelcome()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Welcome to M & H' order by id desc",  con1);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }

    public DataTable bindfilterhome()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 6 * from  mnnet_home where title not in('Welcome to M & H','Business Consulting','Risk Management','Market Research','Quality Services') order by id desc  ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindlist1()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Business Consulting' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindlist2()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Risk Management' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
   
    public DataTable bindlist3()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Market Research' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
     public DataTable bindlist4()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Quality Services' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }


     public DataSet bindfinance()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Finance' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
     public DataSet bindbusiness()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Business' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
     public DataSet bindinvester()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Investers' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
     public DataSet bindhealth()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Health' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
     public DataSet bindbuyer()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Buyers' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
     public DataSet bindmortgage()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from mnnet_home where title='Mortgage' order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }

     public DataSet bindall()
     {
         SqlDataAdapter ad = new SqlDataAdapter("select  * from mnnet_home  order by id desc", con1);
         DataSet dt = new DataSet();
         ad.Fill(dt);
         return dt;
     }
}