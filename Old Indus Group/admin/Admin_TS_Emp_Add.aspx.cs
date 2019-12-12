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
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;

public partial class Admin_TS_Emp_Add : System.Web.UI.Page
{
    string usid = string.Empty;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
 
    protected void Page_Load(object sender, EventArgs e)
    {

        usid = Request.QueryString["cid"].ToString();
        DataSet ds = new DataSet();
        if (!IsPostBack)
        {
            ds = sdata.GetEmpDetails(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {

                empid.Text = ds.Tables[0].Rows[0]["userid"].ToString();
                txtcname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                cname.Text = ds.Tables[0].Rows[0]["consname"].ToString();
                clname.Text = ds.Tables[0].Rows[0]["clientname"].ToString();
                dname.Text = ds.Tables[0].Rows[0]["deptname"].ToString();
                sname.Text = ds.Tables[0].Rows[0]["supname"].ToString();
                txtproj.Text = ds.Tables[0].Rows[0]["projname"].ToString();
                ptime.Text = ds.Tables[0].Rows[0]["projtime"].ToString();
            }
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string uid = empid.Text.ToString();
            string ename = txtcname.Text.ToString();
            string cnam = cname.Text.ToString();
            string clnam = clname.Text.ToString();
            string dnam = dname.Text.ToString();
            string snam = sname.Text.ToString();
            string pname = txtproj.Text.ToString();
            string ptim = ptime.Text.ToString();
            bool streg = sdata.UpdateEmpDet(uid, ename, cnam, clnam, dnam, snam, pname,ptim);
            if (streg)
                Response.Redirect("Admin_TimeSheet.aspx");
        }
        catch
        { }

    }
}
