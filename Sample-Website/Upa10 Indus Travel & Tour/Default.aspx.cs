using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    travelshome tr = new travelshome();
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
        dt = tr.bindwelcome();
        dl1.DataSource = dt;
        dl1.DataBind();

        DataTable dt2 = new DataTable();
        dt2 = tr.bindomtour();
        dl2.DataSource = dt2;
        dl2.DataBind();

        DataTable dt3 = new DataTable();
        dt3 = tr.bindinttour();
        dl3.DataSource = dt3;
        dl3.DataBind();

        DataTable dt4 = new DataTable();
        dt4 = tr.bindspecialoffer();
        dl4.DataSource = dt4;
        dl4.DataBind();

       // DataTable dt5 = new DataTable();
       // dt5 = tr.bindtourismcountry();
      //  dl5.DataSource = dt5;
        //dl5.DataBind();

        //DataTable dt6 = new DataTable();
        //dt6 = tr.bindtourismcountry1();
        //dl6.DataSource = dt6;
        //dl6.DataBind();
        DataTable dt7 = new DataTable();
        dt7 = tr.bindinbound();
        dl7.DataSource = dt7;
        dl7.DataBind();

        DataTable dt8 = new DataTable();
        dt8 = tr.bindoutbound();
        dl8.DataSource = dt8;
        dl8.DataBind();

        DataTable dt9 = new DataTable();
        dt9 = tr.bindhotel();
        dl9.DataSource = dt9;
        dl9.DataBind();

        DataTable dt10 = new DataTable();
        dt10 = tr.bindtravels();
        dl10.DataSource = dt10;
        dl10.DataBind();

        DataTable dt11 = new DataTable();
        dt11 = tr.bindairlines();
       // bl.DataSource = dt11;
       // bl.DataBind();

        DataTable dtt = new DataTable();
        dtt = tr.bindtourismcountry();
       // Repeater1.DataSource = dtt;
        //Repeater1.DataBind();
    }
    protected void dl2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("PackageDetails.aspx?id=" + id);
        }
    }
    protected void dl3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("PackageDetails.aspx?id=" + id);
        }
    }
    protected void dl7_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = tr.bindserviceperid(id);
            string page = ds.Tables[0].Rows[0]["pagename"].ToString();
            if (page == "")
            {

            }
            else
            {
                Response.Redirect(page);
            }
        }
    }
}