using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Globalization;

public partial class Travel_Insurance : System.Web.UI.Page
{
    travelsadmin ad = new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CalculateDays(object sender, EventArgs e)
    {
        this.CalculateDays();
    }

    private void CalculateDays()
    {
        TimeSpan i = new TimeSpan(0, 0, 0);
        DateTime startDate = Convert.ToDateTime(this.txtDate.Text.Trim(), new CultureInfo("en-Gb"));
        DateTime endDate = Convert.ToDateTime(this.txtDate1.Text.Trim(), new CultureInfo("en-Gb"));
        i += endDate.Subtract(startDate);
        int days = i.Days;
        TextBox1.Text = "Days Count is : " + days.ToString();
    }
    protected void btn1_Click(object sender, System.EventArgs e)
    {
        string type = rad.SelectedItem.Text;

        string country = rad2.SelectedItem.Text;
        string sum = ddl.SelectedItem.Text;
        string start = txtDate.Text;
        string enddate = txtDate1.Text;
        //string person = Request.Form["ddlPassport"].ToString();
        string Day = Convert.ToString(Request.Form.Get("ddlPassport").ToString());
        string travel1 = ddl1.SelectedItem.Text;
        string travel2 = DropDownList1.SelectedItem.Text;
        string travel3 = DropDownList2.SelectedItem.Text;
        string trave4 = DropDownList3.SelectedItem.Text;
        string travel5 = DropDownList4.SelectedItem.Text;
        string travel6 = DropDownList5.SelectedItem.Text;

        string email = txt1.Text;
        string ph = TextBox1.Text;

        ad.inserttravelerdetails(country, sum, start, enddate, "", Day, travel1, travel2, travel3, trave4, travel5, travel6, email, ph, type);
        string alert = "alert('ThanQ For Giving Ur Details !!!');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }
}