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
using System.Linq;
using System.Web.Configuration;

public partial class Admin_EmpEdit : System.Web.UI.Page
{
    string cotry = string.Empty;
    IGIIT sdata = new IGIIT();
    DataSet ds = new DataSet();
    string empid = string.Empty;
    string emailid = string.Empty;
    string filenm = string.Empty;

    DataSet dsall = new DataSet();
    string Postedby;
    string LoginId;
    string DocName;
    string folder;
    string subfolder;
    string FileName;
    string usid = string.Empty;


    //Initialise object to navigate and bind countries
    StateCountry countries = new StateCountry();
    AdminCS obj = new AdminCS();
    string Desig;

    //Establish sql connection
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    /// <summary>
    /// employee details shown specific login employee
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                if (Request.QueryString["cid"] != null)
                    usid = Request.QueryString["cid"].ToString();
                else
                    Response.Redirect("Default.aspx");

                int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
                ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

           //     emailid = Session["userid"].ToString();
             //   Desig = Convert.ToString(Session["Designation"]);
                SqlDataReader dr;
                string qry = "select * from employeereg1 where userid='" + usid + "'";
                //open database connection to connect to sql server
                con.Open();
                SqlCommand cmd = new SqlCommand(qry, con);
                dr = cmd.ExecuteReader();
                //close database connection to disconnect to sql server

