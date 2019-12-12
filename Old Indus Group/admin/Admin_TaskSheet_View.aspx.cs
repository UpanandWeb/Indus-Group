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
using System.Web.Configuration;

public partial class Admin_TaskSheet_View : System.Web.UI.Page
{
    string usid = string.Empty;
    string xt = string.Empty;
    //DateTime fdt;
    //DateTime tdt;
    string fdt = string.Empty;
    string tdt = string.Empty;
    DateTime sdt;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
    protected void Page_Load(object sender, EventArgs e)
    {
        usid = Request.QueryString["cid"].ToString();
        
        DataSet ds = new DataSet();

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            ds = sdata.GetEmpDetails(usid);
            if (ds.Tables[0].Rows.Count > 0)
            {

                empid.Text = ds.Tables[0].Rows[0]["userid"].ToString();
                txtcname.Text = ds.Tables[0].Rows[0]["consname"].ToString();
                clname.Text = ds.Tables[0].Rows[0]["clientname"].ToString();
                //txttime.Text = ds.Tables[0].Rows[0]["projtime"].ToString();

                //txtcname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                //dname.Text = ds.Tables[0].Rows[0]["deptname"].ToString();
                //sname.Text = ds.Tables[0].Rows[0]["supname"].ToString();
                //txtproj.Text = ds.Tables[0].Rows[0]["projname"].ToString();

            }
            csdate.Value = DateTime.Now.ToString();
            todate.Value = DateTime.Now.ToString();
            fdate.Value = DateTime.Now.ToString();
        }

    }
    protected void vtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        xt = vtype.SelectedItem.Value.ToString();
        if (xt == "Biweekly" || xt == "Weekly")
        {
            for3.Visible = false;
            biw.Visible = true;
        }

        if (xt == "Fortnightly" || xt == "Monthly")
        {
            for3.Visible = true;
            biw.Visible = false;
        }

        //if (xt == "Monthly")
        //{
        //    for3.Visible = false;
        //    biw.Visible = false;
        //}


    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string qry = string.Empty;
        xt = vtype.SelectedItem.Value.ToString();
        if (xt == "Biweekly" || xt == "Weekly")
        {
            fdt = fdate.Value.ToString();
            tdt = todate.Value.ToString();
            qry=" t.pdate between '" + fdt + "' and '" + tdt + "'";
            
        }

        if (xt == "Fortnightly")
        {
            fdt = csdate.Value.ToString();
            
            qry = " t.pdate = '" + fdt.ToString() + "'";
        }

        if (xt == "Monthly")
        {
            sdt = Convert.ToDateTime(csdate.Value.ToString());

            qry = " datepart(month,t.pdate) = " + sdt.Month.ToString();
        }



        DataSet dst = new DataSet();

        dst = sdata.GetTaskSheetView(usid,qry);

        TimeGrid.DataSource = dst;
        TimeGrid.DataBind();


    }
}
