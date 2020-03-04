using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_PostJob : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
     {
         if (IsPostBack)
         {

         }
         else
         {
             if (Request.QueryString["id"] != null)
             {
                 string id = Request.QueryString["id"];
                 DataSet ds = new DataSet();
                 ds = tr.bindcareerone(id);
                 txt1.Text = ds.Tables[0].Rows[0]["designation"].ToString();
                 for (int i = 0; i < DropDownList1.Items.Count; i++)
                 {
                     if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["experience"]))
                     {
                         DropDownList1.Items[i].Selected = true;

                         // DropDownList1.Items.Insert(0, "Select");
                         break;
                     }
                 }
                 for (int i = 0; i < DropDownList4.Items.Count; i++)
                 {
                     if (DropDownList4.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["jobtype"]))
                     {
                         DropDownList4.Items[i].Selected = true;

                         // DropDownList1.Items.Insert(0, "Select");
                         break;
                     }
                 }
                 for (int i = 0; i < DropDownList2.Items.Count; i++)
                 {
                     if (DropDownList2.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["location"]))
                     {
                         DropDownList2.Items[i].Selected = true;

                         // DropDownList1.Items.Insert(0, "Select");
                         break;
                     }
                 }
                 TextBox2.Text = ds.Tables[0].Rows[0]["desp"].ToString();
                 Button2.Visible = true;
                 Button1.Visible = false;
             }
         }
         int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
         ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string desg = txt1.Text;
        string exp = DropDownList1.SelectedItem.Text;
        string loc = DropDownList2.SelectedItem.Text;
        string type = DropDownList4.SelectedItem.Text;
        string des = TextBox2.Text;
        string date = DateTime.Now.ToString();
        int sts = 1;
        tr.insertcareer(desg, exp, loc, type, des, date, sts);
        string alert = "alert('Job Posted');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        txt1.Text = "";
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        TextBox2.Text = "";

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string desg = txt1.Text;
        string exp = DropDownList1.SelectedItem.Text;
        string loc = DropDownList2.SelectedItem.Text;
        string type = DropDownList4.SelectedItem.Text;
        string des = TextBox2.Text;
        tr.updatecareer(id,desg, exp, loc, type, des);
        string alert = "alert('Job Updated');location.replace('Admin-Career.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }
}