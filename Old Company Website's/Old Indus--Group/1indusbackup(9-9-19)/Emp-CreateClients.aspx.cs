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

public partial class Emp_CreateClients : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
    StateCountry countries = new StateCountry();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                ds = new DataSet();
                ds = countries.GetCounty();
                ddlCountry.DataSource = ds;
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, "Select Country");
            }
        }
    }
    protected void Country_Change(object sender, EventArgs e)
    {
        ds = new DataSet();
        string x = Convert.ToString(ddlCountry.SelectedValue);
        ds = countries.GetState(x);
        ddlstate.DataSource = ds;
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, "Select State");
    }
    protected void ddlstate_change(object sender, EventArgs e)
    {
        ds = new DataSet();
        string x1 = Convert.ToString(ddlstate.SelectedValue);
        ds = countries.GetCity(x1);
        ddlcity.DataSource = ds;
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

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
        SqlCommand cmd = new SqlCommand("sp_clientinsert1", con);
        cmd.CommandType = CommandType.StoredProcedure;
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
            str = "alert('Client Details has been Inserted Successfully');location.replace('Emp-Clients.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

            txtcname.Text = "";
            txtadd1.Text = "";
            txtadd2.Text = "";
            txtcity.Text = "";
            ddlcity.SelectedIndex = -1;
            ddlCountry.SelectedIndex = -1;
            ddlstate.SelectedIndex = 0;
            txtDirect.Text = "";
            txtWork.Text = "";
            txturl.Text = "";
            txtzip.Text = "";
            txtemptaxid.Text = "";
            txtstateid.Text = "";
            txtssnumber.Text = "";
            txtefilename.Text = "";
            txtfiltersname.Text = "";
            txtcontactname.Text = "";
            txtmobile.Text = "";
            txtfax.Text = "";
            txtemail.Text = "";
        }
        else
        {

        }
    }
}