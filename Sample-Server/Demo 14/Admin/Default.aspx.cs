using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    static string excep_page = "Default.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        //if (txt.SelectedItem.Text == "Admin" && txt1.Text == "admin" && txt2.Text == "Admin@123")
        //{
        //    string ur = txt.SelectedItem.Text;
        //    Session["User"] = ur;
        //    Session["username"] = txt1.Text;
        //    Response.Redirect("Admin-Home.aspx");
        //}
        //else
        //{
        //    string alert = "alert('Wrong Credentials');";
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        //    txt.SelectedIndex = 0;
        //    txt1.Text = "";
        //    txt2.Text = "";

        //}

        try
        {
            string user = txt.SelectedItem.Text;
            string username = txt1.Text;
            string pass = txt2.Text;

            SqlDataAdapter ad = new SqlDataAdapter("select * from ST_USers where udesignation='" + user + "'and username='" + username + "' and password='" + pass + "'and status=1", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["User"] = user;
                Session["username"] = username;
                Response.Redirect("Admin-Home.aspx");
            }
            else
            {
                string strScript = "alert('Please Enter Correct User Credentials');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                txt1.Text = "";
                txt2.Text = "";
            }
        }
        catch (Exception ex)
        {
            //  err.insert_exception(ex, excep_page);
            //Response.Redirect("ErrorPage.aspx");
        }
    }
}