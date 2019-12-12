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
public partial class Admin_TimeSheet : System.Web.UI.Page
{
    string uid = string.Empty;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
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


            Method();
        }
    }

    private void Method()
    {
        ds = GetEmpData();
        empdata.DataSource = ds;
        empdata.DataBind();
    }

    public DataSet GetEmpData()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from timesheet order by userid asc", connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        connection.Close();
        return ds;
    }

    protected string AddUrl(int ID)
    {
        if (ID < 0)
            throw new ArgumentOutOfRangeException("id");
        else
            return "Admin_TS_Emp_Add.aspx?cid=" + ID;
    }


    //protected string AddTimeUrl(int ID)
    //{
    //    if (ID < 0)
    //        throw new ArgumentOutOfRangeException("id");
    //    else
    //        return "Admin_TimeSheet_Create.aspx?cid=" + ID;
    //}

    protected void click_newpage(object sender, EventArgs e)
    {
        string id = Convert.ToString(Session["xid"]);
        Response.Redirect("Admin_TimeSheet_Create.aspx?cid=" + id);
      //  Response.Redirect("Admin_TimeSheet_Create.aspx");

    }

    protected string AddTaskUrl(int ID)
    {
        if (ID < 0)
            throw new ArgumentOutOfRangeException("id");
        else
            return "Admin_TaskSheet_Create.aspx?cid=" + ID;
    }

    //protected string EditTimeUrl(int ID)
    //{
    //    if (ID < 0)
    //        throw new ArgumentOutOfRangeException("id");
    //    else
    //        return "TimeSheet_Details.aspx?cid=" + ID;
    //}


    protected string EditTimeUrl(int ID)
    {
        if (ID < 0)
            throw new ArgumentOutOfRangeException("id");
        else
            return "TimeSheet_Details.aspx?cid=" + ID;
    }

    protected string EditTaskUrl(int ID)
    {
        if (ID < 0)
            throw new ArgumentOutOfRangeException("id");
        else
            return "Admin_TaskSheet_View.aspx?cid=" + ID;
    }


    //protected string DeleteUrl(int ID)
    //{
    //    if (ID < 0)
    //        throw new ArgumentOutOfRangeException("id");
    //    else
    //        return "Admin_EmpDelete.aspx?cid=" + ID;
    //}
    //protected void lnkdelrecord(object sender, EventArgs e)
    //{
    //    LinkButton btndel = sender as LinkButton;
    //    //getting particular row linkbutton
    //    GridViewRow gvrow = btndel.NamingContainer as GridViewRow;
    //    //getting userid of particular row
    //    string userid = Convert.ToString(empdata.DataKeys[gvrow.RowIndex].Value.ToString());
    //    //string username = gvrow.Cells[0].Text;
    //    //con.Open();
    //    //SqlCommand cmd = new SqlCommand("delete from employeereg1 where userid=" + userid, con);
    //    //int result = cmd.ExecuteNonQuery();
    //    //con.Close();
    //    bool result = delts1(userid);
    //    if (result == true)
    //    {
    //        Binddata();
    //        //Displaying alert message after successfully deletion of user
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Employee details deleted successfully')", true);
    //    }
    //}

    private void Binddata()
    {
        
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        string qry = "select * from employeereg1 order by firstname asc";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count >0)
           
        {
            empdata.DataSource = ds;
            empdata.DataBind();
        }
        else
        {
            tdcontent.InnerHtml = "No Records Found";
            empdata.Visible = false;
        }

    }
    public bool delts1(string uid)
    {
        string str = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        try
        {
            string qry = "delete from employeereg1 where userid=" + uid;
            SqlCommand cmd = new SqlCommand(qry, connection);
            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;

    }


    //protected void empdata_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        //getting username from particular row
    //        string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "userid"));
    //        //identifying the control in gridview
    //        LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
    //        //raising javascript confirmationbox whenver user clicks on link button
    //        lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
    //    }
    //}

    protected void empdata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        empdata.PageIndex = e.NewPageIndex;
        Method();
    }
}
