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


public partial class Admin_Support : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd, cmddel;
    string strScript;
   string UserId;
    string Script;
    string Base_Dir = System.AppDomain.CurrentDomain.BaseDirectory;

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
        string str = "Select * from support";
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
            dlReview.DataKeyField = "sp_id";
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
    protected void dlReview_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        //Get the Identity Primary DataKey value when user click delete button 
        int userid = Convert.ToInt32(dlReview.DataKeys[e.Item.ItemIndex]);
        SqlCommand cmd = new SqlCommand("delete from support where sp_id=" + userid, sqlConnection);
        //sqlcmd = new SqlCommand("delete from emp where eno='" + eno + "'", sqlcon);
        sqlConnection.Open();
        //Execute query to perform delete operation on SQL Server
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
        //Bind new updated data on DataList control
        BindReview();
    }
    protected void filedownload(object sender, CommandEventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        DataListItem DlItem = lnkbtn.NamingContainer as DataListItem;
        string FID1 = dlReview.DataKeys[DlItem.ItemIndex].ToString();
        //FID = Convert.ToInt32(e.CommandArgument.ToString());
        SqlDataAdapter sdaupload = new SqlDataAdapter("select sp_id,sp_file from support where sp_id='" + FID1 + "'", sqlConnection);
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["sp_file"]);
            string filepath = "admin/Support/" + fileName;
            Response.ContentType = "image/jpg";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
            //Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
            Response.TransmitFile(Base_Dir + "Support/" + fileName);
            Response.End();
        }
        else
        {
        }
    }
}
