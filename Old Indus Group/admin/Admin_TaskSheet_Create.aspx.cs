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

public partial class Admin_TaskSheet_Create : System.Web.UI.Page
{
    string usid = string.Empty;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();

    protected void Page_Load(object sender, EventArgs e)
    {
        usid = Request.QueryString["cid"].ToString();
        DataSet dst = new DataSet();

        dst = sdata.GetTaskSheetDetails(usid);

        TimeGrid.DataSource = dst;
        TimeGrid.DataBind();

        DataSet ds = new DataSet();


        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            ds = sdata.GetEmpDetails(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {

                empid.Text = ds.Tables[0].Rows[0]["userid"].ToString();
                ename.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                dname.Text = ds.Tables[0].Rows[0]["deptname"].ToString();
                sname.Text = ds.Tables[0].Rows[0]["supname"].ToString();
                pname.Text = ds.Tables[0].Rows[0]["projname"].ToString();
  
                //txtcname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                //dname.Text = ds.Tables[0].Rows[0]["deptname"].ToString();
                //sname.Text = ds.Tables[0].Rows[0]["supname"].ToString();
                //txtproj.Text = ds.Tables[0].Rows[0]["projname"].ToString();

            }
            csdate.Value = DateTime.Now.ToString();
        }

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
        string tnam = tname.Text.ToString();
        string sdt = csdate.Value.ToString();
        string whr = whrs.Text.ToString();
        string pnam = pname.Text.ToString();

        bool streg = sdata.AddTaskSheet(usid, whr, tnam, pnam, sdt);
        if(streg)
            Response.Redirect("Admin_TaskSheet_Create.aspx?cid=" + usid);
        }
        catch
        {
        }
    }
}
