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

/// <summary>
/// Summary description to edit the H1B form details of employee.
/// </summary>
public partial class admin_Admin_EditForm2 : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]); string st;
    SqlCommand com = null;
    int id;
    string id2;
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
        //idi.Enabled = false;
        id2 = Convert.ToString(Request.QueryString["value"]);
        id = Convert.ToInt32(Request.QueryString["vid"]);

        //Execute code without refreshing the page.
        if (!IsPostBack)
        {
            idi.Text = Convert.ToString(id2);
            //Open database connection to connect to sql server
            con.Open();
            st = "select * from EmpForm where comp_email='" + id2 + "' and id=" + id;
            com = new SqlCommand(st, con);
            SqlDataReader rdr = com.ExecuteReader();
            while (rdr.Read())
            {
                idi.Text = rdr["comp_email"].ToString();
                i94exp.Text = rdr["expdt_I94"].ToString();
                ppno.Text = rdr["passportno"].ToString();
                ppcoun.Text = rdr["country_issue"].ToString();
                passissue.Text = rdr["date_issue"].ToString();
                passexpiry.Text = rdr["date_exp"].ToString();
                visa1.Text = rdr["visatype1"].ToString();
                admm1.Text = rdr["date_adm1"].ToString();
                depa1.Text = rdr["date_depa1"].ToString();
                visa2.Text = rdr["visatype2"].ToString();
                admm2.Text = rdr["date_adm2"].ToString();
                depa2.Text = rdr["date_depa2"].ToString();
                visa3.Text = rdr["visatype3"].ToString();
                admm3.Text = rdr["date_adm3"].ToString();
                depa3.Text = rdr["date_depa3"].ToString();
                usconsulate.Text = rdr["usa_consulate"].ToString();

                foreignaddr.Text = rdr["Addr_Foriegn"].ToString();
                h1b.Text = rdr["h1bclass"].ToString();
                name1.Text = rdr["name1"].ToString();
                vt1.Text = rdr["visa_type1"].ToString();
                ino1.Text = rdr["I_94No1"].ToString();
                pass1.Text = rdr["passno1"].ToString();
                cp1.Text = rdr["country_pass1"].ToString();
                name2.Text = rdr["name2"].ToString();
                vt2.Text = rdr["visa_type2"].ToString();
                ino2.Text = rdr["I_94No2"].ToString();
                pass2.Text = rdr["passno2"].ToString();
                cp2.Text = rdr["country_pass2"].ToString();
                name3.Text = rdr["name3"].ToString();
                vt3.Text = rdr["visa_type3"].ToString();
                ino3.Text = rdr["I_94No3"].ToString();
                pass3.Text = rdr["passno3"].ToString();
                cp3.Text = rdr["country_pass3"].ToString();
                name4.Text = rdr["name4"].ToString();
                vt4.Text = rdr["visa_type4"].ToString();
                ino4.Text = rdr["I_94No4"].ToString();
                pass4.Text = rdr["passno4"].ToString();
                cp4.Text = rdr["country_pass4"].ToString();
            }
            rdr.Close();
            //close database connection to disconnect to sql server
            con.Close();

        }
    }
    /// <summary>
    /// summary code for edit button to edit the H1B form employee details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnedit2_Click(object sender, EventArgs e)
    {

        com = new SqlCommand("editEmpForm_2nd", con);
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id", id);
        com.Parameters.AddWithValue("@comp_email", idi.Text);
        com.Parameters.AddWithValue("@expdt_I94", i94exp.Text);
        com.Parameters.AddWithValue("@passportno", ppno.Text);
        com.Parameters.AddWithValue("@country_issue", ppcoun.Text);
        com.Parameters.AddWithValue("@date_issue", passissue.Text);
        com.Parameters.AddWithValue("@date_exp", passexpiry.Text);
        com.Parameters.AddWithValue("@visatype1", visa1.Text);
        com.Parameters.AddWithValue("@date_adm1", admm1.Text);
        com.Parameters.AddWithValue("@date_depa1", depa1.Text);
        com.Parameters.AddWithValue("@visatype2", visa2.Text);
        com.Parameters.AddWithValue("@date_adm2", admm2.Text);
        com.Parameters.AddWithValue("@date_depa2", depa2.Text);
        com.Parameters.AddWithValue("@visatype3", visa3.Text);
        com.Parameters.AddWithValue("@date_adm3", admm3.Text);
        com.Parameters.AddWithValue("@date_depa3", depa3.Text);
        com.Parameters.AddWithValue("@usa_consulate", usconsulate.Text);
        com.Parameters.AddWithValue("@Addr_Foriegn", foreignaddr.Text);
        com.Parameters.AddWithValue("@h1bclass", h1b.Text);
        com.Parameters.AddWithValue("@name1", name1.Text);
        com.Parameters.AddWithValue("@visa_type1", vt1.Text);
        com.Parameters.AddWithValue("@I_94No1", ino1.Text);
        com.Parameters.AddWithValue("@passno1", pass1.Text);
        com.Parameters.AddWithValue("@country_pass1", cp1.Text);
        com.Parameters.AddWithValue("@name2", name2.Text);
        com.Parameters.AddWithValue("@visa_type2", vt2.Text);
        com.Parameters.AddWithValue("@I_94No2", ino2.Text);
        com.Parameters.AddWithValue("@passno2", pass2.Text);
        com.Parameters.AddWithValue("@country_pass2", cp2.Text);
        com.Parameters.AddWithValue("@name3", name3.Text);
        com.Parameters.AddWithValue("@visa_type3", vt3.Text);
        com.Parameters.AddWithValue("@I_94No3", ino3.Text);
        com.Parameters.AddWithValue("@passno3", pass3.Text);
        com.Parameters.AddWithValue("@country_pass3", cp3.Text);
        com.Parameters.AddWithValue("@name4", name4.Text);
        com.Parameters.AddWithValue("@visa_type4", vt4.Text);
        com.Parameters.AddWithValue("@I_94No4", ino4.Text);
        com.Parameters.AddWithValue("@passno4", pass4.Text);
        com.Parameters.AddWithValue("@country_pass4", cp4.Text);
        //open database connection to connect to sql server
        con.Open();
        com.ExecuteNonQuery();
        //close database connection to disconnect to sql server
        con.Close();
        Response.Redirect("Admin_EditForm3.aspx?val=" + idi.Text + " &vid=" + id);



    }
}
