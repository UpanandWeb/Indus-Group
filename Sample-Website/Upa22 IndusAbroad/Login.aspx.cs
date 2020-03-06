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

public partial class Login : System.Web.UI.Page
{
    string strScript = "";
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }


    /// <summary>
    /// checking valid user or not
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataAdapter sda = new SqlDataAdapter("select count( * ) as count from IA_Studentinfo where  emailid='" + txtusername.Text + "' and pwd='" + txtpwd.Text + "' and designation='"+dd.SelectedItem.Text+"'", sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows[0]["count"].ToString() == "1")
            {

                Session["userid"] = txtusername.Text;
                Session["userpwd"] = txtpwd.Text;
                Response.Redirect("Student-Info.aspx?email=" + txtusername.Text);
            }
            else
            {
                strScript = "alert('User Name or Password is incorrect')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            }
        }
        catch(Exception ex)
        {

        }
    }

    protected void cancelbtn_Click(object sender, EventArgs e)
    {
        txtusername.Text = "";
        txtpwd.Text = "";
    }
}