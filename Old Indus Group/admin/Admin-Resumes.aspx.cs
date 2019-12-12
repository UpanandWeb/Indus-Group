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

public partial class admin_Admin_Resumes : System.Web.UI.Page
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
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            Binddata();
        }
    }

    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from CurrentResumes order by rid asc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds, "CurrentResumes");

        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "rid"));
            sqlConnection.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from CurrentResumes where rid=" + useriD, sqlConnection);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }
            sqlConnection.Close();
            LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");

            if (statusid == 2)
            {
                lnkactivate.Text = "Complete";
            }
            else if (statusid == 1)
            {
                lnkactivate.Text = "Process";
            }
            else if (statusid == 0)
            {
                lnkactivate.Text = "New";
            }
        }
    }

    //protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
    //    sqlConnection.Open();
    //    SqlCommand cmd = new SqlCommand("delete from CurrentResumes where rid=" + userid, sqlConnection);
    //    int result = cmd.ExecuteNonQuery();
    //    sqlConnection.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Details has been deleted Successfully');location.replace('Admin-Resumes.aspx');", true);
    //    }
    //}

    protected void lnkactivate(object sender, CommandEventArgs e)
    {
        usid = Convert.ToInt32(e.CommandArgument.ToString());
        SqlDataAdapter ad = new SqlDataAdapter("select * from CurrentResumes where rid= " + usid + "", sqlConnection);
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
        SqlCommand cmd = new SqlCommand("update CurrentResumes set status='" + statusid + "',fdate='" + date + "' where rid=" + usid, sqlConnection);
        int result = cmd.ExecuteNonQuery();
        sqlConnection.Close();
        if (result == 1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Status  Updated Successfully');location.replace('Admin-Resumes.aspx');", true);
        }
    }
    protected void lbl1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ss")
        {
            string userid = e.CommandArgument.ToString();
            Response.Redirect("Admin-ViewResume.aspx?sid=" + userid);
        }
    }

    protected void lnkDownload(object sender, CommandEventArgs e)
    {

        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string FID1 = MyGrid.DataKeys[gvrow.RowIndex].Value.ToString();
        string Query = "";
        Query = "select * from CurrentResumes where rid='" + FID1 + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, sqlConnection);
        sqlConnection.Open();
        SqlCommand cmd = new SqlCommand(Query, sqlConnection);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["Resumename"].ToString();
        }
        sqlConnection.Close();
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["Resumename"]);
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Current Resumes/" + Fname));
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File doesnot Exist');", true);
            }
        }
        else
        {
        }
    }
}