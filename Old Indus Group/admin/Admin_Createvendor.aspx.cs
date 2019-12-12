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

public partial class admin_Admin_Createvendor : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
    int select;
    StateCountry countries = new StateCountry();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] == "create")
        {
            body1.Attributes.Add("onload", "return alertcreate()");
        }
        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");
        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }
        if (Session["Addp"].ToString() != "N")
        {
            // crtopt.InnerHtml = "<a href='Admin_Createclient.aspx' class='lblog'><font color='maroon'>Add New Client</font></a>";
        }
        else
        {
            crtopt.InnerHtml = "";
        }
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

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
            txtcomby.Text = Convert.ToString( d);
            txtapby.Text = Convert.ToString(d);
            txtapporvedby.Text = Session["UserName"].ToString();
            txtcompleteby.Text = Session["UserName"].ToString();
        }
    }

    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select emp_id from  EmpContacts where cname='"+ddemp.SelectedItem.Text+"'", con);
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
         
        if (CheckBoxList1.SelectedItem!=null)
        {
            if (rbtnyes.Checked == true || rbtnno.Checked == true)
            {
                if (ddrate.SelectedItem.Text == "Hourly")
                {
                    ddrate.SelectedValue = "0";
                }
                else
                {
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
                    str = "alert('Vendor Details has been Inserted Successfully');location.replace('Admin_vendors.aspx');";
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
}
