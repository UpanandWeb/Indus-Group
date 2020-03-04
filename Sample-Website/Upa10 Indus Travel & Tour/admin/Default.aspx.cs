using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        if (txt.SelectedItem.Text == "Admin" && txt1.Text == "admin" && txt2.Text == "Admin@123")
        {
            string ur = txt.SelectedItem.Text;
            Session["User"] = ur;
            Response.Redirect("Admin-Home.aspx");
        }
        else
        {
            string alert = "alert('Wrong Credentials');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            txt.SelectedIndex = 0;
            txt1.Text = "";
            txt2.Text = "";

        }
    }
}