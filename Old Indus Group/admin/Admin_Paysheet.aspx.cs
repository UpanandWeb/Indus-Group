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
using System.Collections.Generic;
using System.IO;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Net;
using System.Net.Mail;
public partial class admin_Admin_Paysheet : System.Web.UI.Page
{
    //List<timedet> utime = new List<timedet>();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds1;
    public static string actuarate;
    public static string employeerate;
    public static int fl;
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }       
        if (!IsPostBack)
        {
            string s = Session["utype"].ToString();
            if ((s == "Admin") || (s == "Accounts"))
            {
                allpay.Visible = true;
            }
            else
                allpay.Visible = false;

            lblMonth.Text = DateTime.Now.ToString("MMMM") + "'" + DateTime.Now.ToString("yy");
            //lblNext.Text = DateTime.Now.AddMonths(1).ToString("MMMM") + "'" + DateTime.Now.ToString("yy");
            lblNext.Text = lblMonth.Text;
            ddlEmpId.DataTextField = "empid";
            ddlEmpId.DataValueField = "empid";
            ddlEmpId.DataSource = getEmpId("");
            ddlEmpId.DataBind();
            ddlEmpId.Items.Insert(0, "Select");
        }        
    }
    public DataSet getEmpId(string col1)
    {
        string query = "";
        if (col1 == "")
            query = "select empid from employeereg1 where empid is not null";
        else
            query = "select firstname,lastname from employeereg1 where empid='" + col1 + "'";
        ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(query, con);
        da1.Fill(ds1);
        return ds1;
    }
    protected void txtH_Click(object sender, EventArgs e)
    {
        totalTime();
    }
    void totalTime()
    {
        try
        {
            int h1 = 0;
            int h2 = 0;
            int h3 = 0;
            int h4 = 0;
            int h5 = 0;
            if (txtHWeek5.Text != "")
            {
                if (txtHWeek1.Text != "")
                    h1 = Convert.ToInt32(txtHWeek1.Text);
                if (txtHWeek2.Text != "")
                    h2 = Convert.ToInt32(txtHWeek2.Text);
                if (txtHWeek3.Text != "")
                    h3 = Convert.ToInt32(txtHWeek3.Text);
                if (txtHWeek4.Text != "")
                    h4 = Convert.ToInt32(txtHWeek4.Text);
                h5 = Convert.ToInt32(txtHWeek5.Text);
                //FirstClear();
                txtTHrs.Text = Convert.ToString(h1 + h2 + h3 + h4 + h5);
                if (txtARate.Text != "")
                    ActualRate();
                if (txtEmRate.Text != "")
                    empgrosscal();
            }
            else
            {
                FClear();
                FirstClear();
                SecClear();
                secnext();
                thirdclear();
                advClear();
            }
        }
        catch
        {
        }
    }
    protected void txtA_Click(object sender, EventArgs e)
    {
        ActualRate();       
    }
    void ActualRate()
    {
        try
        {
            if (txtARate.Text != "")
            {
                secnext();
                thirdclear();
                advClear();
                txtTAdvance.Text = lbladva.Text;
               // txtBPer.Text = "";
                double th = Convert.ToDouble(txtTHrs.Text);
                double Ar = Convert.ToDouble(txtARate.Text);
                txtTotGross.Text = Convert.ToString(th * Ar);
                if (txtEmRate.Text != "")
                    empgrosscal();
            }
            else
            {
                FirstClear();
                SecClear();
                secnext();
                thirdclear();
                advClear();
                txtTotal.Text = lblpre.Text;
            }
        }
        catch
        {
        }
    }
    protected void txtE_Click(object sender, EventArgs e)
    {
        empgrosscal();
    }
    void empgrosscal()
    {
        try
        {
            if (txtEmRate.Text != "")
            {
                secnext();
                thirdclear();
                advClear();
                txtTAdvance.Text = lbladva.Text;
                //txtBPer.Text = "";
                double Ar = Convert.ToDouble(txtARate.Text);
                double Er = Convert.ToDouble(txtEmRate.Text);
                double per = Convert.ToDouble(100 - ((Er * 100) / Ar));
                double tot = Convert.ToDouble(txtTotGross.Text);
                double dedu = Convert.ToDouble((per * tot) / 100);
                double EAmount = Convert.ToDouble(tot - dedu);
                string sper = Convert.ToString(per);
                try
                {
                    txtMinusPer.Text = sper.Substring(0, 5);
                }
                catch
                {
                    txtMinusPer.Text = sper;
                }
                txtIGI.Text = Convert.ToString(dedu);
                txtEmpGross.Text = Convert.ToString(EAmount);
                txtNetpay.Text = txtEmpGross.Text;
                double netpay = Convert.ToDouble(txtNetpay.Text);                
                //when fixed salary 5000 (as per usa accounts requirement)
                if (netpay >= 5000)
                {
                    txtSalary.Text = "5000";
                    txtBonus.Text = Convert.ToString(netpay - 5000);
                }
                else
                {
                    txtSalary.Text = "";
                    txtBonus.Text = "";
                }
                txtGDeduct.Text = txtNetpay.Text;
                txtFinalTotal.Text = txtNetpay.Text;
            }
            else
            {
                SecClear();
                secnext();
                thirdclear();
                //txtBPer.Text = "";
                advClear();
                txtTotal.Text = lblpre.Text;
            }
        }
        catch
        { }
    }
    protected void Sal_Changed(object sender, EventArgs e)
    {
        try
        {
            txtAdvance.Text = "";
            if (txtBonus.Text != "")
            {
                double npay = Convert.ToDouble(txtNetpay.Text);
                double sal = Convert.ToDouble(txtSalary.Text);
                double bon = Convert.ToDouble(txtBonus.Text);
                double advance = Convert.ToDouble(lbladva.Text);
                double pbal = Convert.ToDouble(lblpre.Text);
                lbltotAdv.Text = "0";
                if ((sal + bon) <= npay)
                {
                    if (lblpre.Text == "0")
                    {
                        txtTotal.Text = Convert.ToString((npay - sal) - bon);
                    }
                    else
                    {
                        txtTotal.Text = Convert.ToString(((npay - sal) - bon) + pbal);
                    }
                    txtTAdvance.Text = lbladva.Text;
                }
                else if ((sal + bon) > npay)
                {
                    if (((sal + bon) - npay) > pbal)
                    {
                        txtTotal.Text = "0";
                        txtTAdvance.Text = Convert.ToString((((sal + bon) - npay) - pbal) + advance);
                        lbltotAdv.Text = txtTAdvance.Text;
                    }
                    //else if (lbladva.Text == "")
                    //{
                    //    txtTotal.Text = lblpre.Text;
                    //    txtTAdvance.Text = Convert.ToString((sal + bon) - npay);
                    //}
                    else
                    {
                        //double adv = Convert.ToDouble(txtTAdvance.Text);
                        txtTotal.Text = Convert.ToString(pbal - ((sal + bon) - npay));
                        txtTAdvance.Text = lbladva.Text;
                    }
                }
                txtGDeduct.Text = Convert.ToString(bon + sal);
                txtFinalTotal.Text = Convert.ToString(bon + sal);
                //txtGDeduct.Text = txtSalary.Text;
            }
            else
            {
                txtTotal.Text = lblpre.Text;
                txtTAdvance.Text = lbladva.Text;
                advClear();
            }
        }
        catch
        { }
    }
    protected void txtAdvances_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtAdvance.Text != "")
            {
                if (txtTAdvance.Text != "0")
                {
                    double adv = Convert.ToDouble(txtAdvance.Text);
                    double sal = Convert.ToDouble(txtSalary.Text);
                    double bon = Convert.ToDouble(txtBonus.Text);
                    double npay = Convert.ToDouble(txtNetpay.Text);
                    double advance = Convert.ToDouble(lbladva.Text);
                    double pbal = Convert.ToDouble(lblpre.Text);
                    double tot = sal + bon;
                    advChange();
                    double Tadv = Convert.ToDouble(txtTAdvance.Text);
                    if (Tadv >= adv)
                    {
                        if (txtTotal.Text == "0")
                        {
                            txtTAdvance.Text = Convert.ToString(((((sal + bon) - npay) - pbal) + advance) - adv);
                        }
                        else
                        {
                            txtTAdvance.Text = Convert.ToString(advance - adv);
                        }
                        txtGDeduct.Text = Convert.ToString(tot - adv);
                        txtFinalTotal.Text = Convert.ToString(tot - adv);
                    }
                    else
                    {
                        advChange();
                        txtAdvance.Text = "";
                        ModalPopupExtender2.Show();
                    }
                }
                else
                {
                    txtAdvance.Text = "";
                    advChange();
                    ModalPopupExtender2.Show();
                }
            }
            else
            {
                advChange();
                //txtTAdvance.Text = lbladva.Text;
            }
        }
        catch { }
    }
    void advChange()
    {
        if (lbltotAdv.Text != "0")
        {
            txtTAdvance.Text = lbltotAdv.Text;
        }
        else
            txtTAdvance.Text = lbladva.Text;
        double sal = Convert.ToDouble(txtSalary.Text);
        double bon = Convert.ToDouble(txtBonus.Text);
        txtGDeduct.Text = Convert.ToString(bon + sal);
        txtFinalTotal.Text = Convert.ToString(bon + sal);
    }
    protected void sala_Changed(object sender, EventArgs e)
    {
        try
        {
            if (txtSalary.Text != "")
            {
                txtAdvance.Text = "";
                double npay = Convert.ToDouble(txtNetpay.Text);
                double salary = Convert.ToDouble(txtSalary.Text);
                if (npay >= salary)
                    txtBonus.Text = Convert.ToString(npay - salary);
                else
                {
                    txtSalary.Text = txtNetpay.Text;
                    txtBonus.Text = "";
                }
                txtGDeduct.Text = txtNetpay.Text;
                txtFinalTotal.Text = txtNetpay.Text;
                txtTAdvance.Text = lbladva.Text;
            }
            else
            {
                thirdclear();
                advClear();
                txtTAdvance.Text = lbladva.Text;
            }
        }
        catch { }
    }
    protected void FornetSal_change(object sender, EventArgs e)
    {
        try
        {
            thirdclear();
            advClear();
            txtTAdvance.Text = lbladva.Text;
            //txtBPer.Text = "";
            double per = 0;
            double bef = 0;
            double empgro = Convert.ToDouble(txtEmpGross.Text);
            if (txtPDium.Text != "")
                per = Convert.ToDouble(txtPDium.Text);
            if (txtNewrate.Text != "")
                bef = Convert.ToDouble(txtNewrate.Text);
            double netpay = empgro - (per + bef);
            txtNetpay.Text = Convert.ToString(empgro - (per + bef));
            //when fixed salary 5000 (as per usa accounts requirement)
            if (netpay >= 5000)
            {
                txtSalary.Text = "5000";
                txtBonus.Text = Convert.ToString(netpay - 5000);
            }
            else
            {
                txtSalary.Text = "";
                txtBonus.Text = "";
            }
            txtGDeduct.Text = txtNetpay.Text;
            txtFinalTotal.Text = txtNetpay.Text;
        }
        catch { }
    }
    void FClear()
    {
        txtTHrs.Text = "";
    }
    void FirstClear()
    {
        txtARate.Text = actuarate;             
        txtTotGross.Text = "";        
    }
    void SecClear()
    {
        txtEmRate.Text = employeerate;     
        txtMinusPer.Text = "";
        txtIGI.Text = "";
        txtEmpGross.Text = "";
       // txtBPer.Text = "";
    }
    void thirdclear()
    {
        txtSalary.Text = "";
        txtBonus.Text = "";
        ddlImmig.SelectedIndex = -1;
    }
    void secnext()
    {
        txtPDium.Text = "";
        txtNewrate.Text = "";
        txtNetpay.Text = "";
    }
    void advClear()
    {
        //txtTotal.Text = "";
        txtAdvance.Text = "";
        txtGDeduct.Text = "";
        txtFinalTotal.Text = "";       
    }
    void clerid()
    {
        txtFname.Text = "";
        txtLname.Text = "";
        //txtEmpId.Text = "";
        ddlEmpId.SelectedIndex = -1;
    }
    void clearall()
    {       
        txtFWeek1.Text = "";
        txtFWeek2.Text = "";
        txtFWeek3.Text = "";
        txtFWeek4.Text = "";
        txtFWeek5.Text = "";

        txtTWeek1.Text = "";
        txtTWeek2.Text = "";
        txtTWeek3.Text = "";
        txtTWeek4.Text = "";
        txtTWeek5.Text = "";

        txtHWeek1.Text = "";
        txtHWeek2.Text = "";
        txtHWeek3.Text = "";
        txtHWeek4.Text = "";
        txtHWeek5.Text = "";

        rdlist.SelectedIndex = 0;
    }
    
    //protected void btnPrint_click(object sender, EventArgs e)
    //{
    //    utime = getdate();        
    //    grd1.DataSource = utime;
    //    grd1.DataBind();
    //}

    //public List<timedet> getdate()
    //{
    //    timedet dt = new timedet();
    //    dt.FName = "ravi";
    //    dt.LName = "sirigiri";
    //    dt.Id = "igi121";
    //    utime.Add(dt);
    //    return utime;
    //}    
    //public class timedet
    //{

    //    string fname = string.Empty;
    //    string lname = string.Empty;
    //    string ids = string.Empty;
    //    public string FName
    //    {
    //        get { return fname; }
    //        set { fname = value; }
    //    }
    //    public string LName
    //    {
    //        get { return lname; }
    //        set { lname = value; }
    //    }
    //    public string Id
    //    {
    //        get { return ids; }
    //        set { ids = value; }
    //    }
    //}

    protected void ddlEmpId_Changed(object sender, EventArgs e)
    {
        FClear();
        FirstClear();
        SecClear();
        secnext();
        thirdclear();
        clearall();
        try
        {
            if (ddlEmpId.SelectedIndex != 0)
            {
                binddetails(ddlEmpId.SelectedItem.Text);
                ds1 = getEmpId(ddlEmpId.SelectedItem.Text);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    txtFname.Text = ds1.Tables[0].Rows[0]["firstname"].ToString();
                    txtLname.Text = ds1.Tables[0].Rows[0]["lastname"].ToString();
                }
            }
            else
            {
                txtFname.Text = "";
                txtLname.Text = "";
            }
        }
        catch
        { }
    }
    void binddetails(string userid)
    {
        ds1 = new DataSet();
        string quer = "select top(1) TotAdva,prebal,mont,ActualRate,EmpRate,datepart(yy,billdate) as year,flag,visaType from MonthPay where EmpId='" + userid + "' order by mpid desc";
        SqlDataAdapter da1 = new SqlDataAdapter(quer, con);
        da1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            string mm = DateTime.Now.Date.ToString("MMMMM");
            string yy = DateTime.Now.Year.ToString();
            if ((ds1.Tables[0].Rows[0]["mont"].ToString() == mm) && (ds1.Tables[0].Rows[0]["year"].ToString() == yy))
            {
                //already make a payment popup
                if ((ds1.Tables[0].Rows[0]["flag"].ToString() == "0")||(ds1.Tables[0].Rows[0]["flag"].ToString() == "2"))
                    ModalPopupExtender3.Show();
                else
                {
                    bindfields(ds1);                    
                }
            }
            else 
            {
                bindfields(ds1);                
            }
        }
        else
        {
            fl = 0;
            lblpre.Text = "0";
            lbladva.Text = "0";
            actuarate = "";
            employeerate = "";
            rdlist.Enabled = true;
        }
        txtARate.Text = actuarate;
        txtEmRate.Text = employeerate;
        txtTotal.Text = lblpre.Text;
        txtTAdvance.Text = lbladva.Text;
        lbltotAdv.Text = "0";
    }

    void bindfields(DataSet dset)
    {
        fl = Convert.ToInt32(dset.Tables[0].Rows[0]["flag"].ToString());
        rdlist.SelectedValue = dset.Tables[0].Rows[0]["flag"].ToString();
        if (rdlist.SelectedValue == "1")
        {            
            rdlist.Enabled = false;
        }
        else
        {           
            rdlist.Enabled = true;
        }
        ddlImmig.SelectedValue = dset.Tables[0].Rows[0]["visaType"].ToString();
        lblpre.Text = dset.Tables[0].Rows[0]["prebal"].ToString();
        lbladva.Text = dset.Tables[0].Rows[0]["TotAdva"].ToString();
        actuarate = dset.Tables[0].Rows[0]["ActualRate"].ToString();
        employeerate = dset.Tables[0].Rows[0]["EmpRate"].ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_insTwoTab", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@fna", txtFname.Text);
        //cmd.Parameters.AddWithValue("@lna", txtLname.Text);
        //string s = DateTime.Now.Date.AddMonths(7).ToString("MMMMM");
        cmd.Parameters.AddWithValue("@mon", DateTime.Now.Date.ToString("MMMMM"));
        cmd.Parameters.AddWithValue("@eid", ddlEmpId.SelectedItem.Text);

        cmd.Parameters.AddWithValue("@fw1", txtFWeek1.Text);
        cmd.Parameters.AddWithValue("@tw1", txtTWeek1.Text);
        cmd.Parameters.AddWithValue("@hw1", txtHWeek1.Text);

        cmd.Parameters.AddWithValue("@fw2", txtFWeek2.Text);
        cmd.Parameters.AddWithValue("@tw2", txtTWeek2.Text);
        cmd.Parameters.AddWithValue("@hw2", txtHWeek2.Text);

        cmd.Parameters.AddWithValue("@fw3", txtFWeek3.Text);
        cmd.Parameters.AddWithValue("@tw3", txtTWeek3.Text);
        cmd.Parameters.AddWithValue("@hw3", txtHWeek3.Text);

        cmd.Parameters.AddWithValue("@fw4", txtFWeek4.Text);
        cmd.Parameters.AddWithValue("@tw4", txtTWeek4.Text);
        cmd.Parameters.AddWithValue("@hw4", txtHWeek4.Text);

        cmd.Parameters.AddWithValue("@fw5", txtFWeek5.Text);
        cmd.Parameters.AddWithValue("@tw5", txtTWeek5.Text);
        cmd.Parameters.AddWithValue("@hw5", txtHWeek5.Text);

        cmd.Parameters.AddWithValue("@thour", txtTHrs.Text);
        cmd.Parameters.AddWithValue("@arate", txtARate.Text);
        cmd.Parameters.AddWithValue("@emrate", txtEmRate.Text);
        cmd.Parameters.AddWithValue("@pdium", txtPDium.Text);
        cmd.Parameters.AddWithValue("@bepay", txtNewrate.Text);
        cmd.Parameters.AddWithValue("@tgross", txtTotGross.Text);
        cmd.Parameters.AddWithValue("@minper", txtMinusPer.Text);
        cmd.Parameters.AddWithValue("@igi", txtIGI.Text);
        cmd.Parameters.AddWithValue("@emgross", txtEmpGross.Text);
        cmd.Parameters.AddWithValue("@npay", txtNetpay.Text);
        
        cmd.Parameters.AddWithValue("@sal", txtSalary.Text);
        cmd.Parameters.AddWithValue("@bonus", txtBonus.Text);

        cmd.Parameters.AddWithValue("@adv", txtAdvance.Text);
        cmd.Parameters.AddWithValue("@Totadv", txtTAdvance.Text);

        cmd.Parameters.AddWithValue("@gdeduct", txtGDeduct.Text);
        cmd.Parameters.AddWithValue("@immtype", ddlImmig.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@prebal", txtTotal.Text);
        int counfl = Convert.ToInt32(rdlist.SelectedValue) + fl;
        cmd.Parameters.AddWithValue("@ptype", counfl);
        cmd.Parameters.AddWithValue("@bDate", DateTime.Now.Date.ToString());

        int flag = cmd.ExecuteNonQuery();
        if ((flag == 1)||(flag==2))
        {
            rdlist.Enabled = true;
            SendMail(Session["utype"].ToString(), txtFname.Text, txtLname.Text, DateTime.Now.Date.ToString("MMMMM"), txtTHrs.Text, txtARate.Text, txtEmRate.Text,
                txtPDium.Text, txtNewrate.Text, txtTotGross.Text, txtMinusPer.Text, txtIGI.Text, txtEmpGross.Text, txtNetpay.Text, 
                txtSalary.Text, txtBonus.Text,txtAdvance.Text, txtTAdvance.Text, txtGDeduct.Text, ddlImmig.SelectedItem.Text,txtTotal.Text,
                DateTime.Now.Date.ToString());
            FClear();
            FirstClear();
            SecClear();
            secnext();
            thirdclear();
            advClear();
            clearall();
            txtTotal.Text = "";
            txtTAdvance.Text = "";
            clerid();
            
            //modalpopup
            //lblpopmessage.InnerText = "Payment details saved successfully !!!";            
            mdpop.Show();
            //ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'>alert('Insert Paysheet successfully !!!');</script>");
        }
        else
        {
            //lblpopmessage.InnerText = "Error!!! while saved payment details !!!";           
            ModalPopupExtender1.Show();
            //ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'>alert('Error !!! while inserting Paysheet ');</script>");
        }
        con.Close();             
    }
    
    private void SendMail(string uname,string fna, string lna, string mon, string hrs, string arate, string emrate, string pdium, string berate,
        string totgr,string minus, string igi, string empgross, string netpay, string salary, string bonus, string adv, string totadv, 
        string gded,string immtype,string prebale,string billdate )
    {
        string Msg = "";
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("info@igiit.com");
        mm.To.Add("ravi_iginc@yahoo.com");
        //mm.Bcc.Add();
        Msg += "<br/> Message about payment details from Indusgroup admin site <br/>" + uname +
            "  creating a new Paysheet for" + mon + " month  <br/><br/>" +
         "<u>Payment details </u><br/>First Name : " + fna +
          "<br>" +
               "<br>Last Name : " + lna + "<br>" + "<br>Total Hours : " + hrs + "<br>" + "<br>Actual Rate : " + arate +
                 "$<br/>" + "<br>Total Gross : " + totgr + "$<br>" + "<br>Employee Rate : " + emrate + "$<br>" +
                 "<br>Minus Percentage : " + minus + "%" + "<br>" + "<br>IGI Gross : " + igi + "$<br>" + "<br>Employee Gross : " + empgross +
                 "$<br>" + "<br>Per Dium : " + pdium + "$<br>" + "<br>Before Pay : " + berate +
                "$<br>" + "<br>Net Pay : " + netpay + "$<br/>" + "<br>Salary : " + salary +
              "$<br>" + "<br>Bonus : " + bonus + "$<br>" + "<br>Pre Balance : " + prebale + "$" +
               "<br>" + "<br>Total Advance : " + totadv +
                 "$<br>" +
                 "<br>" + "<br>Gross After Deduct : " + gded + "$<br/>" + "<br>Immigration Type : " + immtype +
              "<br>_______________" + "<br>Total : " + gded + "$<br>_______________" +
              "<br>" + "Bill Date : " + billdate + "(UTC)" +
               "<br>" + "For confermation, please enquire to " + uname;
        mm.Subject = "Payroll sheet from Indusgroup admin site";
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
