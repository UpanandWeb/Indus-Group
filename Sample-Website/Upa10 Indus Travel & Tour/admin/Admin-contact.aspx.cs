using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_contact : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    travelsadmin ad = new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
            vw.Visible = false;
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }
    public void bind()
    {
        DataTable dt = new DataTable();
        dt = tr.bindcontact();
        gv.DataSource = dt;
        gv.DataBind();
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletefromcontact(id);
            string alert = "alert('Record Deleted!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }
        if(e.CommandName=="edit")
        {
            gv.Visible = false;
            string id = e.CommandArgument.ToString();
            vw.Visible = true;
            DataSet ds = new DataSet();
            ds = ad.bindpercontact(id);
            txt.Text = ds.Tables[0].Rows[0]["name"].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0]["email"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
            ddl.SelectedItem.Text = Convert.ToString(ds.Tables[0].Rows[0]["location"]);
            TextBox3.Text = ds.Tables[0].Rows[0]["msg"].ToString();
            ddl.Enabled = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-contact.aspx");
    }
    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}