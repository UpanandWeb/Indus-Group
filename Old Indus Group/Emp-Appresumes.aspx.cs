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

public partial class Emp_Appresumes : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int usid;
    string strscpt;
    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            Binddata();
        }
    }
    /// <summary>
    /// resumes displayed from client site
    /// </summary>
    private void Binddata()
    {
        DataSet ds = new DataSet();
        //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Careers FULL OUTER JOIN postresume ON Careers.id=postresume.jobid where postresume.jobid>0", con);
        SqlDataAdapter da = new SqlDataAdapter("SELECT p.id as pid,p.name,p.email,p.resumepath,p.resume,p.phno,c.JobName,c.ID as cid FROM Careers c FULL OUTER JOIN postresume p ON c.id=p.jobid where p.jobid>0", con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
        else
        {
            strscpt = "alert('No Records Found');location.replace('Emp-Careers.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    /// <summary>
    /// download the resume
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkbtnfilename(object sender, CommandEventArgs e)
    {
            usid = Convert.ToInt32(e.CommandArgument.ToString());
            string f1;
            con.Open();
            f1 = "select * from postresume where id= " + usid;
            SqlCommand comd = new SqlCommand(f1, con);
            SqlDataReader dr = comd.ExecuteReader();
            string Fname = string.Empty;
            string Resume = string.Empty;
            while (dr.Read())
            {
                //string Fname = string.Empty;
                //Fname = dr["resumepath"].ToString();
                Fname = dr["resume"].ToString();
                //Resume = dr["resume"].ToString();
                if (Fname != "")
                {
                    string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                    //string strUploadFileName = "Resume/" + Resume;
                    // string strUploadFileName1 = "http://www.igiit.net//Resume/" + Resume;
                    System.IO.FileInfo file = new System.IO.FileInfo(Base_dir + "admin/Resumes/" + Fname);
                    //TemplateUpload.SaveAs(Base_dir + strUploadFileName);
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
                        strscpt = "alert('File Does not Exist');location.replace('Emp-Careers.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
        }
    }
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }
}