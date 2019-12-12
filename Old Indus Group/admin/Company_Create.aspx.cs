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

public partial class Company_Create : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
     SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            CountryFill();
        }
        //state.Items.Insert(0, "----Select----");
        //txtcity.Items.Insert(0, "----Select----");
    }

    public void CountryFill()
    {
        ds = new DataSet();
        ds = obj.Read_CountryMaster();
        country.DataSource = ds;
        country.DataTextField = "txtCountry_name";
        country.DataValueField = "intCountry_id";
        country.DataBind();
        country.Items.Insert(0, "Select Country");
    }

    public void StateFill(int intCountry_id)
    {
        DataSet ds1 = new DataSet();
        ds1 = obj.Read_StateMaster(intCountry_id);
        state.DataSource = ds1;
        state.DataTextField = "txtState";
        state.DataValueField = "intState_Id";
        state.DataBind();
        state.Items.Insert(0, "Select State");
    }

    //public void CityFill(int sid)
    //{
    //    DataSet ds2 = new DataSet();
    //    ds2 = obj.Read_CityMaster(sid);
    //    txtcity.DataSource = ds2;
    //    txtcity.DataTextField = "city";
    //    txtcity.DataValueField = "cid";
    //    txtcity.DataBind();
    //    txtcity.Items.Insert(0, "Select City");
    //}

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //if (IsValid)
        //{           
            string streg = string.Empty;            
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into CompanyInfo (CompanyName,CompanyOwner,Address1,City,State,Country,Website,EmailID,PhoneNo,Fax,Description,password,cpassword,cont_person,CompanyType,cont_desig) VALUES (@CompanyName,@CompanyOwner,@Address1,@City,@State,@Country,@Website,@EmailID,@PhoneNo,@Fax,@Description,@password,@cpassword,@cont_person,@CompanyType,@cont_desig)", connection);

            cmd.Parameters.Add(new SqlParameter("@CompanyName", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@CompanyOwner", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@Country", SqlDbType.NVarChar, 50));                                  
            cmd.Parameters.Add(new SqlParameter("@Website", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@EmailID", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@PhoneNo", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Fax", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@Description", SqlDbType.NVarChar, 200));
            //cmd.Parameters.Add(new SqlParameter("@streetaddress", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@cpassword", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@cont_person", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@CompanyType", SqlDbType.NVarChar, 200));
            cmd.Parameters.Add(new SqlParameter("@cont_desig", SqlDbType.NVarChar, 200));

            cmd.Parameters["@CompanyName"].Value = txtcompanyname.Text;
            cmd.Parameters["@CompanyOwner"].Value = txtusername.Text;
            cmd.Parameters["@Address1"].Value = txtaddrforcommunication.Text;
            cmd.Parameters["@City"].Value = txtcity.Text;
            cmd.Parameters["@State"].Value = state.SelectedItem.Text;
            cmd.Parameters["@Country"].Value = country.SelectedItem.Text;
            cmd.Parameters["@Website"].Value = txtulr.Text;
            cmd.Parameters["@EmailID"].Value = txtcompanymailid.Text;
            cmd.Parameters["@PhoneNo"].Value = txtphone.Text;
            cmd.Parameters["@Fax"].Value = txtfax.Text;
            cmd.Parameters["@Description"].Value = txtdesc.Text;
           // cmd.Parameters["@streetaddress"].Value = userstreetaddress;
            cmd.Parameters["@password"].Value = txtpwd.Text;
            cmd.Parameters["@cpassword"].Value = txtconfirmpwd.Text;
            cmd.Parameters["@cont_person"].Value = txtcontactperson.Text;
            cmd.Parameters["@CompanyType"].Value = ddctype.SelectedItem.Text;
            cmd.Parameters["@cont_desig"].Value = txtcontactpersondesg.Text;

            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();

            string strScript = "";
            strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Company.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        //}
    }

    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        int CID = Convert.ToInt32(country.SelectedItem.Value.ToString());
        StateFill(CID);
    }

    //protected void state_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int SID = Convert.ToInt32(state.SelectedItem.Value.ToString());
    //    CityFill(SID);
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Company.aspx");
    }
    protected void txtcompanyname_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtusername.Text))
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from CompanyInfo where CompanyOwner=@CompanyOwner", con);
            cmd.Parameters.AddWithValue("@CompanyOwner", txtcompanyname.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                checkusername.Visible = true;
                imgstatus.ImageUrl = "images/NotAvailable.jpg";
                CheckAvailability.Text = "Company Name Already Exist";
            }
            else
            {
                checkusername.Visible = true;
                imgstatus.ImageUrl = "images/Icon_Available.gif";
                CheckAvailability.Text = "Company Name Available";
            }
        }
        else
        {
            checkusername.Visible = false;
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (CheckBox1.Checked)
        {
            args.IsValid = true;
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtaddrforcommunication.Text = "";
        txtcompanymailid.Text = "";
        txtcompanyname.Text = "";
        txtconfirmpwd.Text = "";
        txtcontactperson.Text = "";
        txtcontactpersondesg.Text = "";
        txtdesc.Text = "";
        txtfax.Text = "";
        txtphone.Text = "";
        txtpwd.Text = "";
        txtulr.Text = "";
        txtusername.Text = "";
        ddctype.SelectedItem.Text = "Select Type";
        txtcity.Text = "";
        country.SelectedItem.Text = "Select Country";
        state.SelectedItem.Text = "Select State";

    }
}
