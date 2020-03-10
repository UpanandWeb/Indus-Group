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
using System.Text;
/// <summary>
///  summarise code to change the password for employee
/// </summary>
public partial class Emp_change_pwd : System.Web.UI.Page
{
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userid"] = email.Text;
        Session["userpwd"] = oldpassword.Text;
    }
    /// <summary>
    ///  Shows a client-side JavaScript alert in the browser. 
    /// </summary>
    public static class Alert
    {

        /// <summary> 
        /// Shows a client-side JavaScript alert in the browser. 
        /// </summary> 
        /// <param name="message">The message to appear in the alert.</param> 
        public static void Show(string message)
        {
            // Cleans the message to allow single quotation marks 
            string cleanMessage = message.Replace("'", "\\'");
            string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');</script>";

            // Gets the executing web page 
            Page page = HttpContext.Current.CurrentHandler as Page;

            // Checks if the handler is a Page and that the script isn't allready on the Page 
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
            {
                page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert", script);
            }
        }
    }
    /// <summary>
    /// summarise code to validate login for employee
    /// </summary>
    /// <param name="Username"></param>
    /// <param name="Password"></param>
    /// <returns></returns>
    public int Validate_Login(String Username, String Password)
    {
        //establish sql connection
        SqlConnection con = new SqlConnection(@"Password=Aceindus9;Persist Security Info=True;User ID=aceindusdata;Initial Catalog=aceindusdata;Data Source=aceindusdata.db.8298063.hostedresource.com");
        SqlCommand cmdselect = new SqlCommand();
        cmdselect.CommandType = CommandType.StoredProcedure;
        cmdselect.CommandText = "[dbo].[prempregister]";
        cmdselect.Parameters.Add("@emailid", SqlDbType.VarChar, 50).Value = Username;
        cmdselect.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = Password;
        cmdselect.Parameters.Add("@OutRes", SqlDbType.Int, 4);
        cmdselect.Parameters["@OutRes"].Direction = ParameterDirection.Output;
        cmdselect.Connection = con;
        int Results = 0;
        
        try
        {
            //open database connection to connect to sql server
            con.Open();
            cmdselect.ExecuteNonQuery();
            Results = (int)cmdselect.Parameters["@OutRes"].Value;
        }
        catch (SqlException ex)
        {
            //to catch exception handled
            lblerror.Text = ex.Message;
        }
        finally
        {
            cmdselect.Dispose();
            if (con != null)
            {
                //close database connection to disconnect to sql server
                con.Close();
            }
        }
        return Results;

    }
    /// <summary>
    ///  summarise code to change password from old one to new password
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        int Results = 0;

        if (email.Text != "" && oldpassword.Text != "")
        {
            Results = Validate_Login(email.Text, oldpassword.Text);
            //lblmsg.Text = "you entered correct emailid and password";
        }
        else
        {
            lblmsg.Text = "Please make sure that the emailid and the password is Correct";
        }

        if (Results == 1)
        {
            
            if (newpassword.Text == confirmpassword.Text)
            {
                //establish sql connection
                SqlConnection conn = new SqlConnection(@"Password=Aceindus9;Persist Security Info=True;User ID=aceindusdata;Initial Catalog=aceindusdata;Data Source=aceindusdata.db.8298063.hostedresource.com;");
                string query = "update employeereg1 set pwd='" + newpassword.Text + "' WHERE [emailid]='" + email.Text + "'";
                //open database connection to connect to sql server
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                //close database connection to disconnect to sql server
                conn.Close();


                oldpassword.Text = string.Empty;
                lblerror.Text = "Your Password has been Changed";
                lblerror.ForeColor = System.Drawing.Color.Green;
            }

            else
            {
                lblerror.Text = "retry";
                lblerror.ForeColor = System.Drawing.Color.Red;
            }

            lblmsg.Visible = false;

            string strScript = "";
            strScript = "alert('Your Password has been Changed.');location.replace('Default.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        }
        else
        {
            lblerror.Visible = false;
            lblmsg.Text = "Please make sure that the emailid and the password is Correct";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            //Dont Give too much information this might tell a hacker what is wrong in the login
        }

    }

}

