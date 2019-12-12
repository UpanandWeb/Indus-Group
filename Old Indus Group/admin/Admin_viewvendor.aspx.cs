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

public partial class admin_Admin_viewvendor : System.Web.UI.Page
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

            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from vendors where vid=" + uid, con);
            imgtext.Fill(ds, "vendors");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtname.Text = ds.Tables[0].Rows[0]["Firm_Name"].ToString();
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
                if (s == 1)
                {
                    rbtnyes.Checked = true;
                }
                else
                {
                    rbtnno.Checked = true;
                }
                txtCName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                txtTitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
                txtMail.Text = ds.Tables[0].Rows[0]["VenMail"].ToString();
                txtUrl.Text = ds.Tables[0].Rows[0]["website"].ToString();
                txtTax.Text = ds.Tables[0].Rows[0]["taxid"].ToString();
                txtWork.Text = ds.Tables[0].Rows[0]["work"].ToString();
                txtDirect.Text = ds.Tables[0].Rows[0]["direct"].ToString();
                txtFax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
                ddlcity.SelectedItem.Text = ds.Tables[0].Rows[0]["city"].ToString();
                ddlstate.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                ddlCountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                txtZip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                txtaddress2.Text = ds.Tables[0].Rows[0]["Addressline2"].ToString();

                txtCName.Enabled = false;
                txtTitle.Enabled = false;
                txtMail.Enabled = false;
                txtUrl.Enabled = false;
                txtTax.Enabled = false;
                txtWork.Enabled = false;
                txtDirect.Enabled = false;
                txtFax.Enabled = false;
                txtZip.Enabled = false;
                txtaddress2.Enabled = false;
                ddlcity.Enabled = false;
                ddlstate.Enabled = false;
                ddlCountry.Enabled = false;
                txtname.Enabled = false;
                txtmobile.Enabled = false;
                txtaddress1.Enabled = false;
                txthead.Enabled = false;
                txtdatabusiness.Enabled = false;
                txtpre.Enabled = false;
                txtother.Enabled = false;
                txtotherofficers.Enabled = false;
                txttype.Enabled = false;
                txtpurchasevalue.Enabled = false;
                txtrefrences.Enabled = false;
                txtlistofbank.Enabled = false;
                txtcompleteby.Enabled = false;
                txtcomby.Enabled = false;
                txtapporvedby.Enabled = false;
                txtapby.Enabled = false;
                CheckBoxList1.Enabled = false;
                rbtnyes.Enabled = false;
                rbtnno.Enabled = false;
            }
        }
    }
}