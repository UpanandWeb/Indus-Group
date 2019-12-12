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
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.Web.Configuration;

public partial class admin_Admin_IndEmployee : System.Web.UI.Page
{
    string Str;
    Int32 uid;
    int usid; int statusid;
    string joinDate;
    string Releave_Date;
    string ReleaveDate;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);

    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    string strscpt;
    string Base_Dir = System.AppDomain.CurrentDomain.BaseDirectory;
    int FID;
    int Emp_result;
    public static string own = "";
    DataSet dsadmin;
    string User_Result = string.Empty;

    exception err = new exception();
    static string excep_page = "Admin-IndEmployee.aspx";
    /// <summary>
    /// To perform action when page is loaded  and showing current employees data with paging
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Str = Convert.ToString(Session["str1"]);
        lblerror.Visible = false;
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

            lblAcess.Text = Session["UserName"].ToString();
            Binddata();
        }
    }

    /// <summary>
    /// retriving new employees data
    /// </summary>
    private void Bindnew()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select * from employeereg1 where Status=0 order by lastname Asc", con);
        da.Fill(ds, "employeereg1");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    /// <summary>
    /// retriving current employees data .
    /// </summary>
    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from employeereg1 where Status=1 order by lastname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "employeereg1");

        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }

    /// <summary>
    /// Retriving all records of present employees data
    /// </summary>
    private void Binddata12()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from employeereg1 where Status=1 order by lastname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "employeereg1");

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }

    /// <summary>
    /// Retriving Previous Employees Data
    /// </summary>
    private void BindDeactivatedata()
    {
        SqlDataAdapter daDeactivate = new SqlDataAdapter("Select * from employeereg1 where Status=2 order by lastname Asc", con);
        DataSet dsDeactivate = new DataSet();
        daDeactivate.Fill(dsDeactivate, "employeereg1");
        if (dsDeactivate.Tables[0].Rows.Count > 0)
        {
            MyGridDeactivate.DataSource = dsDeactivate;
            MyGridDeactivate.DataBind();
        }
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion


    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "userid"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from employeereg1 where userid=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }
            con.Close();
            LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
            LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
            LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
            Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");

            if (lblJoinDate.Text != "")
            {
                // lblJoinDate.Text = DateTime.Parse(lblJoinDate.Text).ToString("MM/dd/yyyy");
            }
            if (statusid == 2)
            {
                lnkactivate.Visible = false;
            }
            else if (statusid == 1)
            {
                lnkactivate.Visible = true;
            }
            else if (statusid == 0)
            {
                lnkactivate.Visible = true;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "userid"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    /// <summary>
    /// status showing all current employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGrid_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "userid"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from employeereg1 where userid=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }
            con.Close();
            LinkButton lnkactivate11 = (LinkButton)e.Row.FindControl("lnkactivate11");
            LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate11");
            LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            Label lblJoinDate11 = (Label)e.Row.FindControl("lblJoindate11");
            Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");

            if (lblJoinDate11.Text != "")
            {
                // lblJoinDate.Text = DateTime.Parse(lblJoinDate.Text).ToString("MM/dd/yyyy");
            }
            if (statusid == 2)
            {
                lnkactivate11.Visible = false;
            }
            else if (statusid == 1)
            {
                lnkactivate11.Visible = true;
            }
            else if (statusid == 0)
            {
                lnkactivate11.Visible = true;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "userid"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel11");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    public string MakeIntoSequence(int i, int total_length)
    {
        string output = i.ToString();
        while (output.Length < total_length)
            output = "0" + output;
        return output;
    }

    /// <summary>
    ///  status showing previous employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGridDeactivate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "userid"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from employeereg1 where userid=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }
            con.Close();
            LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
            LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
            LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
            Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");
            if (lblJoinDate.Text != "")
            {
                /// lblJoinDate.Text = DateTime.Parse(lblJoinDate.Text).ToString("MM/dd/yyyy");
            }

            if (lblReleavedate.Text != "")
            {
                //  lblReleavedate.Text = DateTime.Parse(lblReleavedate.Text).ToString("MM/dd/yyyy");
            }

            if (statusid == 2)
            {
                //  lnkactivate.Visible = false;
                // lnkdeactivate.Visible = true;
                //lnknotactivate.Visible = false;
            }
            else if (statusid == 1)
            {
                //   lnkactivate.Visible = true;
                //lnkdeactivate.Visible = false;
                //lnknotactivate.Visible = false;
            }
            else if (statusid == 0)
            {
                //   lnkactivate.Visible = true;
                //lnkdeactivate.Visible = true;
                //lnknotactivate.Visible = false;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "userid"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    /// <summary>
    /// summary code to download the resume file by clicking the link.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkDownload(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                lblerror.Visible = false;
                lblerror.Text = "";
                LinkButton lnkbtn = sender as LinkButton;
                GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
                string FID1 = MyGrid.DataKeys[gvrow.RowIndex].Value.ToString();
                string Query = "";
                Query = "select userid,filename1,rpath from employeereg1 where userid='" + FID1 + "'";
                SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
                con.Open();
                SqlCommand cmd = new SqlCommand(Query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                string Fname = "";
                while (dr.Read())
                {
                    Fname = dr["filename1"].ToString();
                }
                con.Close();
                DataSet dsupload = new DataSet();
                sdaupload.Fill(dsupload);
                if (!dsupload.Tables[0].Rows.Count.Equals(0))
                {
                    string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["filename1"]);
                    System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/Resumes/" + Fname));
                    if (file.Exists)
                    {
                        Response.Clear();
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                        Response.AddHeader("content-Length", file.Length.ToString());
                        Response.ContentType = "application/octet-stream";// 
                        Response.WriteFile(file.FullName);
                        Response.End();
                    }
                    else
                    {
                        lblerror.Visible = true;
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        lblerror.Text = "File doesnot Exist";
                    }
                }
                else
                {
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void lnkDownload2(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                lblerror.Visible = false;
                lblerror.Text = "";
                LinkButton lnkbtn = sender as LinkButton;
                GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
                string FID1 = MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString();
                string Query = "";
                Query = "select userid,filename1,rpath from employeereg1 where userid='" + FID1 + "'";
                SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
                con.Open();
                SqlCommand cmd = new SqlCommand(Query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                string Fname = "";
                while (dr.Read())
                {
                    Fname = dr["filename1"].ToString();
                }
                con.Close();
                DataSet dsupload = new DataSet();
                sdaupload.Fill(dsupload);
                if (!dsupload.Tables[0].Rows.Count.Equals(0))
                {
                    string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["filename1"]);
                    System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/Resumes/" + Fname));
                    if (file.Exists)
                    {
                        Response.Clear();
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                        Response.AddHeader("content-Length", file.Length.ToString());
                        Response.ContentType = "application/octet-stream";// 
                        Response.WriteFile(file.FullName);
                        Response.End();
                    }
                    else
                    {
                        lblerror.Visible = true;
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        lblerror.Text = "File doesnot Exist";
                    }
                }
                else
                {
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// previous employee resume download
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkDownload1(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                lblerror.Visible = false;
                lblerror.Text = "";

                LinkButton lnkbtn = sender as LinkButton;
                GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
                string FID1 = GridView2.DataKeys[gvrow.RowIndex].Value.ToString();
                string Query = "";
                Query = "select userid,filename1,rpath from employeereg1 where userid='" + FID1 + "'";
                SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
                con.Open();
                SqlCommand cmd = new SqlCommand(Query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                string Fname = "";
                while (dr.Read())
                {
                    Fname = dr["filename1"].ToString();
                }
                con.Close();
                DataSet dsupload = new DataSet();
                sdaupload.Fill(dsupload);
                if (!dsupload.Tables[0].Rows.Count.Equals(0))
                {
                    string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["filename1"]);
                    System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/Resumes/" + Fname));
                    if (file.Exists)
                    {
                        Response.Clear();
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                        Response.AddHeader("content-Length", file.Length.ToString());
                        Response.ContentType = "application/octet-stream";// 
                        Response.WriteFile(file.FullName);
                        Response.End();
                    }
                    else
                    {
                        lblerror.Visible = true;
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        lblerror.Text = "File doesnot Exist";
                    }
                }
                else
                {

                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    ///  current employee deletion
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empdelete"].ToString() == "1")
            {
                ImageButton imgbtndel = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
                //string username = gvrow.Cells[0].Text;
                own = ConfigurationManager.AppSettings["owner"].ToString();
                if (lblAcess.Text == own)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from employeereg1 where userid=" + userid, con);
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result == 1)
                    {
                        //Displaying alert message after successfully deletion of user
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Employee Details has been deleted Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                    }
                }
                else
                {

                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// previous employee deletion
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGridDeactivate_lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                ImageButton imgbtndel = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from employeereg1 where userid=" + userid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    //Displaying alert message after successfully deletion of user
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Employee Details has been deleted Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    ///  new employee deletion
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empdelete"].ToString() == "1")
            {
                ImageButton imgbtndel = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow1 = imgbtndel.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
                string NEmailid = Convert.ToString(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
                //   own = ConfigurationManager.AppSettings["owner"].ToString();
                //    if (lblAcess.Text == own)
                //   {
                //string username = gvrow.Cells[0].Text;
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from employeereg1 where userid=" + userid, con);
                Emp_result = cmd.ExecuteNonQuery();
                con.Close();
                if (Emp_result == 1)
                {
                    //Displaying alert message after successfully deletion of user             
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Employee Details has been deleted Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// view page for employee
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empview"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1 where userid=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                string emailid = das.Tables[0].Rows[0]["username"].ToString();

                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Admin_IndEmpView.aspx?userid=" + userid + "&emailid=" + emailid);
                }
                con.Close();
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void lnkviewrecord2(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empview"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1 where userid=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                string emailid = das.Tables[0].Rows[0]["username"].ToString();

                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Admin_IndEmpView.aspx?userid=" + userid + "&emailid=" + emailid);
                }
                con.Close();
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected DataSet Permission()
    {
        if (Session["uid"] != null)
        {
            string admin = "Select * from user_menu where mid='" + Session["xId"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, con1);
            dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            return dsadmin;
        }
        else
        {
            return null;
        }
    }

    protected void lnkeditrecord(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {

                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1 where userid=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                string emailid = das.Tables[0].Rows[0]["username"].ToString();

                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Admin_IndEmpEdit.aspx?userid=" + userid + "&emailid=" + emailid);
                }
                con.Close();
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// employee deactivation
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkactivate(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                statusid = 2;
                usid = Convert.ToInt32(e.CommandArgument.ToString());
                string date = System.DateTime.Now.ToString("dd/MM/yyyy");
                con.Open();
                SqlCommand cmd = new SqlCommand("update employeereg1 set status='" + statusid + "',releavedate='" + date + "' where userid=" + usid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    //Displaying alert message after successfully deletion of user
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Employee Status  Updated Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// file download by emplyee id
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkactivate1(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                usid = Convert.ToInt32(e.CommandArgument.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1  where userid=" + usid, con);
                DataSet ds = new DataSet();
                cmd.Fill(ds);

                StringWriter strwritter = new StringWriter();
                HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string name = ds.Tables[0].Rows[i]["firstname"].ToString() + " " + ds.Tables[0].Rows[i]["lastname"].ToString();
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ClearContent();
                    Response.ClearHeaders();
                    Response.Charset = "";
                    string FileName = "" + name + ".doc";

                    string Msg = "";
                    Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2' border='1' style='font-size:20px'>";

                    Msg = Msg + "<tr><td align='left'>Full Name (First & Last Name) :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + name.ToString() + "</td></br></tr>";


                    Msg = Msg + "<td align='left'>Father Name & Contact Number  : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["fathername"].ToString() + " & " + ds.Tables[0].Rows[i]["mobile"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Mother  Name & Contact Number : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["mothername"].ToString() + " & " + ds.Tables[0].Rows[i]["mobile"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>All Other Names Used (Include maiden name and names from marriage)  :<b></b></td>";
                    Msg = Msg + "<td align='left'></td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Present Address:(Street, City, State, Zip, Country) : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["street"].ToString() + ", " + ds.Tables[0].Rows[i]["city1"].ToString() + ", " + ds.Tables[0].Rows[i]["state1"].ToString() + ", " + ds.Tables[0].Rows[i]["zip"].ToString() + ", " + ds.Tables[0].Rows[i]["country1"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Permanent Address:(Street, City, State, Zip, Country) : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["street"].ToString() + ", " + ds.Tables[0].Rows[i]["city1"].ToString() + ", " + ds.Tables[0].Rows[i]["state1"].ToString() + ", " + ds.Tables[0].Rows[i]["zip"].ToString() + ", " + ds.Tables[0].Rows[i]["country1"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Birth Date (DD/MM/YYYY):  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["birthdate"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Marital Status / Gender :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["mstatus"].ToString() + " / " + ds.Tables[0].Rows[i]["gender"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Birth Place:(City/Town, State, Country) :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["birthcity"].ToString() + ", " + ds.Tables[0].Rows[i]["birthstate"].ToString() + ", " + ds.Tables[0].Rows[i]["birthcountry"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'> PAN Number: <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["pannumber"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'> AADHAAR Number: <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["aadharnumber"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'> Driver’s License Number :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["dlicencenumber"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Passport Number :   <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["passportno"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Contact Numbers at Work Location:  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["workphone"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'> Contact Numbers in Native Place :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["homephone"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Personnel Email ID for Communication :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["emailid"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Spouse or Family Member Email ID for Communication : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["cp1email"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Bank Account Name, Number & IFSC Code : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["bankacname"].ToString() + ", " + ds.Tables[0].Rows[i]["bankacnumber"].ToString() + " & " + ds.Tables[0].Rows[i]["bankifsc"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Bank Name & Address : <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["bankname"].ToString() + ", " + ds.Tables[0].Rows[i]["bankacaddress"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Emergency Contact Name, Relation & Numbers at Work Location :   <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["cp1phone"].ToString() + ", " + ds.Tables[0].Rows[i]["contactpersonname1"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Emergency Contact Name, Numbers & Relation in Family Member :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["cp2phone2"].ToString() + ", " + ds.Tables[0].Rows[i]["contactpersonname2"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Job Referral Name & Contact Number :  <b></b></td>";
                    Msg = Msg + "<td align='left'></td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Qualification :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["edu2"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Joining Date :  <b></b></td>";
                    Msg = Msg + "<td align='left'>" + ds.Tables[0].Rows[i]["joindate"].ToString() + "</td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Trainee / Full Time / Part Time :  <b></b></td>";
                    Msg = Msg + "<td align='left'></td></br></tr>";

                    Msg = Msg + "<tr><td align='left'>Title & Salary offered :  <b></b></td>";
                    Msg = Msg + "<td align='left'></td></br></tr>";

                    Msg = Msg + "</table>";


                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "application/msword";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                    Response.Write(Msg);

                    Response.Write(strwritter.ToString());
                    Response.End();
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    /// <summary>
    /// status activation
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkdeactivate(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                usid = Convert.ToInt32(e.CommandArgument.ToString());
                statusid = 1;
                string date = System.DateTime.Now.ToString("dd/MM/yyyy");
                con.Open();
                SqlCommand cmd = new SqlCommand("update employeereg1 set status='" + statusid + "',joindate='" + date + "' where userid=" + usid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('Employee Status  Updated Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private void bindEmp_joinDate(string p, int statusid, string joinDate, string Releave_Date)
    {
        con.Open();
        joinDate = System.DateTime.Now.ToString();
        Releave_Date = "NULL";
        statusid = 1;
        con.Close();
    }

    /// <summary>
    /// status showing to new registered employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "userid"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from employeereg1 where userid=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }
            con.Close();
            LinkButton lnkactivatenew = (LinkButton)e.Row.FindControl("lnkactivate");
            LinkButton lnknotactivatenew = (LinkButton)e.Row.FindControl("lnknotact");
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "userid"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    /// <summary>
    /// activation mail with employee id send to registered employee
    /// </summary>
    /// <param name="nmail"></param>
    /// <param name="npwd"></param>
    protected void lnkactivatenew(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                SqlDataAdapter sqlad1 = new SqlDataAdapter("select top 1  empid, * from employeereg1  where empid is not null order by userid desc", con);
                DataSet ds1 = new DataSet();
                sqlad1.Fill(ds1);
                string s = ds1.Tables[0].Rows[0]["empid"].ToString();
                string clean = Regex.Replace(s, "[^0-9 ]", "");
                int s1 = Convert.ToInt16(clean);
                s1 = s1 + 1;
                s = "IS" + Convert.ToString(s1);
                statusid = 2;
                usid = Convert.ToInt32(e.CommandArgument.ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("update employeereg1 set status='1',empid='" + s + "', joindate=getdate(),functionalarea='Employee' where userid=" + usid, con);
                cmd.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sqlad = new SqlDataAdapter("select * from employeereg1 where userid='" + usid + "'", con);
                DataSet ds = new DataSet();
                sqlad.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string nmail = ds.Tables[0].Rows[0]["username"].ToString();
                    string npwd = ds.Tables[0].Rows[0]["pwd"].ToString();


                    string form1 = "hr@1indus.com";
                    string Msg = "";
                    Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td align='center' valign='top'><font class='crentopenings'>*</font>&nbsp; Hi  </td>";
                    Msg = Msg + "<td height='20' valign='top'>";
                    Msg = Msg + "" + nmail + " </br> You Account Activated. Login with Your credential update your details in Profile Page";
                    Msg = Msg + "</td>";

                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td align='center' valign='top'><font class='crentopenings'>*</font>&nbsp; Email </td>";
                    Msg = Msg + "<td valign='top'><strong>:</strong></td>";
                    Msg = Msg + "<td height='20' valign='top'>";
                    Msg = Msg + "" + nmail + "";
                    Msg = Msg + "</td>";
                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td align='right' valign='top'><font class='crentopenings'>*</font>&nbsp;Password </td>";
                    Msg = Msg + "<td valign='top'><strong>:</strong></td>";
                    Msg = Msg + "<td height='20' valign='top'>";
                    Msg = Msg + "" + npwd + "";
                    Msg = Msg + "</td>";
                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td align='right' valign='top'>&nbsp;</td>";
                    Msg = Msg + "<td valign='top'>&nbsp;</td>";
                    Msg = Msg + "<td height='20' valign='top'>";
                    Msg = Msg + "" + "<a href='http://www.1indus.com/india/login.aspx'><b> Click Here to Login</b></a>" + "";
                    Msg = Msg + "</td>";
                    Msg = Msg + "</tr></table>";

                    string body = Msg;
                    string subject = "Your Account Activated";
                    SendMail1(form1, nmail, body, subject);
                    strscpt = "alert('Employee Activated and mail sent successfully');location.replace('Admin_IndEmployee.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    Bindnew();
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    public void SendMail1(string From, string To, string Body, string Subject)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");
        values.Add("from", From);
        values.Add("subject", Subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", To);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
    }


    /// <summary>
    /// showing present employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkbtncurrent_Click(object sender, EventArgs e)
    {
        trnew1.Visible = false;
        trnew2.Visible = false;
        trpre1.Visible = false;
        trpre2.Visible = false;
        trcurr1.Visible = true;
        trcurr2.Visible = true;
        MyGridDeactivate.Visible = false;
        GridView2.Visible = false;
        MyGrid.Visible = true;
    }

    /// <summary>
    /// showing previous employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkbtnpre_Click(object sender, EventArgs e)
    {
        trcurr1.Visible = false;
        trcurr2.Visible = false;
        trnew1.Visible = false;
        trnew2.Visible = false;
        trpre1.Visible = true;
        trpre2.Visible = true;
        MyGridDeactivate.Visible = true;
        GridView2.Visible = false;
        BindDeactivatedata();
    }

    /// <summary>
    /// showing new employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        trcurr1.Visible = false;
        trcurr2.Visible = false;
        trnew1.Visible = true;
        trnew2.Visible = true;
        trpre1.Visible = false;
        trpre2.Visible = false;
        MyGridDeactivate.Visible = false;
        GridView2.Visible = false;
        Bindnew();
    }

    /// <summary>
    /// paging for all present employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }

    /// <summary>
    /// paging for all present employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGrid_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        Binddata12();
        tr1.Visible = true;
    }

    /// <summary>
    /// Paging for new employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bindnew();
    }

    /// <summary>
    /// paging for previous employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGridDeactivate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGridDeactivate.PageIndex = e.NewPageIndex;
        BindDeactivatedata();
    }

    protected void imgus_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_Employee.aspx");
    }

    protected void imgind_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_IndEmployee.aspx");
    }

    /// <summary>
    /// Showing view of employee by id
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empview"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                //getting particular row linkbutton
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                //getting userid of particular row
                int userid = Convert.ToInt32(GridView2.DataKeys[gvrow.RowIndex].Value.ToString());
                //string username = gvrow.Cells[0].Text;
                own = ConfigurationManager.AppSettings["owner"].ToString();
                if (lblAcess.Text == own)
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1 where userid=" + userid, con);
                    DataSet das = new DataSet();
                    cmd.Fill(das);
                    string emailid = das.Tables[0].Rows[0]["username"].ToString();

                    if (das.Tables[0].Rows.Count > 0)
                    {
                        Response.Redirect("Admin_IndEmpView.aspx?userid=" + userid + "&emailid=" + emailid);
                    }
                    con.Close();
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    public static void PrintWebControl(Control ctrl)
    {
        PrintWebControl(ctrl, string.Empty);
    }

    public static void PrintWebControl(Control ctrl, string Script)
    {
        StringWriter stringWrite = new StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        if (ctrl is WebControl)
        {
            Unit w = new Unit(100, UnitType.Percentage); ((WebControl)ctrl).Width = w;
        }
        Page pg = new Page();
        pg.EnableEventValidation = false;
        if (Script != string.Empty)
        {
            pg.ClientScript.RegisterStartupScript(pg.GetType(), "PrintJavaScript", Script);
        }
        HtmlForm frm = new HtmlForm();
        pg.Controls.Add(frm);
        frm.Attributes.Add("runat", "server");
        frm.Controls.Add(ctrl);
        pg.DesignerInitialize();
        pg.RenderControl(htmlWrite);
        string strHTML = stringWrite.ToString();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(strHTML);
        HttpContext.Current.Response.Write("<script>window.print();</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    /// Showing all records of current employees
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkall_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from employeereg1 where Status=1 order by lastname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "employeereg1");

        if (ds.Tables[0].Rows.Count > 0)
        {
            trcurr2.Visible = false;
            trnew1.Visible = false;
            trnew2.Visible = false;
            trpre1.Visible = false;
            trpre2.Visible = false;

            tr1.Visible = true;
            GridView2.Visible = true;
            GridView2.DataSource = ds;
            GridView2.DataBind();

            MyGrid.Visible = false;
            MyGridDeactivate.Visible = false;
            GridView1.Visible = false;
        }
    }

    /// <summary>
    ///  Download all employee data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkreports_Click(object sender, EventArgs e)
    {
        dsadmin = Permission();

        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["empedit"].ToString() == "1")
            {
                SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1", con);
                DataSet ds = new DataSet();
                cmd.Fill(ds);

                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "allrecodrs.xls"));
                Response.ContentType = "application/ms-excel";
                string str = string.Empty;
                DataTable dt = ds.Tables[0];
                foreach (DataColumn dtcol in dt.Columns)
                {
                    Response.Write(str + dtcol.ColumnName);
                    str = "\t";
                }
                Response.Write("\n");
                foreach (DataRow dr in dt.Rows)
                {
                    str = "";
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        Response.Write(str + Convert.ToString(dr[j]));
                        str = "\t";
                    }
                    Response.Write("\n");
                }
                Response.End();
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}

