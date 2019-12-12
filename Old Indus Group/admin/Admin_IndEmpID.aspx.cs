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
using System.Collections.Specialized;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Configuration;

public partial class admin_Admin_IndEmpID : System.Web.UI.Page
{
    string usid = string.Empty;
    IGIIT sdata = new IGIIT();

    DataSet ds = new DataSet();
    StateCountry countries = new StateCountry();
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
      public static string USERNAME = "ravi_iginc@yahoo.com";
      public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            ds = GetCounty();

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    country.Items.Add("");
                    country.Items[i].Text = ds.Tables[0].Rows[i - 1]["Country_name"].ToString();
                    country.Items[i].Value = ds.Tables[0].Rows[i - 1]["cid"].ToString();

                    pcountry.Items.Add("");
                    pcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["Country_name"].ToString();
                    pcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["cid"].ToString();

                    ncountry.Items.Add("");
                    ncountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["Country_name"].ToString();
                    ncountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["cid"].ToString();

                    ccountry.Items.Add("");
                    ccountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["Country_name"].ToString();
                    ccountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["cid"].ToString();

                    bcountry.Items.Add("");
                    bcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["Country_name"].ToString();
                    bcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["cid"].ToString();
                }
            }
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string umail = txtemail.Text;
        DataSet ds = new DataSet();
        ds = GetEmpDetails(umail);

        if (ds.Tables[0].Rows.Count == 0)
        {
            try
            {
                DataSet ds1 = getemailid();
                string uid1 = ds1.Tables[0].Rows[0]["empid"].ToString();
                string str1 = uid1.Remove(0, 2);
                int a = Convert.ToInt32(str1);
                a = a + 1;
                str1 = Convert.ToString(a);
                uid1 = "IS" + str1;
                string pw = txtpwd.Text;
                string fn = fname.Text;
                string mn = mname.Text;
                string ln = lname.Text;

              string ssn1 = "";
                string gn = gend.SelectedItem.Text;
                string sn = mmname.Text;
                string sb = sbdate.Text;
               string ssn2 = "";
                string spg = spgen.SelectedItem.Text;
                string fatn = fatname.Text;
                string motn = motname.Text;
                string k1 = k1name.Text;
                string k2 = k2name.Text;
                string k3 = k3name.Text;
                string k1b = k1bd.Text;
                string k2b = k2bd.Text;
                string k3b = "";
                string k1s = "";
                string k2s = "";
                string k3s = "";
                string k1g = k1gen.SelectedItem.Text;
                string k2g = k2gen.SelectedItem.Text;
                string k3g = k3gen.SelectedItem.Text;

                string co = country.SelectedItem.Text;
                string str = street.Text;
                string sta = state.SelectedItem.Text;
                string ci = city.SelectedItem.Text;
                string zp = zip.Text;
                string wp = wp1.Text + wp2.Text + wp3.Text;
                string hp = hp1.Text + hp2.Text + hp3.Text;
                //string mb = mobile .Text ;
                string mb = mb1.Text + mb2.Text + mb3.Text;
                string bd = bdate.Text;
                //if (bdate.Value != "")
                //    bd = bdate.Value ;

                string bco = bcountry.SelectedItem.Text;
                string bsta = bstate.SelectedItem.Text;
                string bci = bcity.SelectedItem.Text;
                string cco = ccountry.SelectedItem.Text;
                string pn = passno.Text;
                string pco = pcountry.SelectedItem.Text;
                string idt = issdate.Text;
                //if (issdate.Value != "")
                //    idt = issdate.Value ;

                string exdt = expdate.Text;
                //if (expdate.Value != "")
                //    exdt = expdate.Value ;

                string nco = ncountry.SelectedItem.Text;
                string cpport = pcountry.SelectedItem.Text;
                //cpassport.Text ;
                string cpn1 = cpname1.Text;
                string cpph1 = cpphone1.Text;
                string cpml1 = cpemail1.Text;
                string cpadr1 = cpaddr1.Text;
                string cpn2 = cpname2.Text;
                string cpph2 = cpphone2.Text;
                string cpml2 = cpemail2.Text;
                string cpadr2 = cpaddr2.Text;

                string exyr = expyrs.Text;
                string exmn = expmon.Text;
                string fnar = fnarea.Text;
                string cind = currind.Text;
                string sk1 = skills1.Text;
                string sk1yr = sk1yrs.Text;
                string sk1ex = sk1exp.SelectedItem.Text;
                string sk2 = skills2.Text;
                string sk2yr = sk2yrs.Text;
                string sk2ex = sk2exp.SelectedItem.Text;
                string sk3 = skills3.Text;
                string sk3yr = sk3yrs.Text;
                string sk3ex = sk3exp.SelectedItem.Text;
                string sk4 = skills4.Text;
                string sk4yr = sk4yrs.Text;
                string sk4ex = sk4exp.SelectedItem.Text;
                string sk5 = skills5.Text;
                string sk5yr = sk5yrs.Text;
                string sk5ex = sk5exp.SelectedItem.Text;
                string sk6 = skills6.Text;
                string sk6yr = sk6yrs.Text;
                string sk6ex = sk6exp.SelectedItem.Text;

                string ed1 = edu1.Text;
                string ed1bd = ed1brd.Text;
                string ed1sb = ed1sub.Text;
                string ed1y = ed1yr.Text;
                string ed1pe = ed1per.Text;
                string ed2 = edu2.Text;
                string ed2bd = ed2brd.Text;
                string ed2sb = ed2sub.Text;
                string ed2y = ed2yr.Text;
                string ed2pe = ed2per.Text;
                string ed3 = edu3.Text;
                string ed3bd = ed3brd.Text;
                string ed3sb = ed3sub.Text;
                string ed3y = ed3yr.Text;
                string ed3pe = ed3per.Text;

                string ed4 = edu4.Text;
                string ed4bd = ed4brd.Text;
                string ed4sb = ed4sub.Text;
                string ed4y = ed4yr.Text;
                string ed4pe = ed4per.Text;

                string ed5 = edu5.Text;
                string ed5bd = ed5brd.Text;
                string ed5sb = ed5sub.Text;
                string ed5y = ed5yr.Text;
                string ed5pe = ed5per.Text;

                string ed6 = edu6.Text;
                string ed6bd = ed6brd.Text;
                string ed6sb = ed6sub.Text;
                string ed6y = ed6yr.Text;
                string ed6pe = ed6per.Text;

                string ed7 = edu7.Text;
                string ed7bd = ed7brd.Text;
                string ed7sb = ed7sub.Text;
                string ed7y = ed7yr.Text;
                string ed7pe = ed7per.Text;

                string rtit = restitle.Text;
                string rfil = "";
                if (rfile.HasFile)
                {
                    rfil = System.IO.Path.GetFileName(rfile.PostedFile.FileName);
                }

                string strUserid = umail;
                string fppath = string.Empty;
                string fppath1 = string.Empty;
                string imgName1 = "";
                string imgName = "";
                ds = sdata.GetEmpDet2(strUserid);
                if (txtimgfupload.HasFile)
                {
                    imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
                    string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);
                    string iname = ds.Tables[0].Rows[0]["firstname"].ToString() + "." + ds.Tables[0].Rows[0]["lastname"].ToString() + "_Photo" + strextension;

                    if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                    {
                        fppath = Server.MapPath("~/Emp_photos/" + iname);
                        txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + iname));
                        imgName = iname;
                    }
                }
                string rtxt = txtres.Text;
                string pplc = pplace.Text;
                string pdt = DateTime.Now.ToString();
                int status = 1;
                string photo = "";
                string photopath = "";
                string resumepath = "";
                string doj = txtjoin.Text;
                string desig = txtdesg.Text;

                bool xreg = InsertEmp(uid1, umail, pw, fn, mn, ln, fatn, motn, sn, gn, ssn1, spg, ssn2, sb, k1,
                              k2, k3, k1g, k2g, k3g, k1b, k2b, k3b, k1s, k2s, k3s, co, sta, str, ci, zp,
                              wp, hp, mb, bd, cco, bci, bsta, bco, pn, pco, idt, exdt, nco, cpport, cpn1,
                              cpph1, cpml1, cpadr1, cpn2, cpph2, cpml2, cpadr2, exyr, rtit, exmn, fnar, cind, sk1, sk1yr,
                              sk1ex, sk2, sk2yr, sk2ex, sk3, sk3yr, sk3ex, sk4, sk4yr, sk4ex, sk5, sk5yr,
                              sk5ex, sk6, sk6yr, sk6ex, ed1, ed1bd, ed1sb, ed1y, ed1pe, ed2, ed2bd, ed2sb,
                              ed2y, ed2pe, ed3, ed3bd, ed3sb, ed3y, ed3pe, ed4, ed4bd, ed4sb, ed4y, ed4pe,
                              ed5, ed5bd, ed5sb, ed5y, ed5pe, ed6, ed6bd, ed6sb, ed6y, ed6pe,
                              ed7, ed7bd, ed7sb, ed7y, ed7pe, pplc, rtxt, rfil, pdt, status, resumepath, photo, photopath, doj, desig);
                //122 columns
                if (xreg)
                {
                    //EMailId = usid;
                    DataSet dst = new DataSet();
                    dst = GetEmpDetails(umail);
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
                        rfile.PostedFile.SaveAs(Server.MapPath("http://www.aceindus.in/aceinduscoin/Resumes/" + stras));
                        //WelcomeMail(USERID, usmail, uspwd, fn, UserName);
                        sendmail(USERID, usmail, uspwd, fn, UserName);

                        //     Response.Redirect("Admin_IndEmployee.aspx");
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Employee Details has been Added Successfully');location.replace('Admin_IndEmployee.aspx');", true);
                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Employee Details has been Added Successfully');location.replace('Admin_IndEmployee.aspx');", true);

                    }

                }
            }
            catch (Exception ex)
            {

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('User from this mail Id already registered');location.replace('Admin_IndEmpID.aspx');", true);
            //string strScript = "alert('User from this mail Id already registered');location.replace('Admin_IndEmpID.aspx');";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
        }
    }

    private bool InsertEmp(string uid1, string umail, string pw, string fn, string mn, string ln, string fatn, string motn, string sn, 
        string gn, string ssn1, string spg, string ssn2, string sb, string k1, string k2, string k3, string k1g, string k2g, string k3g, string k1b, string k2b, string k3b, string k1s, string k2s, string k3s,
        string co, string sta, string str, string ci, string zp, string wp, string hp, string mb, string bd, string cco, string bci, 
        string bsta, string bco, string pn, string pco, string idt, string exdt, string nco, 
        string cpport, string cpn1, string cpph1, string cpml1, string cpadr1, string cpn2, string cpph2, string cpml2, string cpadr2, string exyr, string rtit, string exmn1, string fnar, string cind,
        string sk1, string sk1yr, string sk1ex, string sk2, string sk2yr, string sk2ex, string sk3, string sk3yr, string sk3ex,
        string sk4, string sk4yr, string sk4ex, string sk5, string sk5yr, string sk5ex, string sk6, string sk6yr, string sk6ex, 
        string ed1, string ed1bd, string ed1sb, string ed1y, string ed1pe, string ed2, string ed2bd, string ed2sb, string ed2y, string ed2pe,
        string ed3, string ed3bd, string ed3sb, string ed3y, string ed3pe, string ed4, string ed4bd, string ed4sb, string ed4y, string ed4pe, string ed5, string ed5bd, 
        string ed5sb, string ed5y, string ed5pe, string ed6, string ed6bd, string ed6sb, string ed6y, string ed6pe, string ed7, string ed7bd, string ed7sb, string ed7y, string ed7pe,
        string pplc, string rtxt, string rfil, string pdt, int status, string resumepath, string photo, string photopath, string doj, string desig)
    {
        string strQry = "insert into employeereg1 (empid,username,emailid,pwd,confirmpwd,firstname,middlename,lastname, fathername, mothername,spousename,";
        strQry = strQry + "gender,ssn,spousegender,spousessn,spousedob,kid1,kid2,kid3,child1gender,child2gender,child3gender,child1dob,child2dob,child3dob,child1ssn,child2ssn,child3ssn,";
        strQry = strQry + "country1,state1,street,city1,zip,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,";
        strQry = strQry + "birthstate,birthcountry,passportno,passportissuedat,dateofissue,doexp,nationality,";
        strQry = strQry + "contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2,";
        strQry = strQry + "totexptrs,rhead,totexpmonths,functionalarea,currentindustrytype,";
        strQry = strQry + "skills1,sk1years,sk1exp,skills2,sk2years,sk2exp,skills3,sk3years,sk3exp,";
        strQry = strQry + "skills4,sk4years,sk4exp,skills5,sk5years,sk5exp,skills6,sk6years,sk6exp,";
        strQry = strQry + "edu1,ed1brd,ed1sub,ed1year,ed1per,edu2,ed2brd,ed2sub,ed2year,ed2per,";
        strQry = strQry + "edu3,ed3brd,ed3sub,ed3year,ed3per,edu4,ed4brd,ed4sub,ed4year,ed4per,edu5,ed5brd,ed5sub,ed5year,ed5per,";
        strQry = strQry + "edu6,ed6brd,ed6sub,ed6year,ed6per,edu7,ed7brd,ed7sub,ed7year,ed7per,piss_place,resumetxt,filename1,pdate,status,";
        strQry = strQry + "rpath,photo,photopath,joindate,designation)";

        strQry = strQry + "values('"+uid1+"','"+umail+"','"+umail+"','"+pw+"','"+pw+"','"+fn+"','"+mn+"','"+ln+"','"+fatn+"','"+motn+"','"+sn+"',";
      strQry = strQry +"  '"+gn+"','"+ssn1+"','"+spg+"','"+ssn2+"','"+sb+"','"+k1+"','"+k2+"','"+k3+"','"+k1g+"','"+k2g+"','"+k3g+"','"+k1b+"','"+k2b+"','"+k3b+"','"+k1s+"','"+k2s+"','"+k3s+"',";
       strQry = strQry +"  '"+co+"','"+sta+"','"+str+"','"+ci+"','"+zp+"','"+wp+"','"+hp+"','"+mb+"','"+bd+"','"+cco+"','"+bci+"',";
       strQry = strQry +"  '"+bsta+"','"+bco+"','"+pn+"','"+pco+"','"+idt+"','"+exdt+"','"+nco+"',";
      strQry = strQry +"  '"+cpn1+"','"+cpph1+"','"+cpml1+"','"+cpaddr1+"','"+cpn2+"','"+cpph2+"','"+cpml2+"','"+cpaddr2+"','"+exyr+"','"+rtit+"','"+exmn1+"','"+fnar+"','"+cind+"',";
      strQry = strQry +"   '"+sk1+"','"+sk1yr+"','"+sk1ex+"','"+sk2+"','"+sk2yr+"','"+sk2ex+"','"+sk3+"','"+sk3yr+"','"+sk3ex+"',";
       strQry = strQry +"  '"+sk4+"','"+sk4yr+"','"+sk4ex+"','"+sk5+"','"+sk5yr+"','"+sk5ex+"','"+sk6+"','"+sk6yr+"','"+sk6ex+"',";
       strQry = strQry +"  '"+ed1+"','"+ed1brd+"','"+ed1sb+"','"+ed1y+"','"+ed1pe+"','"+ed2+"','"+ed2bd+"','"+ed2sb+"','"+ed2y+"','"+ed2pe+"',";
        strQry = strQry +" '"+ed3+"','"+ed3bd+"','"+ed3sb+"','"+ed3y+"','"+ed3pe+"','"+ed4+"','"+ed4bd+"','"+ed4sb+"','"+ed4y+"','"+ed4pe+"','"+ed5+"','"+ed5bd+"',";
        strQry = strQry +" '"+ed5sb+"','"+ed5y+"','"+ed5pe+"','"+ed6+"','"+ed6bd+"','"+ed6sb+"','"+ed6y+"','"+ed6pe+"','"+ed7+"','"+ed7bd+"','"+ed7sb+"','"+ed7y+"','"+ed7pe+"',";
        strQry = strQry +" '"+pplc+"','"+rtxt+"','"+rfil+"','"+pdt+"','"+status+"','"+resumepath+"','"+photo+"','"+photopath+"','"+doj+"','"+desig+"')";
        


        string strx = string.Empty;
        connection.Open();
        SqlCommand cmd = new SqlCommand(strQry, connection);
        strx = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        if (strx == "1")

            return true;
        else
            return false;
    }

    private DataSet getemailid()
    {
        string qry = " select top(1) empid from employeereg1 order by userid desc";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    private DataSet GetEmpDetails(string usid)
    {
        DataSet ds = new DataSet();
        string qry = "select * from employeereg1 where username='" + usid + "'";
        connection.Open();
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        da.Fill(ds);
        connection.Close();
        return ds;
    }

    private void WelcomeMail(string Uid, string UMail, string Pass, string UName, string Usrname)
    {
        string Msg = "";
        try
        {

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("vyarramsetty@aceindus.in");
            mm.To.Add(UMail);
            Msg += "<font color='blue'>" + "Dear " + UName + ", </font><br>" +
                    "<br><font color='blue'>Thankyou for Registering with Indusgroup</font><br><br>" +
                    "<br><font color='blue'>Your UserName is :" + Usrname + "</font><br>" +
                    "<br><font color='blue'>Your Password is :" + Pass + "</font><br>";

            mm.Subject = "Subject : Welcome to Indusgroup";

            mm.IsBodyHtml = true;
            mm.Body = Msg;
            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            lblmail.Text = ex.Message;
        }
    }

    protected void bcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bcountry.SelectedItem.Text.ToString() != "Select Country")
        {
            string x = bcountry.SelectedItem.Value.ToString();
            ds = GetState(x);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                   // bstate.Items.Add("Select");
                    bstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["state_name"].ToString();
                    bstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["sid"].ToString();
                }
            }
        }
    }

    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (country.SelectedItem.Text.ToString() != "Select Country")
        {
            string y = country.SelectedItem.Value.ToString();
            ds = GetState(y);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                   // state.Items.Add("");
                    state.Items[i].Text = ds.Tables[0].Rows[i - 1]["state_name"].ToString();
                    state.Items[i].Value = ds.Tables[0].Rows[i - 1]["sid"].ToString();
                }
            }
        }

    }

    protected void bstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bstate.SelectedItem.Text.ToString() != "Select Country")
        {
            string x = bstate.SelectedItem.Value.ToString();
            ds = GetCity(x);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                  //  bcity.Items.Add("Select");
                    bcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["city_name"].ToString();
                    bcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                }
            }
        }
    }

    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.SelectedItem.Text.ToString() != "Select Country")
        {
            string x = state.SelectedItem.Value.ToString();
            ds = GetCity(x);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                  //  city.Items.Add("Select");
                    city.Items[i].Text = ds.Tables[0].Rows[i - 1]["city_name"].ToString();
                    city.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                }
            }
        }
    }

    public DataSet GetCounty()
    {
        DataSet ds = new DataSet();
        connection.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from ia_Countries order by vcountryname Asc", connection);
        sqlda.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetState(string id)
    {
        DataSet ds = new DataSet();

        connection.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from State_Master where intcountryid = " + id + " order by state_name Asc", connection);
        sqlda.Fill(ds);
        connection.Close();
        return ds;
    }
    public DataSet GetCity(string id1)
    {
        DataSet ds1 = new DataSet();

        connection.Open();
        SqlDataAdapter sqlda1 = new SqlDataAdapter("select * from City_Master where sid = " + id1 + " order by cityname Asc", connection);
        sqlda1.Fill(ds1);
        connection.Close();
        return ds1;
    }

    protected void sendmail(string Uid, string UMail, string Pass, string UName, string Usrname)
    {

        string Msg = "";
        string from = "admin@igiit.com";
        string fromName = "IndusGroup Admin";
        string to = UMail;
        string subject = "User Account Create Information ";
        Msg += "<font color='blue'>" + "Dear " + UName + ", </font><br>" +
                      "<br><font color='blue'>Thankyou for Registering with Indusgroup</font><br><br>" +
                      "<br><font color='blue'>Your UserName is :" + Usrname + "</font><br>" +
                      "<br><font color='blue'>Your Password is :" + Pass + "</font><br>";
        SendEmail(UMail, subject, Msg, from, fromName);
        //string result1 = SendEmail(to, subject, bodyText, from, fromName);
    }
    public static string SendEmail(string to, string subject, string bodyText, string from, string fromName)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", bodyText);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    protected void upload_Click(object sender, EventArgs e)
    {
        string strUserid = Session["userid"].ToString();
        string fppath = string.Empty;
        string imgName = "";
        ds = sdata.GetEmpDet2(strUserid);
        if (ddc.SelectedItem.Text != "Select")
        {
            if (filedoc.HasFile)
            {
                string course = ddc.SelectedItem.Text;
                imgName = System.IO.Path.GetFileName(filedoc.PostedFile.FileName);
                string strextension = System.IO.Path.GetExtension(filedoc.PostedFile.FileName);
                string icertificate = ds.Tables[0].Rows[0]["firstname"].ToString() + "." + ds.Tables[0].Rows[0]["lastname"].ToString() + "_" + "" + course + "" + strextension;

                if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                {
                    fppath = Server.MapPath("~/Emp_photos/" + icertificate);
                    filedoc.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + icertificate));
                    imgName = icertificate;
                    int j = newgallargeimages(imgName, strUserid, course);
                   
                }
            }
        }
    }

    private int newgallargeimages(string imgname23, string strUserid, string course)
    {
        connection.Open();
        string s = "insert into   employeedoc values('" + imgname23 + "','" + strUserid + "','" + course + "')";
        SqlCommand cmd = new SqlCommand(s, connection);
        int i = cmd.ExecuteNonQuery();
        connection.Close();
        return i;
    }
}
 