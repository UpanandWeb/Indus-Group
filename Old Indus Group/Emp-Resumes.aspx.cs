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

public partial class Emp_Resumes : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int statusid;
    public static string own = "";
    int usid;
    string emailid = string.Empty;

    PagedDataSource pgd1 = new PagedDataSource();
    PagedDataSource pgd2 = new PagedDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
            Binddata();
        }
    }

    private DataSet Permission(string emailid)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select uid from Users_Information where userid='" + emailid + "'", sqlConnection);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter("select * from user_menu where mid='" + ds.Tables[0].Rows[0]["uid"].ToString() + "'", sqlConnection);
            da1.Fill(ds1);

            return ds1;
        }
        else
            return null;
    }

    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from CurrentResumes order by rid asc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds, "CurrentResumes");

        //emailid = Session["userid"].ToString();
        //DataSet ds1 = Permission(emailid);

        //if (ds1.Tables[0].Rows[0]["Currentedit"].ToString() == "1")
        //{
           // MyGrid.Columns[13].Visible = true;
            if (ds.Tables[0].Rows.Count > 0)
            {
                MyGrid.DataSource = ds;
                MyGrid.DataBind();
            }
        //}
        //else
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have Permission');location.replace('Emp-Resumes.aspx');", true);
        //}
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        emailid = Session["userid"].ToString();
        DataSet ds1 = Permission(emailid);

        if (ds1.Tables[0].Rows[0]["Currentedit"].ToString() == "1")
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
        else
        {
             MyGrid.Columns[9].Visible = false;
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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Status  Updated Successfully');location.replace('Emp-Resumes.aspx');", true);
        }
    }
    protected void lbl1_Command(object sender, CommandEventArgs e)
    {
        emailid = Session["userid"].ToString();
        DataSet ds1 = Permission(emailid);

        if (ds1.Tables[0].Rows[0]["Currentview"].ToString() == "1")
        {
            if (e.CommandName == "ss")
            {
                string userid = e.CommandArgument.ToString();
                Response.Redirect("Emp-ViewResume.aspx?sid=" + userid);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have Permission');location.replace('Emp-Resumes.aspx');", true);
        }
    }

    protected void lnkDownload(object sender, CommandEventArgs e)
    {
        emailid = Session["userid"].ToString();
        DataSet ds1 = Permission(emailid);

        if (ds1.Tables[0].Rows[0]["Currentedit"].ToString() == "1")
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
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have Permission');location.replace('Emp-Resumes.aspx');", true);
        }
    }

    protected void lnkpost_Click(object sender, EventArgs e)
    {
        emailid = Session["userid"].ToString();
        DataSet ds1 = Permission(emailid);

        if (ds1.Tables[0].Rows[0]["Currentpost"].ToString() == "1")
        {
            Response.Redirect("Emp-NewResume.aspx");
        }
        else
        {
            lnkpost.Visible = false;
        }
    }
}