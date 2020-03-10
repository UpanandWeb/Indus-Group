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
/// summary description to edit the client details
/// </summary>
public partial class client_details_edit : System.Web.UI.Page
{
    DataSet ds1 = new DataSet();
    StateCountry countries = new StateCountry();
    Binddata obj = new Binddata();

    //Establish sql connection
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //open database connection to connect to sql server
        sqlConnection.Open();
        DataSet ds2 = obj.GetCurr_Openings();
        if (ds2.Tables[0].Rows.Count > 0)
        {
            ddlcurop.DataSource = ds2.Tables[0];
            ddlcurop.DataBind();
        }
        //Close database conncetion to disconnect to sql server
        sqlConnection.Close();

        ds1 = countries.GetCounty();
        lblerror.Visible = false;

        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                country.Items.Add("");
                country.Items[i].Text = ds1.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                country.Items[i].Value = ds1.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
            }
        }
      
        string uid = string.Empty;
        DataSet ds = new DataSet();

        uid = Request.QueryString["id"].ToString();
        //create page withour refreshing the page
        if (!IsPostBack)
        {           
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from client_register where ID=" + uid, sqlConnection);
            imgtext.Fill(ds, "client_register");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtusername.Text = ds.Tables[0].Rows[0]["uname"].ToString();
                
                txtcompanyname.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
                txtcompanymailid.Text = ds.Tables[0].Rows[0]["companyemail"].ToString();
                ddlindtype.SelectedItem.Value = ds.Tables[0].Rows[0]["industrytype"].ToString();
                txtcontactperson.Text = ds.Tables[0].Rows[0]["contactperson"].ToString();
                txtcontactpersondesg.Text = ds.Tables[0].Rows[0]["contactpersondesignation"].ToString();
                txtulr.Text = ds.Tables[0].Rows[0]["url"].ToString();
                txtdesc.Text = ds.Tables[0].Rows[0]["description"].ToString();
                txtaddrforcommunication.Text = ds.Tables[0].Rows[0]["addressforcommunication"].ToString();
                txtstreetaddr.Text = ds.Tables[0].Rows[0]["streetaddress"].ToString();
                country.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                state.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                txtcity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                txtphone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();

            }
        }
    }
    /// <summary>
    /// summary code to change state based on selected item of country
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
    /// <summary>
    /// summary code for submit button to edit the user details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string usid = Request.QueryString["id"].ToString();
        string userusername = "";
        
        string usercompanyname = "";
        string usercompanyemailid = "";
        string userindustrytype = "";
        string usercontactperson = "";
        string usercontactpersondesg = "";
        string userurl = "";
        string userdesc = "";
        string useraddressforcommunication = "";
        string userstreetaddress = "";
        string userstate = "";
        string usercity = "";
        string userphone = "";
        string userfax = "";
        string usercountry = "";

        userusername = Convert.ToString(txtusername.Text);
       
        usercompanyname = Convert.ToString(txtcompanyname.Text);
        usercompanyemailid = Convert.ToString(txtcompanymailid.Text);
        userindustrytype = Convert.ToString(ddlindtype.SelectedItem.Text);
        usercontactperson = Convert.ToString(txtcontactperson.Text);
        usercontactpersondesg = Convert.ToString(txtcontactpersondesg.Text);
        userurl = Convert.ToString(txtulr.Text);
        userdesc = Convert.ToString(txtdesc.Text);
        useraddressforcommunication = Convert.ToString(txtaddrforcommunication.Text);
        userstreetaddress = Convert.ToString(txtstreetaddr.Text);
        userstate = Convert.ToString(state.SelectedItem.Text);
        usercity = Convert.ToString(txtcity.Text);
        userphone = Convert.ToString(txtphone.Text);
        userfax = Convert.ToString(txtfax.Text);
        usercountry = Convert.ToString(country.SelectedItem.Text);



        string streg = string.Empty;
        //Establish sql connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //open database connection to connect to sql server
        connection.Open();

        SqlCommand cmd = new SqlCommand("Update client_register set uname=@uname,companyname=@companyname,companyemail=@companyemail,industrytype=@industrytype,contactperson=@contactperson,contactpersondesignation=@contactpersondesignation,url=@url,description=@description,addressforcommunication=@addressforcommunication,streetaddress=@streetaddress,state=@state,city=@city,phone=@phone,fax=@fax,country=@country where ID=" + usid + ";", connection);


        cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar, 50));
       
        cmd.Parameters.Add(new SqlParameter("@companyname", SqlDbType.NVarChar, 150));
        cmd.Parameters.Add(new SqlParameter("@companyemail", SqlDbType.NVarChar, 150));
        cmd.Parameters.Add(new SqlParameter("@industrytype", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@contactperson", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@contactpersondesignation", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@url", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@addressforcommunication", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@streetaddress", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@fax", SqlDbType.NVarChar, 200));
        cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 200));


        cmd.Parameters["@uname"].Value = userusername;
 
        cmd.Parameters["@companyname"].Value = usercompanyname;
        cmd.Parameters["@companyemail"].Value = usercompanyemailid;
        cmd.Parameters["@industrytype"].Value = userindustrytype;
        cmd.Parameters["@contactperson"].Value = usercontactperson;
        cmd.Parameters["@contactpersondesignation"].Value = usercontactpersondesg;
        cmd.Parameters["@url"].Value = userurl;
        cmd.Parameters["@description"].Value = userdesc;
        cmd.Parameters["@addressforcommunication"].Value = useraddressforcommunication;
        cmd.Parameters["@streetaddress"].Value = userstreetaddress;
        cmd.Parameters["@state"].Value = userstate;
        cmd.Parameters["@city"].Value = usercity;
        cmd.Parameters["@phone"].Value = userphone;
        cmd.Parameters["@fax"].Value = userfax;
        cmd.Parameters["@country"].Value = usercountry;

        streg = cmd.ExecuteNonQuery().ToString();
        //close database connection to disconnect to sql server
        connection.Close();

        string strScript = "";
        strScript = "alert('Thanking you! Updated Successfully.');location.replace('login.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
    }
}

