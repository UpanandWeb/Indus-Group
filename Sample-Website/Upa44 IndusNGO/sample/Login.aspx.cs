using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void reg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string user = txt1.Text;
        string password = txt2.Text;
        DataTable dt = new DataTable();
       dt= ob2.clientperid(user, password);

        DataSet ds = new DataSet();
       
            ds.Tables.Add(dt);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string name = ds.Tables[0].Rows[0]["name"].ToString();
                Session["name"] = name;
                Response.Redirect("Default.aspx");
               
            }
    }
}