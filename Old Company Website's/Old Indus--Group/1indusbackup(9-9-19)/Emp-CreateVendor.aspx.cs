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

public partial class Emp_CreateVendor : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
    int select;
    StateCountry countries = new StateCountry();
    DataSet ds;
    DataSet ds1;

    string emailid = string.Empty;
    string uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (Request.QueryString["sid"] != null)
                {
                    uid = Request.QueryString["sid"].ToString();
                    if (uid != "")
                    {
                        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from vendors where vid=" + uid, con);
                        ds = new DataSet();
                        imgtext.Fill(ds);

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

                            txtname.Enabled = false;
                            txtmobile.Enabled = false;
                            txtaddress1.Enabled = false;
                            txthead.Enabled = false;
                            txtdatabusiness.Enabled = false;
                            txtpre.Enabled = false;
                            txtotherofficers.Enabled = false;
                            txttype.Enabled = false;
                            txtpurchasevalue.Enabled = false;
                            txtrefrences.Enabled = false;
                            txtlistofbank.Enabled = false;
                            txtcompleteby.Enabled = false;
                            txtcomby.Enabled = false;
                            txtapporvedby.Enabled = false;
                            txtapby.Enabled = false;

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

                            txtCName.Enabled = false;
                            txtTitle.Enabled = false;
                            txtMail.Enabled = false;
                            txtUrl.Enabled = false;
                            txtTax.Enabled = false;
                            txtWork.Enabled = false;
                            txtDirect.Enabled = false;
                            txtFax.Enabled = false;

                            txtstart.Enabled = false;
                            txthour.Enabled = false;
                            txtot.Enabled = false;
                            txtnet.Enabled = false;
                            txtuser.Enabled = false;

                            if ((ds.Tables[0].Rows[0]["country"].ToString() == "") || (ds.Tables[0].Rows[0]["country"].ToString() == "Select Country"))
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
                            btnsubmit.Visible = false;
                        }
                    }
                }
                ds = new DataSet();
                ds = countries.GetCounty();
                ddlCountry.DataSource = ds;
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, "Select Country");

                SqlDataAdapter da = new SqlDataAdapter("select * from  EmpContacts order by emp_id asc", con);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);
                ddemp.DataSource = ds1;
                ddemp.DataTextField = "cname";
                ddemp.DataValueField = "cid";
                ddemp.DataBind();
                ddemp.Items.Insert(0, "Select Employee");

                //SqlDataAdapter da1 = new SqlDataAdapter("select * from  EmpContacts order by emp_id asc", con);
                //DataSet ds11 = new DataSet();
                //da1.Fill(ds11);

                //if (ds11.Tables[0].Rows.Count > 0)
                //{

                //}

                string date1 = DateTime.UtcNow.ToString();
                DateTime d = new DateTime();
                d = DateTime.UtcNow.AddHours(-4);
                txtcomby.Text = Convert.ToString(d);
                txtapby.Text = Convert.ToString(d);

                emailid = Session["userid"].ToString();

                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'  order by userid asc", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);
                if (dssss.Tables[0].Rows.Count > 0)
                {
                    txtcompleteby.Text = dssss.Tables[0].Rows[0]["firstname"].ToString();
                    txtuser.Text = dssss.Tables[0].Rows[0]["emailid"].ToString();

                    //   txtapby.Text = Session["UserName"].ToString();
                }
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


    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select emp_id from  EmpContacts where cname='" + ddemp.SelectedItem.Text + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        txtid.Text = ds.Tables[0].Rows[0]["emp_id"].ToString();
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

        if (CheckBoxList1.SelectedItem != null)
        {
            if (rbtnyes.Checked == true || rbtnno.Checked == true)
            {
                if (ddrate.SelectedItem.Text == "Hourly")
                {
                    ddrate.SelectedValue = "0";
                }
                else{
                    ddrate.SelectedValue = "1";

                }
                if (rbtnyes.Checked == true)
                {
                    select = 1;
                }
                else if (rbtnno.Checked == true)
                {
                    select = 0;
                }
                string date1 = DateTime.UtcNow.ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_insertvendor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress1.Text);
                cmd.Parameters.AddWithValue("@headquarter", txthead.Text);
                if (CheckBoxList1.SelectedItem.Text == "Other")
                    cmd.Parameters.AddWithValue("@check", txtother.Text);
                else
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

                cmd.Parameters.AddWithValue("@empid", txtid.Text);
                cmd.Parameters.AddWithValue("@hrate", txthour.Text);
                cmd.Parameters.AddWithValue("@ot", txtot.Text);
                cmd.Parameters.AddWithValue("@usedby", txtuser.Text);
                cmd.Parameters.AddWithValue("@startdate", txtstart.Text);
                cmd.Parameters.AddWithValue("@createdate", date1);

                cmd.Parameters.AddWithValue("@netperiod", txtnet.Text);
                cmd.Parameters.AddWithValue("@remarks", txtremarks.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@remarks1", txtremarks1.Text);
                cmd.Parameters.AddWithValue("@invoicecycle", ddcycle.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@ratewise", ddrate.SelectedValue);

                //  cmd.Parameters.AddWithValue("@uploademail", txtuploademail.Text);


                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    str = "alert('Vendor Details has been Inserted Successfully');location.replace('Emp-Vendors.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            else
            {
                str = "alert('Select one Radiobutton')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        else
        {
            str = "alert('Select checkbox')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-Vendors.aspx");
    }
}