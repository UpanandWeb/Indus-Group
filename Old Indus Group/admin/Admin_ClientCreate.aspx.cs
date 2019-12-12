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
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using igiit.safeConvert;
using System.Web.Configuration;

public partial class Admin_ClientCreate : System.Web.UI.Page
{
    bool Regis = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        btn_continue.Attributes.Add("onClick", "return validatefields()");
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

    protected void btn_continue_Click(object sender, EventArgs e)
    {

        igiit.PropertiesLayer.RegistrationProperties oRegprop = new igiit.PropertiesLayer.RegistrationProperties();
        string strResult = string.Empty;
        string StrEmailExists = string.Empty;
        string emailid = Convert.ToString(txtcompmail.Text);
        string uname = Convert.ToString(txtusername.Text);
       
        string f1 = "1";
        EmpRegistration oreg = new EmpRegistration();

        Int32 j = Convert.ToInt32(oreg.CheckUserName(uname));
        Int32 i = Convert.ToInt32(oreg.CheckEmailid(emailid));
       
        if (j != 0)
        {
            lblmail.Text = "The Given " + uname + " Already Exists, Please Enter another UserName";

        }
        else if (i != 0)
        {
            lblmail.Text = "The Given " + emailid + " Already Exists, Please Enter another Email Id";

        }
        else
        {
            try
            {
                oRegprop.vUserName = Convert.ToString(txtusername.Text.Replace("'", "''"));
                oRegprop.vPassword = Convert.ToString(txtpwd.Text.Replace("'", "''").Trim());
                oRegprop.vName = Convert.ToString(txtcompname.Text.Replace("'", "''").Trim());
                oRegprop.vEMail = Convert.ToString(txtcompmail.Text.Replace("'", "''").Trim());
                oRegprop.vIndType = Convert.ToString(indtype.Text.Replace("'", "''").Trim());

                oRegprop.vCPerson = Convert.ToString(conperson.Text.Replace("'", "''").Trim());
                oRegprop.vCPDesig = Convert.ToString(cpersondesig.Text.Replace("'", "''").Trim());
                oRegprop.vComp_URL = Convert.ToString(txturl.Text.Replace("'", "''").Trim());
                oRegprop.vAddress = Convert.ToString(praddr.Text.Replace("'", "''").Trim());
                oRegprop.vStreet = Convert.ToString(staddr.Text.Replace("'", "''").Trim());
                oRegprop.vCountry = Convert.ToString(country.Text.Replace("'", "''").Trim());
                oRegprop.vState = Convert.ToString(state.Text.Replace("'", "''").Trim());
                oRegprop.vCity = Convert.ToString(city.Text.Replace("'", "''").Trim());

                oRegprop.vWork1Ccode = Convert.ToString(W1_ccode.Text.Replace("'", "''"));
                oRegprop.vWork1Acode = Convert.ToString(W1_acode.Text.Replace("'", "''"));
                oRegprop.vWork1Phone = Convert.ToString(W1_phno.Text.Replace("'", "''"));
                oRegprop.vWork2Ccode = Convert.ToString(W2_ccode.Text.Replace("'", "''"));
                oRegprop.vWork2Acode = Convert.ToString(W2_acode.Text.Replace("'", "''"));
                oRegprop.vWork2Phone = Convert.ToString(W2_phno.Text.Replace("'", "''"));
                oRegprop.vFax = Convert.ToString(txtfax.Text.Replace("'", "''"));
                oRegprop.vDesc = Convert.ToString(txtdesc.Text.Replace("'", "''"));
                oRegprop.vPDate = (System.DateTime.Today.Date).ToString();

                oRegprop.vFlag1 = f1;

                EmpRegistration oregistration = new EmpRegistration();
                Regis = oregistration.InsertEmp(oRegprop.vUserName, oRegprop.vPassword, oRegprop.vName, oRegprop.vEMail, oRegprop.vIndType, oRegprop.vCPerson, oRegprop.vCPDesig,
                       oRegprop.vComp_URL, oRegprop.vAddress, oRegprop.vStreet, oRegprop.vCountry, oRegprop.vState, oRegprop.vCity, oRegprop.vWork1Ccode, oRegprop.vWork1Acode,
                       oRegprop.vWork1Phone, oRegprop.vWork2Ccode, oRegprop.vWork2Acode, oRegprop.vWork2Phone, oRegprop.vFax, oRegprop.vDesc, oRegprop.vPDate, oRegprop.vFlag1);

                if (Regis.Equals(true))
                {
                    //DataSet dsUserDetails = new DataSet();
                    //EmpCheckuser oReguser = new EmpCheckuser();
                    //Int32 Count = 0;
                    //Int32 UserID = 0;
                    //string ActiveId = string.Empty;
                    //string UName = string.Empty;
                    //string EMailId = string.Empty;
                    //string FName = string.Empty;
                    //string Flag = string.Empty;
                    //if ((oRegprop.vUserName != "") && (oRegprop.vPassword != ""))
                    //{
                    //    Count = oReguser.FindRecords(oRegprop.vUserName, oRegprop.vPassword);
                    //    if (Count.Equals(1))
                    //    {
                    //        dsUserDetails = oReguser.getNewUserDetails(oRegprop.vUserName, oRegprop.vPassword);
                            
                    //        if (!dsUserDetails.Tables["UserDetails"].Rows.Count.Equals(0))
                    //        {
                    //            UserID = Convert.ToInt32((dsUserDetails.Tables[0].Rows[0]["userid"].ToString()));

                    //            UName = dsUserDetails.Tables[0].Rows[0]["username"].ToString();
                    //            FName = dsUserDetails.Tables[0].Rows[0]["cname"].ToString();
                    //            Flag = dsUserDetails.Tables[0].Rows[0]["flag1"].ToString();

                    //            EMailId = oRegprop.vEMail;
                    //            Session["Authentication"] = "true";
                    //            Session.Add("USERID", UserID);
                    //            Session.Add("UserName", UName);
                    //            Session.Add("Name", FName);
                    //            Session.Add("FLAG", Flag);


                    //            WelcomeMail(UserID, oRegprop.vEMail, oRegprop.vPassword, UName, oRegprop.vUserName);
                    //            string str = "reg";
                    //            Response.Redirect("Emp_Home.aspx");
                    //        }
                    //    }

                    //}
                    
                    Response.Redirect("Admin_Client.aspx?ret=ok");
                }
                else
                {
                    lblmail.Text = "";
                    string msg = "Client Registration Failed";
                  //  Response.Redirect("Admin_Client.aspx?err=" + msg.ToString());
                    lblmail.Text = msg.ToString();
                }

            }
            catch
            {
            }
        }

    }

    private void WelcomeMail(Int32 Uid, string UMail, string Pass, string UName, string Usrname)
    {
        string Msg = "";
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = "info@igiit.net";
            mm.To = UMail;
            Msg += "Dear " + Usrname + ",<br>" +
                    "<br>Thank you for Registering with igiit.com.<br>" +
                    "<br>Your UserName is :" + UName + "<br>" +
                    "<br>Your Password is :" + Pass + "<br>";

            mm.Subject = "Subject : Welcome to Indus Group";
            mm.BodyFormat = MailFormat.Html;
            mm.Body = Msg;
            SmtpMail.Send(mm);
            //Response.Redirect("Js_Thanks.aspx");
        }
        catch (Exception ex)
        {
            lblmail.Text = ex.Message;
        }
    }
}
