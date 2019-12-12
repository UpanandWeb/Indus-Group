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
using System.Data.SqlClient;

public partial class Unsubscribe : System.Web.UI.Page
{
    string str = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        string streg = string.Empty;
        string email = string.Empty;
        DataSet ds = new DataSet();

        str = Request.QueryString["eid"].ToString();
        if (str != string.Empty)
        {

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_newsmails where id=" + str, sqlConnection);
            imgtext.Fill(ds, "wt_newsmails");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                email = "" + ds.Tables[0].Rows[0]["emailid"].ToString();
            }

            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("delete from wt_newsmails where id=" + str, sqlConnection);
            streg = cmd.ExecuteNonQuery().ToString();

            SqlCommand cmdins = new SqlCommand("insert into wt_Unsubscribe_mails (emailid,pdate) VALUES(@aemail,@postdate)", sqlConnection);

            cmdins.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmdins.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

            cmdins.Parameters["@aemail"].Value = email;
            cmdins.Parameters["@postdate"].Value = DateTime.Now.ToString();


            streg = cmdins.ExecuteNonQuery().ToString();
            sqlConnection.Close();
            Response.Redirect("newsletter.aspx");
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
}
