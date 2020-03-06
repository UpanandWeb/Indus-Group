using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class _Default : System.Web.UI.Page
{
    home2 ob = new home2();
    home2 ob2 = new home2();
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
        dt= ob.binddata();
        DataList1.DataSource = dt;
        DataList1.DataBind();

        DataTable dt2 = new DataTable();
        dt2 = ob.bindevent();
        DataList2.DataSource = dt2;
        DataList2.DataBind();

        DataTable dt3 = new DataTable();
        dt3 = ob.bindupcomingevent();
        dataupcoming.DataSource = dt3;
        dataupcoming.DataBind();

        DataTable dt4 = new DataTable();
        dt4 = ob.child();
        child.DataSource = dt4;
        child.DataBind();

        DataTable dt5 = new DataTable();
        dt5 = ob.childadopt();
        DataList3.DataSource = dt5;
        DataList3.DataBind();

        DataTable dt6 = new DataTable();
        dt6 = ob.childcharity();
        DataList4.DataSource = dt6;
        DataList4.DataBind();


        DataTable dt7 = new DataTable();
        dt7 = ob.bindsupport();
        DataList5.DataSource = dt7;
        DataList5.DataBind();


        DataTable dt8 = new DataTable();
        dt8 = ob2.bindgallery();
        ddlgallery.DataSource = dt8;
        ddlgallery.DataBind();
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "img")
        {
            string id = e.CommandArgument.ToString();

            Response.Redirect("EventDetails.aspx?id=" + id);
        }
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();

            Response.Redirect("EventDetails.aspx?id=" + id);
        }
    }
    protected void dataupcoming_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            string up = "Upcoming";

            Response.Redirect("EventDetails.aspx?id=" + id+"&cat="+up);
        }
    }
}

