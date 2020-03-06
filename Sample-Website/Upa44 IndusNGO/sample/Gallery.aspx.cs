using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Gallery : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
            dv.Visible = false;
        }
        if (Session["name"] == null)
        {

        }
        else
        {
            lg.Text = "Log Out";
            string name = Convert.ToString(Session["name"]);
            //lblname.Text = name;
        }
    }
    protected void lg_Click(object sender, EventArgs e)
    {

        if (lg.Text == "Log Out")
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void binddata()
    {
        DataTable dt = new DataTable();
        dt = ob2.bindgalleryhome();
        ddlgallery.DataSource = dt;
        ddlgallery.DataBind();
    }
    protected void ddlgallery_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            DataTable td = new DataTable();
            string id = e.CommandArgument.ToString();
           td= ob2.bindgallperid(id);

           DataList1.DataSource = td;
           DataList1.DataBind();
           div1.Visible = false;
           dv.Visible = true;


     
        }
    }
}