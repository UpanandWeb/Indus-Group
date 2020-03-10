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
/// summary code to bind and view the client details 
/// </summary>
public partial class Client_details : System.Web.UI.Page
{
    //Initialise object to bind data
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

        SqlCommand cmd = new SqlCommand("select * from client_register where uname='"+username+"' and pwd='"+pwd+"'", con);

        SqlDataReader dr = cmd.ExecuteReader();
        DataList1.DataSource = dr;
        DataList1.DataBind();
        //Close database conncetion to disconnect to sql server
        con.Close();

        //open database connection to connect to sql server
        con.Open();
        DataSet ds1 = obj.GetCurr_Openings();
        if (ds1.Tables[0].Rows.Count > 0)
        {
            ddlcurop.DataSource = ds1.Tables[0];
            ddlcurop.DataBind();
        }
        //Close database conncetion to disconnect to sql server
        con.Close();
   
    }
    /// <summary>
    /// summary code to redirect to edit the client details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Response.Redirect("client_details_edit.aspx?id=" + btn.CommandArgument);
    }
}
