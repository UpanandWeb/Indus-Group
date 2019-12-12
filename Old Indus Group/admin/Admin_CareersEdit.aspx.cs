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


public partial class Admin_JobEdit : System.Web.UI.Page
{
    bool Regis = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        string rid = Request.QueryString["rd"];

        //string rid = "2";
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            DataSet dsUserDetails = new DataSet();
            EmpCheckuser oReguser = new EmpCheckuser();

            // txtusername.Text = Session["UserId"].ToString();

            try
            {

                //Int32 Count = 0;
                if ((rid != ""))
                {


                    dsUserDetails = oReguser.getCareersDetails(rid.ToString());
                    if (!dsUserDetails.Tables["UserDetails"].Rows.Count.Equals(0))
                    {

                        txtJobDesc.Text = dsUserDetails.Tables[0].Rows[0]["jobdesc"].ToString();
                        txtposition.Text = dsUserDetails.Tables[0].Rows[0]["position"].ToString();
                        txtfnarea.Text = dsUserDetails.Tables[0].Rows[0]["functionalarea"].ToString();
                        txtLocation.Text = dsUserDetails.Tables[0].Rows[0]["location"].ToString();
                        txtJobFun.Text = dsUserDetails.Tables[0].Rows[0]["jobfunction"].ToString();
                        txtspecial.Text = dsUserDetails.Tables[0].Rows[0]["specialization"].ToString();
                        txtFuncArea.Text = dsUserDetails.Tables[0].Rows[0]["industry"].ToString();
                        txtQuali.Text = dsUserDetails.Tables[0].Rows[0]["qualification"].ToString();
                        string exp = dsUserDetails.Tables[0].Rows[0]["Experience"].ToString();
                        for (int i = 0; i < lstExp.Items.Count; i++)
                        {
                            if (lstExp.Items[i].Text == exp.ToString())
                            {
                                lstExp.SelectedValue = lstExp.Items[i].Value;
                                break;
                            }
                        }

                    }

                    //}
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
        igiit.PropertiesLayer.RegistrationProperties oRegprop = new igiit.PropertiesLayer.RegistrationProperties();
        string strResult = string.Empty;

        try
        {
            string rid = Request.QueryString["rid"].ToString();

           // string rid = "2";
            oRegprop.vRowId = rid;
            
            oRegprop.vJobDesc = Convert.ToString(txtJobDesc.Text.Replace("'", "''").Trim());
            oRegprop.vPosition = Convert.ToString(txtposition.Text.Replace("'", "''").Trim());

            oRegprop.vFnarea = Convert.ToString(txtfnarea.Text.Replace("'", "''").Trim());
            oRegprop.vLocation = Convert.ToString(txtLocation.Text.Replace("'", "''").Trim());
            oRegprop.vJobFunc = Convert.ToString(txtJobFun.Text.Replace("'", "''").Trim());
            oRegprop.vSpecialization = Convert.ToString(txtspecial.Text.Replace("'", "''").Trim());

            oRegprop.vIndustry = Convert.ToString(txtFuncArea.Text.Replace("'", "''").Trim());
            oRegprop.vQualification = Convert.ToString(txtQuali.Text.Replace("'", "''").Trim());
            oRegprop.vExp = Convert.ToString(lstExp.Text.Replace("'", "''").Trim());
            //oRegprop.vPDate = (System.DateTime.Today.Date).ToString();

            

            EmpRegistration oregistration = new EmpRegistration();
            Regis = oregistration.AdminJobEdit(oRegprop.vRowId,oRegprop.vJobDesc, oRegprop.vPosition,
                oRegprop.vFnarea, oRegprop.vLocation, oRegprop.vJobFunc,
                   oRegprop.vSpecialization, oRegprop.vIndustry, oRegprop.vQualification, oRegprop.vExp);
            //, oRegprop.vPDate



            //oregistration.Checklastrow(oRegprop.vUserName);
            // Response.Redirect("Emp_JobPostHome.aspx?rd=1");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
