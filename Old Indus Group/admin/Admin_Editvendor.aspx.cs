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

public partial class admin_Admin_Editvendor : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
    int select;
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

            bindcountries();            
            lblid.Text = uid;

            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from vendors where vid=" + uid, con);
            imgtext.Fill(ds, "vendors");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtname.Text = ds.Tables[0].Rows[0]["firm_name"].ToString();
                txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                txtaddress1.Text = ds.Tables[0].Rows[0]["address"].ToString();
                txthead.Text = ds.Tables[0].Rows[0]["headquarter"].ToString();
                txtdatabusiness.Text = ds.Tables[0].Rows[0]["datebusinesstand"].ToString();
                txtpre.Text = ds.Tables[0].Rows[0]["ppowner"].ToString();
                txtotherofficers.Text = ds.Tables[0].Rows[0]["otheroffices"].ToString();
                txttype.Text = ds.Tables[0].Rows[0]["type"].ToString();
                txtpurchasevalue.Text = ds.Tables[0].Rows[0]["lcurrentpurchase"].ToString();
                txtrefrences.Text = ds.Tables[0].Rows[0]["ltradereferences"].ToString();
                txtlistofbank.Text = ds.Tables[0].Rows[0]["lbankreferences"].ToString();
                txtcompleteby.Text = ds.Tables[0].Rows[0]["compby"].ToString();
                txtcomby.Text = ds.Tables[0].Rows[0]["compdate"].ToString();
                txtapporvedby.Text = ds.Tables[0].Rows[0]["apboy"].ToString();
                txtapby.Text = ds.Tables[0].Rows[0]["apbdate"].ToString();

                string stest = ds.Tables[0].Rows[0]["check"].ToString();
                if (stest == "Corporation" || stest == "Partnership" || stest == "Individual")
                    CheckBoxList1.SelectedValue = ds.Tables[0].Rows[0]["check"].ToString();
                else
                {
                    CheckBoxList1.SelectedValue = "Other";
                    txtother.Text = ds.Tables[0].Rows[0]["check"].ToString();
                }
                int s = Convert.ToInt32(ds.Tables[0].Rows[0]["rcheck"]);

                txtCName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                txtTitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
                txtMail.Text = ds.Tables[0].Rows[0]["VenMail"].ToString();
                txtUrl.Text = ds.Tables[0].Rows[0]["website"].ToString();
                txtTax.Text = ds.Tables[0].Rows[0]["taxid"].ToString();
                txtWork.Text = ds.Tables[0].Rows[0]["work"].ToString();
                txtDirect.Text = ds.Tables[0].Rows[0]["direct"].ToString();
                txtFax.Text = ds.Tables[0].Rows[0]["fax"].ToString();                
                if (ds.Tables[0].Rows[0]["country"].ToString() == "")
                {
                    ddlCountry.SelectedIndex = -1;
                }
                else
                {
                    ddlCountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                    bindstates(ddlCountry.SelectedItem.Text);
                    ddlstate.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                    if (ddlstate.SelectedItem.Text != "Select State")
                    {
                        bindCity(ddlstate.SelectedItem.Text);
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
                    }
                    else
                    {
                        ddlcity.SelectedItem.Text = "Select City";
                    }
                }
                txtZip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                txtaddress2.Text = ds.Tables[0].Rows[0]["Addressline2"].ToString();
                if (s == 1)
                {
                    rbtnyes.Checked = true;
                }
                else
                {
                    rbtnno.Checked = true;
                }
            }
        }
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
        if (CheckBoxList1.SelectedItem == null)
        {
            str = "alert('Please Select checkbox')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        else
        {
            if (rbtnyes.Checked == true || rbtnno.Checked == true)
            {
                if (rbtnyes.Checked == true)
                {
                    select = 1;
                }
                else if (rbtnno.Checked == true)
                {
                    select = 0;
                }
                con.Open();

                SqlCommand cmd = new SqlCommand("sp_updatevendor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@vid", uid);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress1.Text);
                cmd.Parameters.AddWithValue("@headquarter", txthead.Text);
                cmd.Parameters.AddWithValue("@check", CheckBoxList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@datebusinesstand", txtdatabusiness.Text);
                cmd.Parameters.AddWithValue("@ppowner", txtpre.Text);
                cmd.Parameters.AddWithValue("@otheroffices", txtotherofficers.Text);
                cmd.Parameters.AddWithValue("@rcheck", select);
                cmd.Parameters.AddWithValue("@type", txttype.Text);
                cmd.Parameters.AddWithValue("@lcurrentpurchase", txtpurchasevalue.Text);
                cmd.Parameters.AddWithValue("@ltradereferences", txtrefrences.Text);
                cmd.Parameters.AddWithValue("@lbankreferences", txtlistofbank.Text);
                cmd.Parameters.AddWithValue("@compby", txtcompleteby.Text);
                cmd.Parameters.AddWithValue("@compdate", txtcomby.Text);
                cmd.Parameters.AddWithValue("@apboy", txtapporvedby.Text);
                cmd.Parameters.AddWithValue("@apbdate", txtapby.Text);

                cmd.Parameters.AddWithValue("@cname", txtCName.Text);
                cmd.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@mail", txtMail.Text);
                cmd.Parameters.AddWithValue("@url", txtUrl.Text);
                cmd.Parameters.AddWithValue("@tax", txtTax.Text);
                cmd.Parameters.AddWithValue("@work", txtWork.Text);
                cmd.Parameters.AddWithValue("@direct", txtDirect.Text);
                cmd.Parameters.AddWithValue("@fax", txtFax.Text);
                if (ddlcity.SelectedItem.Text == "Other City")
                    cmd.Parameters.AddWithValue("@city", txtcity.Text);
                else
                    cmd.Parameters.AddWithValue("@city", ddlcity.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@state", ddlstate.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@zip", txtZip.Text);
                cmd.Parameters.AddWithValue("@address2", txtaddress2.Text);

                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    str = "alert('Vendor Details has been Updated Successfully');location.replace('Admin_vendors.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            else
            {
                str = "alert('Select one Radiobutton')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
    }
    void bindcountries()
    {
        ds1 = new DataSet();
        ds1 = countries.GetCounty();
        ddlCountry.DataSource = ds1;
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Select Country");
    }

    protected void Country_Change(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedItem.Text != "Select Country")
        {
            ds1 = new DataSet();
            string x = Convert.ToString(ddlCountry.SelectedValue);
            ds1 = countries.GetState(x);
            ddlstate.DataSource = ds1;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, "Select State");
        }
    }

    void bindstates(string country)
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

    protected void ddlstate_change(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedItem.Text != "Select State")
        {
        ds1 = new DataSet();
        string x1 = Convert.ToString(ddlstate.SelectedValue);
        ds1 = countries.GetCity(x1);
        ddlcity.DataSource = ds1;
        ddlcity.DataBind();
        ddlcity.Items.Insert(0, "Select City");
        ddlcity.Items.Add("Other City");
        }
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

    protected void ddlcity_changed(object sender, EventArgs e)
    {
        string s = ddlcity.SelectedItem.Text;
        if (s == "Other City")
            txtcity.Visible = true;
        else
            txtcity.Visible = false;
    }
    
}