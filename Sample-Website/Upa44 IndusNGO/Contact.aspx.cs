using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string page = "Contact.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] == null)
            {

            }
            else
            {
                lg.Text = "Log Out";
                string name = Convert.ToString(Session["name"]);
                //lblname.Text = name;
            }
        }
    }
    protected void lg_Click(object sender, EventArgs e)
    {
        if (lg.Text == "Log Out")
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        try
        {
            string date = DateTime.Now.ToString();
            ob2.insertcontact(txt.Text, txt2.Text, TextBox1.Text, TextBox2.Text, date);
            string alert = "alert('Thanks For Contacting!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            txt.Text = "";
            txt2.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, page);
            Response.Redirect("Default.aspx");
        }
    }
}