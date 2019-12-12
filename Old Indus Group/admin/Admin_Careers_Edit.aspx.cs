using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class igiit_Admin_Admin_Careers_Edit : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

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
       
        uid = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlDataAdapter sda = new SqlDataAdapter("select * from Countryt_Master order by CountryName asc", sqlConnection);
            DataSet ds11 = new DataSet();
            sda.Fill(ds11);
            ddcountry.DataTextField = "CountryName";
            ddcountry.DataValueField = "CountryID";
            ddcountry.DataSource = ds11;
            ddcountry.DataBind();
            ddcountry.Items.Insert(0, "Select Country");

            SqlDataAdapter sda1 = new SqlDataAdapter("select * from State_Master order by txtState asc", sqlConnection);
            DataSet ds111 = new DataSet();
            sda1.Fill(ds111);
            DropDownList1.DataTextField = "txtState";
            DropDownList1.DataValueField = "intState_Id";
            DropDownList1.DataSource = ds111;
            DropDownList1.DataBind();

            SqlDataAdapter sda2 = new SqlDataAdapter("select * from City_Master order by CityName asc ", sqlConnection);
            DataSet ds112 = new DataSet();
            sda2.Fill(ds112);
            ddcity.DataTextField = "CityName";
            ddcity.DataValueField = "CityID";
            ddcity.DataSource = ds112;
            ddcity.DataBind();

            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Careers where id=" + uid, sqlConnection);
            imgtext.Fill(ds, "Careers");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtjname.Text = ds.Tables[0].Rows[0]["JobName"].ToString();
                txtjdesc.Text = ds.Tables[0].Rows[0]["JobDesc"].ToString();
                txtjobid.Text = ds.Tables[0].Rows[0]["jobid"].ToString();
                ddcountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
              //  DropDownList1.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();

                DropDownList1.ClearSelection();
                DropDownList1.Items.FindByText(ds.Tables[0].Rows[0]["state"].ToString()).Selected = true;

               // ddcity.SelectedItem.Text = ds.Tables[0].Rows[0]["JobLocation"].ToString();
                ddcity.ClearSelection();
                ddcity.Items.FindByText(ds.Tables[0].Rows[0]["JobLocation"].ToString()).Selected = true;

                
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

        uid = Request.QueryString["id"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update Careers set JobName=@uname,JobDesc=@jdesc,pdate=@postdate,jobid=@jobid,country=@country,state=@state,joblocation=@city where id=" + uid, connection);

        cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@jdesc", SqlDbType.NVarChar, 2000));
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));
        cmd.Parameters.Add(new SqlParameter("@jobid", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.NVarChar, 250));


        cmd.Parameters["@uname"].Value = Convert.ToString(txtjname.Text);
        cmd.Parameters["@jdesc"].Value = Convert.ToString(txtjdesc.Text);
        cmd.Parameters["@postdate"].Value = System.DateTime.Now.ToString();
        cmd.Parameters["@jobid"].Value = Convert.ToString(txtjobid.Text);
        cmd.Parameters["@country"].Value = Convert.ToString(ddcountry.SelectedItem.Text);
        cmd.Parameters["@state"].Value = Convert.ToString(DropDownList1.SelectedItem.Text);
        cmd.Parameters["@city"].Value = Convert.ToString(ddcity.SelectedItem.Text);

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        string str;
      //  Response.Redirect("Admin_Careers.aspx?ret=edit");
        str = "alert('Job Details has been Updated Successfully');location.replace('Admin_Careers.aspx')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddcountry.SelectedItem.Text != "Select Country")
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from State_Master where intCountryId=" + ddcountry.SelectedValue + " order by txtstate asc", sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DropDownList1.DataTextField = "txtstate";
            DropDownList1.DataValueField = "intState_Id";

            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select State");
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");
        }
        else
        {
            DropDownList1.ClearSelection();
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");
            DropDownList1.Items.Insert(0, "Select State");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "Select State")
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from City_Master where sid=" + DropDownList1.SelectedValue + " order by cityname asc", sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ddcity.DataTextField = "cityname";
            ddcity.DataSource = ds;
            ddcity.DataBind();
        }
        else
        {
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");

        }
    }
}
