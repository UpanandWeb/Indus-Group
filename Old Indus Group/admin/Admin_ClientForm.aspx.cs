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


public partial class Admin_ClientForm : System.Web.UI.Page
{
    string uid = string.Empty;
    string uname = string.Empty;
    string st = "";
    IGIIT sdata = new IGIIT();
    DataSet ds = new DataSet();
    string usid = string.Empty;
  
   
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

             ds = sdata.GetEmpDetails(usid);
             if (ds.Tables[0].Rows.Count > 0)
             {
                 uname = ds.Tables[0].Rows[0]["username"].ToString();

             }
         }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        try
        {
            string usname = string.Empty;
            ds = sdata.GetEmpDetails(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                usname = ds.Tables[0].Rows[0]["username"].ToString();

            }

            con.Open();
            st = "insert into clientform values(" + usid + ", '" + usname + "', '" + cname.Text + "','" + indtype.SelectedItem.Text.ToString() + "','" + caddr.Text + "','" + cphccode.Text + "','" + cphacode.Text + "','" + cphnum.Text + "','" + cemail.Text + "','" + cwebsite.Text + "','" + desc.Text + "','" + clname.Text + "','" + claddr.Text + "','" + clemail.Text + "','" + cldccode.Text + "','" + cldacode.Text + "','" + cldnum.Text + "','" + clmccode.Text + "','" + clmacode.Text + "','" + clmnum.Text + "','" + sname.Text + "','" + saddr.Text + "','" + semail.Text + "','" + sdccode.Text + "','" + sdacode.Text + "','" + sdnum.Text + "','" + smccode.Text + "','" + smacode.Text + "','" + smnum.Text + "','" + ddlcountry.Text.ToString() + "','" + ddlstate.Text.ToString() + "','" + ddlcity.Text.ToString() + "')";
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
