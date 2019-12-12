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

public partial class Digital_cert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        getdetails.Attributes.Add("onclick", "return alertfield()");
        tbldetails.Visible = false;
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
    protected void getdetails_Click(object sender, EventArgs e)
    {
        string fulldet = string.Empty;
        string uid = string.Empty;
        DataSet ds = new DataSet();
        DataSet dss = new DataSet();

        uid = Convert.ToString(admno.Text);

        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_certificate where course_id='" + uid + "'", sqlConnection);
        imgtext.Fill(ds, "wt_certificate");

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            
        SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext1 = new SqlDataAdapter("Select * from wt_enroll where UserId='" + ds.Tables[0].Rows[0]["enroll_id"].ToString() + "'", sqlConnection1);
        imgtext1.Fill(dss, "wt_enroll");
        if (!dss.Tables[0].Rows.Count.Equals(0))
        {
            tbldetails.Visible = true;
            name.Text = dss.Tables[0].Rows[0]["Fname"].ToString() + " " + dss.Tables[0].Rows[0]["Lname"].ToString();
            address.Text = dss.Tables[0].Rows[0]["Address"].ToString();
            country.Text = dss.Tables[0].Rows[0]["Country"].ToString();
            email.Text = dss.Tables[0].Rows[0]["Email"].ToString();
            cwork.Text = dss.Tables[0].Rows[0]["Curr_Working"].ToString();
            course.Text = dss.Tables[0].Rows[0]["Course_Enroll"].ToString();
        }
            totexp.Text = ds.Tables[0].Rows[0]["Exp_years"].ToString() + ds.Tables[0].Rows[0]["Exp_months"].ToString();
            kskills.Text = ds.Tables[0].Rows[0]["Skills"].ToString();
            fnarea.Text = ds.Tables[0].Rows[0]["Fn_area"].ToString();
            bqual.Text = ds.Tables[0].Rows[0]["Edu_qual"].ToString();
            pg.Text = ds.Tables[0].Rows[0]["PG"].ToString();
            ppg.Text = ds.Tables[0].Rows[0]["P_pg"].ToString();

            string eid = ds.Tables[0].Rows[0]["enroll_id"].ToString();
            string neid = eid.Trim();
      
            fulldet = "<br /><table width='100%' border='1' cellspacing='0' cellpadding='0' bgcolor='#F6FDFD'>";

            fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' bgcolor='#F6FDFD'>";

            fulldet = fulldet + "<img src='Certificates/" + neid + ds.Tables[0].Rows[0]["certificate1"].ToString() + "' border='1'/>" + "</td></tr></table>";
        }
        tdimage.InnerHtml = fulldet;


    }
}
