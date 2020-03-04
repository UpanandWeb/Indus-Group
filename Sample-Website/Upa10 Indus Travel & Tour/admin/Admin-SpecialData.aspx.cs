using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Admin_SpecialData : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (fd1.HasFile)
        {
            if (DropDownList3.SelectedIndex == 4)
            {
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                int sts = 1;
                string content = txt4.Text;
              //  string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                tr.addspecialoffer(title, cat, subcat, content, img, sts, date);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
                Response.Redirect("Admin-specialoffers.aspx");
            }
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex == 1)
        {
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            tr2.Visible = true;
           // subtitle.Visible = false;
            DropDownList1.Items.Add("Special Offers on Hotels");
            DropDownList1.Items.Add("Speical Offers on Tickets");
            DropDownList1.Items.Add("Tourism Summer Vacation");
            DropDownList1.Items.Add("Honeymoon Packages");
            DropDownList1.Items.Add("International Hotels");
            DropDownList1.Items.Add("Value Added Benefits");
            DropDownList1.Items.Insert(0, "Select");
        }
    }
}