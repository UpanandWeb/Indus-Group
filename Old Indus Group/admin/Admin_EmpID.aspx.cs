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
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Linq;


public partial class Admin_EmpID : System.Web.UI.Page
{
    string usid = string.Empty;
    DataSet ds = new DataSet();
    StateCountry countries = new StateCountry();
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string emailid = "";
    IGIIT sdata = new IGIIT();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
                //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
                //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                SqlDataAdapter sqlad1 = new SqlDataAdapter("select top 1  empid, * from employeereg1  where empid is not null order by userid desc", connection);
                DataSet ds1 = new DataSet();
                sqlad1.Fill(ds1);
                string s = ds1.Tables[0].Rows[0]["empid"].ToString();
                string clean = Regex.Replace(s, "[^0-9 ]", "");
                int s1 = Convert.ToInt16(clean);
                s1 = s1 + 1;
                s = "IGI" + Convert.ToString(s1);
                txtemid.Text = s;

                country1();
                usastates();
                indiastates();
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string empid = txtemid.Text;
        string mail = txtemail.Text;
        Session["emailid"] = mail;
        string alter = conemail.Text;
        string pw = txtempid.Text;
        //personal details
        string firstname = fname.Text;
        string middlename = mname.Text;
        string lastname = lname.Text;
        string gender = "";
        if (gend1.Checked == true)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }
        string fsn = fssn.Text;

        string marital = "";
        if (chkmarried.Checked == true)
        {
            marital = "Married";
        }
        else
        {
            marital = "Unmarried";
        }
      

        string nation = ncountry.Text;
        string birthdate = bdate.Text;
        string birthcountry = bcountry.Text;
        string birthstate = bstate.Text;
        string birthcity = bcity.Text;
        string citizencountry = ccountry.Text;
        string passport = passno.Text;
        string passportissueat = pcountry.Text;
        string passportissue = issdate.Text;
        string passportexp = expdate.Text;

        //family details
        string fathername = fatname.Text;
        string mothername = motname.Text;
        string spose = mmname.Text;
        string spssn = Spssn.Text;
        string sdob = sbd.Text;
        string sgender = "";
        if (spgen1.Checked == true)
        {
            sgender = "Male";
        }
        else
        {
            sgender = "Female";
        }

        
        string kid1n = k1name.Text;
        string kid2n = k2name.Text;
        string kid3n = k3name.Text;

        string kid1dob = k1bd.Text;
        string kid2dob = k2bd.Text;
        string kid3dob = k3bd.Text;

        string kid1g = "";
        if (k1gen1.Checked == true)
        {
            kid1g = "Male";
        }
        else
        {
            kid1g = "Female";
        }
        string kid2g = "";
        if (k2gen1.Checked == true)
        {
            kid2g = "Male";
        }
        else
        {
            kid2g = "Female";
        }
        string kid3g = "";
        if (k3gen1.Checked == true)
        {
            kid3g = "Male";
        }
        else
        {
            kid3g = "Female";
        }

        string k1sn = k1ssn.Text;
        string k2sn = k2ssn.Text;
        string k3sn = k3ssn.Text;

        string door = txtdoor.Text;
        string streer = street.Text;
        string city1 = city.Text;
        string state1 = state.Text;
        string contry = country.Text;
        string zip1 = zip.Text;

 

        //contact details
        string workp = wp1.Text + wp2.Text + wp3.Text;
        string homep = hp1.Text + hp2.Text + hp3.Text;
        string mobilep = mb1.Text + mb2.Text + mb3.Text;

        //empid,mail,mail,pw,pw,firstname,middlename,lastname,fathername,mothername,spose,gender
        //fsn,sgender,spssn,sdob,kid1n,kid2n,kid3n,kid1g,kid2g,kid3g,kid1dob,kid2dob,kid3dob,k1sn,k2sn,k3sn,
        //contry,state1,streer,city1,zip1,workp,homep,mobilep,birthdate,citizencountry,birthcity,birthstate,
        //birthcountry,passport,passportissueat,passportissue,passportexp,nation,cnp1,cnp1mail,cnp1address,
        //cnp2,cnp2p,cnp2mail,cnp2address,totalexpy,totalexpm,functionalarea,cindustry,
        //sk1,sk1y,sk1m,sk1e,sk2,sk2y,sk2m,sk2e,sk3,sk3y,sk3m,sk3e,sk4,sk4y,sk4m,sk4e,sk5,sk5y,sk5m,sk5e,sk6,sk6y,sk6m,sk6e,
        //ed1,ed1b,ed1s,ed1y,ed1p,ed2,ed2b,ed2s,ed2y,ed2p,ed3,ed3b,ed3s,ed3y,ed3p
        //ed4,ed4b,ed4s,ed4y,ed4p,ed5,ed5b,ed5s,ed5y,ed15,ed6,ed6b,ed6s,ed6y,ed6p,ed7,ed7b,ed7s,ed7y,ed7p
        //imgName1,date,satus,fppath1,imgName,fppath,martial,date,bacname,acnumber,bname,badd,bifsc,bswift,bacadd,
        //dnumber,dplace,dcity,door,martial

        //Bank account details
        string bacname = txtacname.Text;
        string acnumber = txtacnum.Text;
        string bname = txtbankname.Text;
        string badd = txtbankadd.Text;
        string bifsc = txtifsc.Text;
        string bswift = txtswift.Text;
        string bacadd = txtbranchacaddress.Text;

        //Identification Details
        string dnumber = txtdrivenumber.Text;
        string dplace = txtdriveplace.Text;
        string dcity = txtdrivecity.Text;

        // emergency contact details
        string cnp1 = cpname1.Text;
        string cnp1p = cpphone1.Text;
        string cnp1mail = cpemail1.Text;
        string cnp1address = cpaddr1.Text;
        string cnp2 = cpname2.Text;
        string cnp2p = cpphone2.Text;
        string cnp2mail = cpemail2.Text;
        string cnp2address = cpaddr2.Text;

   

        // technical experience
        string totalexpy = expyrs.Text;
        string totalexpm = expmon.Text;
        string functionalarea = fnarea.Text;
        string cindustry = currind.Text;

  
        // Skills
        string sk1 = skills1.Text;
        string sk1y = sk1yrs.Text;
        string sk1m = sk1mnts.Text;
        string sk1e = sk1exp.SelectedItem.Text;

        string sk2 = skills2.Text;
        string sk2m = sk2mnts.Text;
        string sk2y = sk2yrs.Text;
        string sk2e = sk2exp.SelectedItem.Text;

        string sk3 = skills3.Text;
        string sk3m = sk3mnts.Text;
        string sk3y = sk3yrs.Text;
        string sk3e = sk3exp.SelectedItem.Text;

        string sk4 = skills4.Text;
        string sk4m = sk4mnts.Text;
        string sk4y = sk4yrs.Text;
        string sk4e = sk4exp.SelectedItem.Text;

        string sk5 = skills5.Text;
        string sk5m = sk5mnts.Text;
        string sk5y = sk5yrs.Text;
        string sk5e = sk5exp.SelectedItem.Text;

        string sk6 = skills6.Text;
        string sk6m = sk6mnts.Text;
        string sk6y = sk6yrs.Text;
        string sk6e = sk6exp.SelectedItem.Text;

        
        string ed1 = edu1.Text;
        string ed1b = ed1brd.Text;
        string ed1s = ed1sub.Text;
        string ed1y = ed1yr.Text;
        string ed1p = ed1per.Text;

        string ed2 = edu2.Text;
        string ed2b = ed2brd.Text;
        string ed2s = ed2sub.Text;
        string ed2y = ed2yr.Text;
        string ed2p = ed2per.Text;

        string ed3 = edu3.Text;
        string ed3b = ed3brd.Text;
        string ed3s = ed3sub.Text;
        string ed3y = ed3yr.Text;
        string ed3p = ed3per.Text;

        string ed4 = edu4.Text;
        string ed4b = ed4brd.Text;
        string ed4s = ed4sub.Text;
        string ed4y = ed4yr.Text;
        string ed4p = ed4per.Text;

        string ed5 = edu5.Text;
        string ed5b = ed5brd.Text;
        string ed5s = ed5sub.Text;
        string ed5y = ed5yr.Text;
        string ed5p = ed5per.Text;

        string ed6 = edu6.Text;
        string ed6b = ed6brd.Text;
        string ed6s = ed6sub.Text;
        string ed6y = ed6yr.Text;
        string ed6p = ed6per.Text;

        string ed7 = edu7.Text;
        string ed7b = ed7brd.Text;
        string ed7s = ed7sub.Text;
        string ed7y = ed7yr.Text;
        string ed7p = ed7per.Text;

  

      //  string strUserid = Session["userid"].ToString();
        string fppath = string.Empty;
        string fppath1 = string.Empty;
        string imgName1 = "";
        string imgName = "";
        string satus = "1";
     //   ds = GetEmpDet1(strUserid);
        if (txtimgfupload.HasFile)
        {
            imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
            string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);

            if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
            {
                fppath = Server.MapPath("~/Emp_photos/" + txtemail.Text + imgName);
                txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + txtemail.Text + imgName));
                imgName = txtemail.Text + imgName;
            }
        }
        else
        {
           // imgName = ds.Tables[0].Rows[0]["photo"].ToString();
           // fppath = ds.Tables[0].Rows[0]["photopath"].ToString();
        }


        if (txtresupload.HasFile)
        {
            imgName1 = System.IO.Path.GetFileName(txtresupload.PostedFile.FileName);
            string strextension1 = System.IO.Path.GetExtension(txtresupload.PostedFile.FileName);

            if ((strextension1 == ".doc") || (strextension1 == ".docx"))
            {
                fppath1 = Server.MapPath("~/Resumes/" + txtemail.Text + imgName1);
                txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + txtemail.Text + imgName1));
                imgName1 = txtemail.Text + imgName1;
            }
        }
        else
        {
            //imgName1 = ds.Tables[0].Rows[0]["filename1"].ToString();
           // fppath1 = ds.Tables[0].Rows[0]["rpath"].ToString();
        }

        //if (filedoc.HasFile)
        //{
        //    HttpFileCollection fileCollection = Request.Files;
        //    for (int i1 = 2; i1 < fileCollection.Count; i1++)
        //    {
        //        HttpPostedFile uploadfile = fileCollection[i1];
        //        string fileName = Path.GetFileName(uploadfile.FileName);

        //        // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
        //        string path = Server.MapPath("~/admin/Employee_Docs/" + txtemail.Text + fileName);
        //        filedoc.SaveAs(path);

        //        string imgname23 = txtemid.Text + fileName;
        //        if (uploadfile.ContentLength > 0)
        //        {
        //            uploadfile.SaveAs(path);
        //            //  lblMessage.Text += fileName + "Saved Successfully<br>";
        //        }

        //        int j = newgallargeimages(imgname23, txtemail.Text,course);
        //        if (j == 1)
        //        {
        //            path = "";
        //            //  string str = "alert('File Uploaded successfully.');";
        //            // Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //        }
        //        else
        //        {

        //        }
        //    }
        //}

        string date = System.DateTime.Now.ToString();

        bool i = InsertEmp(empid,mail,pw,firstname,middlename,lastname,fathername,mothername,spose,gender,
        fsn,sgender,spssn,sdob,kid1n,kid2n,kid3n,kid1g,kid2g,kid3g,kid1dob,kid2dob,kid3dob,k1sn,k2sn,k3sn,
        contry,state1,streer,city1,zip1,workp,homep,mobilep,birthdate,citizencountry,birthcity,birthstate,
        birthcountry, passport, passportissueat, passportissue, passportexp, nation, cnp1, cnp1p, cnp1mail, cnp1address,
        cnp2,cnp2p,cnp2mail,cnp2address,totalexpy,totalexpm,functionalarea,cindustry,
        sk1,sk1y,sk1m,sk1e,sk2,sk2y,sk2m,sk2e,sk3,sk3y,sk3m,sk3e,sk4,sk4y,sk4m,sk4e,sk5,sk5y,sk5m,sk5e,sk6,sk6y,sk6m,sk6e,
        ed1,ed1b,ed1s,ed1y,ed1p,ed2,ed2b,ed2s,ed2y,ed2p,ed3,ed3b,ed3s,ed3y,ed3p,
        ed4,ed4b,ed4s,ed4y,ed4p,ed5,ed5b,ed5s,ed5y,ed5p,ed6,ed6b,ed6s,ed6y,ed6p,ed7,ed7b,ed7s,ed7y,ed7p,
        imgName1, date, satus, fppath1, imgName, fppath, marital, bacname, acnumber, bname, badd, bifsc, bswift, bacadd,
        dnumber, dplace, dcity, door);

        if (i == true)
        {
            string from = "info@1indus.com";
            string to = empid;
            string subject = "1indus Employee account Registration";
            string Body = " Hi " + firstname + ",<br/><br/>Welcome to Biz Assist<br/><br/>";

            Body += "<b>Your Username :</b> " + empid + "<br/>";
            Body += "<b>Password :</b> " +pw + "<br/><br/>";

            SendMail(from, to, subject, Body);

            string strscpt = "alert ('Employee Details saved');location.replace('Admin_Employee.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void btnsubmit_Click1(object sender, EventArgs e)
    {
        string empid = txtemid.Text;
        string mail = txtemail.Text;
        Session["emailid"] = mail;
        string alter = conemail.Text;
        string pw = txtempid.Text;

        if ((empid != "") && (mail != "") && (pw != ""))
        {
            //personal details
            string firstname = fname.Text;
            string middlename = mname.Text;
            string lastname = lname.Text;
            string gender = "";
            if (gend1.Checked == true)
            {
                gender = "Male";
            }
            else
            {
                gender = "Female";
            }
            string fsn = fssn.Text;

            string marital = "";
            if (chkmarried.Checked == true)
            {
                marital = "Married";
            }
            else
            {
                marital = "Unmarried";
            }


            string nation = ncountry.Text;
            string birthdate = bdate.Text;
            string birthcountry = bcountry.Text;
            string birthstate = bstate.Text;
            string birthcity = bcity.Text;
            string citizencountry = ccountry.Text;
            string passport = passno.Text;
            string passportissueat = pcountry.Text;
            string passportissue = issdate.Text;
            string passportexp = expdate.Text;

            //family details
            string fathername = fatname.Text;
            string mothername = motname.Text;
            string spose = mmname.Text;
            string spssn = Spssn.Text;
            string sdob = sbd.Text;
            string sgender = "";
            if (spgen1.Checked == true)
            {
                sgender = "Male";
            }
            else
            {
                sgender = "Female";
            }


            string kid1n = k1name.Text;
            string kid2n = k2name.Text;
            string kid3n = k3name.Text;

            string kid1dob = k1bd.Text;
            string kid2dob = k2bd.Text;
            string kid3dob = k3bd.Text;

            string kid1g = "";
            if (k1gen1.Checked == true)
            {
                kid1g = "Male";
            }
            else
            {
                kid1g = "Female";
            }
            string kid2g = "";
            if (k2gen1.Checked == true)
            {
                kid2g = "Male";
            }
            else
            {
                kid2g = "Female";
            }
            string kid3g = "";
            if (k3gen1.Checked == true)
            {
                kid3g = "Male";
            }
            else
            {
                kid3g = "Female";
            }

            string k1sn = k1ssn.Text;
            string k2sn = k2ssn.Text;
            string k3sn = k3ssn.Text;

            string door = txtdoor.Text;
            string streer = street.Text;
            string city1 = city.Text;
            string state1 = state.Text;
            string contry = country.Text;
            string zip1 = zip.Text;



            //contact details
            string workp = wp1.Text + wp2.Text + wp3.Text;
            string homep = hp1.Text + hp2.Text + hp3.Text;
            string mobilep = mb1.Text + mb2.Text + mb3.Text;

            //empid,mail,mail,pw,pw,firstname,middlename,lastname,fathername,mothername,spose,gender
            //fsn,sgender,spssn,sdob,kid1n,kid2n,kid3n,kid1g,kid2g,kid3g,kid1dob,kid2dob,kid3dob,k1sn,k2sn,k3sn,
            //contry,state1,streer,city1,zip1,workp,homep,mobilep,birthdate,citizencountry,birthcity,birthstate,
            //birthcountry,passport,passportissueat,passportissue,passportexp,nation,cnp1,cnp1mail,cnp1address,
            //cnp2,cnp2p,cnp2mail,cnp2address,totalexpy,totalexpm,functionalarea,cindustry,
            //sk1,sk1y,sk1m,sk1e,sk2,sk2y,sk2m,sk2e,sk3,sk3y,sk3m,sk3e,sk4,sk4y,sk4m,sk4e,sk5,sk5y,sk5m,sk5e,sk6,sk6y,sk6m,sk6e,
            //ed1,ed1b,ed1s,ed1y,ed1p,ed2,ed2b,ed2s,ed2y,ed2p,ed3,ed3b,ed3s,ed3y,ed3p
            //ed4,ed4b,ed4s,ed4y,ed4p,ed5,ed5b,ed5s,ed5y,ed15,ed6,ed6b,ed6s,ed6y,ed6p,ed7,ed7b,ed7s,ed7y,ed7p
            //imgName1,date,satus,fppath1,imgName,fppath,martial,date,bacname,acnumber,bname,badd,bifsc,bswift,bacadd,
            //dnumber,dplace,dcity,door,martial

            //Bank account details
            string bacname = txtacname.Text;
            string acnumber = txtacnum.Text;
            string bname = txtbankname.Text;
            string badd = txtbankadd.Text;
            string bifsc = txtifsc.Text;
            string bswift = txtswift.Text;
            string bacadd = txtbranchacaddress.Text;

            //Identification Details
            string dnumber = txtdrivenumber.Text;
            string dplace = txtdriveplace.Text;
            string dcity = txtdrivecity.Text;

            // emergency contact details
            string cnp1 = cpname1.Text;
            string cnp1p = cpphone1.Text;
            string cnp1mail = cpemail1.Text;
            string cnp1address = cpaddr1.Text;
            string cnp2 = cpname2.Text;
            string cnp2p = cpphone2.Text;
            string cnp2mail = cpemail2.Text;
            string cnp2address = cpaddr2.Text;



            // technical experience
            string totalexpy = expyrs.Text;
            string totalexpm = expmon.Text;
            string functionalarea = fnarea.Text;
            string cindustry = currind.Text;


            // Skills
            string sk1 = skills1.Text;
            string sk1y = sk1yrs.Text;
            string sk1m = sk1mnts.Text;
            string sk1e = sk1exp.SelectedItem.Text;

            string sk2 = skills2.Text;
            string sk2m = sk2mnts.Text;
            string sk2y = sk2yrs.Text;
            string sk2e = sk2exp.SelectedItem.Text;

            string sk3 = skills3.Text;
            string sk3m = sk3mnts.Text;
            string sk3y = sk3yrs.Text;
            string sk3e = sk3exp.SelectedItem.Text;

            string sk4 = skills4.Text;
            string sk4m = sk4mnts.Text;
            string sk4y = sk4yrs.Text;
            string sk4e = sk4exp.SelectedItem.Text;

            string sk5 = skills5.Text;
            string sk5m = sk5mnts.Text;
            string sk5y = sk5yrs.Text;
            string sk5e = sk5exp.SelectedItem.Text;

            string sk6 = skills6.Text;
            string sk6m = sk6mnts.Text;
            string sk6y = sk6yrs.Text;
            string sk6e = sk6exp.SelectedItem.Text;


            string ed1 = edu1.Text;
            string ed1b = ed1brd.Text;
            string ed1s = ed1sub.Text;
            string ed1y = ed1yr.Text;
            string ed1p = ed1per.Text;

            string ed2 = edu2.Text;
            string ed2b = ed2brd.Text;
            string ed2s = ed2sub.Text;
            string ed2y = ed2yr.Text;
            string ed2p = ed2per.Text;

            string ed3 = edu3.Text;
            string ed3b = ed3brd.Text;
            string ed3s = ed3sub.Text;
            string ed3y = ed3yr.Text;
            string ed3p = ed3per.Text;

            string ed4 = edu4.Text;
            string ed4b = ed4brd.Text;
            string ed4s = ed4sub.Text;
            string ed4y = ed4yr.Text;
            string ed4p = ed4per.Text;

            string ed5 = edu5.Text;
            string ed5b = ed5brd.Text;
            string ed5s = ed5sub.Text;
            string ed5y = ed5yr.Text;
            string ed5p = ed5per.Text;

            string ed6 = edu6.Text;
            string ed6b = ed6brd.Text;
            string ed6s = ed6sub.Text;
            string ed6y = ed6yr.Text;
            string ed6p = ed6per.Text;

            string ed7 = edu7.Text;
            string ed7b = ed7brd.Text;
            string ed7s = ed7sub.Text;
            string ed7y = ed7yr.Text;
            string ed7p = ed7per.Text;



            //  string strUserid = Session["userid"].ToString();
            string fppath = string.Empty;
            string fppath1 = string.Empty;
            string imgName1 = "";
            string imgName = "";
            string satus = "1";
            //   ds = GetEmpDet1(strUserid);
            if (txtimgfupload.HasFile)
            {
                imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
                string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);

                if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                {
                    fppath = Server.MapPath("~/Emp_photos/" + txtemail.Text + imgName);
                    txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + txtemail.Text + imgName));
                    imgName = txtemail.Text + imgName;
                }
            }
            else
            {
                // imgName = ds.Tables[0].Rows[0]["photo"].ToString();
                // fppath = ds.Tables[0].Rows[0]["photopath"].ToString();
            }


            if (txtresupload.HasFile)
            {
                imgName1 = System.IO.Path.GetFileName(txtresupload.PostedFile.FileName);
                string strextension1 = System.IO.Path.GetExtension(txtresupload.PostedFile.FileName);

                if ((strextension1 == ".doc") || (strextension1 == ".docx"))
                {
                    fppath1 = Server.MapPath("~/Resumes/" + txtemail.Text + imgName1);
                    txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + txtemail.Text + imgName1));
                    imgName1 = txtemail.Text + imgName1;
                }
            }
            else
            {
                //imgName1 = ds.Tables[0].Rows[0]["filename1"].ToString();
                // fppath1 = ds.Tables[0].Rows[0]["rpath"].ToString();
            }

            //if (filedoc.HasFile)
            //{
            //    HttpFileCollection fileCollection = Request.Files;
            //    for (int i1 = 2; i1 < fileCollection.Count; i1++)
            //    {
            //        HttpPostedFile uploadfile = fileCollection[i1];
            //        string fileName = Path.GetFileName(uploadfile.FileName);

            //        // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
            //        string path = Server.MapPath("~/admin/Employee_Docs/" + txtemail.Text + fileName);
            //        filedoc.SaveAs(path);

            //        string imgname23 = txtemid.Text + fileName;
            //        if (uploadfile.ContentLength > 0)
            //        {
            //            uploadfile.SaveAs(path);
            //            //  lblMessage.Text += fileName + "Saved Successfully<br>";
            //        }

            //        int j = newgallargeimages(imgname23, txtemail.Text,course);
            //        if (j == 1)
            //        {
            //            path = "";
            //            //  string str = "alert('File Uploaded successfully.');";
            //            // Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //        }
            //        else
            //        {

            //        }
            //    }
            //}

            string date = System.DateTime.Now.ToString();

            bool i = InsertEmp(empid, mail, pw, firstname, middlename, lastname, fathername, mothername, spose, gender,
            fsn, sgender, spssn, sdob, kid1n, kid2n, kid3n, kid1g, kid2g, kid3g, kid1dob, kid2dob, kid3dob, k1sn, k2sn, k3sn,
            contry, state1, streer, city1, zip1, workp, homep, mobilep, birthdate, citizencountry, birthcity, birthstate,
            birthcountry, passport, passportissueat, passportissue, passportexp, nation, cnp1, cnp1p, cnp1mail, cnp1address,
            cnp2, cnp2p, cnp2mail, cnp2address, totalexpy, totalexpm, functionalarea, cindustry,
            sk1, sk1y, sk1m, sk1e, sk2, sk2y, sk2m, sk2e, sk3, sk3y, sk3m, sk3e, sk4, sk4y, sk4m, sk4e, sk5, sk5y, sk5m, sk5e, sk6, sk6y, sk6m, sk6e,
            ed1, ed1b, ed1s, ed1y, ed1p, ed2, ed2b, ed2s, ed2y, ed2p, ed3, ed3b, ed3s, ed3y, ed3p,
            ed4, ed4b, ed4s, ed4y, ed4p, ed5, ed5b, ed5s, ed5y, ed5p, ed6, ed6b, ed6s, ed6y, ed6p, ed7, ed7b, ed7s, ed7y, ed7p,
            imgName1, date, satus, fppath1, imgName, fppath, marital, bacname, acnumber, bname, badd, bifsc, bswift, bacadd,
            dnumber, dplace, dcity, door);

            if (i == true)
            {
                string from = "info@1indus.com";
                string to = empid;
                string subject = "1indus Employee account Registration";
                string Body = " Hi " + firstname + ",<br/><br/>Welcome to Biz Assist<br/><br/>";

                Body += "<b>Your Username :</b> " + empid + "<br/>";
                Body += "<b>Password :</b> " + pw + "<br/><br/>";

                SendMail(from, to, subject, Body);

                string strscpt = "alert ('Employee Details saved');location.replace('Admin_Employee.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please fill Emailid and password');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void lnkc_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        string aux = btn.CommandArgument;

        string Query = "";
        Query = "select * from employeedoc where did='" + aux + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, connection);
        connection.Open();
        SqlCommand cmd = new SqlCommand(Query, connection);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["imgname"].ToString();
        }
        connection.Close();
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["imgname"]);
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/Emp_photos/" + Fname));
            if (file.Exists)
            {
                Response.Clear();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                Response.AddHeader("content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";// 
                Response.WriteFile(file.FullName);
                Response.End();

            }
            else
            {
                //lblerror.Visible = true;
                //lblerror.ForeColor = System.Drawing.Color.Red;
                //lblerror.Text = "File doesnot Exist";
            }
        }
    }
   protected void upload_Click(object sender, EventArgs e)
    {
        string strUserid = txtemail.Text;
        if (strUserid != "")
        {
            string fppath = string.Empty;
            ds = sdata.GetEmpDet1(strUserid);
            string imgName = "";
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
                        if (j == 1)
                        {
                            fppath = "";
                            ddc.SelectedIndex = -1;
                            SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeedoc where emailid='" + strUserid + "' order by did asc", connection);
                            DataSet dssss = new DataSet();
                            sdaaaaa.Fill(dssss);
                            if (dssss.Tables[0].Rows.Count > 0)
                            {
                                dlc.DataSource = dssss;
                                dlc.DataBind();
                            }
                        }
                    }
                }
            }
        }
        else
        {
            string strscpt = "alert ('Please fill Emailid');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    private void SendMail(string from, string to, string subject, string body)
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(to);
            MailAddress address = new MailAddress(from);
            msgs.From = address;
            msgs.Subject = subject;
            string htmlBody = body;
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("svadapalliwar@aceindus.in", "Indusgroup1");
            client.Send(msgs);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your Account Registration mail Sent Successfull.');", true);
        }
        catch (Exception ex)
        {
            //Response.Write("Exception in send Email:" + ex.Message);
        }
    }
    private int newgallargeimages(string imgname23, string strUserid,string course)
    {

        connection.Open();
        string s = "insert into   employeedoc values('" + imgname23 + "','" + strUserid + "','" + course + "')";
        SqlCommand cmd = new SqlCommand(s, connection);
        int i = cmd.ExecuteNonQuery();
        connection.Close();
        return i;
    }

    private bool InsertEmp(string empid,string mail,string pw,string firstname,string middlename,string lastname,string fathername,string mothername,string spose,string gender,string 
        fsn,string sgender,string spssn,string sdob,string kid1n,string kid2n,string kid3n,string kid1g,string kid2g,string kid3g,string kid1dob,string kid2dob,string kid3dob,string k1sn,string k2sn,string k3sn,string 
        contry,string state1,string streer,string city1,string zip1,string workp,string homep,string mobilep,string birthdate,string citizencountry,string birthcity,string birthstate,string 
        birthcountry,string passport,string passportissueat,string passportissue,string passportexp,string nation,
        string cnp1, string cnp1p, string cnp1mail, string cnp1address, string 
        cnp2,string cnp2p,string cnp2mail,string cnp2address,string totalexpy,string totalexpm,string functionalarea,string cindustry,string 
        sk1,string sk1y,string sk1m,string sk1e,string sk2,string sk2y,string sk2m,string sk2e,string sk3,string sk3y,string sk3m,string sk3e,string sk4,string sk4y,string sk4m,string sk4e,string sk5,string sk5y,string sk5m,string sk5e,string sk6,string sk6y,string sk6m,string sk6e,string 
        ed1,string ed1b,string ed1s,string ed1y,string ed1p,string ed2,string ed2b,string ed2s,string ed2y,string ed2p,string ed3,string ed3b,string ed3s,string ed3y,string ed3p,string 
        ed4,string ed4b,string ed4s,string ed4y,string ed4p,string ed5,string ed5b,string ed5s,string ed5y,string ed5p,string ed6,string ed6b,string ed6s,string ed6y,string ed6p,string ed7,string ed7b,string ed7s,string ed7y,string ed7p,string 
        imgName1,string  date,string  satus,string  fppath1,string  imgName,string  fppath,string  marital,string  bacname,string  acnumber,string  bname,string  badd,string  bifsc,string  bswift,string  bacadd,string 
        dnumber,string  dplace,string  dcity,string  door)
    {
        string strQry = "insert into employeereg1 (empid,username,emailid,pwd,confirmpwd,firstname,middlename,lastname,fathername,";
        strQry = strQry + "mothername,spousename,gender,ssn,spousegender,spousessn,spousedob,kid1,kid2,kid3,child1gender,";
        strQry = strQry + "child2gender,child3gender,child1dob,child2dob,child3dob,child1ssn,child2ssn,child3ssn,country1,";
        strQry = strQry + "state1,street,city1,zip,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,birthstate,";
        strQry = strQry + "birthcountry,passportno,passportissuedat,dateofissue,doexp,nationality,contactpersonname1,cp1phone,";
        strQry = strQry + "cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2,totexptrs,";
        strQry = strQry + "totexpmonths,functionalarea,currentindustrytype,skills1,sk1years,sk1months,sk1exp,";
        strQry = strQry + "skills2,sk2years,sk2months,sk2exp,skills3,sk3years,sk3months,sk3exp,skills4,sk4years,sk4months,sk4exp,skills5,";
        strQry = strQry + "sk5years,sk5months,sk5exp,skills6,sk6years,sk6months,sk6exp,edu1,ed1brd,ed1sub,ed1year,ed1per,edu2,ed2brd,";
        strQry = strQry + "ed2sub,ed2year,ed2per,edu3,ed3brd,ed3sub,ed3year,ed3per,edu4,ed4brd,ed4sub,ed4year,ed4per,edu5,ed5brd,ed5sub,";
        strQry = strQry + "ed5year,ed5per,edu6,ed6brd,ed6sub,ed6year,ed6per,edu7,ed7brd,ed7sub,ed7year,ed7per,";
        strQry = strQry + "filename1,pdate,status,rpath,photo,photopath,marital_status,";
        strQry = strQry + "joindate,bankacname,bankacnumber,bankname,bankaddress,bankifsc,bankswift,";
        strQry = strQry + "bankacaddress,dlicencenumber,dissueplace,dissuecitty,doorno,mstatus)";

        strQry = strQry + "values('" + empid + "','" + mail + "','" + mail + "','" + pw + "','" + pw + "',";
    strQry = strQry + "    '" + firstname + "','" + middlename + "','" + lastname + "','" + fathername + "','" + mothername + "',";
    strQry = strQry + "   '" + spose + "','" + gender + "','" + fsn + "','" + sgender + "','" + spssn + "','" + sdob + "','" + kid1n + "','" + kid2n + "',";
     strQry = strQry + "    '"+kid3n+"','"+kid1g+"','"+kid2g+"','"+kid3g+"','"+kid1dob+"','"+kid2dob+"','"+kid3dob+"',";
        strQry = strQry + " '"+k1sn+"','"+k2sn+"','"+k3sn+"','"+ contry+"','"+state1+"','"+streer+"','"+city1+"','"+zip1+"',";
        strQry = strQry + " '"+workp+"','"+homep+"','"+mobilep+"','"+birthdate+"','"+citizencountry+"','"+birthcity+"',";
        strQry = strQry + " '"+birthstate+"','"+ birthcountry + "','" + passport + "','" + passportissueat + "',";
        strQry = strQry + " '" + passportissue + "','" + passportexp + "','" + nation + "','" + cnp1 + "','" + cnp1p + "',";
        strQry = strQry + " '" + cnp1mail + "','" + cnp1address + "','" + cnp2+"','"+cnp2p+"','"+cnp2mail+"','"+cnp2address+"',";
        strQry = strQry + " '"+totalexpy+"','"+totalexpm+"','"+functionalarea+"','"+cindustry+"','"+ sk1+"','"+sk1y+"',";
        strQry = strQry + " '"+sk1m+"','"+sk1e+"','"+sk2+"','"+sk2y+"','"+sk2m+"','"+sk2e+"','"+sk3+"','"+sk3y+"','"+sk3m+"',";
        strQry = strQry + " '"+sk3e+"','"+sk4+"','"+sk4y+"','"+sk4m+"','"+sk4e+"','"+sk5+"','"+sk5y+"','"+sk5m+"','"+sk5e+"',";
        strQry = strQry + " '"+sk6+"','"+sk6y+"','"+sk6m+"','"+sk6e+"','"+ ed1+"','"+ed1b+"','"+ed1s+"','"+ed1y+"','"+ed1p+"',";
        strQry = strQry + " '"+ed2+"','"+ed2b+"','"+ed2s+"','"+ed2y+"','"+ed2p+"','"+ed3+"','"+ed3b+"','"+ed3s+"','"+ed3y+"',";
        strQry = strQry + " '"+ed3p+"','"+ ed4+"','"+ed4b+"','"+ed4s+"','"+ed4y+"','"+ed4p+"','"+ed5+"','"+ed5b+"','"+ed5s+"',";
        strQry = strQry + " '"+ed5y+"','"+ed5p+"','"+ed6+"','"+ed6b+"','"+ed6s+"','"+ed6y+"','"+ed6p+"','"+ed7+"','"+ed7b+"',";
        strQry = strQry + " '"+ed7s+"','"+ed7y+"','"+ed7p+"','"+ imgName1 + "','" + date + "','" + satus + "','" + fppath1 + "',";
        strQry = strQry + " '" + imgName + "','" + fppath + "','" + marital + "','" + date + "','" + bacname + "',";
        strQry = strQry + " '" + acnumber + "','" + bname + "','" + badd + "','" + bifsc + "','" + bswift + "',";
        strQry = strQry + " '" + bacadd + "','" + dnumber + "','" + dplace + "','" + dcity + "','" + door + "',";
        strQry = strQry + " '" + marital + "')";



        string strx = string.Empty;
        connection.Open();
        SqlCommand cmd = new SqlCommand(strQry, connection);
        strx = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        if (strx == "1")
        {
            connection.Open();
            string strQry1 = "insert into Users_Information(userid,emailid,fname,lname,password,mobile,status,country,Designation,empid) values('" + mail + "','" + mail + "','" + firstname + "','" + lastname + "','" + pw + "','" + mobilep + "','0','USA','Employee','"+empid+"');";
            SqlCommand cmd11 = new SqlCommand(strQry1, connection);
            int i = cmd11.ExecuteNonQuery();
            connection.Close();
           
            return true;
        }
        else
        {
            return false;
        }
    }

    private DataSet getemailid()
    {
        string qry = " select top(1) empid from employeereg1 order by userid desc";
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    private DataSet GetEmpDet1(string usid)
    {
        DataSet ds = new DataSet();
        string qry = "select * from employeereg1 where username='" + usid + "'";
        connection.Open();
        SqlDataAdapter da = new SqlDataAdapter(qry, connection);
        da.Fill(ds);
        connection.Close();
        return ds;
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Employee.aspx");
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        // int index = Convert.ToInt32(e.RowIndex);
        connection.Open();
        SqlCommand cmd = new SqlCommand("delete FROM IG_Immigrant where sno='" + lbldeleteid.Text + "'", connection);
        cmd.ExecuteNonQuery();
        connection.Close();
        subgrid();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                }
            }
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");

        TextBox intialland = (TextBox)row.Cells[0].Controls[0].FindControl("txtin");
        TextBox fromind = ((TextBox)row.Cells[1].Controls[0].FindControl("txtfrom"));
        TextBox datearrival = ((TextBox)row.Cells[2].Controls[0].FindControl("txtdateArrive"));
        TextBox i94 = ((TextBox)row.Cells[3].Controls[0].FindControl("txtI94"));
        TextBox vistype = ((TextBox)row.Cells[4].Controls[0].FindControl("txtVisaType"));

        TextBox reason = ((TextBox)row.Cells[5].Controls[0].FindControl("txtReasonTravel"));
        TextBox stayfrom = ((TextBox)row.Cells[6].Controls[0].FindControl("txtStayFrom"));
        TextBox stayto = ((TextBox)row.Cells[7].Controls[0].FindControl("txtStayTo"));
        TextBox visastamp = ((TextBox)row.Cells[8].Controls[0].FindControl("txtVisaStampLoc"));
        TextBox passport = ((TextBox)row.Cells[9].Controls[0].FindControl("txtPassportIssCountry"));


        connection.Open();
        SqlCommand cmd = new SqlCommand("Update IG_Immigrant set Initial_Landing_USA='" + intialland.Text + "',From_Location='" + fromind.Text + "',Date_Arrived='" + datearrival.Text + "',        I94='" + i94.Text + "',Visa_Type='" + vistype.Text + "',Reason_Travel='" + reason.Text + "',Stay_From='" + stayfrom.Text + "',Stay_To='" + stayto.Text + "',Visa_Stamp_Location='" + visastamp.Text + "',        Passport_Issued_Country='" + passport.Text + "' where sno='" + lblID.Text + "'", connection);
        cmd.ExecuteNonQuery();
        connection.Close();
        GridView1.EditIndex = -1;
        subgrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataTable dt = new DataTable();
        GridView1.EditIndex = e.NewEditIndex;
        ViewState["CurrentTable"] = dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        emailid = txtemail.Text;
        if (emailid != "")
        {
            string intialland = dduscitis.SelectedItem.Text;
            string fromind = ddindcitis.SelectedItem.Text;
            string datearrival = txtdateofarrival.Text;
            string i94 = txti94.Text;
            string vistype = ddvisatype.SelectedItem.Text;

            string reason = txtreason.Text;
            string stayfrom = txtstayfrom.Text;
            string stayto = txtstayto.Text;
            string visastamp = ddvisastamp.SelectedItem.Text;
            string passport = ddindpassport.SelectedItem.Text;

            string date = DateTime.UtcNow.ToString();

            connection.Open();
            string s = "insert into   IG_Immigrant values('" + emailid + "','" + intialland + "','" + fromind + "','" + datearrival + "','" + i94 + "','" + vistype + "',        '" + reason + "','" + stayfrom + "','" + stayto + "','" + visastamp + "','" + passport + "','1','" + date + "')";
            SqlCommand cmd = new SqlCommand(s, connection);
            int i = cmd.ExecuteNonQuery();
            connection.Close();

            subgrid();
        }
        else
        {
            string strscpt = "alert ('Please fill Emailid');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    public void subgrid()
    {
        emailid = txtemail.Text;
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from IG_Immigrant where email='" + emailid + "' order by sno asc", connection);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if (dssss.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = dssss;
            GridView1.DataBind();
        }
    }

    protected void OnCancel(object sender, EventArgs e)
    {
        //if (ViewState["currtable"] != null)
        //{
        //    GridView1.EditIndex = -1;
        //    subgrid();
        //}
        //else
        //{
        GridView1.EditIndex = -1;
        subgrid();
        //}
    }

    protected void GridView1_RowEditing1(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        subgrid();
    }

    public void country1()
    {
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from cg_Country_Master  order by txtcountry_name asc", connection);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if (dssss.Tables[0].Rows.Count > 0)
        {
            ddindpassport.DataSource = dssss;
            ddindpassport.DataTextField = "txtcountry_name";
            ddindpassport.DataBind();
            ddindpassport.Items.Insert(0, "Select");
        }
    }

    public void usastates()
    {
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select  * from  [dbo].[City_Master] where intcountryid=2", connection);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if (dssss.Tables[0].Rows.Count > 0)
        {
            dduscitis.DataSource = dssss;
            dduscitis.DataTextField = "cityname";
            dduscitis.DataBind();
            dduscitis.Items.Insert(0, "Select");

            ddvisastamp.DataSource = dssss;
            ddvisastamp.DataTextField = "cityname";
            ddvisastamp.DataBind();
            ddvisastamp.Items.Insert(0, "Select");

        }
    }

    public void indiastates()
    {
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select  * from  [dbo].[City_Master] where intcountryid=1", connection);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if (dssss.Tables[0].Rows.Count > 0)
        {
            ddindcitis.DataSource = dssss;
            ddindcitis.DataTextField = "cityname";
            ddindcitis.DataBind();
            ddindcitis.Items.Insert(0, "Select");

        }
    }


    //public static string SendEmail(string to, string subject, string bodyText, string from, string fromName)
    //{
    //    WebClient client = new WebClient();
    //    NameValueCollection values = new NameValueCollection();
    //    values.Add("username", USERNAME);
    //    values.Add("api_key", API_KEY);
    //    values.Add("from", from);
    //    values.Add("from_name", fromName);
    //    values.Add("to", to);
    //    values.Add("subject", subject);
    //    values.Add("body_html", bodyText);

    //    byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
    //    return Encoding.UTF8.GetString(response);
    //}
}
