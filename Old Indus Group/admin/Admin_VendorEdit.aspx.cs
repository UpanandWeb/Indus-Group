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
using System.IO;
using System.Data.SqlClient;
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
public partial class Admin_VendorEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        string streg = string.Empty;
        string usid = string.Empty;
        DataSet ds = new DataSet();

        usid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from clientregistration where UserId=" + usid, sqlConnection);
            imgtext.Fill(ds, "clientregistration");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {

                txtusername.Text = ds.Tables[0].Rows[0]["username"].ToString();
                txtpwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
                txtcompname.Text = ds.Tables[0].Rows[0]["cname"].ToString();
                txtcompmail.Text = ds.Tables[0].Rows[0]["cemail"].ToString();
                indtype.Text = ds.Tables[0].Rows[0]["indtype"].ToString();
                conperson.Text = ds.Tables[0].Rows[0]["cperson"].ToString();
                cpersondesig.Text = ds.Tables[0].Rows[0]["cpdesig"].ToString();
                txturl.Text = ds.Tables[0].Rows[0]["comp_url"].ToString();
                txtdesc.Text = ds.Tables[0].Rows[0]["cdesc"].ToString();
                praddr.Text = ds.Tables[0].Rows[0]["address"].ToString();
                staddr.Text = ds.Tables[0].Rows[0]["street"].ToString();
                country.Text = ds.Tables[0].Rows[0]["country"].ToString();
                state.Text = ds.Tables[0].Rows[0]["state"].ToString();
                city.Text = ds.Tables[0].Rows[0]["city"].ToString();
                W1_ccode.Text = ds.Tables[0].Rows[0]["w1_ccode"].ToString();
                W1_acode.Text = ds.Tables[0].Rows[0]["w1_acode"].ToString();
                W1_phno.Text = ds.Tables[0].Rows[0]["w1_phone"].ToString();
                W2_ccode.Text = ds.Tables[0].Rows[0]["w2_ccode"].ToString();
                W2_acode.Text = ds.Tables[0].Rows[0]["w2_acode"].ToString();
                W2_phno.Text = ds.Tables[0].Rows[0]["w2_phone"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
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
    protected void btn_continue_Click(object sender, EventArgs e)
    {

        igiit.PropertiesLayer.RegistrationProperties oRegprop = new igiit.PropertiesLayer.RegistrationProperties();

        oRegprop.vUserName = Convert.ToString(txtusername.Text.Replace("'", "''"));
        oRegprop.vPassword = Convert.ToString(txtpwd.Text.Replace("'", "''").Trim());
        oRegprop.vName = Convert.ToString(txtcompname.Text.Replace("'", "''").Trim());
        oRegprop.vEMail = Convert.ToString(txtcompmail.Text.Replace("'", "''").Trim());
        oRegprop.vIndType = Convert.ToString(indtype.Text.Replace("'", "''").Trim());

        oRegprop.vCPerson = Convert.ToString(conperson.Text.Replace("'", "''").Trim());
        oRegprop.vCPDesig = Convert.ToString(cpersondesig.Text.Replace("'", "''").Trim());
        oRegprop.vComp_URL = Convert.ToString(txturl.Text.Replace("'", "''").Trim());
        oRegprop.vAddress = Convert.ToString(praddr.Text.Replace("'", "''").Trim());
        oRegprop.vStreet = Convert.ToString(staddr.Text.Replace("'", "''").Trim());
        oRegprop.vCountry = Convert.ToString(country.Text.Replace("'", "''").Trim());
        oRegprop.vState = Convert.ToString(state.Text.Replace("'", "''").Trim());
        oRegprop.vCity = Convert.ToString(city.Text.Replace("'", "''").Trim());

        oRegprop.vWork1Ccode = Convert.ToString(W1_ccode.Text.Replace("'", "''"));
        oRegprop.vWork1Acode = Convert.ToString(W1_acode.Text.Replace("'", "''"));
        oRegprop.vWork1Phone = Convert.ToString(W1_phno.Text.Replace("'", "''"));
        oRegprop.vWork2Ccode = Convert.ToString(W2_ccode.Text.Replace("'", "''"));
        oRegprop.vWork2Acode = Convert.ToString(W2_acode.Text.Replace("'", "''"));
        oRegprop.vWork2Phone = Convert.ToString(W2_phno.Text.Replace("'", "''"));
        oRegprop.vFax = Convert.ToString(txtfax.Text.Replace("'", "''"));
        oRegprop.vDesc = Convert.ToString(txtdesc.Text.Replace("'", "''"));
        oRegprop.vPDate = (System.DateTime.Today.Date).ToString();

        
        bool Regis = false;

        EmpRegistration oregistration = new EmpRegistration();
        Regis = oregistration.UpdateEmp(oRegprop.vUserName, oRegprop.vPassword, oRegprop.vName, oRegprop.vEMail, oRegprop.vIndType, oRegprop.vCPerson, oRegprop.vCPDesig,
               oRegprop.vComp_URL, oRegprop.vAddress, oRegprop.vStreet, oRegprop.vCountry, oRegprop.vState, oRegprop.vCity, oRegprop.vWork1Ccode, oRegprop.vWork1Acode,
               oRegprop.vWork1Phone, oRegprop.vWork2Ccode, oRegprop.vWork2Acode, oRegprop.vWork2Phone, oRegprop.vFax, oRegprop.vDesc, oRegprop.vPDate, oRegprop.vFlag1);

        if (Regis.Equals(true))
        {
            Response.Redirect("Admin_Vendor.aspx?ret=edit");
        }
        else
        {
            lblmail.Text = "";
            string msg = "Vendor Updation Failed";
            lblmail.Text = msg.ToString();
        }

    }
}
