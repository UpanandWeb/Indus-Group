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
using igiit;
using System.Web.Configuration;

public partial class Emp_New_TimeSheet : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    string usid = string.Empty;
    int x = 0;
    int y = 0;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                SqlDataAdapter da = new SqlDataAdapter("select  * from employeereg1 where status=1 and empid like 'IGI%'  and emailid='" + Session["userid"] .ToString()+ "'", con);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    empid.Text = ds1.Tables[0].Rows[0]["empid"].ToString();
                    txtcname.Text = ds1.Tables[0].Rows[0]["firstname"].ToString() + ds1.Tables[0].Rows[0]["lastname"].ToString();
                    SqlDataAdapter da1 = new SqlDataAdapter("select  * from vendors where Emp_Id='" + empid.Text + "'", con);
                    DataSet ds11 = new DataSet();
                    da1.Fill(ds11);
                    if (ds11.Tables[0].Rows.Count > 0)
                    {

                        clname.Text = ds11.Tables[0].Rows[0]["Firm_Name"].ToString();
                    }

                }
            }
        }

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string id = "";
            SqlDataAdapter da = new SqlDataAdapter("select  * from employeereg1 where status=1 and empid like 'IGI%'  and emailid='" + Session["userid"].ToString() + "'", con);
            DataSet ds1 = new DataSet();
            da.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                id = ds1.Tables[0].Rows[0]["userid"].ToString();
            }

            string Eid = empid.Text;
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


            bool streg = sdata.addts(Eid, id, whr, ovtime, rem, sdt, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5,
                x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15,
                x16, y16, x17, y17, x18, y18, x19, y19, x20, y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25,
                x26, y26, x27, y27, x28, y28, x29, y29, x30, y30, x31, y31, clnam, connam, tper, fdt, tdt);
            if (streg)

                //cntdata.InnerHtml = tdcontent1.InnerHtml;
                Response.Redirect("Emp-TimeSheet.aspx");
            //Response.Redirect("TimeSheet_Mail.aspx?cid=" + usid);
        }
        catch
        {
        }
    }

    protected void txttime_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txttime.SelectedItem.Value.ToString() == "1")
        {
            fromdate.Text = "01-JAN-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-JAN-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "2")
        {
            fromdate.Text = "01-FEB-" + DateTime.Now.ToString("yyyy");
            todate.Text = "28-FEB-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "3")
        {
            fromdate.Text = "01-MAR-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-MAR-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "4")
        {
            fromdate.Text = "01-APR-" + DateTime.Now.ToString("yyyy");
            todate.Text = "30-APR-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "5")
        {
            fromdate.Text = "01-MAY-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-MAY-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "6")
        {
            fromdate.Text = "01-JUN-" + DateTime.Now.ToString("yyyy");
            todate.Text = "30-JUN-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "7")
        {
            fromdate.Text = "01-JUL-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-JUL-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "8")
        {
            fromdate.Text = "01-AUG-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-AUG-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "9")
        {
            fromdate.Text = "01-SEP-" + DateTime.Now.ToString("yyyy");
            todate.Text = "30-SEP-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "10")
        {
            fromdate.Text = "01-OCT-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-OCT-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "11")
        {
            fromdate.Text = "01-NOV-" + DateTime.Now.ToString("yyyy");
            todate.Text = "30-NOV-" + DateTime.Now.ToString("yyyy");
        }

        if (txttime.SelectedItem.Value.ToString() == "12")
        {
            fromdate.Text = "01-DEC-" + DateTime.Now.ToString("yyyy");
            todate.Text = "31-DEC-" + DateTime.Now.ToString("yyyy");
        }

    }

    protected void t1_TextChanged(object sender, EventArgs e)
    {
        x = Convert.ToInt32(t1.Text.ToString());
        y = Convert.ToInt32(whrs.Text.ToString());
        y = y + x;
        whrs.Text = Convert.ToString(y);
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-TimeSheet.aspx");

    }
}