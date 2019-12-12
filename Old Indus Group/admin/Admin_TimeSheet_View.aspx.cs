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

public partial class Admin_TimeSheet_View : System.Web.UI.Page
{
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
        string Eemail = "";
        //usid = Request.QueryString["cid"].ToString();
        DataSet dsemail = sdata.GetEmpDetails(usid);
        if (dsemail.Tables[0].Rows.Count > 0)
        {
             Eemail = dsemail.Tables[0].Rows[0]["emailid"].ToString();
        }
        DataSet ds = new DataSet();

            //ds = sdata.GetTimeSheetView(usid);
        ds = sdata.Get_EmpTimeSheetView(usid, Id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //empid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                empid.Text = Eemail;
                otime.Text = ds.Tables[0].Rows[0]["overtime"].ToString();
                whrs.Text = ds.Tables[0].Rows[0]["workhrs"].ToString();
                txtrem.Text = ds.Tables[0].Rows[0]["remarks"].ToString();
                clname.Text = ds.Tables[0].Rows[0]["clientname"].ToString();
                txtcname.Text = ds.Tables[0].Rows[0]["consname"].ToString();
                txttime.Text = ds.Tables[0].Rows[0]["timeperiod"].ToString();
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
            else
            {
                string strr = "alert(No records found');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert" ,strr,true);
            }
    }
}
