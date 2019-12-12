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

public partial class Admin_States_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string streg = string.Empty;
        string uid = string.Empty;

        uid = Request.QueryString["cid"].ToString();

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("delete from State_Master where intState_Id=" + uid, connection);

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Admin_States.aspx?ret=ok");

    }
}
