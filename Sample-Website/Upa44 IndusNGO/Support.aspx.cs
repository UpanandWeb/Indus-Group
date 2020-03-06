using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Support : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string page = "Support.aspx";
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

            DataTable dt2 = new DataTable();
            dt2 = ob2.bindsupport1();
            DataList1.DataSource = dt2;
            DataList1.DataBind();

            DataTable dt3 = new DataTable();
            dt3 = ob2.bindsupport1details();
            dldetails.DataSource = dt3;
            dldetails.DataBind();



            DataTable dt4 = new DataTable();
            dt4 = ob2.supportmainpageside();
            dlside.DataSource = dt4;
            dlside.DataBind();
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
    protected void dldetails_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            int total = 0;
            DataSet dt = new DataSet();
            dt = ob2.bindsupport1details2();
            int tot = Convert.ToInt32(dt.Tables[0].Rows[0]["total"].ToString());
            Label lblTot = (Label)e.Item.FindControl("total");
            lblTot.Text = tot.ToString("C2");
        }
        
      

    }
}
