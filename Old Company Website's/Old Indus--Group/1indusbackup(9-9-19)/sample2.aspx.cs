using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;

public partial class sample2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static string[] GetCustomers(string prefix)
    {
        List<string> customers = new List<string>();
            SqlConnection sqlconn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select empname from IA_DailytimeSheet where empname like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefix);
                cmd.Connection = sqlconn;
                sqlconn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["empname"]));
                    }
                }
                sqlconn.Close();
            }
        return customers.ToArray();
    }

    protected void Submit(object sender, EventArgs e)
    {
        string customerName = Request.Form[txtSearch.UniqueID];
        string customerId = Request.Form[hfCustomerId.UniqueID];
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + customerName + "\\nID: " + customerId + "');", true);
    }
}

    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> GetListofCountries(string prefixText)
    //{
    //    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //    sqlconn.Open();
    //    SqlCommand cmd = new SqlCommand("select empname from IA_DailytimeSheet where empname like '" + prefixText + "%' ", sqlconn);
    //    cmd.Parameters.AddWithValue("@Country", prefixText);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    List<string> CountryNames = new List<string>();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //    {

    //        CountryNames.Add(dt.Rows[i]["empname"].ToString());
    //    }
    //    return CountryNames;
    //}
