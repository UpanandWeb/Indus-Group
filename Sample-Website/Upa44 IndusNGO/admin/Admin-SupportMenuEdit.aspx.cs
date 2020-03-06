using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_SupportMenuEdit : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            DataSet ds = new DataSet();

          ds=  ob.bindmenuperid(id);
          TextBox2.Text = ds.Tables[0].Rows[0]["menu_name"].ToString();
          TextBox3.Text = ds.Tables[0].Rows[0]["page_name"].ToString();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Support.aspx");
    }
    protected void btn3_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        ob.updatesupportmenu(TextBox2.Text, TextBox3.Text, id);

        string str = "alert('Updated');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }
}