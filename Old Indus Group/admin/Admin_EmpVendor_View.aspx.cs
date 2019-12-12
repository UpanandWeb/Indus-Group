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


public partial class Admin_EmpVendor_View : System.Web.UI.Page
{
    string uid = string.Empty;
    string uname = string.Empty;
    string st = "";
    IGIIT sdata = new IGIIT();
    clsIGIIT oReguser = new clsIGIIT();
    DataSet ds = new DataSet();
    string usid = string.Empty;
    //    string uid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


        if (Request.QueryString["cid"] != null)
            usid = Request.QueryString["cid"].ToString();
        else
            Response.Redirect("Default.aspx");

        DataSet dsUserDetails = new DataSet();

        dsUserDetails = oReguser.GetEmpVendorDet(usid);
        if (dsUserDetails.Tables[0].Rows.Count > 0)
        {
            uid = dsUserDetails.Tables[0].Rows[0]["userid"].ToString();
            txtname.Text = dsUserDetails.Tables[0].Rows[0]["companyname"].ToString();
            industry.Text = dsUserDetails.Tables[0].Rows[0]["indtype"].ToString();
            addr.Text = dsUserDetails.Tables[0].Rows[0]["caddress"].ToString();
            location.Text = dsUserDetails.Tables[0].Rows[0]["city"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["state"].ToString(); ;
            country.Text = dsUserDetails.Tables[0].Rows[0]["country"].ToString();
            phno.Text = dsUserDetails.Tables[0].Rows[0]["cph1ccode"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["cph1acode"].ToString() + dsUserDetails.Tables[0].Rows[0]["cph1num"].ToString();
            txtemail.Text = dsUserDetails.Tables[0].Rows[0]["cmailid"].ToString();
            website.Text = dsUserDetails.Tables[0].Rows[0]["cwebsite"].ToString();
            abtcomp.Text = dsUserDetails.Tables[0].Rows[0]["cdesc"].ToString();
            Label1.Text = dsUserDetails.Tables[0].Rows[0]["clientname"].ToString();
            Label3.Text = dsUserDetails.Tables[0].Rows[0]["claddress"].ToString();
            Label4.Text = dsUserDetails.Tables[0].Rows[0]["clph1ccode"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["clph1acode"].ToString() + dsUserDetails.Tables[0].Rows[0]["clph1num"].ToString();
            Label5.Text = dsUserDetails.Tables[0].Rows[0]["clmb1ccode"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["clmb1acode"].ToString() + dsUserDetails.Tables[0].Rows[0]["clmb1num"].ToString();
            Label6.Text = dsUserDetails.Tables[0].Rows[0]["clemailid"].ToString();

            Label14.Text = dsUserDetails.Tables[0].Rows[0]["suname"].ToString();
            Label16.Text = dsUserDetails.Tables[0].Rows[0]["suaddress"].ToString();
            Label17.Text = dsUserDetails.Tables[0].Rows[0]["suph1ccode"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["suph1acode"].ToString() + dsUserDetails.Tables[0].Rows[0]["suph1num"].ToString();
            Label18.Text = dsUserDetails.Tables[0].Rows[0]["sumb1ccode"].ToString() + "-" + dsUserDetails.Tables[0].Rows[0]["sumb1acode"].ToString() + dsUserDetails.Tables[0].Rows[0]["sumb1num"].ToString();
            Label19.Text = dsUserDetails.Tables[0].Rows[0]["suemailid"].ToString();

        }


        DataSet ds = new DataSet();

        ds = oReguser.GetEmpVendorDetall(uid);
        GridCysto.DataSource = ds;
        GridCysto.DataBind();

    }

    protected string ViewUrl(int ID)
    {
        if (ID == 0)
            throw new ArgumentOutOfRangeException("id");
        else
        {
            string xid = ID.ToString();
            return "Admin_EmpVendor_View.aspx?cid=" + xid;
        }
    }


    protected string EditUrl(int ID)
    {
        if (ID == 0)
            throw new ArgumentOutOfRangeException("id");
        else
        {
            string xid = ID.ToString();
            return "Admin_EmpVendor_Edit.aspx?cid=" + xid;
        }
    }


    protected string DeleteUrl(int ID)
    {
        if (ID == 0)
            throw new ArgumentOutOfRangeException("id");
        else
        {
            string xid = ID.ToString();
            return "Admin_EmpVendor_Delete.aspx?cid=" + xid;
        }
    }


}
