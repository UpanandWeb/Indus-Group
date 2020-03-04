using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Contact : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string nm = txt.Text;
        string email = TextBox2.Text;
        string ph = TextBox3.Text;
        string loc = ddl.SelectedItem.Text;
        string msg = TextBox6.Text;
        tr.contactinsert(nm, email, ph, loc, msg);
        string alert = "alert('Data Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        txt.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox6.Text="";
        ddl.SelectedIndex = 0;
    }
}