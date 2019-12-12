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
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userid"] = txtusername.Text;
        Session["userpwd"] = txtpwd.Text;
        lblMessage.Visible = false;
        if (!IsPostBack)
            pnlemployee.Visible = true;
        Hyperreg.Visible = true;
    }

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
                    // Response.Redirect("Employee_Newform.aspx?mail=" + user);
                    Response.Redirect("Emp_page1.aspx?mail=" + user);
                }
            }
            Results = Validate_empLogin(txtusername.Text, txtpwd.Text);
            if (Results == 1)
            {
                string x = GetUser_IP();
                if ((x == "1.22.125.2") || (x == "117.195.145.180") || (txtusername.Text == "rr@1indus.com") || (txtusername.Text == "padmaravi25@gmail.com"))//1. tikona broadband 2. bsnl broad band
                  {
                      lblMessage.Visible = true;
                      lblMessage.Text = "Login is Good";

                      SqlDataReader dr;
                      //Establish sql connection
                      string connection = ConfigurationManager.AppSettings["aceConnectionString"];
                      SqlConnection con = new SqlConnection(connection);
                      string qry = "select * from employeereg1 where username='" + txtusername.Text + "'";

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
                          Session["Country"] = Convert.ToString(dr["country1"]);
                          Session["EmpId"] = Convert.ToString(dr["empid"]);
                          Session["Designation"] = ddllogin.SelectedItem.Text;
                      }

                      con.Close();

                      if (Status == 1)
                      {
                          //Response.Redirect("Emp_Home.aspx?email=" + Session["userid"].ToString() + "&desig=" + ddllogin.SelectedItem.Text + "&cont=" + Session["Country"].ToString());
                          Response.Redirect("Emp_Home.aspx");

                      }
                      else if (Status == 2)
                      {
                          lblMessage.Text = "Your account is deactivated.Please contact to your admin to enable the account ";
                          //Response.Redirect("Employee_reg.aspx?email=" + Session["userid"].ToString() + "");
                      }
                      else if (Status == 0)
                      {
                          lblMessage.Text = "Your account is not activated.Please contact to your admin to enable the account ";
                      }
                  }
                  else
                  {
                      lblMessage.Visible = true;
                      lblMessage.Text = "No Permission to login outside company"; lblMessage.ForeColor = System.Drawing.Color.Red;//Dont Give too much information this might tell a hacker what is wrong in the login
                      script = "<script type=\"text/javascript\">alert('" + lblMessage.Text + "');</script> ";
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
            lblMessage.Visible = true;
            lblMessage.Text = "Please make sure that the username and the password is Correct";

            strScript = "alert('Please make sure that the username and the password is Correct');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }

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


    protected void ddllogin_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddllogin.SelectedItem.Value == "Employee")
        {
            pnlemployee.Visible = true;
            pnlvendor.Visible = false;
            pnlclient.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            Hyperreg.Visible = true;
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
            Hyperreg.Visible = false;
        }
        else if (ddllogin.SelectedItem.Value == "Vendor")
        {
            pnlvendor.Visible = true;
            pnlclient.Visible = false; ;
            pnlemployee.Visible = false;
            txtusername.Text = "";
            txtpwd.Text = "";
            //lblMessage.Visible = false;            
            Hyperreg.Visible = false;
        }
    }

    public int Validate_empLogin(String userid, String userpwd)
    {
        //Establish sql connection
        string Connection = ConfigurationManager.AppSettings["aceConnectionString"];
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

