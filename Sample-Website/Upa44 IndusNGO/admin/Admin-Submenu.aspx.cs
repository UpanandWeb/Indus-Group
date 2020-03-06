using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Admin_Submenu : System.Web.UI.Page
{
    home ob = new home();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            fr23.Visible = false;
            bindcat();
        }

    }

    protected void bindcat()
    {

        DataSet ds = new DataSet();
        ds = ob.bindmainmenu();
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "id";

       
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "Select");
    }
    protected void bindcat2()
    {

        
    }

    protected void btnsub_Click(object sender, EventArgs e)
    {
        ob.insertmenu(txt1.Text, DropDownList1.SelectedValue);

        string strScript = "alert('Sub Menu Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        fr23.Visible = true;
        fr.Visible = false;
        Button2.Visible = true;
        DataSet ds = new DataSet();
        ds = ob.bindmainmenu();
        DropDownList2.DataSource = ds;
        DropDownList2.DataTextField = "name";
        DropDownList2.DataValueField = "id";


        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "Select");
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        fr.Visible = true;
        fr23.Visible = false;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Select")
        {
            DropDownList3.Items.Clear();
        }
        else
        {
            DataSet ds = new DataSet();
            ds = ob.bindsubmenu(DropDownList2.SelectedValue);
            DropDownList3.DataSource = ds;
            DropDownList3.DataTextField = "subname";
            DropDownList3.DataValueField = "sid";


            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "Select");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ob.addcategory(TextBox1.Text,DropDownList3.SelectedValue, DropDownList2.SelectedValue);
        string strScript = "alert('Sub Category Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Submenu.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Submenu.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Submenu.aspx");
    }
}