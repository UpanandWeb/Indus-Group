using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Admin_resumes : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int usid;
    string strscpt;
    public static string own = "";
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


            lblAcess.Text = Session["UserName"].ToString();
            Binddata();
         }
    }

    private void Binddata()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("select * from postresume where jobid = 0  order by id desc", con);
         da.Fill(ds);
         if (ds.Tables[0].Rows.Count > 0)
         {
             MyGrid.DataSource = ds; 
             MyGrid.DataBind();
         }
         else
         {
             strscpt = "alert('No Records Found');location.replace('Admin_resumes.aspx');";
             Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
         }
    }
    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id"));
             LinkButton lnkbtnfilename = (LinkButton)e.Row.FindControl("lnkbtnfilename");
            ImageButton imgclick = (ImageButton)e.Row.FindControl("imgbtndel");            
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
            //getting username from particular row           
            //identifying the control in gridview
            ImageButton imgclick = (ImageButton)e.Row.FindControl("imgbtndel"); 
            //raising javascript confirmationbox whenver user clicks on link button
            imgclick.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }   
    }
    protected void imgclick(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            usid = Convert.ToInt32(e.CommandArgument.ToString());
            string f1;
            con.Open();
            f1 = "delete from postresume where id= " + usid;
            SqlCommand comd = new SqlCommand(f1, con);
            int i = comd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                strscpt = "alert('Resume Deleted Successfully');location.replace('Admin_resumes.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete()");
            
    }
    protected void lnkbtnfilename(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            string basedir = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
            usid = Convert.ToInt32(e.CommandArgument.ToString());
            string f1;
            con.Open();
            f1 = "select * from postresume where id= " + usid;
            SqlCommand comd = new SqlCommand(f1, con);
            SqlDataReader dr = comd.ExecuteReader();

            string Fname = string.Empty;
            while (dr.Read())
            {            //string Fname = string.Empty;
                Fname = dr["resume"].ToString();
                if (Fname != "")
                {
                    System.IO.FileInfo file = new System.IO.FileInfo(basedir + "admin/Resumes/" + Fname);
                    //Response.Write(Server.MapPath("..\\"+Fname));
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
                        strscpt = "alert('File Does not Exist');location.replace('Admin_resumes.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete()");
    }  
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }

  
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        string s11 = Session["UserName"].ToString();

        if (s11 == "Recruiter")
        {
            // GridView1.Columns[6].Visible = false;
            MyGrid.Columns[5].Visible = false;

        }
        else
        {
            // GridView1.Columns[6].Visible = true;
            MyGrid.Columns[5].Visible = true;
        }
    }
}
