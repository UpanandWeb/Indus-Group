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

public partial class TimeSheet_Edit : System.Web.UI.Page
{
    int x = 0;
    int y = 0;
    string usid = string.Empty;
    string xt = string.Empty;
    string fdt = string.Empty;
    string tdt = string.Empty;
    DateTime sdt;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
    string Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["cid"] != null && Request.QueryString["vid"] != null)
        {
            usid = Request.QueryString["cid"].ToString();
            Id = Request.QueryString["vid"].ToString();
            navi.HRef = "TimeSheet_Details.aspx?cid=" + usid;
        }
        //DataSet dsemail = sdata.GetEmpDetails(usid);
        //string Eemail = dsemail.Tables[0].Rows[0]["emailid"].ToString();
        string Eemail = "";
        //usid = Request.QueryString["cid"].ToString();
        DataSet dsemail = sdata.GetEmpDetails(usid);
        if (dsemail.Tables[0].Rows.Count > 0)
        {
            Eemail = dsemail.Tables[0].Rows[0]["emailid"].ToString();
        }
        DataSet ds = new DataSet();


        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            ds = sdata.Get_EmpTimeSheetView(usid, Id);          
            if (ds.Tables[0].Rows.Count > 0)
            {
                // empid.Text = ds.Tables[0].Rows[0]["userid"].ToString();
                //empid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                empid.Text = Eemail;
                otime.Text = ds.Tables[0].Rows[0]["overtime"].ToString();
                whrs.Text = ds.Tables[0].Rows[0]["workhrs"].ToString();
                txtrem.Text = ds.Tables[0].Rows[0]["remarks"].ToString();
                clname.Text = ds.Tables[0].Rows[0]["clientname"].ToString();
                txtcname.Text = ds.Tables[0].Rows[0]["consname"].ToString();

                txttime.ClearSelection();
                txttime.Items.FindByText(ds.Tables[0].Rows[0]["timeperiod"].ToString()).Selected = true;

               // txttime.SelectedItem.Text = ds.Tables[0].Rows[0]["timeperiod"].ToString();
                fromdate.Text = ds.Tables[0].Rows[0]["fromdate"].ToString();
                todate.Text = ds.Tables[0].Rows[0]["todate"].ToString();
                t1.Text = ds.Tables[0].Rows[0]["rd1"].ToString();
                t2.Text = ds.Tables[0].Rows[0]["rd2"].ToString();
                t3.Text = ds.Tables[0].Rows[0]["rd3"].ToString();
                t4.Text = ds.Tables[0].Rows[0]["rd4"].ToString();
                t5.Text = ds.Tables[0].Rows[0]["rd5"].ToString();
                t6.Text = ds.Tables[0].Rows[0]["rd6"].ToString();
                t7.Text = ds.Tables[0].Rows[0]["rd7"].ToString();
                t8.Text = ds.Tables[0].Rows[0]["rd8"].ToString();
                t9.Text = ds.Tables[0].Rows[0]["rd9"].ToString();
                t10.Text = ds.Tables[0].Rows[0]["rd10"].ToString();
                t11.Text = ds.Tables[0].Rows[0]["rd11"].ToString();
                t12.Text = ds.Tables[0].Rows[0]["rd12"].ToString();
                t13.Text = ds.Tables[0].Rows[0]["rd13"].ToString();
                t14.Text = ds.Tables[0].Rows[0]["rd14"].ToString();
                t15.Text = ds.Tables[0].Rows[0]["rd15"].ToString();
                t16.Text = ds.Tables[0].Rows[0]["rd16"].ToString();
                t17.Text = ds.Tables[0].Rows[0]["rd17"].ToString();
                t18.Text = ds.Tables[0].Rows[0]["rd18"].ToString();

                t19.Text = ds.Tables[0].Rows[0]["rd19"].ToString();
                t20.Text = ds.Tables[0].Rows[0]["rd20"].ToString();
                t21.Text = ds.Tables[0].Rows[0]["rd21"].ToString();
                t22.Text = ds.Tables[0].Rows[0]["rd22"].ToString();
                t23.Text = ds.Tables[0].Rows[0]["rd23"].ToString();
                t24.Text = ds.Tables[0].Rows[0]["rd24"].ToString();
                t25.Text = ds.Tables[0].Rows[0]["rd25"].ToString();
                t26.Text = ds.Tables[0].Rows[0]["rd26"].ToString();
                t27.Text = ds.Tables[0].Rows[0]["rd27"].ToString();
                t28.Text = ds.Tables[0].Rows[0]["rd28"].ToString();
                t29.Text = ds.Tables[0].Rows[0]["rd29"].ToString();
                t30.Text = ds.Tables[0].Rows[0]["rd30"].ToString();
                t31.Text = ds.Tables[0].Rows[0]["rd31"].ToString();


                o1.Text = ds.Tables[0].Rows[0]["ot1"].ToString();
                o2.Text = ds.Tables[0].Rows[0]["ot2"].ToString();
                o3.Text = ds.Tables[0].Rows[0]["ot3"].ToString();
                o4.Text = ds.Tables[0].Rows[0]["ot4"].ToString();
                o5.Text = ds.Tables[0].Rows[0]["ot5"].ToString();
                o6.Text = ds.Tables[0].Rows[0]["ot6"].ToString();
                o7.Text = ds.Tables[0].Rows[0]["ot7"].ToString();
                o8.Text = ds.Tables[0].Rows[0]["ot8"].ToString();
                o9.Text = ds.Tables[0].Rows[0]["ot9"].ToString();
                o10.Text = ds.Tables[0].Rows[0]["ot10"].ToString();
                o11.Text = ds.Tables[0].Rows[0]["ot11"].ToString();
                o12.Text = ds.Tables[0].Rows[0]["ot12"].ToString();
                o13.Text = ds.Tables[0].Rows[0]["ot13"].ToString();
                o14.Text = ds.Tables[0].Rows[0]["ot14"].ToString();
                o15.Text = ds.Tables[0].Rows[0]["ot15"].ToString();
                o16.Text = ds.Tables[0].Rows[0]["ot16"].ToString();
                o17.Text = ds.Tables[0].Rows[0]["ot17"].ToString();
                o18.Text = ds.Tables[0].Rows[0]["ot18"].ToString();

                o19.Text = ds.Tables[0].Rows[0]["ot19"].ToString();
                o20.Text = ds.Tables[0].Rows[0]["ot20"].ToString();
                o21.Text = ds.Tables[0].Rows[0]["ot21"].ToString();
                o22.Text = ds.Tables[0].Rows[0]["ot22"].ToString();
                o23.Text = ds.Tables[0].Rows[0]["ot23"].ToString();
                o24.Text = ds.Tables[0].Rows[0]["ot24"].ToString();
                o25.Text = ds.Tables[0].Rows[0]["ot25"].ToString();
                o26.Text = ds.Tables[0].Rows[0]["ot26"].ToString();
                o27.Text = ds.Tables[0].Rows[0]["ot27"].ToString();
                o28.Text = ds.Tables[0].Rows[0]["ot28"].ToString();
                o29.Text = ds.Tables[0].Rows[0]["ot29"].ToString();
                o30.Text = ds.Tables[0].Rows[0]["ot30"].ToString();
                o31.Text = ds.Tables[0].Rows[0]["ot31"].ToString();

            }
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            Id = Request.QueryString["vid"].ToString();
            string empid1 = empid.Text;
            string sdt = DateTime.Now.ToString();
            string ovtime = otime.Text.ToString();
            string whr = whrs.Text.ToString();
            string rem = txtrem.Text.ToString();
            string clnam = clname.Text.ToString();
            string connam = txtcname.Text.ToString();
            string tper = txttime.SelectedItem.Text.ToString();
            string fdt = fromdate.Text.ToString();
            string tdt = todate.Text.ToString();
            string x1 = t1.Text.ToString();
            string x2 = t2.Text.ToString();
            string x3 = t3.Text.ToString();
            string x4 = t4.Text.ToString();
            string x5 = t5.Text.ToString();
            string x6 = t6.Text.ToString();
            string x7 = t7.Text.ToString();
            string x8 = t8.Text.ToString();
            string x9 = t9.Text.ToString();
            string x10 = t10.Text.ToString();
            string x11 = t11.Text.ToString();
            string x12 = t12.Text.ToString();
            string x13 = t13.Text.ToString();
            string x14 = t14.Text.ToString();
            string x15 = t15.Text.ToString();
            string x16 = t16.Text.ToString();
            string x17 = t17.Text.ToString();
            string x18 = t18.Text.ToString();
            string x19 = t19.Text.ToString();
            string x20 = t20.Text.ToString();
            string x21 = t21.Text.ToString();
            string x22 = t22.Text.ToString();
            string x23 = t23.Text.ToString();
            string x24 = t24.Text.ToString();
            string x25 = t25.Text.ToString();
            string x26 = t26.Text.ToString();
            string x27 = t27.Text.ToString();
            string x28 = t28.Text.ToString();
            string x29 = t29.Text.ToString();
            string x30 = t30.Text.ToString();
            string x31 = t31.Text.ToString();


            string y1 = o1.Text.ToString();
            string y2 = o2.Text.ToString();
            string y3 = o3.Text.ToString();
            string y4 = o4.Text.ToString();
            string y5 = o5.Text.ToString();
            string y6 = o6.Text.ToString();
            string y7 = o7.Text.ToString();
            string y8 = o8.Text.ToString();
            string y9 = o9.Text.ToString();
            string y10 = o10.Text.ToString();
            string y11 = o11.Text.ToString();
            string y12 = o12.Text.ToString();
            string y13 = o13.Text.ToString();
            string y14 = o14.Text.ToString();
            string y15 = o15.Text.ToString();
            string y16 = o16.Text.ToString();
            string y17 = o17.Text.ToString();
            string y18 = o18.Text.ToString();
            string y19 = o19.Text.ToString();
            string y20 = o20.Text.ToString();
            string y21 = o21.Text.ToString();
            string y22 = o22.Text.ToString();
            string y23 = o23.Text.ToString();
            string y24 = o24.Text.ToString();
            string y25 = o25.Text.ToString();
            string y26 = o26.Text.ToString();
            string y27 = o27.Text.ToString();
            string y28 = o28.Text.ToString();
            string y29 = o29.Text.ToString();
            string y30 = o30.Text.ToString();
            string y31 = o31.Text.ToString();

            bool streg = sdata.editts(Id, whr, ovtime, rem, sdt, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5,
                x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15,
                x16, y16, x17, y17, x18, y18, x19, y19, x20, y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25,
                x26, y26, x27, y27, x28, y28, x29, y29, x30, y30, x31, y31, clnam, connam, tper, fdt, tdt);
            if (streg)

                Response.Redirect("TimeSheet_Details.aspx");
        }
        catch
        {
        }
    }
    protected void txttime_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txttime.SelectedItem.Value.ToString() == "1")
        {
            fromdate.Text = "01-JAN-2009";
            todate.Text = "31-JAN-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "2")
        {
            fromdate.Text = "01-FEB-2009";
            todate.Text = "28-FEB-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "3")
        {
            fromdate.Text = "01-MAR-2009";
            todate.Text = "31-MAR-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "4")
        {
            fromdate.Text = "01-APR-2009";
            todate.Text = "30-APR-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "5")
        {
            fromdate.Text = "01-MAY-2009";
            todate.Text = "31-MAY-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "6")
        {
            fromdate.Text = "01-JUN-2009";
            todate.Text = "30-JUN-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "7")
        {
            fromdate.Text = "01-JUL-2009";
            todate.Text = "31-JUL-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "8")
        {
            fromdate.Text = "01-AUG-2009";
            todate.Text = "31-AUG-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "9")
        {
            fromdate.Text = "01-SEP-2009";
            todate.Text = "30-SEP-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "10")
        {
            fromdate.Text = "01-OCT-2009";
            todate.Text = "31-OCT-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "11")
        {
            fromdate.Text = "01-NOV-2009";
            todate.Text = "30-NOV-2009";
        }

        if (txttime.SelectedItem.Value.ToString() == "12")
        {
            fromdate.Text = "01-DEC-2009";
            todate.Text = "31-DEC-2009";
        }

    }
    protected void t1_TextChanged(object sender, EventArgs e)
    {
        x = Convert.ToInt32(t1.Text.ToString());
        y= Convert.ToInt32(whrs.Text.ToString());
        y = y + x;
        whrs.Text = Convert.ToString(y);

    }
}
