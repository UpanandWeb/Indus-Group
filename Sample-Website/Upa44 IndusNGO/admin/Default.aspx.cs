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
    home ob = new home();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_Click(object sender, EventArgs e)
    {
        DataSet ds = new  DataSet();
       ds= ob.searchuser(ddltype.SelectedItem.Text, txt1.Text, txt2.Text);
        if (ds.Tables[0].Rows.Count>0)
        {
            Session["user"] = txt1.Text;
            Response.Redirect("Admin-Home.aspx");
           
        }
        else
        {
            string alert1 = "alert('Please Enter Correct Credentials');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert1, true);
            ddltype.SelectedIndex = 0;
            txt1.Text = "";
            txt2.Text = "";
          
        }
    }
}