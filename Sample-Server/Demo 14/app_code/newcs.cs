using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for newcs
/// </summary>
/// 


public class newcs
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
	public newcs()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable bindnewsall()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from ST_Posts where post_type='News'  order by pid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
}