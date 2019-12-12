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

public partial class Admin_UserEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        string uid = string.Empty;
        DataSet ds = new DataSet();

        uid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Users_Info where id=" + uid, sqlConnection);
            imgtext.Fill(ds, "Users_Info");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                username.Text = ds.Tables[0].Rows[0]["Username"].ToString();
                userid.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
                passwd.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                cpasswd.Text = ds.Tables[0].Rows[0]["Password"].ToString();

                if (ds.Tables[0].Rows[0]["Add_Perm"].ToString() != "N")
                    cadd.Checked = true;
                else
                    cadd.Checked = false;

                if (ds.Tables[0].Rows[0]["Edit_Perm"].ToString() != "N")
                    cedit.Checked = true;
                else
                    cedit.Checked = false;

                if (ds.Tables[0].Rows[0]["Delete_Perm"].ToString() != "N")
                    cdelete.Checked = true;
                else
                    cdelete.Checked = false;
                               
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
        
        uid = Request.QueryString["cid"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("update Users_Info set Username=@uname,UserId=@userid,Password=@pwd,Add_Perm=@cadd,Edit_Perm=@cedit,Delete_Perm=@cdelete,pdate=@postdate where id=" + uid, connection);


        cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@userid", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cadd", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cedit", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cdelete", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));


        cmd.Parameters["@uname"].Value = Convert.ToString(username.Text);
        cmd.Parameters["@userid"].Value = Convert.ToString(userid.Text);
        cmd.Parameters["@pwd"].Value = Convert.ToString(passwd.Text);
        if (cadd.Checked == true)
            cmd.Parameters["@cadd"].Value = "Y";
        else
            cmd.Parameters["@cadd"].Value = "N";

        if (cedit.Checked == true)
            cmd.Parameters["@cedit"].Value = "Y";
        else
            cmd.Parameters["@cedit"].Value = "N";

        if (cdelete.Checked == true)
            cmd.Parameters["@cdelete"].Value = "Y";
        else
            cmd.Parameters["@cdelete"].Value = "N";

        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();
        
        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Admin_Users.aspx?ret=edit");
    }



}
