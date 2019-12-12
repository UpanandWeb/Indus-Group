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

public partial class Admin_EmpClient_Edit : System.Web.UI.Page
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

        cphccode.Attributes.Add("onkeyup", "return length_textfield_validator1()");
        cphacode.Attributes.Add("onkeyup", "return length_textfield_validator2()");
        cldccode.Attributes.Add("onkeyup", "return length_textfield_validator3()");
        cldacode.Attributes.Add("onkeyup", "return length_textfield_validator4()");
        clmccode.Attributes.Add("onkeyup", "return length_textfield_validator5()");
        clmacode.Attributes.Add("onkeyup", "return length_textfield_validator6()");
        sdccode.Attributes.Add("onkeyup", "return length_textfield_validator7()");
        sdacode.Attributes.Add("onkeyup", "return length_textfield_validator8()");
        smccode.Attributes.Add("onkeyup", "return length_textfield_validator9()");
        smacode.Attributes.Add("onkeyup", "return length_textfield_validator10()");

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

            ds = oReguser.GetEmpClientDet(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uname = ds.Tables[0].Rows[0]["username"].ToString();
                cname.Text =ds.Tables[0].Rows[0]["companyname"].ToString();
                indtype.SelectedItem.Text =ds.Tables[0].Rows[0]["indtype"].ToString();
                caddr.Text=ds.Tables[0].Rows[0]["caddress"].ToString();
                cphccode.Text=ds.Tables[0].Rows[0]["cph1ccode"].ToString();
                cphacode.Text = ds.Tables[0].Rows[0]["cph1acode"].ToString();
                cphnum.Text = ds.Tables[0].Rows[0]["cph1num"].ToString();
                cemail.Text=ds.Tables[0].Rows[0]["cmailid"].ToString();
                cwebsite.Text=ds.Tables[0].Rows[0]["cwebsite"].ToString();
                desc.Text=ds.Tables[0].Rows[0]["cdesc"].ToString();
                clname.Text=ds.Tables[0].Rows[0]["clientname"].ToString();
                claddr.Text=ds.Tables[0].Rows[0]["claddress"].ToString();
                clemail.Text=ds.Tables[0].Rows[0]["clemailid"].ToString();
                cldccode.Text=ds.Tables[0].Rows[0]["clmb1ccode"].ToString();
                cldacode.Text=ds.Tables[0].Rows[0]["clmb1acode"].ToString();
                cldnum.Text=ds.Tables[0].Rows[0]["clmb1num"].ToString();
                clmccode.Text=ds.Tables[0].Rows[0]["clph1ccode"].ToString();
                clmacode.Text = ds.Tables[0].Rows[0]["clph1acode"].ToString();
                clmnum.Text = ds.Tables[0].Rows[0]["clph1num"].ToString();
                sname.Text=ds.Tables[0].Rows[0]["suname"].ToString();
                saddr.Text=ds.Tables[0].Rows[0]["suaddress"].ToString();
                semail.Text=ds.Tables[0].Rows[0]["suemailid"].ToString();
                sdccode.Text = ds.Tables[0].Rows[0]["sumb1ccode"].ToString();
                sdacode.Text = ds.Tables[0].Rows[0]["sumb1acode"].ToString();
                sdnum.Text = ds.Tables[0].Rows[0]["sumb1num"].ToString();
                smccode.Text = ds.Tables[0].Rows[0]["suph1ccode"].ToString();
                smacode.Text = ds.Tables[0].Rows[0]["suph1acode"].ToString();
                smnum.Text = ds.Tables[0].Rows[0]["suph1num"].ToString();
                ddlcountry.Text=ds.Tables[0].Rows[0]["country"].ToString();
                ddlstate.Text=ds.Tables[0].Rows[0]["state"].ToString();
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
            st = "update clientform set companyname='" + 
                cname.Text + "', indtype='" + 
                indtype.SelectedItem.Text.ToString() + "', caddress='" +
                caddr.Text + "', cph1ccode='" + 
                cphccode.Text + "', cph1acode='" + 
                cphacode.Text + "', cph1num='" + 
                cphnum.Text + "', cmailid='" + 
                cemail.Text + "', cwebsite='" + 
                cwebsite.Text + "', cdesc='" + 
                desc.Text + "', clientname='" + 
                clname.Text + "', claddress='" + 
                claddr.Text + "', clemailid='" + 
                clemail.Text + "', clmb1ccode='" +
                cldccode.Text + "', clmb1acode='" +
                cldacode.Text + "', clmb1num='" +
                cldnum.Text + "', clph1ccode='" +
                clmccode.Text + "', clph1acode='" +
                clmacode.Text + "', clph1num='" + 
                clmnum.Text + "', suname='" + 
                sname.Text + "', suaddress='" + 
                saddr.Text + "', suemailid='" +
                semail.Text + "', sumb1ccode='" +
                sdccode.Text + "', sumb1acode='" +
                sdacode.Text + "', sumb1num='" +
                sdnum.Text + "', suph1ccode='" +
                smccode.Text + "', suph1acode='" +
                smacode.Text + "', suph1num='" + 
                smnum.Text + "', country='" + 
                ddlcountry.Text + "', state='" + 
                ddlstate.Text + "', city='" + 
                ddlcity.Text + "' where id=" + usid;

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
