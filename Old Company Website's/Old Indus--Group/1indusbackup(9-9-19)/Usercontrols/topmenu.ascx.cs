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

public partial class Usercontrols_TopMenu : System.Web.UI.UserControl
{
    string connection = ConfigurationManager.AppSettings["ConnectionString"];

    string username = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["clientid"] != null)
        {
          // lbllastloginvalue.Text = System.DateTime.Now.ToString();
           
            tdlogin.Visible = true;
            ipadr.Visible = true;

            if (Session["usertype"] != "Client")
            {
                // Sub Users
                if (Session["FirstName"] == null && Session["LastName"] == null)
                {
                    lblloginvalue.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();
                }
                else
                {
                    lblloginvalue.Text = Session["FirstName"].ToString() + " " + Session["LastName"].ToString();
                }
                
            }
            else
            {
                // Client
                lblloginvalue.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();
            }

            lblcompcodevalue.Text = Session["clientid"].ToString();

            lblcountrycode.Text = Session["Country"].ToString();


            if (Session["IPaddr"] == "")
            {
                lblipaddrvalue.Text = "";
            }
            else
            {
                lblipaddrvalue.Text = Session["IPaddr"].ToString();
            }

            
            //To make connection
            SqlConnection cn = new SqlConnection(connection);

            //To open connection
            //cn.Open();

            //string stm = "select lastlogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0)";
            ////string stm = "select lastlogin=Convert.ToDateTime(date).ToString("dd-MMM-yyyy hh:mm tt")";
            //SqlDataAdapter da = new SqlDataAdapter(stm, cn);
            //DataSet ds = new DataSet();

            ////To fill the dataset
            //da.Fill(ds);
            //cn.Close();

            //if (!ds.Tables[0].Rows[0].Equals(0))
            //{
            //    lbllastloginvalue.Text = ds.Tables[0].Rows[0]["lastlogin"].ToString();

            //}


            ///
            //To get the last login time from clientprofile Table
            cn.Open();
            string Query = "";
            Query = "select * from clientprofile where clientid='" + Session["clientid"].ToString() + "' and id='" + Session["id"] + "'";
            SqlCommand cmd1 = new SqlCommand(Query, cn);
            SqlDataReader sqldr = cmd1.ExecuteReader();
            while (sqldr.Read())
            {
                lbllastloginvalue.Text = Convert.ToString(sqldr["LastLogin"]);
            }
            cn.Close();
            ///
            if (Session["username"] != null)
            {
                cn.Open();
                // To Insert Login IP into database
                string statement = "update User_Permissions1 set LoginIP='" + lblipaddrvalue.Text + "' where username='" + Session["username"] + "'";
                SqlCommand cmd = new SqlCommand(statement, cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                // Put user code to initialize the page here
                // To end the session
                
            }


            
        }
        
        else
        {
            ipadr.Visible = false;
            tdlogin.Visible = false;
         
        }        
        
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("clientuserhome.aspx");
        }
        else
        {
            Response.Redirect("clienthome.aspx");
        }
    }
}
