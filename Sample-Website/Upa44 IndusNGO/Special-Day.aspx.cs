using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Special_Day : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string page = "Special-Day.aspx";
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


            DataTable dt2 = new DataTable();
            dt2 = ob2.bindvegmenu();
            DataList1.DataSource = dt2;
            DataList1.DataBind();


            DataTable dt3 = new DataTable();
            dt3 = ob2.bindnonvegmenu();
            DataList2.DataSource = dt3;
            DataList2.DataBind();


            DataTable dt4 = new DataTable();
            dt4 = ob2.bindvegimg();
            dlimg1.DataSource = dt4;
            dlimg1.DataBind();

            DataTable dt5 = new DataTable();
            dt5 = ob2.bindnonvegimg();
            DataList3.DataSource = dt5;
            DataList3.DataBind();
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, page);
            Response.Redirect("Default.aspx");
        }


    }
    protected void list_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //try
        //{
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
        //}
        //catch (Exception ex)
        //{
        //    ec.insert_exception(ex, page);
        //    Response.Redirect("Default.aspx");
        //}
    }
}