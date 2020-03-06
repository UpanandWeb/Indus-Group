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
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IB_Enquiry order by id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GalleryDatalist.DataSource = ds;
        GalleryDatalist.DataBind();
    }
    protected void Grid_rowdatabound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GalleryDatalist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GalleryDatalist.Rows[e.RowIndex];
        string id = Convert.ToString(GalleryDatalist.DataKeys[e.RowIndex].Value);

        SqlCommand cmd = new SqlCommand("delete from  IB_Enquiry where id=" + id, con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string str = "alert('Record Deleted successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        bind();
    }
}