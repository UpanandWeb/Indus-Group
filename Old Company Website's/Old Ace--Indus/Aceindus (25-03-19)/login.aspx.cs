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
     Binddata obj = new Binddata();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userid"] = txtusername.Text;
        Session["userpwd"] = txtpwd.Text;
        lblMessage.Visible = false;

        //Establish sql connection
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //open database connection to connect to sql server
        sqlConnection.Open();
        DataSet ds2 = obj.GetCurr_Openings();
        if (ds2.Tables[0].Rows.Count > 0)
        {
           // ddlcurop.DataSource = ds2.Tables[0];
           // ddlcurop.DataBind();
        }
        //close database connection to disconnect to sql server
        sqlConnection.Close();
    }
    /// <summary>
    /// summarise code to validate vendor login
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
    /// <summary>
    /// summarise code to validate client login
    /// </summary>
    /// <param name="userid">User email id</param>
    /// <param name="userpwd">User password</param>
    /// <returns></returns>
    public int Validate_ClientLogin(String userid, String userpwd)
    {
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmdselect = new SqlCommand();
        cmdselect.CommandType = CommandType.StoredProcedure;
        cmdselect.CommandText = "[dbo].[prregister]";
        cmdselect.Parameters.Add("@uname", SqlDbType.VarChar, 50).Value = userid;
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
    /// summarise code to validate vendor login
    /// </summary>
    /// <param name="userid">User Id</param>
    /// <param name="userpwd">Password</param>
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
    /// summarise code to enable selected item and other should be disable
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>    
    
    protected void ddllogin_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddllogin.SelectedItem.Value == "Employee")
        {
            pnlemployee.Visible = true;
            pnlvendor.Visible = false;
            pnlclient.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            //lblMessage.Visible = false;            

        }
        else if (ddllogin.SelectedItem.Value == "Client")
        {
            pnlclient.Visible = true;
            pnlemployee.Visible = false;
            pnlvendor.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            //lblMessage.Visible = false;            

        }
        else if (ddllogin.SelectedItem.Value == "Vendor")
        {
            pnlvendor.Visible = true;
            pnlclient.Visible = false; ;
            pnlemployee.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            //lblMessage.Visible = false;            

        }
    }
    /// <summary>
    /// summarise code for login button based on selected item among three categories
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //Initialise results if itis zero login is sucessfull if itis one it will redirect to Default page.
        int Results = 0;

        if (ddllogin.SelectedItem.Text == "Client" && txtusername.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_ClientLogin(txtusername.Text, txtpwd.Text);
            lblMessage.Text = "login sucessful";
            if (Results == 1)
            {
                Response.Redirect("Client-Details.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
            }
        }
        else if (ddllogin.SelectedItem.Text == "Vendor" && txtusername.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_VendrLogin(txtusername.Text, txtpwd.Text);

            if (Results == 1)
            {
                lblMessage.Text = "login sucessful";
                Response.Redirect("Vendor-Details.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
            }
        }
        else if (ddllogin.SelectedItem.Text == "Employee" && txtusername.Text != "" && txtpwd.Text != "")
        {
            Results = Validate_empLogin(txtusername.Text, txtpwd.Text);

            if (Results == 1)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Login is Good";

                SqlDataReader dr;
                //Establish sql connection
                string connection = ConfigurationManager.AppSettings["ConnectionString"];
                SqlConnection con = new SqlConnection(connection);
                string qry = "select status from employeereg1 where username='" + txtusername.Text + "'";

                //open database connection to connect to sql server
                con.Open();
                SqlCommand cmd = new SqlCommand(qry, con);
                dr = cmd.ExecuteReader();
                //close database connection to disconnect to sql server

                //Initialise status,if itis zero it will be login if itis one it will redirect to default page
                int Status = 0;
                while (dr.Read())
                {
                    Status = Convert.ToInt32(dr["status"]);
                }
                con.Close();



                if (Status == 1)
                {
                    Session["userid"] = txtusername.Text;
                    //   Response.Redirect("Employee_reg.aspx?email=" + txtusername.Text + "");
                    Response.Redirect("Employee-Details.aspx?email=" + txtusername.Text + "");

                }


                // anji modified on 14-12-2017
                //if (Status == 1)
                //{
                //    Response.Redirect("Default.aspx");
                //}
                //else
                //{
                //    Response.Redirect("Employee_reg.aspx?email=" + txtusername.Text + "");
                //}
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid Login"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
                strScript = "alert('Invalid Login.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }

        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Please make sure that the username and the password is Correct";

            strScript = "alert('Please make sure that the username and the password is Correct');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }

    }

    protected void cancelbtn_Click(object sender, EventArgs e)
    {
        ddllogin.SelectedIndex = -1;
        txtusername.Text = "";
        txtpwd.Text = "";
        pnlclient.Visible = false;
        pnlemployee.Visible = false;
        pnlvendor.Visible = false;
    }
}