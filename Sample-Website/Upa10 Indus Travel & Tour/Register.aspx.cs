using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
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
        string name = txt1.Text;
        string email = txt2.Text;
        string pwd = txt3.Text;
        string cpwd = txt4.Text;
        string ph = txt5.Text;
        string add=ddl.SelectedItem.Text;
        string date = DateTime.Now.ToString();
        int sts = 0;
        tr.insertclient(name, email, pwd, cpwd, ph, add, date, sts);

        string alert = "alert('Thanks For Registering! ');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

    }
}