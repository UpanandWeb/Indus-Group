using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using igiit.BussinessLogic;

/// <summary>
/// summarise code to register new employee form 
/// </summary>
public partial class new_employeeform : System.Web.UI.Page
{
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //code to execute without refreshing the page.
        if (!IsPostBack)
        {
            //Initialise object to bind and navigate countries
            StateCountry coun = new StateCountry();
            DataSet ds = new DataSet();
            ds = coun.GetCounty();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    country.Items.Add("");
                    country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                    country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
            }

        }
    }
   /// <summary>
   /// summarise code for save button to save the details of new employee
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    protected void btnsave_Click(object sender, EventArgs e)
    {    
       
        try
        {
            //Establish sql connection
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //open database connection to connect to sql server
            con.Open();
           
            SqlCommand cmd = new SqlCommand("Insert_Newform", con);
            cmd.CommandType = CommandType.StoredProcedure;
          
            cmd.Parameters.Add("@lname", SqlDbType.NVarChar, 50).Value = txtlname.Text;
            cmd.Parameters.Add("@fname",SqlDbType .NVarChar,50).Value = txtfname.Text;
            cmd.Parameters.Add("@mname",SqlDbType.NVarChar,50).Value = txtmname.Text;
            cmd.Parameters.Add("@oname",SqlDbType.NVarChar,50).Value = txtoname.Text;
            cmd.Parameters.Add("@paddress",SqlDbType.NVarChar,50).Value = txtaddress.Text;
            cmd.Parameters.Add("@premaddress",SqlDbType.NVarChar,50).Value =txtpaddress.Text;
            cmd.Parameters.Add("@Faddress",SqlDbType .NVarChar,50).Value = txtusadd.Text;
            cmd.Parameters.Add("@Bdate",SqlDbType.NVarChar,50).Value = txtbdate.Text;
            cmd.Parameters.Add("@Bplace",SqlDbType .NVarChar,50).Value = txtbplace.Text;
            cmd.Parameters.Add("@country",SqlDbType.NVarChar,50).Value = country.SelectedItem.Text;
            cmd.Parameters.Add("@ssnumber",SqlDbType.NVarChar,50).Value = ssnum.Text; 
            cmd.Parameters.Add("@Anumber",SqlDbType.NVarChar,50).Value =regnum.Text;
            cmd.Parameters.Add("@TINnumber",SqlDbType.NVarChar,50).Value = txttinnum.Text;
            cmd.Parameters.Add("@NonImm",SqlDbType .NVarChar,50).Value = txtnonimm.Text;
            cmd.Parameters.Add("@USDate",SqlDbType.NVarChar,50).Value =txtdate2.Text;
            cmd.Parameters.Add("@I94number",SqlDbType.NVarChar,50).Value = txtnumber.Text;

            cmd.ExecuteNonQuery();
            //close database connection to disconnect to sql server
            con.Close();
            string strScript = "";
            strScript = "alert('New Employee Form is Registered Sucessfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            txtlname.Text = "";
            txtfname.Text = "";
            txtmname.Text = "";
            txtoname.Text = "";
            txtaddress.Text = "";
            txtpaddress.Text = "";
            txtusadd.Text = "";
            txtbdate.Text = "";
            txtbplace.Text = "";
            country.SelectedValue = "Select Country";
            ssnum.Text = "";
            regnum.Text = "";
            txttinnum.Text = "";
            txtnonimm.Text = "";
            txtdate2.Text = "";
            txtnumber.Text = "";

        }
        catch (Exception ex)
        {
            //To catch exception handled
            lblmessage.Text = ex.Message;
        }
       

    }
}
