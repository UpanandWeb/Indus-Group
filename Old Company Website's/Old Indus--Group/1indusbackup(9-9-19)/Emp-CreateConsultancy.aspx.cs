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

public partial class Emp_CreateConsultancy : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
   
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string pdate = System.DateTime.Now.ToString();
        con.Open();
        string s = "insert into ig_counsaltancy (pdate,cname,firstname,lastname,disgnation,emailid,mobile,Current_Location,Visa_status,Discription) values ('" + pdate + "','" + CName.Text + "','" + txtFname.Text + "','" + txtLname.Text + "','" + txtDesg.Text + "','" + txtMail.Text + "','" + txtph.Text + "','" + txtLoc.Text + "','" + txtstatus.Text + "','" + txtRemark.Text + "') ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string strscpt = "alert ('Data Saved');location.replace('Emp-Consultancy.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp-Consultancy.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }

    }
}