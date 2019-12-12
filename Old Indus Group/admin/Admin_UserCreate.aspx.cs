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

public partial class Admin_UserCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

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
        //int indx = course.SelectedIndex;
        //string indstr = course.SelectedItem.Value;
        //string indtxt = course.SelectedItem.Text;
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("insert into Users_Info (Username,UserId,Password,Add_Perm,Edit_Perm,Delete_Perm,pdate) VALUES (@uname,@userid,@pwd,@cadd,@cedit,@cdelete,@postdate);", connection);


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

        //cmd.Parameters["@cedit"].Value = Convert.ToString(cedit.Text);
        //cmd.Parameters["@cdelete"].Value = Convert.ToString(cdelete.Text);
        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();
        

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Admin_Users.aspx?ret=ok");
    }



}
