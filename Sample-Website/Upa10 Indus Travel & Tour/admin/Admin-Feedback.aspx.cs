using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Admin_Feedback : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    travelsadmin ad = new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
            Tr1.Visible = false;
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }

    protected void bind()
    {

        DataSet ds = new DataSet();
      ds = tr.bindfeedbackadmin();

      gv.DataSource = ds;
      gv.DataBind();
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
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ad.deletefeedback(id);
            string alert = "alert('Record deleted!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }
        if (e.CommandName == "edit")
        {
            vw.Visible = true;
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
           ds= ad.bindfeedbackperid(id);
           txt.Text = ds.Tables[0].Rows[0]["name"].ToString();
           TextBox1.Text = ds.Tables[0].Rows[0]["email"].ToString();
           TextBox3.Text = ds.Tables[0].Rows[0]["content"].ToString();
           gv.Visible = false;
           Tr1.Visible = true;
        }

        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = ad.bindfeedbackperid(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                ad.updatestatusoffeedback(id, "0");
            }
            else
            {
                ad.updatestatusoffeedback(id, "1");
            }
            string alert = "alert('status updated!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gv_DataBound(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Feedback.aspx");
    }
    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}