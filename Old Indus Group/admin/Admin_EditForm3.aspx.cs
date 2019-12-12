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
public partial class admin_Admin_EditForm3 : System.Web.UI.Page
{
    //establish sql connection
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand com = null;
    string st;
    int id3;
    string eid;
    /// <summary>
    /// to perform action when page is loaded.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        id3 = Convert.ToInt32(Request.QueryString["vid"]);
        eid = Convert.ToString(Request.QueryString["val"]);
        //execute code without refreshing the page
        if (!IsPostBack)
        {
            //idi.Enabled = false;            
            idi.Text = Convert.ToString(eid);
            //open database connection to connect to sql server
            con.Open();
            st = "select * from EmpForm where comp_email='" + eid + "' and id=" + id3;
            com = new SqlCommand(st, con);
            SqlDataReader rdr = com.ExecuteReader();
            while (rdr.Read())
            {
                cousa.Text = rdr["ConNo"].ToString();
                cof.Text = rdr["ConNo1"].ToString();
                email.Text = rdr["emailid"].ToString();
                txtbenficiary.Text = rdr["benificiary"].ToString();
                txtbenficiary1.Text = rdr["benificiary"].ToString();
                txtbenficiary2.Text = rdr["benificiary"].ToString();

                txteac.Text = rdr["H1B_EAC"].ToString();
                try
                {
                    valid1.Text = Convert.ToDateTime(rdr["Valid_EAC"].ToString()).ToShortDateString();
                }
                catch
                {
                    valid1.Text = "";
                }
                textIeac.Text = rdr["I_EAC"].ToString();
                try
                {
                    valid2.Text =  Convert.ToDateTime(rdr["Valid_IEAC"].ToString()).ToShortDateString();
                }
                catch
                {
                   valid2.Text =  "";
                }                
                txtlca.Text = rdr["DOL_LCA"].ToString();
                try
                {
                    valid3.Text = Convert.ToDateTime(rdr["Valid_LCA"].ToString()).ToShortDateString();
                }
                catch
                {
                    valid3.Text = "";
                }                
                txtperm.Text = rdr["DOL_PERM"].ToString();
                try
                {
                    valid4.Text = Convert.ToDateTime(rdr["Valid_PERM"].ToString()).ToShortDateString();
                }
                catch
                {
                    valid4.Text = "";
                }                
                txtEad.Text = rdr["EAD"].ToString();
                try
                {
                    txtEadValid.Text = Convert.ToDateTime(rdr["Valid_EAD"].ToString()).ToShortDateString();
                }
                catch
                {
                    txtEadValid.Text = "";
                }                
                txtI485.Text = rdr["I_485_EAC"].ToString();
                try
                {
                    txtIValid.Text = Convert.ToDateTime(rdr["Valid_I485"].ToString()).ToShortDateString();
                }
                catch
                {
                    txtIValid.Text = "";
                } 
            }
            rdr.Close();
            //close database connection to disconnect to sql server
            con.Close();
        }

    }
    /// <summary>
    /// summary code for edit button 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnedit_Click(object sender, EventArgs e)
    {
        com = new SqlCommand("editemp_31", con);
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@id", id3);
        com.Parameters.AddWithValue("@comp_email", idi.Text);
        com.Parameters.AddWithValue("@ConNo", cousa.Text);
        com.Parameters.AddWithValue("@ConNo1", cof.Text);
        com.Parameters.AddWithValue("@emailid", email.Text);
        com.Parameters.AddWithValue("@benificiary", txtbenficiary.Text);
        com.Parameters.AddWithValue("@benificiary1", txtbenficiary1.Text);
        com.Parameters.AddWithValue("@benificiary2", txtbenficiary1.Text);

        com.Parameters.AddWithValue("@eac", txteac.Text);
        com.Parameters.AddWithValue("@valeac", valid1.Text);
        com.Parameters.AddWithValue("@ieac", textIeac.Text);
        com.Parameters.AddWithValue("@valieac", valid2.Text);
        com.Parameters.AddWithValue("@lca", txtlca.Text);
        com.Parameters.AddWithValue("@valac", valid3.Text);
        com.Parameters.AddWithValue("@perm", txtperm.Text);
        com.Parameters.AddWithValue("@valperm", valid4.Text);

        com.Parameters.AddWithValue("@ead", txtEad.Text);
        com.Parameters.AddWithValue("@valead", txtEadValid.Text);
        com.Parameters.AddWithValue("@ifour", txtI485.Text);
        com.Parameters.AddWithValue("@validifour", txtIValid.Text);

        //open database connection to connect to sql server
        con.Open();
        com.ExecuteNonQuery();
        //close database connection to disconnect to sql server
        con.Close();

        Response.Redirect("Admin_EmpNewForm.aspx?ret=edit");
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
