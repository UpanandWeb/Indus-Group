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
public partial class admin_Admin_Editclient : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
    StateCountry countries = new StateCountry();
    DataSet ds1;
    protected void Page_Load(object sender, EventArgs e)
    {

        string uid = string.Empty;
        DataSet ds = new DataSet();

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }

        uid = Request.QueryString["sid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblid.Text = uid;

            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from clients where cid=" + uid, con);
            imgtext.Fill(ds, "clients");
            bindCountry();
            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtcname.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
                txtadd1.Text = ds.Tables[0].Rows[0]["address1"].ToString();
                txtadd2.Text = ds.Tables[0].Rows[0]["address2"].ToString();
                ddlCountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                string sCountry = ds.Tables[0].Rows[0]["country"].ToString();
                ddlstate.SelectedItem.Text = sCountry;
                bindState(sCountry);
                ddlstate.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                string State = ds.Tables[0].Rows[0]["state"].ToString();
                bindCity(State);
                try
                {
                    ddlcity.SelectedItem.Text = ds.Tables[0].Rows[0]["city"].ToString();
                    txtcity.Visible = false;
                }
                catch
                {
                    txtcity.Visible = true;
                    ddlcity.SelectedItem.Text = "Other City";
                    txtcity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                }
                txtzip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                txtemptaxid.Text = ds.Tables[0].Rows[0]["emptaxid"].ToString();
                txtstateid.Text = ds.Tables[0].Rows[0]["stateid"].ToString();
                txtssnumber.Text = ds.Tables[0].Rows[0]["ssnumber"].ToString();
                txtefilename.Text = ds.Tables[0].Rows[0]["efilenamecontrol"].ToString();
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["finalreturn"]) > 0)
                {
                    chk1.Checked = true;
                }
                else
                {
                    chk1.Checked = false;
                }
                txtfiltersname.Text = ds.Tables[0].Rows[0]["filersname"].ToString();
                txtcontactname.Text = ds.Tables[0].Rows[0]["contactname"].ToString();
                txtmobile.Text = ds.Tables[0].Rows[0]["telephone"].ToString();
                txtWork.Text = ds.Tables[0].Rows[0]["work_phone"].ToString();
                txtDirect.Text = ds.Tables[0].Rows[0]["direct_phone"].ToString();
                txturl.Text = ds.Tables[0].Rows[0]["URL"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();

            }
        }
    }

    void bindCountry()
    {
        
        ds1 = new DataSet();
        ds1 = countries.GetCounty();
        ddlCountry.DataSource = ds1;
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Select Country");
    }
    void bindState(string country)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select intCountry_id from  Country_Master where txtCountry_name='" + country + "'", con);
        string countryId = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        ds1 = new DataSet();
        string x = Convert.ToString(countryId);
        ds1 = countries.GetState(x);
        ddlstate.DataSource = ds1;
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, "Select State");
    }
    void bindCity(string state)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select intState_id from  State_Master where txtState='" + state + "'", con);
        string stateId = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        ds1 = new DataSet();
        string x1 = Convert.ToString(stateId);
        ds1 = countries.GetCity(x1);
        ddlcity.DataSource = ds1;
        ddlcity.DataBind();
        ddlcity.Items.Insert(0, "Select City");
        ddlcity.Items.Add("Other City");
    }

    #region Web Form Designer generated code

    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>


    #endregion
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;
        string uid = string.Empty;
        uid = lblid.Text;
        int file = 0;
        if (chk1.Checked == true)
        {
            file = 1;
        }
        else
        {
            file = 0;
        }

        con.Open();

        SqlCommand cmd = new SqlCommand("sp_updateclient1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cid", uid);
        cmd.Parameters.AddWithValue("@cname", txtcname.Text);
        cmd.Parameters.AddWithValue("@add1", txtadd1.Text);
        cmd.Parameters.AddWithValue("@add2", txtadd2.Text);
        cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@state", ddlstate.SelectedItem.Text);
        if (ddlcity.SelectedItem.Text == "Other City")
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
        else
            cmd.Parameters.AddWithValue("@city", ddlcity.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@zip", txtzip.Text);
        cmd.Parameters.AddWithValue("@emptax", txtemptaxid.Text);
        cmd.Parameters.AddWithValue("@stateid", txtstateid.Text);
        cmd.Parameters.AddWithValue("@sscnumber", txtssnumber.Text);
        cmd.Parameters.AddWithValue("@efilename", txtefilename.Text);
        cmd.Parameters.AddWithValue("@filereturn", file);
        cmd.Parameters.AddWithValue("@filtername", txtfiltersname.Text);
        cmd.Parameters.AddWithValue("@contactname", txtcontactname.Text);
        cmd.Parameters.AddWithValue("@url", txturl.Text);
        cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
        cmd.Parameters.AddWithValue("@work", txtWork.Text);
        cmd.Parameters.AddWithValue("@direct", txtDirect.Text);
        cmd.Parameters.AddWithValue("@fax", txtfax.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);          
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {

            str = "alert('Client Details has been Updated Successfully');location.replace('Admin_clients.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
    protected void Country_Change(object sender, EventArgs e)
    {
        ds1 = new DataSet();
        string x = Convert.ToString(ddlCountry.SelectedValue);
        ds1 = countries.GetState(x);
        ddlstate.DataSource = ds1;
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, "Select State");
    }
    protected void ddlstate_change(object sender, EventArgs e)
    {
        ds1 = new DataSet();
        string x1 = Convert.ToString(ddlstate.SelectedValue);
        ds1 = countries.GetCity(x1);
        ddlcity.DataSource = ds1;
        ddlcity.DataBind();
        ddlcity.Items.Insert(0, "Select City");
        ddlcity.Items.Add("Other City");

    }
    protected void ddlcity_changed(object sender, EventArgs e)
    {
        string s = ddlcity.SelectedItem.Text;
        if (s == "Other City")
            txtcity.Visible = true;
        else
            txtcity.Visible = false;
    }
}