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

public partial class TimeSheet_Mail : System.Web.UI.Page
{
    string filldet = string.Empty;
    string usid = string.Empty;
    DataSet ds = new DataSet();
    DataSet dst = new DataSet();
    IGIIT sdata = new IGIIT();
    string fmail = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Request.QueryString["cid"] != null)
            usid = Request.QueryString["cid"].ToString();
        

        DataSet ds = new DataSet();
        string empname = string.Empty;
        string address = string.Empty;
        string lxus = string.Empty;

        //ds = sdata.GetEmpDetails(usid);
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    empname = ds.Tables[0].Rows[0]["firstname"].ToString() + " " + ds.Tables[0].Rows[0]["middlename"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString();
            //    address = ds.Tables[0].Rows[0]["street"].ToString() + ", " + ds.Tables[0].Rows[0]["city1"].ToString() + ", " + ds.Tables[0].Rows[0]["state1"].ToString() + ", " + ds.Tables[0].Rows[0]["country1"].ToString() + " - " + ds.Tables[0].Rows[0]["zip"].ToString();
            //    fmail = ds.Tables[0].Rows[0]["emailid"].ToString();
            //}
            dst = sdata.GetTimeSheetView(usid);


            filldet = "<table><tr><td class='lable' align='center' style='font-weight: bold; font-size: 20pt'>" + "Time Sheet </td></tr>";
            if (dst.Tables[0].Rows.Count > 0)
            {
                lxus = dst.Tables[0].Rows[0]["userid"].ToString();
                ds = sdata.GetEmpDetails(lxus);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    empname = ds.Tables[0].Rows[0]["firstname"].ToString() + " " + ds.Tables[0].Rows[0]["middlename"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString();
                    address = ds.Tables[0].Rows[0]["street"].ToString() + ", " + ds.Tables[0].Rows[0]["city1"].ToString() + ", " + ds.Tables[0].Rows[0]["state1"].ToString() + ", " + ds.Tables[0].Rows[0]["country1"].ToString() + " - " + ds.Tables[0].Rows[0]["zip"].ToString();
                    fmail = ds.Tables[0].Rows[0]["emailid"].ToString();
                }
 
                //filldet = filldet + "<tr><td class='lable'>From Date : " + dst.Tables[0].Rows[0]["fromdate"].ToString() + " To Date: " + dst.Tables[0].Rows[0]["todate"].ToString() + "</tr></td>";

                filldet = filldet + "<tr><td class='lable'><table><tr><td>Employee Name </td><td>:</td><td>" + empname + "</td></tr>";
                filldet = filldet + "<tr><td class='lable'>Address</td><td>: </td><td>" + address + "</td></tr>";
                filldet = filldet + "<tr height='10'><td class='lable' colspan='3'>&nbsp;</td></tr>";
                filldet = filldet + "<tr height='10'><td class='lable' colspan='3'>&nbsp;</td></tr>";

                filldet = filldet + "<tr><td class='lable'>Consultant</td><td>:</td><td>" + dst.Tables[0].Rows[0]["consname"].ToString() + "</td></tr>";

                filldet = filldet + "<tr><td class='lable'>Client Name</td><td>:</td><td>" + dst.Tables[0].Rows[0]["clientname"].ToString() + "</td></tr>";

                filldet = filldet + "<tr><td class='lable'>TimePeriod</td><td>:</td><td>" + dst.Tables[0].Rows[0]["timeperiod"].ToString() + "</td></tr>";

                filldet = filldet + "<tr><td class='lable'>FromDate</td><td>:</td><td>" + dst.Tables[0].Rows[0]["fromdate"].ToString() + "</td></tr>";
                filldet = filldet + "<tr><td class='lable'>Todate</td><td>:</td><td> " + dst.Tables[0].Rows[0]["todate"].ToString() + "</td></tr></table></td></tr>";
               
                filldet = filldet + "<tr height='10'><td class='lable'>&nbsp;</td></tr>";
                filldet = filldet + "<tr height='10'><td class='lable'>&nbsp;</td></tr>";

                filldet = filldet + "<tr height='10'><td class='lable'><table>";
                filldet = filldet + "<tr><td align='center' class='lable' width='30'>Date </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 1 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 2 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 3 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 4 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 5 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 6 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 7 </td>";

                filldet = filldet + "<td align='center' class='lable' width='30'> 8 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 9 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 10 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 11 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 12 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 13</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 14 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 15 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>  </td></tr>";

                filldet = filldet + "<tr><td align='center' class='lable' width='30'>Reg. </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd1"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd2"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd3"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd4"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd5"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd6"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd7"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd8"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd9"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd10"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd11"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd12"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd13"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd14"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd15"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + "</td></tr>";

                //filldet = filldet + "<tr height='15'><td colspan='16' class='lable'>&nbsp;</td></tr>";
                


                filldet = filldet + "<tr><td align='center' class='lable' width='30'>OT. </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot1"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot2"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot3"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot4"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot5"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot6"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot7"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot8"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot9"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot10"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot11"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot12"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot13"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot14"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot15"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + "</td></tr>";

                filldet = filldet + "<tr height='15'><td colspan='17' class='lable'>&nbsp;</td></tr>";

                //filldet = filldet + "<tr height='10'><td class='lable'><table>";
                filldet = filldet + "<tr><td align='center' class='lable' width='30'>Date </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 16 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 17 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 18 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 19 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 20 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 21 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 22 </td>";

                filldet = filldet + "<td align='center' class='lable' width='30'> 23 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 24 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 25 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 26 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 27 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 28</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 29 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 30 </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'> 31 </td></tr>";

                filldet = filldet + "<tr><td align='center' class='lable' width='30'>Reg. </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd16"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd17"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd18"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd19"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd20"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd21"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd22"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd23"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd24"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd25"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd26"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd27"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd28"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd29"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd30"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["rd31"].ToString() + "</td><td></td></tr>";


                filldet = filldet + "<tr><td align='center' class='lable' width='30'>OT. </td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot16"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot17"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot18"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot19"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot20"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot21"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot22"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot23"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot24"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot25"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot26"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot27"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot28"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot29"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot30"].ToString() + "</td>";
                filldet = filldet + "<td align='center' class='lable' width='30'>" + dst.Tables[0].Rows[0]["ot31"].ToString() + "</td><td></td></tr>";

                filldet = filldet + "<tr height='15'><td colspan='17' class='lable'>&nbsp;</td></tr>";
                filldet = filldet + "</table></td></tr>";

                filldet = filldet + "<tr><td class='lable'><table><tr><td>Total Working Hours</td><td>:</td><td> " + dst.Tables[0].Rows[0]["workhrs"].ToString() + "</td></tr>";
                filldet = filldet + "<tr><td class='lable'>Total Over Time Hours </td><td>:</td><td> " + dst.Tables[0].Rows[0]["overtime"].ToString() + "</td></tr>";
                filldet = filldet + "<tr height='20'><td class='lable' colspan='3'>&nbsp;</td></tr>";

                filldet = filldet + "<tr><td class='lable'>Comments </td><td>:</td><td> " + dst.Tables[0].Rows[0]["remarks"].ToString() + "</td></tr></table></td></tr>";

                filldet = filldet + "<tr><td class='lable' align='center' style='font-weight: bold; font-size: 15pt'>Instrustions </td></tr>";

                filldet = filldet + "<tr><td class='lable' align='center'>Please enter regular hours in Reg. cell and over time hours in OT cell. All days in the specified time period must be filled.  Use Codes as follows:  V = Vacation, H = Holiday Monthly: 1 - 30/31 days, Mon-Sun. Fax completed Time Sheet within 3 days of Time Period.</td></tr>";
                filldet = filldet + "<tr height='20'><td class='lable'>&nbsp;</td></tr>";
                filldet = filldet + "<tr><td class='lable' align='center'>Indus Group Inc. 1033 Sterling Road, Ste. 204, Herndon - VA - 20170, USA. www.igiit.ws email: info@igiit.com, Phone:  703-968-6268 Ext.224 / Fax: 703-842-8746 </td></tr>";
                filldet = filldet + "</table>";

            }

            tdcontent.InnerHtml = filldet;
    }
    protected void maillbtn_Click(object sender, EventArgs e)
    {

        string Msg = "";
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = fmail;
            //mm.From = "rlaxmi2003@yahoo.com";
            //mm.From = "rlaxmi2003@gmail.com";
            //mm.To = UMail;
            mm.To = "accounts@igiit.com";
            Msg += filldet;
            mm.Subject = "Subject : Time Sheet";
            mm.BodyFormat = MailFormat.Html;
            mm.Body = Msg;
            SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];

            SmtpMail.Send(mm);
            Response.Redirect("Admin_TimeSheet.aspx");
        }
        catch (Exception ex)
        {
           // lblmail.Text = ex.Message;
        }
    }

}
