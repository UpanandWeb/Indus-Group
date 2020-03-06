using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Monthly_Need : System.Web.UI.Page
{
    home ob = new home();
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
        dt = ob2.monthlyexpenses();
        dldetails.DataSource = dt;
        dldetails.DataBind();


        DataTable dt2 = new DataTable();
        dt2 = ob2.monthlyexpensesmed();
        DataList1.DataSource = dt2;
        DataList1.DataBind();
    }
    protected void dldetails_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            int total = 0;
            DataSet dt = new DataSet();
            dt = ob2.monthlyexpensestotal();
            int tot = Convert.ToInt32(dt.Tables[0].Rows[0]["total"].ToString());
            Label lblTot = (Label)e.Item.FindControl("total");
            lblTot.Text = tot.ToString("C2");
        }



    }
}