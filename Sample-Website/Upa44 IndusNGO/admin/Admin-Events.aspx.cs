using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Events : System.Web.UI.Page
{
    home ob = new home();
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                fr.Visible = false;
                bind();
            }
        }

    }

    protected void bind()
    {
        DataSet ds = new DataSet();
        ds=ob.bindevent();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {

        string date = DateTime.Now.ToString();

          string image = FileUpload1.FileName.ToString();
        string path = Base_dir1 + "photos/events/" + image;
        FileUpload1.SaveAs(path);
        int sts=1;
        ob.insertevent(txt1.Text, DropDownList1.SelectedItem.Text, image, TextBox1.Text, date, sts);
        string strScript = "alert('Event Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);

    }
    protected void post_Click(object sender, EventArgs e)
    {
        fr.Visible = true;
        fr23.Visible = false;
        post.Visible = false;
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();  
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ob.deleteevent(id);
            string strScript = "alert('Event Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
            bind();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-EventEdit.aspx?id=" + id);
        }
    }
	protected void btnsub1 (object sender, EventArgs e)
	{
		Response.Redirect("Admin-Events.aspx");
	}
}