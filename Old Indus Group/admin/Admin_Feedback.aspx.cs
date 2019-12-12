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
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Configuration;


public partial class Admin_Feedback : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd, cmddel;
    string strScript;
    string date = DateTime.Now.ToShortDateString();
    int testid, statusid;
    string UserId;
    string Script;
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

            BindReview();
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


    public void BindReview()
    {
        sqlConnection.Open();
        string Record_Count = string.Empty;
        string str = "Select  * from feedbackform order by id  desc";
        cmd = new SqlCommand(str, sqlConnection);
        DataSet dsreview = new DataSet();
        SqlDataAdapter ada = new SqlDataAdapter(str, sqlConnection);
        ada.Fill(dsreview);
        //dlReview.DataSource = dsreview;
        //dlReview.DataBind();
        PagedDataSource objPds = new PagedDataSource();
        if (!dsreview.Tables[0].Rows.Count.Equals(0))
        {
            objPds.DataSource = dsreview.Tables[0].DefaultView;
            objPds.AllowPaging = true;
            objPds.PageSize = 11;
            objPds.CurrentPageIndex = CurrentPage;
            lblCurrentPage.Text = "Page: " + (CurrentPage + 1).ToString() + " of " + objPds.PageCount.ToString();
            // Disable Prev or Next buttons if necessary
            cmdPrev.Enabled = !objPds.IsFirstPage;
            cmdNext.Enabled = !objPds.IsLastPage;
            dlReview.DataKeyField = "Id";
            dlReview.DataSource = objPds;
            dlReview.DataBind();
        }
        else
        {
            lblMessage.Text = "No records found";
            lblCurrentPage.Visible = false;
            cmdPrev.Visible = false;
            cmdNext.Visible = false;
        }

    }

    protected void cmdPrev_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        BindReview();
    }
    protected void cmdNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        BindReview();
    }
    public int CurrentPage
    {
        get
        {
            object o = this.ViewState["_CurrentPage"];
            if (o == null)
                return 0;
            else
                return (int)o;
        }
        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }

    protected void dlReview_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblstat = (Label)e.Item.FindControl("lblstatus");
        Label lblrname = (Label)e.Item.FindControl("lblname");
        Label lblreview = (Label)e.Item.FindControl("lblview");
        Label postdate = (Label)e.Item.FindControl("lbldate");
        Label nsays = (Label)e.Item.FindControl("says");
        //LinkButton lnkactivate = (LinkButton)e.Item.FindControl("lnkact");
        //LinkButton lnkdeactivate = (LinkButton)e.Item.FindControl("lnkdeact");


        //if (lblstat.Text != null)
        //{
        //    if (lblstat.Text == "2")
        //    {
        //        lblrname.ForeColor = Color.Silver;
        //        lblreview.ForeColor = Color.Silver;
        //        postdate.ForeColor = Color.Silver;
        //        nsays.ForeColor = Color.Silver;
        //        lnkactivate.Visible = true;
        //        lnkdeactivate.Visible = false;
        //    }
        //    else
        //    {
        //        lblrname.ForeColor = Color.Black;
        //        lblreview.ForeColor = Color.Black;
        //        postdate.ForeColor = Color.Gray;
        //        nsays.ForeColor = Color.Black;
        //        lnkactivate.Visible = false;
        //        lnkdeactivate.Visible = true;
        //    }
        //}       
    }
    //protected void activate_command(object sender, CommandEventArgs e)
    //{
    //    testid = Convert.ToInt32(e.CommandArgument.ToString());
    //    statusid = 1;
    //    changestatus(statusid, testid);
    //    Response.Redirect("Admin_Feedback.aspx");
    //}
    //protected void deactivate_command(object sender, CommandEventArgs e)
    //{
    //    testid = Convert.ToInt32(e.CommandArgument.ToString());
    //    statusid = 2;
    //    changestatus(statusid, testid);
    //    Response.Redirect("Admin_Feedback.aspx");
    //}
    //public void changestatus(int status, int id)
    //{
    //    sqlConnection.Open();
    //    SqlCommand cmdstatus = new SqlCommand("Feedback_actDeactive", sqlConnection);
    //    cmdstatus.CommandType = CommandType.StoredProcedure;
    //    cmdstatus.Parameters.AddWithValue("@status", status);
    //    cmdstatus.Parameters.AddWithValue("@id", id);
    //    cmdstatus.ExecuteNonQuery();
    //    sqlConnection.Close();
    //}
   
    protected void dlReview_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        //Get the Identity Primary DataKey value when user click delete button 
        int userid = Convert.ToInt32(dlReview.DataKeys[e.Item.ItemIndex]);
        SqlCommand cmd = new SqlCommand("delete from feedbackform where id=" + userid, sqlConnection);
        //sqlcmd = new SqlCommand("delete from emp where eno='" + eno + "'", sqlcon);
        sqlConnection.Open();
        //Execute query to perform delete operation on SQL Server
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
        //Bind new updated data on DataList control
        BindReview();
    }
}
