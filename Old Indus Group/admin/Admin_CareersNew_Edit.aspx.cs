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
 
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using igiit.safeConvert;
using System.Web.Configuration;


public partial class Admin_CareersNew_Edit : System.Web.UI.Page
{
    bool Regis = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        string rid = Request.QueryString["cid"];

        //string rid = "2";
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

                //Int32 Count = 0;
                if ((rid != ""))
                {


                    dsUserDetails = oReguser.getnewCareersDetails(rid.ToString());
                    if (!dsUserDetails.Tables["UserDetails"].Rows.Count.Equals(0))
                    {

                        txtjid.Text = dsUserDetails.Tables[0].Rows[0]["jobid"].ToString();
                        jtitle.Text = dsUserDetails.Tables[0].Rows[0]["jobtitle"].ToString();
                        jqual.Text = dsUserDetails.Tables[0].Rows[0]["qualification"].ToString();
                        jskills.Text = dsUserDetails.Tables[0].Rows[0]["skills"].ToString();
                        jlocation.Text = dsUserDetails.Tables[0].Rows[0]["location"].ToString();
                        jofrom.Text = dsUserDetails.Tables[0].Rows[0]["openfrom"].ToString();
                        joto.Text = dsUserDetails.Tables[0].Rows[0]["opento"].ToString();
                        jdesc.Text = dsUserDetails.Tables[0].Rows[0]["description"].ToString();
                        
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

    //#region Web Form Designer generated code
    //override protected void OnInit(EventArgs e)
    //{
    //    //
    //    // CODEGEN: This call is required by the ASP.NET Web Form Designer.
    //    //
    //    base.OnInit(e);
    //    if (Session["UserName"] == null)
    //    {
    //        Session.Add("requestUrl", Request.Url);
    //        Response.Redirect("Admin_Login.aspx");
    //    }
    //}

    ///// <summary>
    ///// Required method for Designer support - do not modify
    ///// the contents of this method with the code editor.
    ///// </summary>
    //#endregion
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string strResult = string.Empty;

        try
        {

            string rid = Request.QueryString["cid"].ToString();

            string jid = txtjid.Text.ToString();
            string jtit = jtitle.Text.ToString();
            string jsk = jskills.Text.ToString();
            string qual = jqual.Text.ToString();
            string jloc = jlocation.Text.ToString();
            string jfrom = jofrom.Text.ToString();
            string jto = joto.Text.ToString();
            string jdes = jdesc.Text.ToString();

            EmpRegistration oregistration = new EmpRegistration();
            string xreg = oregistration.CareerJobEdit(jid, jtit, jsk, qual, jloc, jfrom, jto, jdes, rid);

            if (xreg == "1")
                Response.Redirect("Admin_CareersNew.aspx?xres=edit");
        }

        catch (Exception ex)
        {
            throw ex;
        }
    }
}
