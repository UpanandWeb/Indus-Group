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
using System.Web.Mail;
using System.IO;
using System.Web.SessionState;
using System.Data.SqlClient;
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using System.Web.Configuration;

public partial class igiit_Admin_Admin_JobPost_Edit : System.Web.UI.Page
{
    bool Regis = false;

    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        string rid = Request.QueryString["id"];

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            DataSet dsUserDetails = new DataSet();
            EmpCheckuser oReguser = new EmpCheckuser();

        
            try
            {
        
                string uid = "4";
                string uname = "indus";
                Int32 Count = 0;
                if ((rid != ""))
                {
        
                    dsUserDetails = oReguser.getNewJobDetails(rid.ToString());
                    if (!dsUserDetails.Tables["UserDetails"].Rows.Count.Equals(0))
                    {

                        txtjobtitle.Text = dsUserDetails.Tables[0].Rows[0]["jobtitle"].ToString();
                        txtposts.Text = dsUserDetails.Tables[0].Rows[0]["no_posts"].ToString();
                        txtskill.Text = dsUserDetails.Tables[0].Rows[0]["Keyskills"].ToString();
                        txtqual.Text = dsUserDetails.Tables[0].Rows[0]["Edu_Min"].ToString();
                        expmin.Text = dsUserDetails.Tables[0].Rows[0]["Min_Exp"].ToString();
                        expmax.Text = dsUserDetails.Tables[0].Rows[0]["Max_Exp"].ToString();
                        txtfnarea.Text = dsUserDetails.Tables[0].Rows[0]["Functional_Area"].ToString();
                        minsal.Text = dsUserDetails.Tables[0].Rows[0]["minsal"].ToString();
                        maxsal.Text = dsUserDetails.Tables[0].Rows[0]["maxsal"].ToString();
                        currency.Text = dsUserDetails.Tables[0].Rows[0]["currency"].ToString();
                        txtloc.Text = dsUserDetails.Tables[0].Rows[0]["Location"].ToString();
                        txtcperson.Text = dsUserDetails.Tables[0].Rows[0]["Contact_Person"].ToString();
                        txtphno.Text = dsUserDetails.Tables[0].Rows[0]["Contact_Phone"].ToString();
                        txtcompmail.Text = dsUserDetails.Tables[0].Rows[0]["Contact_Email"].ToString();

                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
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
        string rid = Request.QueryString["id"];
        btnsubmit.Attributes.Add("onClick", "return validatejobfields()");
        igiit.PropertiesLayer.RegistrationProperties oRegprop = new igiit.PropertiesLayer.RegistrationProperties();
        string strResult = string.Empty;

        try
        {
           
            string uid = "0";
            string uname = "indus";
            oRegprop.vRowId = rid;

            oRegprop.vUsid = uid;
            oRegprop.vUserName = uname;
            // oRegprop.vFlag = flg;
            oRegprop.vJobTitle = Convert.ToString(txtjobtitle.Text.Replace("'", "''").Trim());
            oRegprop.vPosts = Convert.ToString(txtposts.Text.Replace("'", "''").Trim());

            oRegprop.vEMail = Convert.ToString(txtcompmail.Text.Replace("'", "''").Trim());
            oRegprop.vEducation = Convert.ToString(txtqual.Text.Replace("'", "''").Trim());
            oRegprop.vCPerson = Convert.ToString(txtcperson.Text.Replace("'", "''").Trim());
            oRegprop.vMobPhone = Convert.ToString(txtphno.Text.Replace("'", "''").Trim());

            oRegprop.vSkills = Convert.ToString(txtskill.Text.Replace("'", "''").Trim());
            oRegprop.vFnarea = Convert.ToString(txtfnarea.Text.Replace("'", "''").Trim());
            oRegprop.vCurrentLoc = Convert.ToString(txtloc.Text.Replace("'", "''").Trim());

            oRegprop.vExpMin = Convert.ToString(expmin.Text.Replace("'", "''").Trim());
            oRegprop.vExpMax = Convert.ToString(expmax.Text.Replace("'", "''").Trim());
            oRegprop.vPDate = (System.DateTime.Today.Date).ToString();

            oRegprop.vMinSal = Convert.ToString(minsal.Text.Replace("'", "''").Trim());
            oRegprop.vMaxSal = Convert.ToString(maxsal.Text.Replace("'", "''").Trim());
            oRegprop.vCurrency = Convert.ToString(currency.Text.Replace("'", "''").Trim());



            EmpRegistration oregistration = new EmpRegistration();
            Regis = oregistration.JobEdit(oRegprop.vRowId, oRegprop.vUserName, oRegprop.vJobTitle, oRegprop.vPosts, oRegprop.vSkills, oRegprop.vEducation, oRegprop.vExpMin,
                   oRegprop.vExpMax, oRegprop.vFnarea, oRegprop.vMinSal, oRegprop.vMaxSal, oRegprop.vCurrency, oRegprop.vCurrentLoc, oRegprop.vCPerson, oRegprop.vMobPhone, oRegprop.vEMail, oRegprop.vPDate);
            Response.Redirect("Admin_JobPost.aspx?ret=edit");
        }
        catch
        {
        }


    }
}
