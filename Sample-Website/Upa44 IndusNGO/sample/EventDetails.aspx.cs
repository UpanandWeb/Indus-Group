using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class EventDetails : System.Web.UI.Page
{

    home ob = new home();
    home2 ob2 = new home2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string type = Request.QueryString["cat"];
            if (type == null)
            {
                binddata();
            }
            else
            {
                binddata2();
            }
        }
    }
    protected void binddata()
    {
        string id = Request.QueryString["id"];
        DataSet ds = new DataSet();
        ds = ob.evntperid(id);
        ddl.DataSource = ds;
        ddl.DataBind();
    }

    protected void binddata2()
    {
        string id = Request.QueryString["id"];
        string type = Request.QueryString["cat"];
        DataSet ds = new DataSet();
        ds = ob2.bindeventwithcat(id);
        ddl.DataSource = ds;
        ddl.DataBind();
    }
}