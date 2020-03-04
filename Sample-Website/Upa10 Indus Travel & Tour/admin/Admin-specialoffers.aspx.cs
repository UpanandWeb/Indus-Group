using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class admin_Admin_specialoffers : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }
    protected void bind()
    {
        DataTable dt = new DataTable();
        dt = tr.bindspecialofferdata();
        gv.DataSource = dt;
        gv.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-SpecialData.aspx");
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
           gv.PageIndex = e.NewPageIndex;
        bind();
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
                ds = tr.bindperstatusoffer(id);
                string st = ds.Tables[0].Rows[0]["status"].ToString();
                if (st == "1")
                {
                    tr.updateperoffer(id, "0");
                }
                else
                {
                    tr.updateperoffer(id, "1");
                }
                string alert = "alert('Status Updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                bind();
           
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deleteperoffer(id);
            bind();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-Specialofferedit.aspx?id="+id);
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
}