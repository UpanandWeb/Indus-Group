using System;
using System.Collections.Generic;
 
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for country
/// </summary>
public class statecountry
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    public statecountry()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
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