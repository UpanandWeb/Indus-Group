using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    string strScript = "";
    Binddata obj = new Binddata();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlConnection acesqlConnection = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);

    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (chksign.Checked == true)
        {
            Response.Cookies["UserId"].Value = txtusername.Text;
            Response.Cookies["password"].Value = txtpwd.Text;
            Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(15);
            Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
        }

        else
        {
            Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
        }

        Session["userid"] = txtusername.Text;
        Session["userpwd"] = txtpwd.Text;
        lblMessage.Visible = false;
        if (!IsPostBack)
            pnlemployee.Visible = true;
        Hyperreg.Visible = true;
    }

    protected string GetUser_IP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        return VisitorsIPAddr;

    }
    /// <summary>
    /// login with credentials
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnlogin_Click(object sender, ImageClickEventArgs e)
    {
        int Results = 0;
        string script = "";
        if (ddllogin.SelectedItem.Text == "Client" && txtusername.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_ClientLogin(txtusername.Text, txtpwd.Text);
            lblMessage.Text = "login sucessful";

            if (Results == 1)
            {
                Response.Redirect("Client_details.aspx");
            }
            else
            {
                lblMessage.Visible = true;

                lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
                script = "<script type=\"text/javascript\">alert('" + lblMessage.Text + "');</script> ";
            }
        }

        else if (ddllogin.SelectedItem.Text == "Vendor" && txtusername.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_VendrLogin(txtusername.Text, txtpwd.Text);

            if (Results == 1)
            {
                lblMessage.Text = "login sucessful";
                Response.Redirect("vendor_details.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
                script = "<script type=\"text/javascript\">alert('" + lblMessage.Text + "');</script> ";
            }
        }

        else if (ddllogin.SelectedItem.Text == "Employee" && txtusername.Text != "" && txtpwd.Text != "")
        {
            string ud = "";
            string x = GetUser_IP();   // local ip ::1
            if ((x == "1.22.125.2") || (x == "98.175.101.254") || (own == "admin") || (ud == "rr@1indus.com") || (x == "::1") || (x == "71.163.132.64") || (x == "71.114.25.168") || (x == "70.183.4.89") || (x == "103.211.39.52") || (ud == "admin123"))// US IP ADDRESS and india 1.22.125.2
            {
                string Email = "NULL";
                SqlDataAdapter sqlad = new SqlDataAdapter("select * from  employeereg1 where username='" + txtusername.Text + "' and pwd='" + txtpwd.Text + "' and status='1'", sqlConnection);
                DataSet ds = new DataSet();
                sqlad.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string mail = ds.Tables[0].Rows[0]["emailid"].ToString();
                    string user = ds.Tables[0].Rows[0]["username"].ToString();
                    if (mail == "" || mail == null || mail == "NULL")
                    {
                        Response.Redirect("Emp_page1.aspx?mail=" + user);
                    }
                }

                //Results = Validate_empLogin(txtusername.Text, txtpwd.Text);
                //if (Results == 1)
                //{
                lblMessage.Visible = true;
                lblMessage.Text = "Login is Good";

                SqlDataReader dr;
                string connection = ConfigurationManager.AppSettings["ConnectionString"];
                SqlConnection con = new SqlConnection(connection);
                DataSet ds2 = new DataSet();
                SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Users_Information where UserId=" + "'" + txtusername.Text + "'" + " and Password='" + txtpwd.Text + "' and Designation='" + ddllogin.SelectedItem.Text + "' and Country='" + ddcontry.SelectedItem.Text + "' ", sqlConnection);
                imgtext.Fill(ds2, "Users_Information");
                if (!ds2.Tables[0].Rows.Count.Equals(0))
                {
                    if (ds2.Tables[0].Rows[0]["Status"].ToString() == "1")
                    {
                        string username = ds2.Tables[0].Rows[0]["FName"].ToString();
                        string userid = ds2.Tables[0].Rows[0]["UserId"].ToString();
                        string uid = ds2.Tables[0].Rows[0]["uid"].ToString();
                        string email = ds2.Tables[0].Rows[0]["EmailId"].ToString();
                        string utype = ds2.Tables[0].Rows[0]["designation"].ToString();
                        string contry = ds2.Tables[0].Rows[0]["country"].ToString();

                        Session["Authentication"] = "true";
                        Session.Add("1username", username);
                        Session.Add("1userid", userid);
                        Session.Add("userid", userid);

                        Session.Add("1uid", uid);
                        Session.Add("1email", email);
                        Session.Add("utype", utype);
                        Session.Add("country", contry);
                        Session.Add("xId", uid);

                        if (chksign.Checked == true)
                        {
                            Response.Cookies["UserId"].Value = txtusername.Text;
                            Response.Cookies["password"].Value = txtpwd.Text;
                            Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                        }

                        else
                        {
                            Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                        }

                        Response.Redirect("Emp_Home.aspx");
                    }
                    else
                    {
                        strScript = "alert('You are deactivated');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
                    script = "<script type=\"text/javascript\">alert('" + lblMessage.Text + "');</script> ";
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No permission to out side company');location.replace('Login.aspx');", true);
            }

        }
        else
        {
            strScript = "alert('Please make sure that the username and the password is Correct');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
        //}
    }

    protected void ddllogin_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddllogin.SelectedItem.Value == "Employee")
        {
            pnlemployee.Visible = true;
            pnlvendor.Visible = false;
            pnlclient.Visible = false;
         //   txtusername.Text = "";
         //   txtpwd.Text = "";
            Hyperreg.Visible = true;
        }
        else if (ddllogin.SelectedItem.Value == "Client")
        {
            pnlclient.Visible = true;
            pnlemployee.Visible = false;
            pnlvendor.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            Hyperreg.Visible = false;
        }
        else if (ddllogin.SelectedItem.Value == "Vendor")
        {
            pnlvendor.Visible = true;
            pnlclient.Visible = false; ;
            pnlemployee.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            Hyperreg.Visible = false;
        }
    }
    /// <summary>
    ///  Validate employee Login
    /// </summary>
    /// <param name="userid"></param>
    /// <param name="userpwd"></param>
    /// <returns></returns>
    public int Validate_empLogin(String userid, String userpwd)
    {
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmdselect = new SqlCommand();
        cmdselect.CommandType = CommandType.StoredProcedure;
        cmdselect.CommandText = "[dbo].[prempregister]";
        cmdselect.Parameters.Add("@emailid", SqlDbType.VarChar, 50).Value = userid;
        cmdselect.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = userpwd;
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
            lblMessage.Text = ex.Message;
            lblMessage.Visible = true;
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
    /// Validate Client Login
    /// </summary>
    /// <param name="userid"></param>
    /// <param name="userpwd"></param>
    /// <returns></returns>
    public int Validate_ClientLogin(String userid, String userpwd)
    {
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmdselect = new SqlCommand();
        cmdselect.CommandType = CommandType.StoredProcedure;
        cmdselect.CommandText = "[dbo].[prregister]";
        cmdselect.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = userid;
        cmdselect.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = userpwd;
        cmdselect.Parameters.Add("@OutRes", SqlDbType.Int, 4);
        cmdselect.Parameters["@OutRes"].Direction = ParameterDirection.Output;
        cmdselect.Connection = con; int Results = 0;
        try
        {
            //open database connection to connect to sql server
            con.Open();
            cmdselect.ExecuteNonQuery();
            Results = (int)cmdselect.Parameters["@OutRes"].Value;
        }
        catch (SqlException ex)
        {
            lblMessage.Text = ex.Message;
            lblMessage.Visible = true;
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
    ///  Validate Vendr Login
    /// </summary>
    /// <param name="userid"></param>
    /// <param name="userpwd"></param>
    /// <returns></returns>
    public int Validate_VendrLogin(String userid, String userpwd)
    {
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmdselect = new SqlCommand();
        cmdselect.CommandType = CommandType.StoredProcedure;
        cmdselect.CommandText = "[dbo].[prvendregister]";
        cmdselect.Parameters.Add("@emailid", SqlDbType.VarChar, 50).Value = userid;
        cmdselect.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = userpwd;
        cmdselect.Parameters.Add("@OutRes", SqlDbType.Int, 4);
        cmdselect.Parameters["@OutRes"].Direction = ParameterDirection.Output;
        cmdselect.Connection = con; int Results = 0;
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
            lblMessage.Text = ex.Message;
            lblMessage.Visible = true;
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

}

