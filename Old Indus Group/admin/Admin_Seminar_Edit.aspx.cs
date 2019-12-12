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
public partial class admin_Admin_Seminar_Edit : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {

        string uid = string.Empty;
        DataSet ds = new DataSet();

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }

        uid = Request.QueryString["sid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);



            lblid.Text = uid;
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Seminars where sid=" + uid, sqlConnection);
            imgtext.Fill(ds, "Careers");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtjname.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
                txtjdesc.Text = ds.Tables[0].Rows[0]["CouserDes"].ToString();
                txtfaculity.Text = ds.Tables[0].Rows[0]["Sfacilityname"].ToString();
                txtdate.Text = ds.Tables[0].Rows[0]["SEDate"].ToString();

            }
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

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;
        string uid = string.Empty;
        uid = lblid.Text;
        //uid = Request.QueryString["id"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("update Seminars set CourseName=@uname,CouserDes=@jdesc,SeDate=@sedate,Sfacilityname=@Sfac,spdate=@postdate where sid=" + uid, connection);


        cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@Sfac", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@jdesc", SqlDbType.NVarChar, 2000));
        cmd.Parameters.Add(new SqlParameter("@sedate", SqlDbType.DateTime, 20));
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

        cmd.Parameters["@uname"].Value = Convert.ToString(txtjname.Text);
        cmd.Parameters["@jdesc"].Value = Convert.ToString(txtjdesc.Text);
        cmd.Parameters["@Sfac"].Value = Convert.ToString(txtfaculity.Text);
        cmd.Parameters["@postdate"].Value = System.DateTime.Now.ToString();
        cmd.Parameters["@sedate"].Value = Convert.ToString(txtdate.Text);

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();//Admin_Seminar.aspx
      //  Response.Redirect("Admin_Seminar.aspx?ret=edit");
        string str = "alert('Seminar has been Updated Successfully');location.replace('Admin_Seminar.aspx?ret=edit');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }


}
