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
 
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
public partial class admin_Admin_AllPaysheets : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds;
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

            Binddata();
        }
    }
   
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gridview1.PageIndex = e.NewPageIndex;
        Binddata();
    }
    private void Binddata()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("select e.firstname,e.lastname,m.mpid,m.mont,datepart(yy,m.billdate) as yer,m.totHours,m.ActualRate,m.EmpRate,m.Prebal,m.totAdva,m.FinalPay,m.Flag from monthpay m join employeereg1 e on m.empid=e.empid order by m.mpid desc ", con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblNoRecord.Visible = false;
            Gridview1.DataSource = ds;
            Gridview1.DataBind();
        }
        else
        {
            lblNoRecord.Visible = true;
            lblNoRecord.Text = "No Record Found.";
        }
    }
    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "mpid"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }
    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        string mpid = Gridview1.DataKeys[gvrow.RowIndex].Value.ToString();           
        fillLables(mpid);           
    }
    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;        
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;        
        int mpid = Convert.ToInt32(Gridview1.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from MonthPay where mpid=" + mpid + "; delete from MonthTable where mId=" + mpid, con);
        int result = cmd.ExecuteNonQuery();
        //int result = 1;
        con.Close();
        if ((result == 1) || (result == 2))
        {
            Binddata();
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pay sheet details deleted Successfully');", true);
        }       
    }
    
    void fillLables(string id)
    {

        string quer = "select e.firstname,e.lastname,m.EmpId,m.mont,m.totHours,m.Prebal,m.TotAdva,m.visaType,convert(varchar(12),m.BillDate,103) as BillDate,m.ActualRate,m.totGross," +
            "m.EmpRate,m.EmpRate,m.IGIGross,m.empGross,m.pDium,m.bePay,m.netPay,m.advaPay,m.FinalPay" +
            " from monthpay as m inner join employeereg1 as e on m.EmpId=e.empid  where m.mpid=" + id ;
        ds = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(quer, con);
        da1.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            pnlTop.Visible = true;
            lblNoRecord.Visible = false;
            lblName.Text = ds.Tables[0].Rows[0]["firstname"].ToString() +" "+ ds.Tables[0].Rows[0]["lastname"].ToString();
            lblId.Text = ds.Tables[0].Rows[0]["EmpId"].ToString();
            lblMonth.Text = ds.Tables[0].Rows[0]["mont"].ToString();
            lblHours.Text = ds.Tables[0].Rows[0]["totHours"].ToString();
            lblpBal.Text = ds.Tables[0].Rows[0]["Prebal"].ToString();
            lblTAdvance.Text = ds.Tables[0].Rows[0]["TotAdva"].ToString();
            lblImmig.Text = ds.Tables[0].Rows[0]["visaType"].ToString();
            lblBiDate.Text = ds.Tables[0].Rows[0]["BillDate"].ToString();
            lblARate.Text = ds.Tables[0].Rows[0]["ActualRate"].ToString();
            lblTGross.Text = ds.Tables[0].Rows[0]["totGross"].ToString();
            lblERate.Text = ds.Tables[0].Rows[0]["EmpRate"].ToString();
            lblIGI.Text = ds.Tables[0].Rows[0]["IGIGross"].ToString();
            lblEGross.Text = ds.Tables[0].Rows[0]["empGross"].ToString();
            lblpDium.Text = ds.Tables[0].Rows[0]["pDium"].ToString();
            lblBePay.Text = ds.Tables[0].Rows[0]["bePay"].ToString();
            lblNetpay.Text = ds.Tables[0].Rows[0]["netPay"].ToString();
            lblPAdvance.Text = ds.Tables[0].Rows[0]["advaPay"].ToString();
            lblTotPay.Text = ds.Tables[0].Rows[0]["FinalPay"].ToString();
        }
        else
        {
            lblNoRecord.Text = "No Record Found.";
            lblNoRecord.Visible = true;
            pnlTop.Visible = false;
        }
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        SendMail(Session["utype"].ToString(), lblId.Text, lblMonth.Text, DateTime.Now.ToString());
    }

    private void SendMail(string uname, string eid, string monpay, string acctime)
    {
        string Msg = "";
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("info@igiit.com");
        mm.To.Add("ravi_iginc@yahoo.com");
        //mm.Bcc.Add();
        Msg += "<br/> Message about payment printing from Indusgroup admin site <br/><br/>" + uname +
            "  try to take print of Employeee ID(" + eid + ") for"+monpay+" month payroll sheet at "+acctime+"(UTC)  <br/><br/>"+
               "<br>" + "For confermation please enquire to " + uname;
        mm.Subject = uname + " try to take print of payroll sheet from Indusgroup admin site.";
        mm.IsBodyHtml = true;
        mm.Body = Msg;
        SmtpClient smtp = new SmtpClient();
        try
        {
            smtp.Send(mm);
        }
        catch
        {
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="uname"></param>
    /// <param name="eid"></param>
    /// <param name="monpay"></param>
    /// <param name="acctime"></param>
    private void deleteMail1(string uname, string eid, string monpay, string acctime)
    {
        string Msg = "";
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("info@igiit.com");
        mm.To.Add("ravi_iginc@yahoo.com");
        //mm.Bcc.Add();
        Msg += "<br/> Message about payroll sheet delete from Indusgroup admin site <br/><br/>" + uname +
            "  delete the Payroll sheet of Employeee ID(" + eid + ") for" + monpay + " month, at " + acctime + "(UTC)  <br/><br/>" +
               "<br>" + "For confermation please enquire to " + uname;
        mm.Subject = uname + " delete the record of payroll sheet from Indusgroup admin site.";
        mm.IsBodyHtml = true;
        mm.Body = Msg;
        SmtpClient smtp = new SmtpClient();
        try
        {
            smtp.Send(mm);
        }
        catch
        {
        }
    }
   
}
