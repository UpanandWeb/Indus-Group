using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Feedback : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {
            string cont = text.Text;
             string email = TextBox1.Text;
            string name=TextBox2.Text;
            int sts = 1;
            string date = DateTime.Now.ToString();
            tr.insertfeedback(cont, email, name, date, sts);
            string alert = "alert('Thanks For your feedback');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

            text.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
    }
}