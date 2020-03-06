using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string page = "Register.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void reg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        try
        {
            string date = DateTime.Now.ToString();
            int sts = 0;
            ob2.insertclient(txt1.Text, txt2.Text, txt3.Text, txt4.Text, txt5.Text, ddl1.SelectedItem.Text, date, sts);
            string alert = "alert('Thanks for Registering! You will get mail shortly');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

            txt1.Text = "";
            txt2.Text = "";
            txt3.Text = "";
            txt4.Text = "";
            txt5.Text = "";
            ddl1.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, page);
            Response.Redirect("Default.aspx");
        }
    }
}