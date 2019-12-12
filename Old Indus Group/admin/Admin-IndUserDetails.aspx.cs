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


public partial class admin_Admin_IndUserDetails : System.Web.UI.Page
{
    string uid = string.Empty;
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
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

            GetEmpData();


        }
    }
    public void GetEmpData()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select userid, empid,emailid,mobile,street,bankswift,joindate,rdate,hrate,ratesymbol,bankacnumber,firstname +' '+ lastname as empname, bankname from employeereg1 where status=1 order by userid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        gv.DataSource = ds;
        gv.DataBind();
    }

    protected void empdata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        GetEmpData();
    }

    protected void imgbtnedit1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(gv.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from employeereg1 where userid=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        string did = das.Tables[0].Rows[0]["userid"].ToString();

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-IndCreate-User.aspx?userid=" + did);
        }
        con.Close();
    }
    protected void imgbtndel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(gv.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from employeereg1 where userid=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('User Details has been deleted Successfully');location.replace('Admin-IndUserDetails.aspx');", true);
        }
    }
}