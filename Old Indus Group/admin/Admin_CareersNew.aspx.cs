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
using System.Web.Configuration;

public partial class Admin_CareersNew : System.Web.UI.Page
{
    string usid = string.Empty;
    string usnm = string.Empty;
    string fdata = string.Empty;
    DataSet ds = new DataSet();
    string uid;
    EmployeeDetails sdata = new EmployeeDetails();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["xres"] != null)
        {
            if (Request.QueryString["xres"].ToString() == "del")
            {
                Errmsg.InnerHtml = "Record is Successfully Deleted...";
            }

            if (Request.QueryString["xres"].ToString() == "edit")
            {
                Errmsg.InnerHtml = "Record is Successfully Edited...";
            }

        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        ds = sdata.GetNewCareers();
        rptAds.DataSource = ds;
        rptAds.DataBind();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Response.Redirect("Admin_CareersNew_Edit.aspx?cid=" + btn.CommandArgument);
    }

    protected void btnDelete_Click(object sender, CommandEventArgs e)
    {
        Int32 Did = Convert.ToInt32(e.CommandArgument.ToString());
        Session["Did"] = Did;
        lbldid.Text = Did.ToString();
        ModalPopupExtender1.Show();
        //Button btn = sender as Button;
        //string cid = btn.CommandArgument.ToString();
        //string xcon = sdata.DeleteCareers(cid);

        //if (xcon == "1")
        //    Response.Redirect("Admin_CareersNew.aspx?xres=del");
        //else
        //    Errmsg.InnerHtml = "It was not deleted! Please Verify Your Input....";
    }
    protected void imgbtnsmsdelete_Click(object sender, EventArgs e)
    {
        uid = Convert.ToString(Session["Did"]);
        string xcon = sdata.DeleteCareers(uid);
        if (xcon == "1")
            Response.Redirect("Admin_CareersNew.aspx?xres=del");
        else
            Errmsg.InnerHtml = "It was not deleted! Please Verify Your Input....";
    }
}
