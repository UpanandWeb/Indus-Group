using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Vendor : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int statusid;
    public static string own = "";
    int usid;
    PagedDataSource pgd1 = new PagedDataSource();
    PagedDataSource pgd2 = new PagedDataSource();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            //own = Session["UserName"].ToString();
            //string x = GetUser_IP();   // local ip ::1
            //if ((x == "1.22.125.2") || (x == "98.175.101.254") || (own == "admin"))// US IP ADDRESS and india 1.22.125.2
            //{
                Binddata();
            //}
            //else
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No permission to out side company');location.replace('Admin_Home.aspx');", true);
            //}
        }
    }
    protected string GetUser_IP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        return VisitorsIPAddr;
    }

    private void Binddata()
    {
       // serletter.Visible = false;

        SqlDataAdapter da = new SqlDataAdapter("Select * from vendors order by firm_name asc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds, "vendors");

        if (ds.Tables[0].Rows.Count > 0)
        {
            //pgd1.DataSource = ds.Tables["vendors"].DefaultView;

            //pgd1.CurrentPageIndex = CurrentPage;
            //pgd1.AllowPaging = true;
            //pgd1.PageSize = 25;

            //lnknxt.Enabled = !(pgd1.IsLastPage);
            //lnkprev.Enabled = !(pgd1.IsFirstPage);
            //if (lnknxt.Enabled == true)
            //{
            //    lnknxt.Visible = true;
            //}
            //else
            //{
            //    lnknxt.Visible = false;
            //}

            //if (lnkprev.Enabled == false)
            //{
            //    lnkprev.Visible = false;
            //}
            //else
            //{
            //    lnkprev.Visible = true;
            //}
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
            ViewState["data"] = ds;
        }
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (ViewState["data"] == null)
        {
            MyGrid.PageIndex = e.NewPageIndex;
            LinkButton letter = sender as LinkButton;
            string id = Convert.ToString(Session["serch"]);
            bindtype(id);
        }
        else
        {
            MyGrid.PageIndex = e.NewPageIndex;
            Binddata();
        }
    }
   
    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
            e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");

            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "vid"));
            sqlConnection.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from vendors where vid=" + useriD, sqlConnection);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }

            sqlConnection.Close();

            string emptylbl = "";
            Label lblcp = (Label)e.Row.FindControl("lbl333");
            emptylbl = das.Tables[0].Rows[0]["name"].ToString();
            if (emptylbl == "")
            {
                lblcp.Text = "*****";
                lblcp.ForeColor = System.Drawing.Color.Red;
            }
            else 
            {
                lblcp.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl1 = "";
            Label lbldesig = (Label)e.Row.FindControl("lbl3333");
            emptylbl1 = das.Tables[0].Rows[0]["title"].ToString();
            if (emptylbl1 == "")
            {
                lbldesig.Text = "*****";
                lbldesig.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lbldesig.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl11 = "";
            Label lblemail = (Label)e.Row.FindControl("lbl33331");
            emptylbl11 = das.Tables[0].Rows[0]["venmail"].ToString();
            if (emptylbl11 == "")
            {
                lblemail.Text = "*****";
                lblemail.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblemail.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl111 = "";
            Label lblmob = (Label)e.Row.FindControl("lbl333m");
            emptylbl111 = das.Tables[0].Rows[0]["mobile"].ToString();
            if (emptylbl111 == "")
            {
                lblmob.Text = "*****";
                lblmob.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmob.ForeColor = System.Drawing.Color.Gray;
            }


            LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");

            if (statusid == 2)
            {
                lnkactivate.Text = "Deactive";
            }
            else if (statusid == 1)
            {
                lnkactivate.Text = "Active";
            }
            //else if (statusid == 0)
            //{
            //    lnkactivate.Text = "New";
            //}
        }
        own = Session["UserName"].ToString();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Hide the edit button when some condition is true
            // for example, the row contains a certain property
            if (own == "Recruiter")
            {
                ImageButton btnEdit = (ImageButton)e.Row.FindControl("imgbtndela");
                btnEdit.Visible = false;
                MyGrid.HeaderRow.Cells[7].Visible = false;
                MyGrid.Columns[7].ItemStyle.Width = 0;

                ImageButton btnEdit1 = (ImageButton)e.Row.FindControl("imgbtneditb");
                btnEdit1.Visible = false;
                MyGrid.HeaderRow.Cells[8].Visible = false;
                MyGrid.Columns[8].ItemStyle.Width = 0;
            }
        }

       
    }

    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("delete from vendors where vid=" + userid, sqlConnection);
            int result = cmd.ExecuteNonQuery();
            sqlConnection.Close();
            if (result == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Vendor Details has been deleted Successfully');location.replace('Admin_Vendors.aspx');", true);
            }
    }

    protected void lnkactivate(object sender, CommandEventArgs e)
    {
        own = ConfigurationManager.AppSettings["owner"].ToString();
        usid = Convert.ToInt32(e.CommandArgument.ToString());
        SqlDataAdapter ad = new SqlDataAdapter("select * from vendors where vid= " + usid + "", sqlConnection);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        statusid = Convert.ToInt32(ds.Tables[0].Rows[0]["status"].ToString());

        if (statusid == 0)
        {
            statusid = 1;
        }
        else if (statusid == 1)
        {
            statusid = 2;
        }
        else 
        {
            statusid = 1;
        }

        string date = System.DateTime.Now.ToString("dd/MM/yyyy");
        sqlConnection.Open();
        SqlCommand cmd = new SqlCommand("update vendors set status='" + statusid + "',apbdate='" + date + "' where vid=" + usid, sqlConnection);
        int result = cmd.ExecuteNonQuery();
        sqlConnection.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Vendor Status  Updated Successfully');location.replace('Admin_Vendors.aspx');", true);
        }
    }

    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        own = ConfigurationManager.AppSettings["owner"].ToString();
     //   if (lblAcess.Text == own)
       // {
            sqlConnection.Open();
            SqlDataAdapter cmd = new SqlDataAdapter("select * from vendors where vid=" + userid, sqlConnection);
            DataSet das = new DataSet();
            cmd.Fill(das);
          //  string emailid = das.Tables[0].Rows[0]["username"].ToString();

            if (das.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Admin_viewvendor.aspx?sid=" + userid);
            }
            sqlConnection.Close();
      //  }
    }

    protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        own = ConfigurationManager.AppSettings["owner"].ToString();
     //   if (lblAcess.Text == own)
     //   {
            sqlConnection.Open();
            SqlDataAdapter cmd = new SqlDataAdapter("select * from vendors where vid=" + userid, sqlConnection);
            DataSet das = new DataSet();
            cmd.Fill(das);
          //  string emailid = das.Tables[0].Rows[0]["username"].ToString();

            if (das.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Admin_Editvendor.aspx?sid=" + userid);
            }
            sqlConnection.Close();
      //  }
    }

    protected void filter(object sender, EventArgs e)
    {
        ViewState.Clear();
      //  letter1.Visible = false;
        //string  letter = (string)e.CommandArgument;
        LinkButton letter = sender as LinkButton;
        Session["serch"] = letter.Text;
        bindtype(letter.Text);
    }

    protected void bindtype(string id)
    {
        id = Convert.ToString(Session["serch"]);
         SqlDataAdapter da = new SqlDataAdapter("select * from vendors where Firm_Name LIKE '" +id+ "%'", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            //pgd2.DataSource = ds.Tables["Table"].DefaultView;
            //pgd2.CurrentPageIndex = CurrentPage1;
            //pgd2.AllowPaging = true;
            //pgd2.PageSize = 100;

            //lnknxt1.Enabled = !(pgd2.IsLastPage);
            //lnkprev1.Enabled = !(pgd2.IsFirstPage);
            //if (lnknxt1.Enabled == true)
            //{
            //    lnknxt1.Visible = true;
            //    serletter.Visible = true;
            //}
            //else
            //{
            //    lnknxt1.Visible = false;
            //}

            //if (lnkprev1.Enabled == false)
            //{
            //    lnkprev1.Visible = false;
            //}
            //else
            //{
            //    lnkprev1.Visible = true;
            //    serletter.Visible = true;

            //}
         
                MyGrid.DataSource = ds;
                MyGrid.DataBind();
                ViewState["type"] = ds;
        }
        
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No Vendor Found !!!');location.replace('Admin_Vendors.aspx');", true);
        }
    }


    protected void lbl1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ss")
        {
            string userid = e.CommandArgument.ToString();
            Response.Redirect("Admin_Editvendor.aspx?sid=" + userid);
        }
    }

    //protected void lnkprev_Click(object sender, EventArgs e)
    //{
       
    //        CurrentPage--;
    //        Binddata();
    //}

    //protected void lnknxt_Click(object sender, EventArgs e)
    //{
    //        CurrentPage++;
    //        Binddata();
    //}

    //public int CurrentPage
    //{
    //    get
    //    {
    //        if (ViewState["pg"] == null)
    //            return 0;
    //        else
    //            return Convert.ToInt16(ViewState["pg"]);
    //    }
    //    set
    //    {
    //        ViewState["pg"] = value;
    //    }
    //}

    //private void filter1()
    //{
    //  //  letter1.Visible = false;
    //    SqlDataAdapter da = new SqlDataAdapter("select * from vendors where Firm_Name LIKE '" + Session["serch"].ToString() + "%'", sqlConnection);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        pgd2.DataSource = ds.Tables["Table"].DefaultView;
    //        pgd2.CurrentPageIndex = CurrentPage1;
    //        pgd2.AllowPaging = true;
    //        pgd2.PageSize = 25;

    //        //lnknxt1.Enabled = !(pgd2.IsLastPage);
    //        //lnkprev1.Enabled = !(pgd2.IsFirstPage);
    //        //if (lnknxt1.Enabled == true)
    //        //{
    //        //    lnknxt1.Visible = true;
    //        //}
    //        //else
    //        //{
    //        //    lnknxt1.Visible = false;
    //        //}

    //        //if (lnkprev1.Enabled == false)
    //        //{
    //        //    lnkprev1.Visible = false;
    //        //}
    //        //else
    //        //{
    //        //    lnkprev1.Visible = true;
    //        //}
    //        MyGrid.DataSource = pgd2;
    //        MyGrid.DataBind();
    //    }
    //}

   
    //protected void lnkprev_Click1(object sender, EventArgs e)
    //{
    //    CurrentPage1--;
    //    filter1();
    //}

    //protected void lnknxt_Click1(object sender, EventArgs e)
    //{
    //    CurrentPage1++;
    //    filter1();
    //}
    public int CurrentPage1
    {
        get
        {
            if (ViewState["pgq"] == null)
                return 0;
            else
                return Convert.ToInt16(ViewState["pgq"]);
        }
        set
        {
            ViewState["pgq"] = value;
        }
    }

    protected void btnVendor_Click(object sender, EventArgs e)
    {
        if (txtsrchven.Text != "")
        {

            SqlDataAdapter ad = new SqlDataAdapter("select * from vendors where firm_name like '" + txtsrchven.Text + "%'", sqlConnection);
            DataSet ds = new DataSet();
            ad.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                MyGrid.Columns[6].Visible = false;
                MyGrid.DataSource = ds;
                MyGrid.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No Vendor Found !!!');location.replace('Admin_Vendors.aspx');", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Enter any name !!!');", true);
        }
    }
}
