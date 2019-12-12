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
using igiit.BussinessLogic;

public partial class admin_Admin_EmpNewFrmCreate2 : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand com = null;
    Int32 uid;

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }
    }
        /// <summary>
    /// summary description to edit the new employee form details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnedit_Click(object sender, EventArgs e)
    {
    //    string str = "select ID from EmpForm";
    //    com = new SqlCommand(str, connection);
    //    SqlDataReader dr;
    //    //open database connection to connect to sql server
    //    connection.Open();
    //    dr = com.ExecuteReader();

    //    while (dr.Read())
    //    {
    //        uid = Convert.ToInt32(dr["ID"]);
    //        Session["ID"] = uid;
    //    }
    //    //close database connection to disconnect to sql server
    //    connection.Close();

        uid = Convert.ToInt32(Request.QueryString["crid1"]);

        com = new SqlCommand("empform3", connection);
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@eid", uid);
        com.Parameters.AddWithValue("@conno ", cousa.Text);
        com.Parameters.AddWithValue("@conno1 ", cof.Text);
        com.Parameters.AddWithValue("@emailid ", email.Text);
        //com.Parameters.AddWithValue("@benificiary ", txtbenficiary.Text);
        //com.Parameters.AddWithValue("@benificiary1 ", txtbenficiary1.Text);
        //com.Parameters.AddWithValue("@benificiary2 ", txtbenficiary2.Text);
        com.Parameters.AddWithValue("@pdt", DateTime.Now.ToString());
        //open database connection to connect to sql server
        connection.Open();
        com.ExecuteNonQuery();
        //close database connection to disconnect to sql server
        connection.Close();

        Response.Redirect("Admin_EmpNewForm.aspx?ret=create");
    }
    // Benificiary 1
    protected void rbtnyes_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary.Visible = true;
        rbtnno.Checked = false;
    }
    protected void rbtnno_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary.Visible = false;
        rbtnyes.Checked = false;
    }

    // Benificiary 2
    protected void rbtnyes1_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary1.Visible = true;
        rbtnno1.Checked = false;
    }
    protected void rbtnno1_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary1.Visible = false;
        rbtnyes1.Checked = false;
    }

    // Benificiary 3
    protected void rbtnyes2_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary2.Visible = true;
        rbtnno2.Checked = false;
    }
    protected void rbtnno2_CheckedChanged(object sender, EventArgs e)
    {
        txtbenficiary2.Visible = false;
        rbtnyes2.Checked = false;
    }

    
}
