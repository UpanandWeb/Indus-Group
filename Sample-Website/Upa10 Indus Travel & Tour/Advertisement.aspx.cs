using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Advertisement : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string busi = ddlBusiness.SelectedItem.Text;
        string cont = txtContact.Text;
        string email = txtmail.Text;
        string page = ddlAdpage.SelectedItem.Text;
        string type = dllAdtype.SelectedItem.Text;
        string size = ddlSize.SelectedItem.Text;
        string period = ddlPeriod.SelectedItem.Text;

        tr.insertads(name, busi, cont, email, page, type, size, period);
        string alert = "alert('Thanks For Submitting Requirement!');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        txtName.Text = "";
        ddlBusiness.SelectedIndex = 0;
        txtContact.Text = "";
        txtmail.Text = "";
        ddlAdpage.SelectedIndex = 0;
        dllAdtype.SelectedIndex = 0;
        ddlSize.SelectedIndex = 0;
        ddlPeriod.SelectedIndex = 0;

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}