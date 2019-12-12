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

public partial class Usercontrols_clientmenu : System.Web.UI.UserControl
{
    DataTable xid = new DataTable();
    string client = string.Empty;
    string username = string.Empty;
    string lastlogin = string.Empty;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["usertype"] == "Recruiter" || Session["usertype"] == "Accounting" || Session["usertype"] == "HR" || Session["usertype"] == "Sales")
        {
            liusers.Visible = false;            
        }        

        if (Session["username"] != null)
        {
            xid = (DataTable)Session["UserPerm"];

            int x = xid.Columns.Count;
            string xx = xid.Rows[0][8].ToString();
            

            /* Company*/
            if (xid.Rows[0][8].ToString() == "1")
            {
                ulcompany.Visible = true;
            }
            else
                ulcompany.Visible = false;

            
            
            /* HR*/
            if (xid.Rows[0][15].ToString() == "1")
            {
                ulHr.Visible = true;
            }
            else
                ulHr.Visible = false;


            
            
            
            /* Sales*/
            if (xid.Rows[0][29].ToString() == "1")
            {
                ulsales.Visible = true;
            }
            else
                ulsales.Visible = false;

            
            
            
            /* Recruting*/
            if (xid.Rows[0][36].ToString() == "1")
            {
                ulrecruiting.Visible = true;
            }
            else
                ulrecruiting.Visible = false;

        }

    }
    protected void lnkbtnhome_Click(object sender, EventArgs e)
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

    [System.Web.Services.WebMethod()]
    public static void KillSession()
    {
        HttpContext.Current.Session.Abandon();
    }

    protected void lnkbtnlogout_Click(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();

            // To Update Last Login Time and Status into Client Users database
            //string statement = "update User_Permissions1 set Status=0, LastLogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where username='" + Session["username"] + "'";
            string statement = "update User_Permissions1 set LastLogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where username='" + Session["username"] + "'";
            SqlCommand cmd = new SqlCommand(statement, con);
            cmd.ExecuteNonQuery();
            con.Close();

            // Put user code to initialize the page here

            // To end the session
            Session.Abandon();
                          
                        
            
            // View the visitors Login //

            SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            
            // To Insert Last Login Time into database
            cn.Open();
            string visitors = "Insert login_visitors values('" + Session["clientid"] + "', '" + Session["username"] + "','" + Session["password"] + "','" + System.DateTime.Now.ToString() + "', '" + Session["IPaddr"] + "', '" + Session["uid"] + "')";
            SqlCommand cmd1 = new SqlCommand(visitors, cn);
            cmd1.ExecuteNonQuery();
            cn.Close();
            
            // Put user code to initialize the page here
            // To end the session
            Session.Abandon();




            //To make connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            //To open connection
            conn.Open();

            string stm = "select lastlogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0)";
            SqlDataAdapter da = new SqlDataAdapter(stm, conn);
            DataSet ds = new DataSet();

            //To fill the dataset
            da.Fill(ds);
            conn.Close();

            if (!ds.Tables[0].Rows[0].Equals(0))
            {
              lastlogin = ds.Tables[0].Rows[0]["lastlogin"].ToString();

            }

            
            
            
            
            // View the Log File //

            SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            // To Insert Last Login Time into database
            cnn.Open();
            string logfile = "update RCLogfile set Logouttime=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where id=(select top 1 id from RCLogfile where clientuserid='" + Session["uid"] + "' order by id desc)";
            SqlCommand cmd2 = new SqlCommand(logfile, cnn);
            cmd2.ExecuteNonQuery();
            cnn.Close();
            // Put user code to initialize the page here
            // To end the session
            Session.Abandon();

            Response.Redirect("Default.aspx");
            
        }
        else
        {
            // Update the LastLogin in ClientProfile//

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            // To Insert Last Login Time into database
            //string statement = "update clientprofile set status=1, LastLogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where usid='" + Session["usid"] + "'";
            string statement = "update clientprofile set LastLogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where usid='" + Session["usid"] + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(statement, con);
            cmd.ExecuteNonQuery();
            con.Close();
            // Put user code to initialize the page here
            // To end the session



            //To make connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            //To open connection
            conn.Open();

            string stm = "select lastlogin=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0)";
            SqlDataAdapter da = new SqlDataAdapter(stm, conn);
            DataSet ds = new DataSet();

            //To fill the dataset
            da.Fill(ds);
            conn.Close();

            if (!ds.Tables[0].Rows[0].Equals(0))
            {
                lastlogin = ds.Tables[0].Rows[0]["lastlogin"].ToString();

            }





            // View the Log File //

            SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            // To Insert Last Login Time into database
            cnn.Open();
            string logfile = "update RCLogfile set Logouttime=convert(varchar, DATEADD(mi,750,CONVERT(varchar, GETDATE(), 120)), 0) where id=(select top 1 id from RCLogfile where clientuserid='" + Session["id"] + "' order by id desc)";
            SqlCommand cmd2 = new SqlCommand(logfile, cnn);
            cmd2.ExecuteNonQuery();
            cnn.Close();
            // Put user code to initialize the page here
            // To end the session
            //Session.Abandon();

            Response.Redirect("Default.aspx");

        }
    }
}
