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
using igiit.PropertiesLayer;

/// <summary>
/// summarise code to edit the  vendor details
/// </summary>
public partial class vendor_details_edit : System.Web.UI.Page
{
    DataSet ds1 = new DataSet();
     //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();

    //Initialise object to bind data
    Binddata obj = new Binddata();
    string usid;
    //Establish sql connection
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string streg = string.Empty;
        string usid = string.Empty;

        //open database connection to connect to sql server
        sqlConnection.Open();

        //Navigate and bind current job openings
        DataSet ds2 = obj.GetCurr_Openings();
        if (ds2.Tables[0].Rows.Count > 0)
        {
            ddlcurop.DataSource = ds2.Tables[0];
            ddlcurop.DataBind();
        }
        //close database connection to disconnect to sql server
        sqlConnection.Close();      

        ds1 = countries.GetCounty();
        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                country.Items.Add("");
                country.Items[i].Text = ds1.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                country.Items[i].Value = ds1.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
            }
        }
        usid = Request.QueryString["id"].ToString();
        DataSet ds = new DataSet();
        
        //code to execute without refreshing the page.
        if(!IsPostBack)
        {
           
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from vendorreg where userid=" + usid, sqlConnection);
            imgtext.Fill(ds, "vendorreg");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {

                txtusername.Text = ds.Tables[0].Rows[0]["username"].ToString();
                txtcompname.Text = ds.Tables[0].Rows[0]["cname"].ToString();
                txtcompmail.Text = ds.Tables[0].Rows[0]["cemail"].ToString();
                indtype.Text = ds.Tables[0].Rows[0]["indtype"].ToString();
                conperson.Text = ds.Tables[0].Rows[0]["cperson"].ToString();
                cpersondesig.Text = ds.Tables[0].Rows[0]["cpdesig"].ToString();
                txturl.Text = ds.Tables[0].Rows[0]["comp_url"].ToString();
                txtdesc.Text = ds.Tables[0].Rows[0]["cdesc"].ToString();
                praddr.Text = ds.Tables[0].Rows[0]["address"].ToString();
                staddr.Text = ds.Tables[0].Rows[0]["street"].ToString();
                country.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                state.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                city.Text = ds.Tables[0].Rows[0]["city"].ToString();
                W1_phno.Text = ds.Tables[0].Rows[0]["w1_phone"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
               
            }
        }
    }
    /// <summary>
    /// summarise code to edit the vandor details and save.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_continue_Click(object sender, EventArgs e)
    {
        usid = Request.QueryString["id"].ToString();
        //open database connection to connect to sql server
        sqlConnection.Open();
        string str = "update vendorreg set username='"+txtusername.Text+
            "',cname='" + txtcompname.Text + "',cemail='" + txtcompmail.Text +
            "',indtype='" + indtype.Text + "',cperson='" + conperson.Text +
            "',cpdesig='" + cpersondesig.Text + "',comp_url='" + txturl.Text +
            "',cdesc='" + txtdesc.Text + "',address='" + praddr.Text +
            "',street='" + staddr.Text + "',country='" + country.SelectedItem.Text +
            "',state='" + state.SelectedItem.Text + "',city='" + city.Text +
            "',w1_phone='" + W1_phno.Text + "',fax='" + txtfax.Text + "' where userid="+usid;
        SqlCommand cmd = new SqlCommand(str, sqlConnection);
    
        cmd.ExecuteNonQuery();

        //close database connection to disconnect to sql server
        sqlConnection.Close();       

        string strScript = "";
        strScript = "alert('Thanking you! Updated Successfully.');location.replace('login.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

     
    }
    /// <summary>
    ///  Summarise code to change state when we select country
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        string y = country.SelectedItem.Value.ToString();
        ds1 = countries.GetState(y);

        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                state.Items.Add("");
                state.Items[i].Text = ds1.Tables[0].Rows[i - 1]["txtState"].ToString();
                state.Items[i].Value = ds1.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
    }
}