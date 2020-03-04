using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ADmin_AddFooterPage : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tr1.Visible = false;
            tr2.Visible = false;
            tr3.Visible = true;
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string page = ddpage.SelectedItem.Text;
            string title = ddpage.SelectedItem.Text;
            string content = txtdis.Text;
            string img = FileUpload1.FileName.ToString();
            string path = Base_dir1 + "photos/" + img;
            string date = DateTime.Now.ToString();
            FileUpload1.SaveAs(path);

            travelshome tr = new travelshome();
            tr.insertfooter(page, title, content, img,date);

        }
        else if (ddpage.SelectedIndex == 2)
        {
            travelshome tr = new travelshome();
            int sts = 1;
            tr.insertairlines(txttitle.Text, TextBox1.Text, sts);
        }
        else
        {
            string page = ddpage.SelectedItem.Text;
            string title = ddpage.SelectedItem.Text;
            string content = txtdis.Text;
            string date = DateTime.Now.ToString();
            string img = "";
            travelshome tr = new travelshome();
            tr.insertfooter(page, title, content, img, date);
        }
        string alert = "alert('Content Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
       // Response.Redirect("Admin-FooterPages.aspx");

    }
    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddpage.SelectedIndex == 2)
        {
            tr1.Visible = true;
            tr2.Visible = true;
            tr3.Visible = false;

        }
        else
        {
            tr1.Visible = false;
            tr2.Visible = false;
            tr3.Visible = true;
        }
    }
}