using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Enquiry : System.Web.UI.Page
{
    exception err = new exception();
    static string excep_page = "Admin-Enquiry.aspx";
    DataSet dsadmin = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                try
                {
                    permission();
                    bind();
                    view.Visible = false;
                }
                catch (Exception ex)
                {
                    err.insert_exception(ex, excep_page);
                    Response.Redirect("ExceptionPage.aspx");
                }
            }
        }
    }

    /// <summary>
    /// login user details and permissions
    /// </summary>
    protected void permission()
    {
        if (Session["user"] != null)
        {
            string admin = "Select * from IA_Users where userid='" + Session["user"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, con);
            DataSet dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            Session["dsadmin"] = dsadmin;
        }
    }

    /// <summary>
    /// display the enquiry details
    /// </summary>
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IB_Enquiry order by id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GalleryDatalist.DataSource = ds;
        GalleryDatalist.DataBind();
    }

    protected void GalleryDatalist_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GalleryDatalist_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    /// <summary>
    /// to view the recors with permission
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkView_Command(object sender, CommandEventArgs e)
    {
         permission();
        dsadmin = (DataSet)Session["dsadmin"];
        if (dsadmin.Tables[0].Rows[0]["Enquiryview"].ToString() == "1")
        {
            if (e.CommandName == "view")
            {
                view.Visible = true;
                GalleryDatalist.Visible = false;
                string id = e.CommandArgument.ToString();
                SqlDataAdapter ad = new SqlDataAdapter("select * from IB_Enquiry where id=" + id, con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                txt1name.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["Email_Id"].ToString();
                txtphone.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                txtmsg.Text = ds.Tables[0].Rows[0]["Comments"].ToString();
            }
        }
        else
        {
            string strScript = "alert('NO permission to do this Task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// to delete the record with permission
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgbtn1_Command(object sender, CommandEventArgs e)
    {
        permission();
        dsadmin = (DataSet)Session["dsadmin"];
        if (dsadmin.Tables[0].Rows[0]["Enquirydelete"].ToString() == "1")
        {
            if (e.CommandName == "Delete")
            {
                string id = e.CommandArgument.ToString();

                SqlCommand cmd = new SqlCommand("delete from  IB_Enquiry where id=" + id, con);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string str = "alert('Record Deleted successfully.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
        }
        else
        {
            string strScript = "alert('NO permission to do this Task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// using oncommand for give reply to enquiry
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkreply_Command(object sender, CommandEventArgs e)
    {
        permission();
        dsadmin = (DataSet)Session["dsadmin"];
        if (dsadmin.Tables[0].Rows[0]["Enquiryreply"].ToString() == "1")
        {
            if (e.CommandName == "reply")
            {
                string id = e.CommandArgument.ToString();
            }
        }
        else
        {
            string strScript = "alert('NO permission to do this Task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Enquiry.aspx");
    }
}