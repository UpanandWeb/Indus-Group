using System;
using System.Collections.Generic;
 
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for new1indus
/// </summary>
public class new1indus
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
	public new1indus()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool insertdata(string name, string email, string ph, string msg)
    {
        SqlCommand cmd = new SqlCommand("insert into messagerequest values('" + name + "','" + email + "','" + ph + "','" + msg + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return true;
        
    }
}