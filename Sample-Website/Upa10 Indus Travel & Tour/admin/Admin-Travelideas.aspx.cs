using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Traveideas : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            frimg.Visible = false;
            bind();
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }
    protected void bind()
    {
        DataSet ds = new DataSet();
        ds=tr.bindideadata();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string title = DropDownList3.SelectedItem.Text;
        string content = txt4.Text;
        int sts = 1;
        string date = DateTime.Now.ToString();
        tr.insertidea(title, content, sts, date);
        string alert = "alert('Data Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        DropDownList3.SelectedIndex = 0;
        txt4.Text = "";

        
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = tr.bindperidea(id);
            string st = ds.Tables[0].Rows[0]["status"].ToString();
            if (st == "1")
            {
                tr.updateideastatus(id, "0");
                string alert = "alert('Status Updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                bind();
            }
            else
            {
                tr.updateideastatus(id, "1");
                string alert = "alert('Status Updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                bind();
            }
        }

        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-TRavelIdeaEdit.aspx?id=" + id);
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletefromidea(id);
            string alert = "alert('Record deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }
    }
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the TextBox control.
            LinkButton txtName = (e.Row.FindControl("lnkmore") as LinkButton);

            //Find the DropDownList control.
            if (txtName.Text == "1")
            {
                txtName.Text = "Active";
            }
            else
            {
                txtName.Text = "Deactivate";
            }
        }
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        frimg.Visible = true;
        fr23.Visible = false;
        gv.Visible = false;
        Button3.Visible = false;
    }
}