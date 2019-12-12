using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_Admin_Account_Reports : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    exception err = new exception();
    static string excep_page = "Admin-Account-Reports.aspx";
    int statusid;
    int Emp_result;
    int usid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            active.Visible = false;
            inactive.Visible = false;
            actdownload.Visible = false;
            inactdownload.Visible = false;
            empdownload.Visible = false;

            //active.ForeColor = System.Drawing.Color.Green;
            //Bindnew();
            //actdownload.Visible = true;
            //inactdownload.Visible = false;

           SqlDataAdapter sscmd = new SqlDataAdapter("select  emp_id +' ' + '-' +' '+ cname as name ,* from EmpContacts order by cname", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                ddemp.DataTextField="name";
                ddemp.DataValueField = "emp_id";

                ddemp.DataSource = das;
                ddemp.DataBind();
                ddemp.Items.Insert(0, "Select Employee");
            }
        }
    }

    private void Bindnew()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT a.firm_name,a.vid,a.hourrate,a.OTRate,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.InvoiceCycle,a.remarks as Vendor_Remarks,a.remarks1 as remarks11,a.NetPeriod,* FROM dbo.IG_Invoice b,vendors a where ctype='vendors' and a.emp_id=b.emp_id and enddate is  null order by cname asc", con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    //protected void MyGrid_RowDataBound1(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        string cid = "";
    //        string cid1 = "";
    //        string cid2 = "";
    //        string cid3 = "";

    //        string d1 = "";
    //        string d2 = "";
    //        string d3 = "";
    //        string d4 = "";
    //        string d5 = "";
    //        string d6 = "";
    //        string d7 = "";
    //        int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
    //        con.Open();
    //        SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
    //        DataSet das = new DataSet();
    //        sscmd.Fill(das);
    //        if (das.Tables[0].Rows.Count > 0)
    //        {
    //            cid = das.Tables[0].Rows[0]["idc1"].ToString();
    //            cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
    //            cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
    //            cid3 = das.Tables[0].Rows[0]["remarcksc1"].ToString();
    //            statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
    //            d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
    //            d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();
    //            d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
    //            d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();
    //            d5 = das.Tables[0].Rows[0]["tspendingperiod1"].ToString();
    //            d6 = das.Tables[0].Rows[0]["invoiceperiod1"].ToString();
    //            d7 = das.Tables[0].Rows[0]["idate"].ToString();
    //        }
    //        con.Close();

    //        DateTime d = new DateTime();
    //        d = DateTime.UtcNow.Date;
    //        string day = d.ToString("MM-dd-yyyy");

    //        Label dates1 = (Label)e.Row.FindControl("lblJoindatebt9");
    //        if (d3 == "Other")
    //        {
    //            dates1.Text = d1;
    //        }
    //        else
    //        {
    //            dates1.Text = d3;
    //        }

    //        Label dates2 = (Label)e.Row.FindControl("lblJoindatebf9");
    //        if (d4 == "Other")
    //        {
    //            dates2.Text = d2;
    //        }
    //        else
    //        {
    //            dates2.Text = d4;
    //        }
    //        Label lnkactivate1 = (Label)e.Row.FindControl("lblName555");
    //        if (cid1 != "")
    //        {
    //            lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
    //            if (DateTime.Parse(d6) < DateTime.Parse(day))
    //            {
    //                lnkactivate1.ForeColor = System.Drawing.Color.Red;
    //            }
    //            else
    //            {
    //                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
    //            }
    //        }
    //        else
    //        {
    //            lnkactivate1.ForeColor = System.Drawing.Color.Black;
    //        }

    //        Label lnkactivate12 = (Label)e.Row.FindControl("lblName566");
    //        if (cid2 != "")
    //        {
    //            lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);

    //            if (DateTime.Parse(d5) < DateTime.Parse(day))
    //            {
    //                lnkactivate12.ForeColor = System.Drawing.Color.Red;
    //            }
    //            else
    //            {
    //                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
    //            }
    //        }
    //        else
    //        {
    //            lnkactivate12.ForeColor = System.Drawing.Color.Black;
    //        }

    //        Label lnkactivate = (Label)e.Row.FindControl("lblJoindate9");
    //        if (cid != "")
    //        {
    //            lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);

    //            if (DateTime.Parse(d7) < DateTime.Parse(day))
    //            {
    //                lnkactivate.ForeColor = System.Drawing.Color.Red;
    //            }
    //            else
    //            {
    //                lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);
    //            }
    //        }
    //        else
    //        {
    //            lnkactivate.ForeColor = System.Drawing.Color.Black;
    //        }
    //        Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww9");
    //        if (cid3 != "")
    //        {
    //            lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid3);
    //        }
    //        else
    //        {
    //            lnkactivate123.ForeColor = System.Drawing.Color.Black;
    //        }
    //    }
    //}

    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView1.PageIndex = e.NewPageIndex;
    //    Bindnew();
    //}

    protected void gridviewSorting_Sorting1(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (sortProperty == SortDirection.Ascending)
        {
            sortProperty = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView(BindGridView2());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        GridView1.DataSource = sortedView;
        GridView1.DataBind();
    }

    public SortDirection sortProperty
    {
        get
        {
            if (ViewState["SortingState"] == null)
            {
                ViewState["SortingState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortingState"];
        }
        set
        {
            ViewState["SortingState"] = value;
        }
    }

    private DataTable BindGridView2()
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT a.firm_name,a.vid,a.hourrate,a.OTRate,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.InvoiceCycle,a.remarks as Vendor_Remarks,a.remarks1 as remarks11,a.NetPeriod,* FROM dbo.IG_Invoice b,vendors a where ctype='vendors' and a.emp_id=b.emp_id and enddate is  null order by cname asc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        return dtGridView;
    }

    protected void gridviewSorting_Sorting2(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (sortProperty1 == SortDirection.Ascending)
        {
            sortProperty1 = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty1 = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

      //  DataView sortedView = new DataView(BindGridView3());
        DataView sortedView = new DataView(BindGridView3());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        MyGrid.DataSource = sortedView;
        MyGrid.DataBind();
    }

    public SortDirection sortProperty1
    {
        get
        {
            if (ViewState["SortingState"] == null)
            {
                ViewState["SortingState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortingState"];
        }
        set
        {
            ViewState["SortingState"] = value;
        }
    }

    private DataTable BindGridView3()
    {
        string strSelect = "";
        DataTable dtGridView = new DataTable();
        if (ddt.SelectedItem.Text != "Select")
        {
         strSelect = "select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where b.emp_id=a.emp_id and  enddate is not null  order by cname asc";
        }
        else
        {
            //strSelect = "select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where a.emp_id='" + ddemp.SelectedValue + "'  and a.emp_id=b.emp_id order by a.enddate asc";
            strSelect = "select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where a.emp_id='" + ddemp.SelectedValue + "'  and a.emp_id=b.emp_id order by a.enddate ";
        }
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        return dtGridView;
    }

    //protected void lnkactivate(object sender, CommandEventArgs e)
    //{
    //    statusid = 2;
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');", true);
    //        Bindnew();
    //        Bindnew();
    //    }
    //}

    //protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtnedit = sender as ImageButton;
    //    GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
    //    DataSet das = new DataSet();
    //    cmd.Fill(das);
    //    if (das.Tables[0].Rows.Count > 0)
    //    {
    //        Response.Redirect("Admin-InvoiceCreate.aspx?sno1=" + userid);
    //    }
    //    con.Close();
    //}

    //protected void lnkdelrecord1(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow1 = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
    //    string NEmailid = Convert.ToString(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
    //    Emp_result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (Emp_result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Admin-Invoice.aspx');", true);
    //    }
    //}
     
    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where b.emp_id=a.emp_id and  enddate is not null  order by cname asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }

    //protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    MyGrid.PageIndex = e.NewPageIndex;
    //    Binddata();
    //}

    //protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete from vendors where vid=" + userid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Vendor Details has been deleted Successfully');location.replace('Admin_Vendors.aspx');", true);
    //    }
    //}

    //protected void lnkactivate1(object sender, CommandEventArgs e)
    //{
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    SqlDataAdapter ad = new SqlDataAdapter("select * from vendors where vid= " + usid + "", con);
    //    DataSet ds = new DataSet();
    //    ad.Fill(ds);
    //    statusid = Convert.ToInt32(ds.Tables[0].Rows[0]["status"].ToString());

    //    if (statusid == 0)
    //    {
    //        statusid = 1;
    //    }
    //    else if (statusid == 1)
    //    {
    //        statusid = 2;
    //    }
    //    else
    //    {
    //        statusid = 1;
    //    }

    //    string date = System.DateTime.Now.ToString("dd/MM/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update vendors set status='" + statusid + "',apbdate='" + date + "' where vid=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Vendor Status  Updated Successfully');location.replace('Admin_Vendors.aspx');", true);
    //    }
    //}

    //protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtnedit = sender as ImageButton;
    //    GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlDataAdapter cmd = new SqlDataAdapter("select * from vendors where vid=" + userid, con);
    //    DataSet das = new DataSet();
    //    cmd.Fill(das);
    //    if (das.Tables[0].Rows.Count > 0)
    //    {
    //        Response.Redirect("Admin_viewvendor.aspx?sid=" + userid);
    //    }
    //    con.Close();
    //}

    //protected void lnkviewrecord121(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtnedit = sender as ImageButton;
    //    GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlDataAdapter cmd = new SqlDataAdapter("select * from vendors where vid=" + userid, con);
    //    DataSet das = new DataSet();
    //    cmd.Fill(das);
    //    if (das.Tables[0].Rows.Count > 0)
    //    {
    //        Response.Redirect("Admin_Editvendor.aspx?sid=" + userid);
    //    }
    //    con.Close();
    //}

    protected void active_Click(object sender, EventArgs e)
    {
        Bindnew();
        GridView1.Visible = true;
        MyGrid.Visible = false;
        actdownload.Visible = true;
        inactdownload.Visible = false;
        active.ForeColor = System.Drawing.Color.Green;
        inactive.ForeColor = System.Drawing.Color.Blue;
        active.BackColor = System.Drawing.Color.LightGray;
        inactive.BackColor = System.Drawing.Color.White;

        empdownload.Visible = false;

    }

    protected void inactive_Click(object sender, EventArgs e)
    {
        Binddata();
        GridView1.Visible = false;
        MyGrid.Visible = true;
        actdownload.Visible = false;
        inactdownload.Visible = true;
        active.ForeColor = System.Drawing.Color.Blue;
        inactive.ForeColor = System.Drawing.Color.Green;
        inactive.BackColor = System.Drawing.Color.LightGray;
        active.BackColor = System.Drawing.Color.White;

        empdownload.Visible = false;
    }

    protected void btnsearch_Click1(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            active.Visible = false;
            inactive.Visible = false;
            actdownload.Visible = false;
            inactdownload.Visible = false;
            empdownload.Visible = true;

            SqlDataAdapter ada = new SqlDataAdapter("select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where a.emp_id='" + ddemp.SelectedValue + "'  and a.emp_id=b.emp_id order by a.enddate asc", con);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                MyGrid.DataSource = ds;
                MyGrid.DataBind();
                MyGrid.Visible = true;
                GridView1.Visible = false;
            }
        }
        else if (ddt.SelectedItem.Text != "Select")
        {

            active.Visible = true;
            inactive.Visible = true;
            actdownload.Visible = true;
            inactdownload.Visible = false;
            Bindnew();
            active.ForeColor = System.Drawing.Color.Green;
            inactive.ForeColor = System.Drawing.Color.Blue;
            active.BackColor = System.Drawing.Color.LightGray;
            inactive.BackColor = System.Drawing.Color.White;

            lblerror.Visible = false;
            MyGrid.Visible = false;
            GridView1.Visible = true;
            empdownload.Visible = false;
        }
        else
        {
            lblerror.Visible = true;
            lblerror.Text = "Select Employee OR Report type";
            lblerror.ForeColor = System.Drawing.Color.Red;
            MyGrid.Visible = false;
            GridView1.Visible = false;
        }
    }
    protected void actdownload_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT b.efname + ' ' + b.elname as name ,a.firm_name,a.vid,a.hourrate,a.OTRate,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.InvoiceCycle,a.remarks as Vendor_Remarks,a.remarks1 as remarks11,a.NetPeriod,* FROM dbo.IG_Invoice b,vendors a where ctype='vendors' and a.emp_id=b.emp_id and enddate is  null order by cname asc  ", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataTable d2 = new DataTable();
            DataColumn dc = new DataColumn();

            dc = new DataColumn();
            dc.ColumnName = "Employee Name";
            dc.Caption = "name";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee Email";
            dc.Caption = "cemail";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Company";
            dc.Caption = "firm_name";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Cycle";
            dc.Caption = "invoicecycle";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Rate";
            dc.Caption = "hourrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Net Period";
            dc.Caption = "netperiod";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "OT Rate";
            dc.Caption = "otrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);


            dc = new DataColumn();
            dc.ColumnName = "Start Date";
            dc.Caption = "startdate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "End Date";
            dc.Caption = "enddate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks";
            dc.Caption = "vendor_remarks";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks1";
            dc.Caption = "remarks11";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = d2.NewRow();
                DataRow dr = dt.Rows[i];
                string id = dr[3].ToString();

                row["Employee Name"] = dt.Rows[i]["name"].ToString();
                row["Employee Email"] = dt.Rows[i]["cemail"].ToString();
                row["Company"] = dt.Rows[i]["firm_name"].ToString();
                row["Cycle"] = dt.Rows[i]["invoicecycle"].ToString();
                row["Rate"] = dt.Rows[i]["hourrate"].ToString();
                row["OT Rate"] = dt.Rows[i]["otrate"].ToString();
                row["Net Period"] = dt.Rows[i]["netperiod"].ToString();
                row["Start Date"] = dt.Rows[i]["startdate"].ToString();
                row["End Date"] = dt.Rows[i]["enddate"].ToString();
                row["Remarks"] = dt.Rows[i]["vendor_remarks"].ToString();
                row["Remarks1"] = dt.Rows[i]["remarks11"].ToString();

                d2.Rows.Add(row);
            }

            DataTable d3 = new DataTable();
            d3 = d2;

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "EMP-Billing.xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;

            foreach (DataColumn dtcol in d3.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in d3.Rows)
            {
                str = "";
                for (int j = 0; j < d3.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
    }
    protected void inactdownload_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where b.emp_id=a.emp_id and  enddate is not null  order by cname asc", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataTable d2 = new DataTable();
            DataColumn dc = new DataColumn();

            dc = new DataColumn();
            dc.ColumnName = "Employee Name";
            dc.Caption = "cname";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee Email";
            dc.Caption = "cemail";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Company";
            dc.Caption = "firm_name";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Cycle";
            dc.Caption = "invoicecycle";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Rate";
            dc.Caption = "hourrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Net Period";
            dc.Caption = "netperiod";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "OT Rate";
            dc.Caption = "otrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Start Date";
            dc.Caption = "startdate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "End Date";
            dc.Caption = "enddate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks";
            dc.Caption = "remarks";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks1";
            dc.Caption = "remarks1";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = d2.NewRow();
                DataRow dr = dt.Rows[i];
                string id = dr[3].ToString();

                row["Employee Name"] = dt.Rows[i]["cname"].ToString();
                row["Employee Email"] = dt.Rows[i]["cemail"].ToString();
                row["Company"] = dt.Rows[i]["firm_name"].ToString();
                row["Cycle"] = dt.Rows[i]["invoicecycle"].ToString();
                row["Rate"] = dt.Rows[i]["hourrate"].ToString();
                row["OT Rate"] = dt.Rows[i]["otrate"].ToString();
                row["Net Period"] = dt.Rows[i]["netperiod"].ToString();
                row["Start Date"] = dt.Rows[i]["startdate"].ToString();
                row["End Date"] = dt.Rows[i]["enddate"].ToString();
                row["Remarks"] = dt.Rows[i]["remarks"].ToString();
                row["Remarks1"] = dt.Rows[i]["remarks1"].ToString();

                d2.Rows.Add(row);
            }

            DataTable d3 = new DataTable();
            d3 = d2;

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Emp-Proj-Term.xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;

            foreach (DataColumn dtcol in d3.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in d3.Rows)
            {
                str = "";
                for (int j = 0; j < d3.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
    }
    protected void ddemp_TextChanged(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            ddt.SelectedIndex = -1;
            lblerror.Visible = false;
        }
    }
    protected void ddt_TextChanged(object sender, EventArgs e)
    {
        if (ddt.SelectedItem.Text != "Select")
        {
            ddemp.SelectedIndex = -1;
            lblerror.Visible = false;
        }
    }
    protected void empdownload_Click(object sender, EventArgs e)
    {
        SqlDataAdapter ada = new SqlDataAdapter("select b.cname,b.cemail ,convert(varchar, a.startDate, 101)as startdate,convert(varchar, a.enddate, 101)as enddate,a.* from empcontacts b , vendors a where a.emp_id='" + ddemp.SelectedValue + "'  and a.emp_id=b.emp_id order by a.enddate asc", con);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataTable d2 = new DataTable();
            DataColumn dc = new DataColumn();

            dc = new DataColumn();
            dc.ColumnName = "Employee Name";
            dc.Caption = "cname";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee Email";
            dc.Caption = "cemail";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Company";
            dc.Caption = "firm_name";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Cycle";
            dc.Caption = "invoicecycle";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Rate";
            dc.Caption = "hourrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Net Period";
            dc.Caption = "netperiod";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "OT Rate";
            dc.Caption = "otrate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Start Date";
            dc.Caption = "startdate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "End Date";
            dc.Caption = "enddate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks";
            dc.Caption = "remarks";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Remarks1";
            dc.Caption = "remarks1";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = d2.NewRow();
                DataRow dr = dt.Rows[i];
                string id = dr[3].ToString();

                row["Employee Name"] = dt.Rows[i]["cname"].ToString();
                row["Employee Email"] = dt.Rows[i]["cemail"].ToString();
                row["Company"] = dt.Rows[i]["firm_name"].ToString();
                row["Cycle"] = dt.Rows[i]["invoicecycle"].ToString();
                row["Rate"] = dt.Rows[i]["hourrate"].ToString();
                row["OT Rate"] = dt.Rows[i]["otrate"].ToString();
                row["Net Period"] = dt.Rows[i]["netperiod"].ToString();
                row["Start Date"] = dt.Rows[i]["startdate"].ToString();
                row["End Date"] = dt.Rows[i]["enddate"].ToString();
                row["Remarks"] = dt.Rows[i]["remarks"].ToString();
                row["Remarks1"] = dt.Rows[i]["remarks1"].ToString();

                d2.Rows.Add(row);
            }

            DataTable d3 = new DataTable();
            d3 = d2;

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Employee.xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;

            foreach (DataColumn dtcol in d3.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in d3.Rows)
            {
                str = "";
                for (int j = 0; j < d3.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
    }
}