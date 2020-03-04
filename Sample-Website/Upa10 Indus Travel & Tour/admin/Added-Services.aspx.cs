using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Added_Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gv_DataBound(object sender, EventArgs e)
    {

    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
//RequiredFieldValidator6.Enabled = true;
        if (DropDownList2.SelectedIndex == 1)
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Add("Exotic Kashmir");
            DropDownList5.Items.Add("Golden Triangle Holiday");
            DropDownList5.Items.Add("Experience Andamans");
            //DropDownList5.Items.Add("Exotic Kashmir");
            DropDownList5.Items.Add("Heritage Travel India");
            DropDownList5.Items.Add("Scenic Kerala");
            DropDownList5.Items.Insert(0, "Select");
        }
        else if (DropDownList2.SelectedIndex == 2)
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Add("Australia Holiday Packages");
            DropDownList5.Items.Add("Europe Tour Packages");
            DropDownList5.Items.Add("New Zealand Tour Packages");
            DropDownList5.Items.Add("South East Asia Toursr");
            DropDownList5.Items.Add("Srilanka Tours");
           
            DropDownList5.Items.Insert(0, "Select");
        }
        else if (DropDownList2.SelectedIndex == 3)
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Add("France , Swiss Paris");
            DropDownList5.Items.Add("Highlights Of Turkey");
            DropDownList5.Items.Add("Hongkong With Macau Package");
            DropDownList5.Items.Add("Luxury in Singapore");
            DropDownList5.Items.Add("Maldives With Cochin Stopover");

            DropDownList5.Items.Insert(0, "Select");
        }
        else if (DropDownList2.SelectedIndex == 4)
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Add("Domestic and International Air Ticketing");
            DropDownList5.Items.Add("Holiday packages");
            DropDownList5.Items.Add("Passport and Visa Assistance");
            DropDownList5.Items.Add("Travel Insurance");
            DropDownList5.Items.Add("Rail and Bus Tickets");

            DropDownList5.Items.Insert(0, "Select");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        string drop1 = DropDownList2.SelectedItem.Text;
        string drop2 = DropDownList5.SelectedItem.Text;
        travelshome tr = new travelshome();
        DataSet ds = new DataSet();
        ds = tr.bindvaluepercat(drop1, drop2);
        string id = ds.Tables[0].Rows[0]["eid"].ToString();
        tr.updateservicepage(id, TextBox1.Text);
        string alert = "alert('Page Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }
}