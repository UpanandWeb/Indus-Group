using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;

public partial class Roles : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    Boolean res;
    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        pnlgrid.Visible = true;
        pnladd.Visible = false;

        if (!IsPostBack)
        {
            lblAcess.Text = Session["UserName"].ToString();
            bind();
        }
    }

    public void bind()
    {
        ds = new DataSet();
        ds = obj.Bind_Roles();
        gvroles.DataSource = ds;
        gvroles.DataBind();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        pnladd.Visible = true;
        pnlgrid.Visible = false;
        string Role_Name = txtrole.Text.ToString();
        obj.Insert_Roles(Role_Name);
        txtrole.Text = "";
        pnladd.Visible = false;
        pnlgrid.Visible = true;
        bind();
    }

    protected void gvroles_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvroles.EditIndex = e.NewEditIndex;
        bind();
    }

    protected void gvroles_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ID=Convert.ToInt32(gvroles.DataKeys[e.RowIndex].Values[0].ToString());
        TextBox tbox = (TextBox)gvroles.Rows[e.RowIndex].FindControl("txtrole");
        string Role_Name = tbox.Text.ToString();
        string strres = obj.Edit_Roles(ID, Role_Name);
        gvroles.EditIndex = -1;
        bind();
    }

    protected void gvroles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvroles.EditIndex = -1;
        bind();
    }

    protected void gvroles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int ID = Convert.ToInt32(gvroles.DataKeys[e.RowIndex].Values[0].ToString());
        int res=Convert.ToInt32(obj.Delete_roles(ID));
       
            
        bind();
    }

    protected void gvroles_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvroles.PageIndex = e.NewPageIndex;
        bind();
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        pnlgrid.Visible = false;
        pnladd.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pnladd.Visible = true;
        pnlgrid.Visible = false;
        pnladd.Visible = false;
        pnlgrid.Visible = true;
    }
    protected void gvroles_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ID"));
            //identifying the control in gridview
            LinkButton lnkdel1 = (LinkButton)e.Row.FindControl("lnkdel");
            //raising javascript confirmationbox whenver user clicks on link button
            lnkdel1.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }

    }


    protected void gvroles_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void lnkdel_Click(object sender, EventArgs e)
    {
      //  own = ConfigurationManager.AppSettings["owner"].ToString();
     //   if (lblAcess.Text == own)
    //    {

            //Int32 Did = Convert.ToInt32(e.CommandArgument.ToString());
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            LinkButton lnkdel = sender as LinkButton;
            //getting particular row linkbutton
            GridViewRow gvrow = lnkdel.NamingContainer as GridViewRow;
            //getting userid of particular row
            int userid = Convert.ToInt32(gvroles.DataKeys[gvrow.RowIndex].Value.ToString());
            string username = gvrow.Cells[0].Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Roles where ID= " + userid + "", con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                bind();
                //Displaying alert message after successfully deletion of user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Employee details deleted successfully')", true);
            }
       // }
       // else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }
}
