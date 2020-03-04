using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {

            }
            else
            {
                lg.Text = "Log Out";
                string name = Convert.ToString(Session["user"]);
                //lblname.Text = name;
            }

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

            //DataTable dt11 = new DataTable();
            //dt11 = tr.bindairlines();
            //bl.DataSource = dt11;
            //bl.DataBind();
        }
    }
    protected void lg_Click(object sender, EventArgs e)
    {
        if (lg.Text == "Log Out")
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
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
