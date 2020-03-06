using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;


public partial class admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    exception err = new exception();
    static string excep_page = "Default.aspx";
    DataSet dsadmin = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    /// <summary>
    /// validate user name and password
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void button1_Click(object sender, EventArgs e)
    {
        //try
        //{
            string user = ddlusertype.SelectedItem.Text;
            string username = txtusername.Text;
            string pass = txtpassword.Text;

            SqlDataAdapter sda = new SqlDataAdapter("select count( * ) as count from IA_Users where Designation='" + user + "' and  userid='" + username + "' and password='" + pass + "' and  ustatus=1", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows[0]["count"].ToString() == "1")
            {
                Session["user"] = username;
                Response.Redirect("Admin-Home.aspx");
            }

            else
            {
                string strScript = "alert('Please Enter Correct User Credentials');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                txtusername.Text = "";
                txtpassword.Text = "";
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }
}