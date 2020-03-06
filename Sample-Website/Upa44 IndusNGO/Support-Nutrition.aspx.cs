using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Support_Nutrition : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string exp_page = "Support-Nutrition.aspx";
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
            dt2 = ob2.bindsupport2();
            DataList1.DataSource = dt2;
            DataList1.DataBind();

            DataTable dt3 = new DataTable();
            dt3 = ob2.bindsupport2details();
            dldetails.DataSource = dt3;
            dldetails.DataBind();

            DataTable dt4 = new DataTable();
            dt4 = ob2.binddatainnutrition();
            dlside.DataSource = dt4;
            dlside.DataBind();
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex,exp_page);
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
                    string pagename = ds.Tables[0].Rows[0]["page_name"].ToString();
                    //Server.Transfer(pagename);
                    Response.Redirect(pagename);
                }

            //}
        }
        //catch (Exception ex)
        //{
        //    ec.insert_exception(ex, exp_page);
        //    Response.Redirect("Default.aspx");
        //}
    }
    protected void dldetails_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                int total = 0;
                DataSet dt = new DataSet();
                dt = ob2.bindsupport1details2nutrition();
                int tot = Convert.ToInt32(dt.Tables[0].Rows[0]["total"].ToString());
                Label lblTot = (Label)e.Item.FindControl("total");
                lblTot.Text = tot.ToString("C2");
            }
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex, exp_page);
            Response.Redirect("Default.aspx");
        }




    }
}