using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Fund : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string page = "Fund.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void bind()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ob2.bindsupportmenu();
            list.DataSource = dt;
            list.DataBind();
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, page);
            Response.Redirect("Default.aspx");
        }
    }
    protected void list_ItemCommand(object source, DataListCommandEventArgs e)
    {
    
            if (e.CommandName == "view")
            {
                string id = e.CommandArgument.ToString();
                DataTable dt = new DataTable();
                dt = ob2.bindperidmenu(id);
                DataSet ds = new DataSet();

                ds.Tables.Add(dt);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string page = ds.Tables[0].Rows[0]["page_name"].ToString();
                    Response.Redirect(page);
                }

            }
       
    }
}