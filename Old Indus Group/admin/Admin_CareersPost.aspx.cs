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
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using igiit.safeConvert;
using System.Web.Configuration;

public partial class Admin_jobPost : System.Web.UI.Page
{
    bool Regis = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

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
        igiit.PropertiesLayer.RegistrationProperties oRegprop = new igiit.PropertiesLayer.RegistrationProperties();
        string strResult = string.Empty;

        try
        {
            
            oRegprop.vJobDesc= Convert.ToString(txtJobDesc.Text.Replace("'", "''").Trim());
            oRegprop.vPosition = Convert.ToString(txtposition.Text.Replace("'", "''").Trim());

            oRegprop.vFnarea = Convert.ToString(txtfnarea.Text.Replace("'", "''").Trim());
            oRegprop.vLocation = Convert.ToString(txtLocation.Text.Replace("'", "''").Trim());
            oRegprop.vJobFunc = Convert.ToString(txtJobFun.Text.Replace("'", "''").Trim());
            oRegprop.vSpecialization = Convert.ToString(txtspecial.Text.Replace("'", "''").Trim());

            oRegprop.vIndustry = Convert.ToString(txtFuncArea.Text.Replace("'", "''").Trim());
            oRegprop.vQualification = Convert.ToString(lstQuali.Text.Replace("'", "''").Trim());
            oRegprop.vExp = Convert.ToString(lstExp.Text.Replace("'", "''").Trim());
            //oRegprop.vPDate = (System.DateTime.Today.Date).ToString();
          


            EmpRegistration oregistration = new EmpRegistration();
            Regis = oregistration.AdminJobPost( oRegprop.vJobDesc, oRegprop.vPosition,
                oRegprop.vFnarea, oRegprop.vLocation, oRegprop.vJobFunc,
                   oRegprop.vSpecialization, oRegprop.vIndustry, oRegprop.vQualification, oRegprop.vExp);
            //, oRegprop.vPDate



            //oregistration.Checklastrow(oRegprop.vUserName);
            // Response.Redirect("Emp_JobPostHome.aspx?rd=1");
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
}
