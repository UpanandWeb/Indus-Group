using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// summarise code to view the details of vendor
/// </summary>
public partial class vendor_details : System.Web.UI.Page
{
    //Initialise object to bind the data
    Binddata obj = new Binddata();

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Convert.ToString(Session["userid"]);
        string pwd = Convert.ToString(Session["userpwd"]);
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);

        //open database connection to connect to sql server
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from vendorreg where username='" + username + "' and password='" + pwd + "'", con);

        SqlDataReader dr = cmd.ExecuteReader();
        DataList1.DataSource = dr;
        DataList1.DataBind();
        //close database connection to disconnect to sql server
        con.Close();

        //open database connection to connect to sql server
        con.Open();
        DataSet ds1= obj.GetCurr_Openings();
       if (ds1.Tables[0].Rows.Count > 0)
        {
            ddlcurop.DataSource = ds1.Tables[0];
            ddlcurop.DataBind();
        }
       //close database connection to disconnect to sql server
        con.Close();
    }
    /// <summary>
    /// summarise code to redirect to vendor details edit page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Response.Redirect("vendor_details_edit.aspx?id=" + btn.CommandArgument);
    }

}
