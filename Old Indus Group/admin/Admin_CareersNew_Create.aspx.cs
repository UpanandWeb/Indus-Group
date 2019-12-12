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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_CareersNew_Create : System.Web.UI.Page
{
    bool Regis = false;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            BindjobId();
        }
    }

    private void BindjobId()
    {
        string Jobid;
        string qry1 = "Select max(ID) as Jid from careersnew";
        con.Open();
        SqlCommand cmd = new SqlCommand(qry1, con);
        Int32 ma = (int)cmd.ExecuteScalar();
        int Job_Id = 10000 + ma + 1;
        con.Close();
        Jobid = "IGI-" + Job_Id;
        txtjid.Text = Jobid;
        txtjid.ReadOnly = true;
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
            string jid = txtjid.Text.ToString();    
            string jtit = jtitle.Text.ToString();
            string jsk = jskills.Text.ToString();
            string qual = jqual.Text.ToString();
            string jloc = jlocation.Text.ToString();
            string jfrom = jofrom.Text.ToString();
            string jto = joto.Text.ToString();
            string jdes = jdesc.Text.ToString();

            EmpRegistration oregistration = new EmpRegistration();
            string xreg = oregistration.CareerJobInsert(jid, jtit, jsk, qual, jloc, jfrom, jto, jdes);

            if (xreg == "1")
            {
                //Response.Redirect("Admin_CareersNew.aspx?xres=edit");
                string strr = "alert('JobPost has been saved Successfully ');location.replace('Admin_CareersNew.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strr, true);
            }
        }

        catch (Exception ex)
        {
            throw ex;
        }
    }
}
