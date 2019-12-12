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
using System.Net;
using System.Net.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_EmpCreate: System.Web.UI.Page
{
    string usid = string.Empty;
    
    DataSet ds = new DataSet();
    StateCountry countries = new StateCountry();
    IGIIT sdata = new IGIIT();
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        ds = countries.GetCounty();

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                country.Items.Add("");
                country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();

                pcountry.Items.Add("");
                pcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                pcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();

                ncountry.Items.Add("");
                ncountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                ncountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();

                ccountry.Items.Add("");
                ccountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                ccountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();

                bcountry.Items.Add("");
                bcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                bcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();

            }
        }

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //       
        string un = txtemail.Text.ToString();
        DataSet ds = new DataSet();
        ds = sdata.GetEmpDet(un);
        usid = txtemail.Text.ToString();
        if (ds.Tables[0].Rows.Count == 0)
        {
            try
            {
                string unm = un;
                string eml = ctxtmail.Text.ToString();
                string pw = txtpwd.Text.ToString();
                string fn = fname.Text.ToString();
                string ln = lname.Text.ToString();
                string mn = mname.Text.ToString();
                string ssn1 = FNssn.Text.ToString();
                string gn = gend.SelectedItem.Text.ToString();
                string sn = mmname.Text.ToString();

                string sb = "";
                if (Sbdate.Value != "")
                    sb = Sbdate.Value.ToString();


                string ssn2 = SNssn.Text.ToString();
                string spg = spgen.SelectedItem.Text.ToString();
                string fatn = fatname.Text.ToString();
                string motn = motname.Text.ToString();
                string k1 = k1name.Text.ToString();
                string k2 = k2name.Text.ToString();
                string k3 = k3name.Text.ToString();
                string k1b = "";
                if (k1bd.Value != "")
                    k1b = k1bd.Value.ToString();

                string k2b = "";
                if (k2bd.Value != "")
                    k2b = k2bd.Value.ToString();

                string k3b = "";
                if (k3bd.Value != "")
                    k3b = k3bd.Value.ToString();

                string k1s = k1ssn.Text.ToString();
                string k2s = k2ssn.Text.ToString();
                string k3s = k3ssn.Text.ToString();
                string k1g = k1gen.SelectedItem.Text.ToString();
                string k2g = k2gen.SelectedItem.Text.ToString();
                string k3g = k3gen.SelectedItem.Text.ToString();
                string co = country.SelectedItem.Text.ToString();
                string str = street.Text.ToString();
                string sta = state.SelectedItem.Text.ToString();
                string ci = city.Text.ToString();
                string zp = zip.Text.ToString();
                string wp = wp1.Text.ToString() + wp2.Text.ToString() + wp3.Text.ToString();
                string hp = hp1.Text.ToString() + hp2.Text.ToString() + hp3.Text.ToString();
                //string mb = mobile .Text.ToString();
                string mb = mb1.Text.ToString() + mb2.Text.ToString() + mb3.Text.ToString();
                string bd = "";
                if (bdate.Value != "")
                    bd = bdate.Value.ToString();

                string bco = bcountry.SelectedItem.Text.ToString();
                string bsta = bstate.SelectedItem.Text.ToString();
                string bci = bcity.Text.ToString();
                string cco = ccountry.SelectedItem.Text.ToString();
                string pn = passno.Text.ToString();
                string pco = pcountry.SelectedItem.Text.ToString();
                string idt = "";
                if (issdate.Value != "")
                    idt = issdate.Value.ToString();

                string exdt = "";
                if (expdate.Value != "")
                    exdt = expdate.Value.ToString();

                string nco = ncountry.SelectedItem.Text.ToString();
                string cpport = pcountry.SelectedItem.Text.ToString();
                //cpassport.Text.ToString();
                string cpn1 = cpname1.Text.ToString();
                string cpph1 = cpphone1.Text.ToString();
                string cpml1 = cpemail1.Text.ToString();
                string cpadr1 = cpaddr1.Text.ToString();
                string cpn2 = cpname2.Text.ToString();
                string cpph2 = cpphone2.Text.ToString();
                string cpml2 = cpemail2.Text.ToString();
                string cpadr2 = cpaddr2.Text.ToString();
                string exyr = expyrs.Text.ToString();
                string exmn = expmon.Text.ToString();
                string fnar = fnarea.Text.ToString();
                string cind = currind.Text.ToString();
                string sk1 = skills1.Text.ToString();
                string sk1yr = sk1yrs.Text.ToString();
                string sk1ex = sk1exp.SelectedItem.Text.ToString();
                string sk2 = skills2.Text.ToString();
                string sk2yr = sk2yrs.Text.ToString();
                string sk2ex = sk2exp.SelectedItem.Text.ToString();
                string sk3 = skills3.Text.ToString();
                string sk3yr = sk3yrs.Text.ToString();
                string sk3ex = sk3exp.SelectedItem.Text.ToString();
                string sk4 = skills4.Text.ToString();
                string sk4yr = sk4yrs.Text.ToString();
                string sk4ex = sk4exp.SelectedItem.Text.ToString();
                string sk5 = skills5.Text.ToString();
                string sk5yr = sk5yrs.Text.ToString();
                string sk5ex = sk5exp.SelectedItem.Text.ToString();
                string sk6 = skills6.Text.ToString();
                string sk6yr = sk6yrs.Text.ToString();
                string sk6ex = sk6exp.SelectedItem.Text.ToString();

                string ed1 = edu1.Text.ToString();
                string ed1bd = ed1brd.Text.ToString();
                string ed1sb = ed1sub.Text.ToString();
                string ed1y = ed1yr.Text.ToString();
                string ed1pe = ed1per.Text.ToString();
                string ed2 = edu2.Text.ToString();
                string ed2bd = ed2brd.Text.ToString();
                string ed2sb = ed2sub.Text.ToString();
                string ed2y = ed2yr.Text.ToString();
                string ed2pe = ed2per.Text.ToString();
                string ed3 = edu3.Text.ToString();
                string ed3bd = ed3brd.Text.ToString();
                string ed3sb = ed3sub.Text.ToString();
                string ed3y = ed3yr.Text.ToString();
                string ed3pe = ed3per.Text.ToString();

                string ed4 = edu4.Text.ToString();
                string ed4bd = ed4brd.Text.ToString();
                string ed4sb = ed4sub.Text.ToString();
                string ed4y = ed4yr.Text.ToString();
                string ed4pe = ed4per.Text.ToString();

                string ed5 = edu5.Text.ToString();
                string ed5bd = ed5brd.Text.ToString();
                string ed5sb = ed5sub.Text.ToString();
                string ed5y = ed5yr.Text.ToString();
                string ed5pe = ed5per.Text.ToString();

                string ed6 = edu6.Text.ToString();
                string ed6bd = ed6brd.Text.ToString();
                string ed6sb = ed6sub.Text.ToString();
                string ed6y = ed6yr.Text.ToString();
                string ed6pe = ed6per.Text.ToString();

                string ed7 = edu7.Text.ToString();
                string ed7bd = ed7brd.Text.ToString();
                string ed7sb = ed7sub.Text.ToString();
                string ed7y = ed7yr.Text.ToString();
                string ed7pe = ed7per.Text.ToString();

                string rtit = restitle.Text.ToString();
                string rfil = System.IO.Path.GetFileName(rfile.PostedFile.FileName);
                string rtxt = txtres.Text.ToString();
                string pplc = pplace.Text.ToString();
                string pdt = DateTime.Now.ToString();

                bool xreg = sdata.InsertEmp(unm, eml, pw, usid, fn, ln, mn, ssn1, gn, sn, sb, ssn2, spg, fatn, motn, k1, 
                              k2, k3, k1b, k2b, k3b, k1s, k2s, k3s, k1g, k2g, k3g, co, str, sta, ci, zp,
                              wp, hp, mb, bd, bco, bsta, bci, cco, pn, pco, idt, exdt, nco, cpport, cpn1,
                              cpph1, cpml1, cpadr1, cpn2, cpph2, cpml2, cpadr2, exyr, fnar, cind, sk1, sk1yr, 
                              sk1ex, sk2, sk2yr, sk2ex, sk3, sk3yr, sk3ex, sk4, sk4yr, sk4ex, sk5, sk5yr, 
                              sk5ex, sk6, sk6yr, sk6ex, ed1, ed1bd, ed1sb, ed1y, ed1pe, ed2, ed2bd, ed2sb,
                              ed2y, ed2pe, ed3, ed3bd, ed3sb, ed3y, ed3pe, ed4, ed4bd, ed4sb, ed4y, ed4pe,
                              ed5, ed5bd, ed5sb, ed5y, ed5pe, ed6, ed6bd, ed6sb, ed6y, ed6pe,
                              ed7, ed7bd, ed7sb, ed7y, ed7pe, rtit, rfil, rtxt, exmn, pplc, pdt);

                if (xreg)
                {
                    //EMailId = usid;
                    DataSet dst = new DataSet();
                    dst = sdata.GetEmpDet(un);
                    if (dst.Tables[0].Rows.Count > 0)
                    {
                        string xnm = fn + " " + ln;
                        Session["Authentication"] = "true";
                        string USERID = dst.Tables[0].Rows[0]["userid"].ToString();
                        string UserName = dst.Tables[0].Rows[0]["username"].ToString();
                        string usmail = dst.Tables[0].Rows[0]["emailid"].ToString();
                        string uspwd = dst.Tables[0].Rows[0]["pwd"].ToString();
                        Session.Add("USERID", USERID);
                        Session.Add("UserName", UserName);
                        Session.Add("Name", xnm);

                        // Session.Add("FLAG", Flags);
                        string stras = USERID + "" + rfil;
                        rfile.PostedFile.SaveAs(Server.MapPath("Resumes/" + stras));
                        //R_upload.PostedFile.SaveAs(Server.MapPath("Resumes/" + UserID + System.IO.Path.GetFileName(R_upload.PostedFile.FileName)));
                        WelcomeMail(USERID, usmail, uspwd, fn, UserName);
                        Response.Redirect("Admin_Employee.aspx");
                    }

                }


                //  Response.Redirect("Emp_Home.aspx?cid=" + usid);
            }
            catch
            {
            }

        }
    }


    private void WelcomeMail(string Uid, string UMail, string Pass, string UName, string Usrname)
    {
        string Msg = "";
        try
        {

            MailMessage mm = new MailMessage();
            //mm.From = "info@igiit.com";
            mm.From = new MailAddress("info@igiit.ws");
            mm.To.Add(UMail);
            //mm.To = UMail;
            Msg += "<font color='blue'>" + "Dear " + UName + ", </font><br>" +
                    "<br><font color='blue'>Thank you for Registering with Indusgroup.com.</font><br><br>" +
                    "<br><font color='blue'>Your UserName is :" + Usrname + "</font><br>" +
                    "<br><font color='blue'>Your Password is :" + Pass + "</font><br>";

            mm.Subject = "Subject : Welcome to Indus Group";

            mm.IsBodyHtml = true;
            mm.Body = Msg;
            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);
            //Response.Redirect("Js_Thanks.aspx");
        }
        catch (Exception ex)
        {
            lblmail.Text = ex.Message;
        }
    }











    //        try
    //        {
                
    //            string eml = conemail.Text.ToString();
    //            string pw = txtpwd.Text.ToString();

    //            string fn = fname.Text.ToString();
    //            string ln = lname.Text.ToString();
    //            string mn = mname.Text.ToString();
    //            string sn = mmname.Text.ToString();
    //            string fatn = fatname.Text.ToString();
    //            string motn = motname.Text.ToString();
    //            string k1 = k1name.Text.ToString();
    //            string k2 = k2name.Text.ToString();
    //            string k3 = k3name.Text.ToString();
    //            string co = country.SelectedItem.Text.ToString();
    //            string str = street.Text.ToString();
    //            string sta = state.SelectedItem.Text.ToString();
    //            string ci = city.Text.ToString();
    //            string zp = zip.Text.ToString();
    //            string wp = wp1.Text.ToString() + wp2.Text.ToString() + wp3.Text.ToString();
    //            string hp = hp1.Text.ToString() + hp2.Text.ToString() + hp3.Text.ToString();
    //            string mb = mb1.Text.ToString() + mb2.Text.ToString() + mb3.Text.ToString();
    //            string bd = Convert.ToDateTime(bdate.Text.ToString()).ToShortDateString();
    //            string bco = bcountry.SelectedItem.Text.ToString();
    //            string bsta = bstate.SelectedItem.Text.ToString();
    //            string bci = bcity.Text.ToString();
    //            string cco = ccountry.SelectedItem.Text.ToString();
    //            string pn = passno.Text.ToString();
    //            string pco = pcountry.SelectedItem.Text.ToString();
    //            string idt = Convert.ToDateTime(issdate.Text.ToString()).ToShortDateString();
    //            string exdt = Convert.ToDateTime(expdate.Text.ToString()).ToShortDateString();
    //            string nco = ncountry.SelectedItem.Text.ToString();
    //            string cpport = pcountry.SelectedItem.Text.ToString();
    //                //cpassport.Text.ToString();
    //            string cpn1 = cpname1.Text.ToString();
    //            string cpph1 = cpphone1.Text.ToString();
    //            string cpml1 = cpemail1.Text.ToString();
    //            string cpadr1 = cpaddr1.Text.ToString();
    //            string cpn2 = cpname2.Text.ToString();
    //            string cpph2 = cpphone2.Text.ToString();
    //            string cpml2 = cpemail2.Text.ToString();
    //            string cpadr2 = cpaddr2.Text.ToString();
    //            string exyr = expyrs.Text.ToString();
    //            string exmn = expmon.Text.ToString();
    //            string fnar = fnarea.Text.ToString();
    //            string cind = currind.Text.ToString();
    //            string sk1 = skills1.Text.ToString();
    //            string sk1yr = sk1yrs.Text.ToString();
    //            string sk1ex = sk1exp.Text.ToString();
    //            string sk2 = skills2.Text.ToString();
    //            string sk2yr = sk2yrs.Text.ToString();
    //            string sk2ex = sk2exp.Text.ToString();
    //            string sk3 = skills3.Text.ToString();
    //            string sk3yr = sk3yrs.Text.ToString();
    //            string sk3ex = sk3exp.Text.ToString();

    //            string ed1 = edu1.Text.ToString();
    //            string ed1bd = ed1brd.Text.ToString();
    //            string ed1sb = ed1sub.Text.ToString();
    //            string ed1y = ed1yr.Text.ToString();
    //            string ed1pe = ed1per.Text.ToString();
    //            string ed2 = edu2.Text.ToString();
    //            string ed2bd = ed2brd.Text.ToString();
    //            string ed2sb = ed2sub.Text.ToString();
    //            string ed2y = ed2yr.Text.ToString();
    //            string ed2pe = ed2per.Text.ToString();
    //            string ed3 = edu3.Text.ToString();
    //            string ed3bd = ed3brd.Text.ToString();
    //            string ed3sb = ed3sub.Text.ToString();
    //            string ed3y = ed3yr.Text.ToString();
    //            string ed3pe = ed3per.Text.ToString();

    //            string ed4 = edu4.Text.ToString();
    //            string ed4bd = ed4brd.Text.ToString();
    //            string ed4sb = ed4sub.Text.ToString();
    //            string ed4y = ed4yr.Text.ToString();
    //            string ed4pe = ed4per.Text.ToString();

    //            string ed5 = edu5.Text.ToString();
    //            string ed5bd = ed5brd.Text.ToString();
    //            string ed5sb = ed5sub.Text.ToString();
    //            string ed5y = ed5yr.Text.ToString();
    //            string ed5pe = ed5per.Text.ToString();

    //            string rtit = restitle.Text.ToString();
    //            string rfil = System.IO.Path.GetFileName(rfile.PostedFile.FileName);
    //            string rtxt = txtres.Text.ToString();
    //            string pdt = DateTime.Now.ToString();

    //            bool xreg = sdata.InsertEmp(un, eml, pw, fn, ln, mn, sn, fatn, motn, k1, k2, k3, co, str, sta, ci, zp,
    //                          wp, hp, mb, bd, bco, bsta, bci, cco, pn, pco, idt, exdt, nco, cpport, cpn1,
    //                          cpph1, cpml1, cpadr1, cpn2, cpph2, cpml2, cpadr2, exyr, fnar, cind, sk1, sk1yr, sk1ex,
    //                          sk2, sk2yr, sk2ex, sk3, sk3yr, sk3ex, ed1, ed1bd, ed1sb, ed1y, ed1pe, ed2, ed2bd, ed2sb,
    //                          ed2y, ed2pe, ed3, ed3bd, ed3sb, ed3y, ed3pe, ed4, ed4bd, ed4sb, ed4y, ed4pe, ed5, ed5bd, ed5sb, ed5y, ed5pe, rtit, rfil, rtxt, exmn, pdt);

    //            if (xreg)
    //            {
    //                //EMailId = usid;
    //                DataSet dst = new DataSet();
    //                dst = sdata.GetEmpDet(un);
    //                if (dst.Tables[0].Rows.Count > 0)
    //                {

    //                    string USERID = dst.Tables[0].Rows[0]["userid"].ToString();
    //                    string UserName = dst.Tables[0].Rows[0]["username"].ToString();
    //                    string usmail = dst.Tables[0].Rows[0]["emailid"].ToString();
    //                    string uspwd = dst.Tables[0].Rows[0]["pwd"].ToString();
    //                    string stras = USERID + "" + rfil;
    //                    rfile.PostedFile.SaveAs(Server.MapPath("../Resumes/" + stras));
    //                    WelcomeMail(USERID, usmail, uspwd, fn, UserName);
    //                }

    //            }


    //              Response.Redirect("Admin_Employee.aspx");
    //        }
    //        catch
    //        {
    //        }
    //    }

    //    else
    //    {
    //        lblmail.Text = "Email already exist!.... try with another one";
    //    }

    //}



    //private void WelcomeMail(string Uid, string UMail, string Pass, string UName, string Usrname)
    //{
    //    string Msg = "";
    //    try
    //    {
    //        MailMessage mm = new MailMessage();
    //        mm.From = "info@igiit.com";
    //        //mm.From = "rlaxmi2003@gmail.com";
    //        mm.To = UMail;
    //        Msg += "Dear " + Usrname + ",<br>" +
    //                "<br>Thank you for Registering with Indusgroup.com.<br>" +
    //                "<br>Your UserName is :" + UName + "<br>" +
    //                "<br>Your Password is :" + Pass + "<br>";

    //        mm.Subject = "Subject : Welcome to Indus Group";

    //        mm.BodyFormat = MailFormat.Html;
    //        mm.Body = Msg;
    //        SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["MySMTPServer"];
    //        SmtpMail.Send(mm);
    //        //Response.Redirect("Js_Thanks.aspx");
    //    }
    //    catch (Exception ex)
    //    {
    //        lblmail.Text = ex.Message;
    //    }
    //}


    protected void bcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = bcountry.SelectedItem.Value.ToString();
        ds = countries.GetState(x);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                bstate.Items.Add("");
                bstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                bstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }

    }
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        string y = country.SelectedItem.Value.ToString();
        ds = countries.GetState(y);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add("");
                state.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                state.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }

    }
}
