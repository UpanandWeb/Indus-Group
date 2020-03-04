using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class holidaypackage : System.Web.UI.Page
{
    travelshome tr = new travelshome();
travelsadmin ad= new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    
    
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void bind()
    {
        DataTable dt = new DataTable();
        dt = ad.packagetourdetail();
        dl2.DataSource = dt;
        dl2.DataBind();
    }
    protected void dl2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("PackageDetails.aspx?id=" + id);
        }
    }
    //protected void dl3_ItemCommand(object source, DataListCommandEventArgs e)
    //{
    //    if (e.CommandName == "view")
    //    {
    //        string id = e.CommandArgument.ToString();
    //        Response.Redirect("PackageDetails.aspx?id=" + id);
    //    }
    //}
    //protected void btnmore_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("#.aspx");
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("#.aspx");
    //}
}