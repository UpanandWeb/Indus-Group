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
using System.Web.Configuration;
/// <summary>
/// summary description to edit the new employee form details
/// </summary>
public partial class admin_Admin_EmpNewForm_Edit : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand com = null;
    string st;
    int id;
    string C_email;
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        idi.Enabled = false;
       id = Convert.ToInt32(Request.QueryString["vid"]);
       
        //Execute code without refreshing the page.
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
            connection.Open();

            connection.Close();
            idi.Text = Convert.ToString(id);
            //open database connection to connect to sql server
            connection.Open();

            st = "select * from EmpForm where id=" + id;
            com = new SqlCommand(st, connection);
            SqlDataReader rdr = com.ExecuteReader();
            while (rdr.Read())
            {
                //idi.Text = rdr["id"].ToString();
                idi.Text = rdr["comp_email"].ToString();
                C_email = Convert.ToString(rdr["comp_email"].ToString());
                faname.Text = rdr["FamilyName"].ToString();
                fname.Text = rdr["FName"].ToString();
                mname.Text = rdr["MName"].ToString();
                othernames.Text = rdr["AName"].ToString();
                presaddr.Text = rdr["Presaddr"].ToString();
                permaddr.Text = rdr["Permaddr"].ToString();
                permaddr_f.Text = rdr["Permaddr_F"].ToString();
                dob.Text = rdr["DOB"].ToString();
                bplace.Text = rdr["BPlace"].ToString();
                ccitizen.Text = rdr["Country_citizen"].ToString();
                ssno.Text = rdr["SSNo"].ToString();
                arno.Text = rdr["ARegNo"].ToString();
                taxno.Text = rdr["DTaxIdNo"].ToString();
                nonimm.Text = rdr["Non_Imgr_Status"].ToString();
                usaddmission.Text = rdr["Rec_Date_Admn"].ToString();
                i94no.Text = rdr["I94No"].ToString();
            }
            //close database connection to disconnect to sql server.
            connection.Close();
        }


    }
    /// <summary>
    /// summary description to edit the employee form details.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
   
    protected void btnedit_Click1(object sender, EventArgs e)
    {
        com = new SqlCommand("editEmpForm", connection);
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id", id);
        com.Parameters.AddWithValue("@comp_email", idi.Text);
        com.Parameters.AddWithValue("@FamilyName", faname.Text);
        com.Parameters.AddWithValue("@FName", fname.Text);
        com.Parameters.AddWithValue("@MName", mname.Text);
        com.Parameters.AddWithValue("@AName", othernames.Text);
        com.Parameters.AddWithValue("@Presaddr", presaddr.Text);
        com.Parameters.AddWithValue("@Permaddr", permaddr.Text);
        com.Parameters.AddWithValue("@Permaddr_F", permaddr_f.Text);
        com.Parameters.AddWithValue("@DOB", dob.Text);
        com.Parameters.AddWithValue("@BPlace", bplace.Text);
        com.Parameters.AddWithValue("@Country_citizen", ccitizen.Text);
        com.Parameters.AddWithValue("@SSNo", ssno.Text);
        com.Parameters.AddWithValue("@ARegNo", arno.Text);
        com.Parameters.AddWithValue("@DTaxIdNo", taxno.Text);
        com.Parameters.AddWithValue("@Non_Imgr_Status", nonimm.Text);
        com.Parameters.AddWithValue("@Rec_Date_Admn", usaddmission.Text);
        com.Parameters.AddWithValue("@I94No", i94no.Text);
        //open database connection to connect to sql server
        connection.Open();
        com.ExecuteNonQuery();
        //close databse connection to disconnect to sql server
        connection.Close();
        Response.Redirect("Admin_EditForm2.aspx?value=" + idi.Text+ " &vid=" + id);
    }
}
