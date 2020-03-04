using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_VisaData : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dl.Visible = false;
            bind();
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

    }

    public void bind()
    {
        DataSet ds = new DataSet();
        ds = tr.binddatavisa();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString();
        string place = ddl.SelectedItem.Text;
        string contact = txt1.Text;
        string info = txt2.Text;
        string business = txt3.Text;
        string tourist = txt4.Text;
        int sts = 1;

        tr.insertdatavisa(place, contact, info, business, tourist, sts, date);
        string alert = "alert('Data Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        ddl.SelectedIndex = 0;
        txt1.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        dl.Visible = true;
        gid.Visible = false;
        Button3.Visible = false;
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletevisa(id);
            string alert = "alert('Record Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }

        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-VisaEdit.aspx?id=" + id);
        }
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = tr.bindvisaper(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                tr.updatestatusvisa(id, "0");
                string alert = "alert('Status Updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                bind();
            }
            else
            {
                tr.updatestatusvisa(id, "1");
                string alert = "alert('Status Updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                bind();
            }
        }

    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

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
}