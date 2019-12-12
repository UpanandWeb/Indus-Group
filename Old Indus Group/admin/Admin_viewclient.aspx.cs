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
public partial class admin_Admin_viewclient : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string str;
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

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtcname.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
                txtadd1.Text = ds.Tables[0].Rows[0]["address1"].ToString();
                txtadd2.Text = ds.Tables[0].Rows[0]["address2"].ToString();
                ddlcity.SelectedItem.Text = ds.Tables[0].Rows[0]["city"].ToString();
                ddlstate.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                ddlCountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
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
                txturl.Text = ds.Tables[0].Rows[0]["URL"].ToString();
                txtWork.Text = ds.Tables[0].Rows[0]["work_phone"].ToString();
                txtDirect.Text = ds.Tables[0].Rows[0]["direct_phone"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();

                //txtcname.Enabled = false;
                //txtadd1.Enabled = false;
                //txtadd2.Enabled = false;
                //txtcity.Enabled = false;
                //ddlstate.Enabled = false;
                //txtzip.Enabled = false;
                //txtemptaxid.Enabled = false;
                //txtstateid.Enabled = false;
                //txtssnumber.Enabled = false;
                //txtefilename.Enabled = false;
                //txtfiltersname.Enabled = false;
                //txtcontactname.Enabled = false;
                //txtmobile.Enabled = false;
                //txtfax.Enabled = false;
                //txtemail.Enabled = false;
                //chk1.Enabled = false;
            }
        }
    }
}