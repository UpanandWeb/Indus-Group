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


/// <summary>
/// summary description to continue the edit new employee form details
/// </summary>
public partial class admin_Admin_EmpNewFrmCreate1 : System.Web.UI.Page
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
    protected void btnedit2_Click(object sender, EventArgs e)
    {
        //string str = "select ID from EmpForm";
        //com = new SqlCommand(str, connection);
        //SqlDataReader dr;
        ////open database connection to connect to sql server
        //connection.Open();
        //dr = com.ExecuteReader();

        //while (dr.Read())
        //{
        //    uid = Convert.ToInt32(dr["ID"]);
        //    Session["ID"] = uid;
        //}
        ////close database connection to disconnect to sql server
        //connection.Close();

        uid = Convert.ToInt32(Request.QueryString["crid"]);

        com = new SqlCommand("empform2", connection);
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@eid", uid);
        com.Parameters.AddWithValue("@exdt_i94", i94exp.Text.ToString());
        com.Parameters.AddWithValue("@passno ", ppno.Text);
        com.Parameters.AddWithValue("@country_iss", ppcoun.Text);
        com.Parameters.AddWithValue("@dt_iss", passissue.Text.ToString());
        com.Parameters.AddWithValue("@dt_exp", passexpiry.Text.ToString());
        com.Parameters.AddWithValue("@vt1", visa1.Text);
        com.Parameters.AddWithValue("@dt_adm2 ", admm1.Text.ToString());
        com.Parameters.AddWithValue("@dt_dep1", depa1.Text.ToString());
        com.Parameters.AddWithValue("@vt2", visa2.Text);
        com.Parameters.AddWithValue("@dt_adm1", admm2.Text.ToString());
        com.Parameters.AddWithValue("@dt_dep2", depa2.Text.ToString());
        com.Parameters.AddWithValue("@vt3", visa3.Text);
        com.Parameters.AddWithValue("@dt_adm3 ", admm3.Text.ToString());
        com.Parameters.AddWithValue("@dt_dep3", depa3.Text.ToString());
        com.Parameters.AddWithValue("@usa_cons", usconsulate.Text);
        com.Parameters.AddWithValue("@addr_F", foreignaddr.Text);
        com.Parameters.AddWithValue("@h1bclass", h1b.Text);
        com.Parameters.AddWithValue("@nm1", name1.Text);
        com.Parameters.AddWithValue("@vtt1", vt1.Text);
        com.Parameters.AddWithValue("@i94no1", ino1.Text);
        com.Parameters.AddWithValue("@passno1", pass1.Text);
        com.Parameters.AddWithValue("@country_p1", cp1.Text);
        com.Parameters.AddWithValue("@nm2", name2.Text);
        com.Parameters.AddWithValue("@vtt2", vt2.Text);
        com.Parameters.AddWithValue("@i94no2", ino2.Text);
        com.Parameters.AddWithValue("@passno2", pass2.Text);
        com.Parameters.AddWithValue("@country_p2", cp2.Text);
        com.Parameters.AddWithValue("@nm3", name3.Text);
        com.Parameters.AddWithValue("@vtt3", vt3.Text);
        com.Parameters.AddWithValue("@i94no3 ", ino3.Text);
        com.Parameters.AddWithValue("@passno3 ", pass3.Text);
        com.Parameters.AddWithValue("@country_p3", cp3.Text);
        com.Parameters.AddWithValue("@nm4", name4.Text);
        com.Parameters.AddWithValue("@vtt4", vt4.Text);
        com.Parameters.AddWithValue("@i94no4", ino4.Text);
        com.Parameters.AddWithValue("@passno4", pass4.Text);
        com.Parameters.AddWithValue("@country_p4", cp4.Text);
        //open database connection to connect to sql server
        connection.Open();
        int i=com.ExecuteNonQuery();
        //close database connection to disconnect to sql server
        connection.Close();
        if (i == 1)
        {

            Response.Redirect("Admin_EmpNewFrmCreate2.aspx?crid1=" + uid);
        }

    }
}
