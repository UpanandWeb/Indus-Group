using System;
using System.Collections.Generic;
 
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for country
/// </summary>
public class country
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
      
	public country()
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
}