                while (dr.Read())
                {
                    emailid = Convert.ToString(dr["emailid"]);
                    Session["LogInId"] = emailid;
                }
                con.Close();
            }


            country1();
            usastates();
            indiastates();

            string streg = string.Empty;

            //Navigate and bind employee details
            ds = sdata.GetEmpDet1(emailid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                subgrid();

                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeedoc where emailid='" + emailid + "' order by did asc", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);
                if (dssss.Tables[0].Rows.Count > 0)
                {
                    dlc.DataSource = dssss;
                    dlc.DataBind();
                }

                txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["username"].ToString();
                conemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                fname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                lname.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                mname.Text = ds.Tables[0].Rows[0]["middlename"].ToString();

                string x = ds.Tables[0].Rows[0]["gender"].ToString();

                if (x == "Male")
                {
                    gend1.Checked = true;
                    gend1.Text = x;
                }
                else
                {
                    gend2.Checked = true;
                    gend2.Text = "Female";
                }

                string y = ds.Tables[0].Rows[0]["mstatus"].ToString();

                if (y == "Married")
                {
                    chkmarried.Checked = true;
                    chkmarried.Text = y;
                }
                else
                {
                    chkunmaried.Checked = true;
                    chkunmaried.Text = "Unmarried";
                }
                fssn.Text = ds.Tables[0].Rows[0]["ssn"].ToString();
                mmname.Text = ds.Tables[0].Rows[0]["spousename"].ToString();
                sbd.Text = ds.Tables[0].Rows[0]["spousedob"].ToString();
                Spssn.Text = ds.Tables[0].Rows[0]["spousessn"].ToString();

                string x4 = ds.Tables[0].Rows[0]["spousegender"].ToString();

                if (x4 == "Male")
                {
                    spgen1.Checked = true;
                    spgen1.Text = x4;
                }
                else
                {
                    spgen2.Checked = true;
                    spgen2.Text = "Female";
                }

                fatname.Text = ds.Tables[0].Rows[0]["fathername"].ToString();
                motname.Text = ds.Tables[0].Rows[0]["mothername"].ToString();

                k1name.Text = ds.Tables[0].Rows[0]["kid1"].ToString();
                k2name.Text = ds.Tables[0].Rows[0]["kid2"].ToString();
                k3name.Text = ds.Tables[0].Rows[0]["kid3"].ToString();

                k1bd.Text = ds.Tables[0].Rows[0]["child1dob"].ToString();
                k2bd.Text = ds.Tables[0].Rows[0]["child2dob"].ToString();
                k3bd.Text = ds.Tables[0].Rows[0]["child3dob"].ToString();

                k1ssn.Text = ds.Tables[0].Rows[0]["child1ssn"].ToString();
                k2ssn.Text = ds.Tables[0].Rows[0]["child2ssn"].ToString();
                k3ssn.Text = ds.Tables[0].Rows[0]["child3ssn"].ToString();

                string x1 = ds.Tables[0].Rows[0]["child1gender"].ToString();
                if (x1 == "Male")
                {
                    k1gen1.Checked = true;
                    k1gen1.Text = x1;
                }
                else
                {
                    k1gen2.Checked = true;
                    k1gen2.Text = "Female";
                }
                string x2 = ds.Tables[0].Rows[0]["child2gender"].ToString();
                if (x2 == "Male")
                {
                    k2gen1.Checked = true;
                    k2gen1.Text = x2;
                }
                else
                {
                    k2gen2.Checked = true;
                    k2gen2.Text = "Female";
                }
                string x3 = ds.Tables[0].Rows[0]["child3gender"].ToString();
                if (x3 == "Male")
                {
                    k3gen1.Checked = true;
                    k3gen1.Text = x3;
                }
                else
                {
                    k3gen2.Checked = true;
                    k3gen2.Text = "Female";
                }

                country.Text = ds.Tables[0].Rows[0]["country1"].ToString();
                street.Text = ds.Tables[0].Rows[0]["street"].ToString();
                state.Text = ds.Tables[0].Rows[0]["state1"].ToString();
                city.Text = ds.Tables[0].Rows[0]["city1"].ToString();
                zip.Text = ds.Tables[0].Rows[0]["zip"].ToString();

                string s = ds.Tables[0].Rows[0]["workphone"].ToString();
                if (s.Length >= 10)
                {
                    wp1.Text = s.Substring(0, 3);
                    wp2.Text = s.Substring(3, 3);
                    wp3.Text = s.Substring(6, 4);
                }

                string ss = ds.Tables[0].Rows[0]["homephone"].ToString();

                if (ss.Length >= 10)
                {
                    hp1.Text = ss.Substring(0, 3);
                    hp2.Text = ss.Substring(3, 3);
                    hp3.Text = ss.Substring(6, 4);
                }
                string ms = ds.Tables[0].Rows[0]["mobile"].ToString();

                if (ms.Length >= 10)
                {
                    mb1.Text = ms.Substring(0, 3);
                    mb2.Text = ms.Substring(3, 3);
                    mb3.Text = ms.Substring(6, 4);
                }

                bdate.Text = ds.Tables[0].Rows[0]["birthdate"].ToString();
                bcountry.Text = ds.Tables[0].Rows[0]["birthcountry"].ToString();
                bstate.Text = ds.Tables[0].Rows[0]["birthstate"].ToString();
                bcity.Text = ds.Tables[0].Rows[0]["birthcity"].ToString();
                ccountry.Text = ds.Tables[0].Rows[0]["cntryofcitizenship"].ToString();
                passno.Text = ds.Tables[0].Rows[0]["passportno"].ToString();
                pcountry.Text = ds.Tables[0].Rows[0]["passportissuedat"].ToString();
                issdate.Text = ds.Tables[0].Rows[0]["dateofissue"].ToString();
                expdate.Text = ds.Tables[0].Rows[0]["doexp"].ToString();
                ncountry.Text = ds.Tables[0].Rows[0]["nationality"].ToString();
                cpname1.Text = ds.Tables[0].Rows[0]["contactpersonname1"].ToString();
                cpphone1.Text = ds.Tables[0].Rows[0]["cp1phone"].ToString();
                cpemail1.Text = ds.Tables[0].Rows[0]["cp1email"].ToString();
                cpaddr1.Text = ds.Tables[0].Rows[0]["cpaddress1"].ToString();
                cpname2.Text = ds.Tables[0].Rows[0]["contactpersonname2"].ToString();
                cpphone2.Text = ds.Tables[0].Rows[0]["cp2phone2"].ToString();
                cpemail2.Text = ds.Tables[0].Rows[0]["cp2email"].ToString();
                cpaddr2.Text = ds.Tables[0].Rows[0]["cpaddress2"].ToString();
                expyrs.Text = ds.Tables[0].Rows[0]["totexptrs"].ToString();
                expmon.Text = ds.Tables[0].Rows[0]["totexpmonths"].ToString();
                fnarea.Text = ds.Tables[0].Rows[0]["functionalarea"].ToString();
                currind.Text = ds.Tables[0].Rows[0]["currentindustrytype"].ToString();
                txtdoor.Text = ds.Tables[0].Rows[0]["doorno"].ToString();
                txtacname.Text = ds.Tables[0].Rows[0]["bankacname"].ToString();
                txtacnum.Text = ds.Tables[0].Rows[0]["bankacnumber"].ToString();
                txtbankname.Text = ds.Tables[0].Rows[0]["bankname"].ToString();
                txtbankadd.Text = ds.Tables[0].Rows[0]["bankaddress"].ToString();
                txtifsc.Text = ds.Tables[0].Rows[0]["bankifsc"].ToString();
                txtswift.Text = ds.Tables[0].Rows[0]["bankswift"].ToString();
                txtbranchacaddress.Text = ds.Tables[0].Rows[0]["bankacaddress"].ToString();
                txtdrivenumber.Text = ds.Tables[0].Rows[0]["dlicencenumber"].ToString();
                txtdriveplace.Text = ds.Tables[0].Rows[0]["dissueplace"].ToString();
                txtdrivecity.Text = ds.Tables[0].Rows[0]["dissuecitty"].ToString();

                // Skills
                skills1.Text = ds.Tables[0].Rows[0]["skills1"].ToString();
                sk1mnts.Text = ds.Tables[0].Rows[0]["sk1months"].ToString();
                sk1yrs.Text = ds.Tables[0].Rows[0]["sk1years"].ToString();
                sk1exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk1exp"].ToString();

                skills2.Text = ds.Tables[0].Rows[0]["skills2"].ToString();
                sk2mnts.Text = ds.Tables[0].Rows[0]["sk2months"].ToString();
                sk2yrs.Text = ds.Tables[0].Rows[0]["sk2years"].ToString();
                sk2exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk2exp"].ToString();

                skills3.Text = ds.Tables[0].Rows[0]["skills3"].ToString();
                sk3mnts.Text = ds.Tables[0].Rows[0]["sk3months"].ToString();
                sk3yrs.Text = ds.Tables[0].Rows[0]["sk3years"].ToString();
                sk3exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk3exp"].ToString();

                skills4.Text = ds.Tables[0].Rows[0]["skills4"].ToString();
                sk4mnts.Text = ds.Tables[0].Rows[0]["sk4months"].ToString();
                sk4yrs.Text = ds.Tables[0].Rows[0]["sk4years"].ToString();
                sk4exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk4exp"].ToString();

                skills5.Text = ds.Tables[0].Rows[0]["skills5"].ToString();
                sk5mnts.Text = ds.Tables[0].Rows[0]["sk5months"].ToString();
                sk5yrs.Text = ds.Tables[0].Rows[0]["sk5years"].ToString();
                sk5exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk5exp"].ToString();

                skills6.Text = ds.Tables[0].Rows[0]["skills6"].ToString();
                sk6mnts.Text = ds.Tables[0].Rows[0]["sk6months"].ToString();
                sk6yrs.Text = ds.Tables[0].Rows[0]["sk6years"].ToString();
                sk6exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk6exp"].ToString();

                // Eductioan Details.
                edu1.Text = ds.Tables[0].Rows[0]["edu1"].ToString();
                ed1brd.Text = ds.Tables[0].Rows[0]["ed1brd"].ToString();
                ed1sub.Text = ds.Tables[0].Rows[0]["ed1sub"].ToString();
                ed1yr.Text = ds.Tables[0].Rows[0]["ed1year"].ToString();
                ed1per.Text = ds.Tables[0].Rows[0]["ed1per"].ToString();

                edu2.Text = ds.Tables[0].Rows[0]["edu2"].ToString();
                ed2brd.Text = ds.Tables[0].Rows[0]["ed2brd"].ToString();
                ed2sub.Text = ds.Tables[0].Rows[0]["ed2sub"].ToString();
                ed2yr.Text = ds.Tables[0].Rows[0]["ed2year"].ToString();
                ed2per.Text = ds.Tables[0].Rows[0]["ed2per"].ToString();

                edu3.Text = ds.Tables[0].Rows[0]["edu3"].ToString();
                ed3brd.Text = ds.Tables[0].Rows[0]["ed3brd"].ToString();
                ed3sub.Text = ds.Tables[0].Rows[0]["ed3sub"].ToString();
                ed3yr.Text = ds.Tables[0].Rows[0]["ed3year"].ToString();
                ed3per.Text = ds.Tables[0].Rows[0]["ed3per"].ToString();

                edu4.Text = ds.Tables[0].Rows[0]["edu4"].ToString();
                ed4brd.Text = ds.Tables[0].Rows[0]["ed4brd"].ToString();
                ed4sub.Text = ds.Tables[0].Rows[0]["ed4sub"].ToString();
                ed4yr.Text = ds.Tables[0].Rows[0]["ed4year"].ToString();
                ed4per.Text = ds.Tables[0].Rows[0]["ed4per"].ToString();

                edu5.Text = ds.Tables[0].Rows[0]["edu5"].ToString();
                ed5brd.Text = ds.Tables[0].Rows[0]["ed5brd"].ToString();
                ed5sub.Text = ds.Tables[0].Rows[0]["ed5sub"].ToString();
                ed5yr.Text = ds.Tables[0].Rows[0]["ed5year"].ToString();
                ed5per.Text = ds.Tables[0].Rows[0]["ed5per"].ToString();

                edu6.Text = ds.Tables[0].Rows[0]["edu6"].ToString();
                ed6brd.Text = ds.Tables[0].Rows[0]["ed6brd"].ToString();
                ed6sub.Text = ds.Tables[0].Rows[0]["ed6sub"].ToString();
                ed6yr.Text = ds.Tables[0].Rows[0]["ed6year"].ToString();
                ed6per.Text = ds.Tables[0].Rows[0]["ed6per"].ToString();

                edu7.Text = ds.Tables[0].Rows[0]["edu7"].ToString();
                ed7brd.Text = ds.Tables[0].Rows[0]["ed7brd"].ToString();
                ed7sub.Text = ds.Tables[0].Rows[0]["ed7sub"].ToString();
                ed7yr.Text = ds.Tables[0].Rows[0]["ed7year"].ToString();
                ed7per.Text = ds.Tables[0].Rows[0]["ed7per"].ToString();
                //  lnkphoto.Text = ds.Tables[0].Rows[0]["photo"].ToString();
                //   lnkresume.Text = ds.Tables[0].Rows[0]["filename1"].ToString();


                txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                imgdisplay.ImageUrl = "~/admin/emp_photos/" + ds.Tables[0].Rows[0]["photo"].ToString();
            }
        }
    }

    /// <summary>
    /// update employee datails
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //personal details
        string firstname = fname.Text;
        string middlename = mname.Text;
        string lastname = lname.Text;
        string fsn = fssn.Text;
        string gender = "";
        if (gend1.Checked == true)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }
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
        string k2sn = k1ssn.Text;
        string k3sn = k1ssn.Text;

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


        string strUserid = Session["LogInId"].ToString();
        string fppath = string.Empty;
        string fppath1 = string.Empty;
        string imgName1 = "";
        string imgName = "";

        ds = sdata.GetEmpDet1(strUserid);
        if (txtimgfupload.HasFile)
        {
            imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
            string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);
            string iname = ds.Tables[0].Rows[0]["firstname"].ToString() + "." + ds.Tables[0].Rows[0]["lastname"].ToString() + "_Photo" + strextension;

            if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
            {
                //fppath = Server.MapPath("~/Emp_photos/" + strUserid + imgName);
                //txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + strUserid + imgName));
                //imgName = strUserid + imgName;

                //imgName = ds.Tables[0].Rows[0]["photopath"].ToString();
                //fppath = Server.MapPath("~/Emp_photos/" + iname);
                //if (imgName==fppath)
                //{
                //    System.IO.File.Delete(Server.MapPath("~/Emp_photos/" + iname));
                //}

                fppath = Server.MapPath("~/Emp_photos/" + iname);
                txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/Emp_photos/" + iname));
                imgName = iname;
            }
        }
        else
        {
            imgName = ds.Tables[0].Rows[0]["photo"].ToString();
            fppath = ds.Tables[0].Rows[0]["photopath"].ToString();
        }


        if (txtresupload.HasFile)
        {

            imgName1 = System.IO.Path.GetFileName(txtresupload.PostedFile.FileName);
            string strextension1 = System.IO.Path.GetExtension(txtresupload.PostedFile.FileName);
            string iresume = ds.Tables[0].Rows[0]["firstname"].ToString() + "." + ds.Tables[0].Rows[0]["lastname"].ToString() + "_Resume" + strextension1;

            if ((strextension1 == ".doc") || (strextension1 == ".docx"))
            {
                //fppath1 = Server.MapPath("~/Resumes/" + strUserid + imgName1);
                //txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + strUserid + imgName1));
                //imgName1 = strUserid + imgName1;

                fppath1 = Server.MapPath("~/Resumes/" + iresume);
                txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + iresume));
                imgName1 = iresume;
            }
        }
        else
        {
            imgName1 = ds.Tables[0].Rows[0]["filename1"].ToString();
            fppath1 = ds.Tables[0].Rows[0]["rpath"].ToString();
        }

        //if (filedoc.HasFile)
        //{

        //HttpFileCollection fileCollection = Request.Files;
        //for (int i1 = 2; i1 < fileCollection.Count; i1++)
        //{
        //    HttpPostedFile uploadfile = fileCollection[i1];
        //    string fileName = Path.GetFileName(uploadfile.FileName);

        //    // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
        //    string path = Server.MapPath("~/admin/Employee_Docs/" + strUserid + fileName);
        //    filedoc.SaveAs(path);

        //    string imgname23 = strUserid + fileName;
        //    if (uploadfile.ContentLength > 0)
        //    {
        //        uploadfile.SaveAs(path);
        //        //  lblMessage.Text += fileName + "Saved Successfully<br>";
        //    }

        //    int j = newgallargeimages(imgname23, strUserid,);
        //    if (j == 1)
        //    {
        //        path = "";
        //        //  string str = "alert('File Uploaded successfully.');";
        //        // Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //    }
        //    else
        //    {
        //        //   string str = "alert('Sorry Try Again');";
        //        //  Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //    }
        //}
        //  }

        string date = System.DateTime.Now.ToString();
        int i = update(firstname, middlename, lastname, fathername, mothername, spose, gender, sgender, sdob, kid1n, kid2n, kid3n,
kid1g, kid2g, kid3g, kid1dob, kid2dob, kid3dob, contry, state1, streer, city1, zip1, door, workp, homep, mobilep,
birthdate, citizencountry, birthcity, birthstate, birthcountry, passport, passportissueat, passportissue, passportexp,
nation, cnp1, cnp1p, cnp1mail, cnp1address, cnp2, cnp2p, cnp2mail, cnp2address, totalexpy, totalexpm, functionalarea, cindustry,
sk1, sk1y, sk1m, sk1e, sk2, sk2y, sk2m, sk2e, sk3, sk3y, sk3m, sk3e, sk4, sk4y, sk4m, sk4e, sk5, sk5y, sk5m, sk5e, sk6, sk6y, sk6m, sk6e,
ed1, ed1b, ed1s, ed1y, ed1p, ed2, ed2b, ed2s, ed2y, ed2p, ed3, ed3b, ed3s, ed3y, ed3p, ed4, ed4b, ed4s, ed4y, ed4p,
ed5, ed5b, ed5s, ed5y, ed5p, ed6, ed6b, ed6s, ed6y, ed6p, ed7, ed7b, ed7s, ed7y, ed7p, imgName1, date, fppath1, imgName, fppath,
bacname, acnumber, bname, badd, bifsc, bswift, bacadd, dnumber, dplace, dcity, strUserid, marital, fsn, spssn, k1sn, k2sn, k3sn);

        if (i == 1)
        {
            string strscpt = "alert ('Your Details Updated');location.replace('Admin_Employee.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    /// <summary>
    /// insert certificates 
    /// </summary>
    /// <param name="imgname23"></param>
    /// <param name="strUserid"></param>
    /// <param name="course"></param>
    /// <returns></returns>
    private int newgallargeimages(string imgname23, string strUserid, string course)
    {
        con.Open();
        string s = "insert into   employeedoc values('" + imgname23 + "','" + strUserid + "','" + course + "')";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    private int update(string firstname, string middlename, string lastname, string fathername, string mothername,
        string spose, string gender, string sgender, string sdob, string kid1n, string kid2n, string kid3n,
        string kid1g, string kid2g, string kid3g, string kid1dob, string kid2dob, string kid3dob, string contry,
        string state1, string streer, string city1, string zip1, string door, string workp, string homep,
        string mobilep, string birthdate, string citizencountry, string birthcity, string birthstate, string
        birthcountry, string passport, string passportissueat, string passportissue, string passportexp, string nation,
        string cnp1, string cnp1p, string cnp1mail, string cnp1address, string cnp2, string cnp2p, string cnp2mail,
        string cnp2address, string totalexpy, string totalexpm, string functionalarea, string cindustry, string sk1,
        string sk1y, string sk1m, string sk1e, string sk2, string sk2y, string sk2m, string sk2e, string sk3, string sk3y,
        string sk3m, string sk3e, string sk4, string sk4y, string sk4m, string sk4e, string sk5, string sk5y, string sk5m,
        string sk5e, string sk6, string sk6y, string sk6m, string sk6e, string ed1, string ed1b, string ed1s, string ed1y,
        string ed1p, string ed2, string ed2b, string ed2s, string ed2y, string ed2p, string ed3, string ed3b,
        string ed3s, string ed3y, string ed3p, string ed4, string ed4b, string ed4s, string ed4y, string ed4p,
        string ed5, string ed5b, string ed5s, string ed5y, string ed5p, string ed6, string ed6b, string ed6s,
        string ed6y, string ed6p, string ed7, string ed7b, string ed7s, string ed7y, string ed7p, string imgName1,
        string date, string fppath1, string imgName, string fppath, string bacname, string acnumber, string bname,
        string badd, string bifsc, string bswift, string bacadd, string dnumber, string dplace,
        string dcity, string strUserid, string marital, string fsn, string spssn, string k1sn, string k2sn, string k3sn)
    {
        con.Open();
        string s = "update  employeereg1  set firstname='" + firstname + "',mstatus='" + marital + "',middlename='" + middlename + "',lastname='" + lastname + "',fathername='" + fathername + "', mothername='" + mothername + "',spousename='" + spose + "',gender='" + gender + "',spousegender='" + sgender + "',spousedob='" + sdob + "', kid1='" + kid1n + "',kid2='" + kid2n + "',kid3='" + kid3n + "',child1gender='" + kid1g + "',child2gender='" + kid2g + "',child3gender='" + kid3g + "',child1dob='" + kid1dob + "',child2dob='" + kid2dob + "',child3dob='" + kid3dob + "',country1='" + contry + "',state1='" + state1 + "',street='" + streer + "',city1='" + city1 + "',zip='" + zip1 + "',doorno='" + door + "',workphone='" + workp + "',homephone='" + homep + "',mobile='" + mobilep + "',birthdate='" + birthdate + "',cntryofcitizenship='" + citizencountry + "',birthcity='" + birthcity + "',birthstate='" + birthstate + "',birthcountry='" + birthcountry + "',passportno='" + passport + "',passportissuedat='" + passportissueat + "',dateofissue='" + passportissue + "',doexp='" + passportexp + "',nationality='" + nation + "',contactpersonname1='" + cnp1 + "',cp1phone='" + cnp1p + "',cp1email='" + cnp1mail + "',cpaddress1='" + cnp1address + "',contactpersonname2='" + cnp2 + "',cp2phone2='" + cnp2p + "',cp2email='" + cnp2mail + "',cpaddress2='" + cnp2address + "',totexptrs='" + totalexpy + "',totexpmonths='" + totalexpm + "',functionalarea='" + functionalarea + "',currentindustrytype ='" + cindustry + "',skills1 ='" + sk1 + "',sk1years ='" + sk1y + "',sk1months ='" + sk1m + "',sk1exp ='" + sk1e + "',skills2 ='" + sk2 + "',sk2years ='" + sk2y + "',sk2months ='" + sk2m + "',sk2exp='" + sk2e + "',skills3='" + sk3 + "',sk3years='" + sk3y + "',sk3months='" + sk3m + "',sk3exp='" + sk3e + "',skills4='" + sk4 + "',sk4years='" + sk4y + "',sk4months='" + sk4m + "',sk4exp='" + sk4e + "',skills5='" + sk5 + "',sk5years='" + sk5y + "',sk5months='" + sk5m + "',sk5exp='" + sk5e + "',skills6='" + sk6 + "',sk6years='" + sk6y + "',sk6months='" + sk6m + "',sk6exp='" + sk6e + "',edu1='" + ed1 + "',ed1brd='" + ed1b + "',ed1sub='" + ed1s + "',     ed1year='" + ed1y + "',ed1per='" + ed1p + "',edu2='" + ed2 + "',ed2brd='" + ed2b + "',ed2sub='" + ed2s + "',ed2year='" + ed2y + "',ed2per='" + ed2p + "',edu3='" + ed3 + "',ed3brd='" + ed3b + "', ed3sub='" + ed3s + "',        ed3year='" + ed3y + "',ed3per='" + ed3p + "',edu4='" + ed4 + "',ed4brd='" + ed4b + "',ed4sub='" + ed4s + "',ed4year='" + ed4y + "',        ed4per='" + ed4p + "',edu5='" + ed5 + "',ed5brd='" + ed5b + "',ed5sub='" + ed5s + "',ed5year='" + ed5y + "',ed5per='" + ed5p + "',edu6='" + ed6 + "',ed6brd='" + ed6b + "',ed6sub='" + ed6s + "',ed6year='" + ed6y + "',        ed6per='" + ed6p + "',edu7='" + ed7 + "',ed7brd='" + ed7b + "',ed7sub='" + ed7s + "',ed7year='" + ed7y + "',ed7per='" + ed7p + "',        filename1='" + imgName1 + "',pdate='" + date + "',rpath='" + fppath1 + "',photo='" + imgName + "',photopath='" + fppath + "',        bankacname='" + bacname + "',bankacnumber='" + acnumber + "',bankname='" + bname + "',        bankaddress='" + badd + "',bankifsc='" + bifsc + "',bankswift='" + bswift + "',bankacaddress='" + bacadd + "',dlicencenumber='" + dnumber + "',dissueplace='" + dplace + "',dissuecitty='" + dcity + "',ssn='" + fsn + "',spousessn='" + spssn + "',child1ssn='" + k1sn + "',child2ssn='" + k2sn + "',child3ssn='" + k3sn + "' where username='" + strUserid + "'";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();

        return i;
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Home.aspx");
    }

    /// <summary>
    /// download photo
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkphoto_Click(object sender, EventArgs e)
    {
        emailid = Session["LogInId"].ToString();

        string Query = "";
        Query = "select userid,photo,photopath from employeereg1 where username='" + emailid + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
        con.Open();
        SqlCommand cmd = new SqlCommand(Query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["photo"].ToString();
        }
        con.Close();
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["photo"]);
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/admin/emp_photos/" + Fname));
            if (file.Exists)
            {
                Response.Clear();
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

    /// <summary>
    /// download resume
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkresume_Click(object sender, EventArgs e)
    {
        emailid = Session["LogInId"].ToString();

        string Query = "";
        Query = "select userid,filename1,rpath from employeereg1 where username='" + emailid + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
        con.Open();
        SqlCommand cmd = new SqlCommand(Query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["filename1"].ToString();
        }
        con.Close();
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["filename1"]);
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/Resumes/" + Fname));
            if (file.Exists)
            {
                Response.Clear();
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

    /// <summary>
    /// displayed certificates  
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void upload_Click(object sender, EventArgs e)
    {
        string strUserid = Session["LogInId"].ToString();
        string fppath = string.Empty;
        string imgName = "";
        ds = sdata.GetEmpDet1(strUserid);
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
                        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeedoc where emailid='" + strUserid + "' order by did asc", con);
                        DataSet dssss = new DataSet();
                        sdaaaaa.Fill(dssss);
                        if (dssss.Tables[0].Rows.Count > 0)
                        {
                            dlc.DataSource = dssss;
                            dlc.DataBind();
                        }
                        //  Response.Redirect("Emp_Profile.aspx");

                        //string strscpt = "alert('Your Certificate Updated');location.replace('Emp_Profile.aspx');";
                        //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
            }
        }
    }

    protected void lnkc_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        string aux = btn.CommandArgument;

        string Query = "";
        Query = "select * from employeedoc where did='" + aux + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
        con.Open();
        SqlCommand cmd = new SqlCommand(Query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["imgname"].ToString();
        }
        con.Close();
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

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        // int index = Convert.ToInt32(e.RowIndex);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM IG_Immigrant where sno='" + lbldeleteid.Text + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
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


        con.Open();
        SqlCommand cmd = new SqlCommand("Update IG_Immigrant set Initial_Landing_USA='" + intialland.Text + "',From_Location='" + fromind.Text + "',Date_Arrived='" + datearrival.Text + "',        I94='" + i94.Text + "',Visa_Type='" + vistype.Text + "',Reason_Travel='" + reason.Text + "',Stay_From='" + stayfrom.Text + "',Stay_To='" + stayto.Text + "',Visa_Stamp_Location='" + visastamp.Text + "',        Passport_Issued_Country='" + passport.Text + "' where sno='" + lblID.Text + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
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
        emailid = Session["LogInId"].ToString();

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

        con.Open();
        string s = "insert into   IG_Immigrant values('" + emailid + "','" + intialland + "','" + fromind + "','" + datearrival + "','" + i94 + "','" + vistype + "',        '" + reason + "','" + stayfrom + "','" + stayto + "','" + visastamp + "','" + passport + "','1','" + date + "')";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();

        subgrid();
    }

    public void subgrid()
    {
        emailid = Session["LogInId"].ToString();
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from IG_Immigrant where email='" + emailid + "' order by sno asc", con);
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
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from cg_Country_Master  order by txtcountry_name asc", con);
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
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select  * from  [dbo].[City_Master] where intcountryid=2", con);
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
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select  * from  [dbo].[City_Master] where intcountryid=1", con);
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
    protected void lnkback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Employee.aspx");
    }
}