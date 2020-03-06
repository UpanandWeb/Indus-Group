using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Current_Needs : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string exp_page = "Current-Needs.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ob2.bindsupportmenu();
            list.DataSource = dt;
            list.DataBind();

            DataTable dt1 = new DataTable();
            dt1 = ob2.bindcurrentneeds();
            dls.DataSource = dt1;
            dls.DataBind();


            DataTable dt2 = new DataTable();
            dt2 = ob2.bindcurrentimg();
            ddlcurrent.DataSource = dt2;
            ddlcurrent.DataBind();


            DataTable dt3 = new DataTable();
            dt3 = ob2.bindcurrentneedsideimg();
            dlside.DataSource = dt3;
            dlside.DataBind();
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, exp_page);
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