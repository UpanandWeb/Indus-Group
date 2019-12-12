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
using System.Web.SessionState;
using System.Web.Configuration;


public partial class Admin_EmpVendor_Delete : System.Web.UI.Page
{
    string uid = string.Empty;
    string uname = string.Empty;
    string st = "";
    IGIIT sdata = new IGIIT();
    DataSet ds = new DataSet();
    string usid = string.Empty;
    clsIGIIT oReguser = new clsIGIIT();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["cid"] != null)
            usid = Request.QueryString["cid"].ToString();
        else
            Response.Redirect("Default.aspx");


        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            ds = oReguser.GetEmpVendorDet(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uname = ds.Tables[0].Rows[0]["username"].ToString();
                cname.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
                indtype.SelectedItem.Text = ds.Tables[0].Rows[0]["indtype"].ToString();
                caddr.Text = ds.Tables[0].Rows[0]["caddress"].ToString();
                cphccode.Text = ds.Tables[0].Rows[0]["cph1ccode"].ToString();
                cphacode.Text = ds.Tables[0].Rows[0]["cph1acode"].ToString();
                cphnum.Text = ds.Tables[0].Rows[0]["cph1num"].ToString();
                cemail.Text = ds.Tables[0].Rows[0]["cmailid"].ToString();
                cwebsite.Text = ds.Tables[0].Rows[0]["cwebsite"].ToString();
                desc.Text = ds.Tables[0].Rows[0]["cdesc"].ToString();
                clname.Text = ds.Tables[0].Rows[0]["clientname"].ToString();
                claddr.Text = ds.Tables[0].Rows[0]["claddress"].ToString();
                clemail.Text = ds.Tables[0].Rows[0]["clemailid"].ToString();
                cldccode.Text = ds.Tables[0].Rows[0]["clmb1ccode"].ToString();
                cldacode.Text = ds.Tables[0].Rows[0]["clmb1acode"].ToString();
                cldnum.Text = ds.Tables[0].Rows[0]["clmb1num"].ToString();
                clmccode.Text = ds.Tables[0].Rows[0]["clph1ccode"].ToString();
                clmacode.Text = ds.Tables[0].Rows[0]["clph1acode"].ToString();
                clmnum.Text = ds.Tables[0].Rows[0]["clph1num"].ToString();
                sname.Text = ds.Tables[0].Rows[0]["suname"].ToString();
                saddr.Text = ds.Tables[0].Rows[0]["suaddress"].ToString();
                semail.Text = ds.Tables[0].Rows[0]["suemailid"].ToString();
                sdccode.Text = ds.Tables[0].Rows[0]["sumb1ccode"].ToString();
                sdacode.Text = ds.Tables[0].Rows[0]["sumb1acode"].ToString();
                sdnum.Text = ds.Tables[0].Rows[0]["sumb1num"].ToString();
                smccode.Text = ds.Tables[0].Rows[0]["suph1ccode"].ToString();
                smacode.Text = ds.Tables[0].Rows[0]["suph1acode"].ToString();
                smnum.Text = ds.Tables[0].Rows[0]["suph1num"].ToString();
                ddlcountry.Text = ds.Tables[0].Rows[0]["country"].ToString();
                ddlstate.Text = ds.Tables[0].Rows[0]["state"].ToString();
                ddlcity.Text = ds.Tables[0].Rows[0]["city"].ToString();



            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        try
        {
            con.Open();
            st = "delete from vendorform where id=" + usid;

            SqlCommand com = new SqlCommand(st, con);
            com.ExecuteNonQuery();

            con.Close();
            Response.Redirect("Admin_H1B.aspx");
        }
        catch (SqlException ex)
        {
            Response.Write(ex.ToString());
        }
    }
}
