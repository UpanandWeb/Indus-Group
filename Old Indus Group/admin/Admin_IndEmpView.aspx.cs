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
//using Microsoft.Office.Interop.Word;
using System.Text;
using System.Web.Configuration;
//using Code7248.word_reader; 

public partial class admin_Admin_IndEmpView : System.Web.UI.Page
{
    IGIIT sdata = new IGIIT();
    DataSet ds = new DataSet();
    string usid = string.Empty;
    string email = string.Empty;
    string filenm = string.Empty;

    DataSet dsall = new DataSet();
    string Usertype;
    string Postedby;
    string LoginId;
    string DocName;
    string folder;
    string subfolder;
    string FileName;
    int ImmigView;
    int ImmigPost;
    int ImmigEdit;
    int ImmigDel;
    int ImmigDown;

    int HRView;
    int HRPost;
    int HREdit;
    int HRDel;
    int HRDown;

    int AccView;
    int AccPost;
    int AccEdit;
    int AccDel;
    int AccDown;

    int DRView;
    int DRPost;
    int DRDel;
    int DRDown;

    int LeavesView;
    int LeavesPost;
    int LeavesEdit;
    int LeavesDel;

    int ARPView;
    int ARPPost;
    int ARPEdit;
    int ARPDel;
    int ARPDown;

    int ExelView;
    int ExelPost;
    int ExelEdit;
    int ExelDel;
    int ExelDown;

    int EmpDocsView;
    int EmpDocsPost;
    int EmpDocsDown;
    int EmpDocsDel;

    //Initialise object to navigate and bind countries
    StateCountry countries = new StateCountry();
    AdminCS obj = new AdminCS();

    //Establish sql connection
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);

    /// <summary>
    /// to perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    //private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    protected void Page_Load(object sender, EventArgs e)
    {
       // DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            usid = Request.QueryString["userid"].ToString();
            email = Request.QueryString["emailid"].ToString();
        }
        string streg = string.Empty;
  
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + usid + "' and username='" + email + "'", con);
        DataSet ds1 = new DataSet();
        da.Fill(ds1);
  //      con.Close();
        if (ds1.Tables[0].Rows.Count > 0)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from employeedoc where  emailid='" + email + "'", con);
            DataSet ds2 = new DataSet();
            da1.Fill(ds2);
            docs.DataSource = ds2;
            docs.DataBind();

            txtempid.Text = ds1.Tables[0].Rows[0]["empid"].ToString();
            txtemail.Text = ds1.Tables[0].Rows[0]["username"].ToString();

            conemail.Text = ds1.Tables[0].Rows[0]["emailid"].ToString();
            fname.Text = ds1.Tables[0].Rows[0]["firstname"].ToString();
            lname.Text = ds1.Tables[0].Rows[0]["lastname"].ToString();
            mname.Text = ds1.Tables[0].Rows[0]["middlename"].ToString();
            gend.Text = ds1.Tables[0].Rows[0]["gender"].ToString();
         //   fssn.Text = ds1.Tables[0].Rows[0]["ssn"].ToString();
            mmname.Text = ds1.Tables[0].Rows[0]["spousename"].ToString();
            try
            {
                sbd.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["spousedob"].ToString()).ToShortDateString();
            }
            catch
            {
                sbd.Text = ds1.Tables[0].Rows[0]["spousedob"].ToString();
            }
            //Spssn.Text = ds1.Tables[0].Rows[0]["spousessn"].ToString();
            spgen.Text = ds1.Tables[0].Rows[0]["spousegender"].ToString();

            fatname.Text = ds1.Tables[0].Rows[0]["fathername"].ToString();
            motname.Text = ds1.Tables[0].Rows[0]["mothername"].ToString();

            k1name.Text = ds1.Tables[0].Rows[0]["kid1"].ToString();
            k2name.Text = ds1.Tables[0].Rows[0]["kid2"].ToString();
            k3name.Text = ds1.Tables[0].Rows[0]["kid3"].ToString();

            try
            {
                k1bd.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["child1dob"].ToString()).ToShortDateString();
            }
            catch
            {
                k1bd.Text = ds1.Tables[0].Rows[0]["child1dob"].ToString();
            }
            try
            {
                k2bd.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["child2dob"].ToString()).ToShortDateString();

            }
            catch
            {
                k2bd.Text = ds1.Tables[0].Rows[0]["child2dob"].ToString();
            }
            try
            {
                k3bd.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["child3dob"].ToString()).ToShortDateString();
            }
            catch
            {
                k3bd.Text = ds1.Tables[0].Rows[0]["child3dob"].ToString();
            }

            //k1ssn.Text = ds1.Tables[0].Rows[0]["child1ssn"].ToString();
            //k2ssn.Text = ds1.Tables[0].Rows[0]["child2ssn"].ToString();
            //k3ssn.Text = ds1.Tables[0].Rows[0]["child3ssn"].ToString();

            k1gen.Text = ds1.Tables[0].Rows[0]["child1gender"].ToString();
            k2gen.Text = ds1.Tables[0].Rows[0]["child2gender"].ToString();
            k3gen.Text = ds1.Tables[0].Rows[0]["child3gender"].ToString();

            country.Text = ds1.Tables[0].Rows[0]["country1"].ToString();
            street.Text = ds1.Tables[0].Rows[0]["street"].ToString();
            state.Text = ds1.Tables[0].Rows[0]["state1"].ToString();
            city.Text = ds1.Tables[0].Rows[0]["city1"].ToString();
            zip.Text = ds1.Tables[0].Rows[0]["zip"].ToString();

            string s = ds1.Tables[0].Rows[0]["workphone"].ToString();
            if (s.Length >= 10)
            {
                wp1.Text = s.Substring(0, 3);
                wp2.Text = s.Substring(3, 3);
                wp3.Text = s.Substring(6, 4);
            }

            string ss = ds1.Tables[0].Rows[0]["homephone"].ToString();


            if (ss.Length >= 10)
            {
                hp1.Text = ss.Substring(0, 3);
                hp2.Text = ss.Substring(3, 3);
                hp3.Text = ss.Substring(6, 4);
            }
            string ms = ds1.Tables[0].Rows[0]["mobile"].ToString();

            if (ms.Length >= 10)
            {
                mb1.Text = ms.Substring(0, 3);
                mb2.Text = ms.Substring(3, 3);
                mb3.Text = ms.Substring(6, 4);
            }
            try
            {
                bdate.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["birthdate"].ToString()).ToShortDateString();
            }
            catch
            {
                bdate.Text = ds1.Tables[0].Rows[0]["birthdate"].ToString();

            }
            bcountry.Text = ds1.Tables[0].Rows[0]["birthcountry"].ToString();
            bstate.Text = ds1.Tables[0].Rows[0]["birthstate"].ToString();
            bcity.Text = ds1.Tables[0].Rows[0]["birthcity"].ToString();
            ccountry.Text = ds1.Tables[0].Rows[0]["cntryofcitizenship"].ToString();
            passno.Text = ds1.Tables[0].Rows[0]["passportno"].ToString();
            pcountry.Text = ds1.Tables[0].Rows[0]["passportissuedat"].ToString();
            try
            {
                issdate.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["dateofissue"].ToString()).ToShortDateString();
            }
            catch
            {
                issdate.Text = ds1.Tables[0].Rows[0]["dateofissue"].ToString();
            }
            try
            {
                expdate.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0]["doexp"].ToString()).ToShortDateString();
            }
            catch
            {
                expdate.Text = ds1.Tables[0].Rows[0]["doexp"].ToString();
            }
            ncountry.Text = ds1.Tables[0].Rows[0]["nationality"].ToString();
            // cpassport.Text = ds.Tables[0].Rows[0]["countryofpassport"].ToString();
            cpname1.Text = ds1.Tables[0].Rows[0]["contactpersonname1"].ToString();
            cpphone1.Text = ds1.Tables[0].Rows[0]["cp1phone"].ToString();
            cpemail1.Text = ds1.Tables[0].Rows[0]["cp1email"].ToString();
            cpaddr1.Text = ds1.Tables[0].Rows[0]["cpaddress1"].ToString();
            cpname2.Text = ds1.Tables[0].Rows[0]["contactpersonname2"].ToString();
            cpphone2.Text = ds1.Tables[0].Rows[0]["cp2phone2"].ToString();
            cpemail2.Text = ds1.Tables[0].Rows[0]["cp2email"].ToString();
            cpaddr2.Text = ds1.Tables[0].Rows[0]["cpaddress2"].ToString();
            lblpwd.Text = ds1.Tables[0].Rows[0]["pwd"].ToString();
            lbldoor.Text = ds1.Tables[0].Rows[0]["doorno"].ToString();

            //birthcountry.Text = ds1.Tables[0].Rows[0]["prcountry"].ToString();
            //birthaddress.Text = ds1.Tables[0].Rows[0]["prstreet"].ToString();
            //prstate.Text = ds1.Tables[0].Rows[0]["prstate"].ToString();
            //prcity.Text = ds1.Tables[0].Rows[0]["prcity"].ToString();
            //przip.Text = ds1.Tables[0].Rows[0]["przip"].ToString();

                string s222= ds1.Tables[0].Rows[0]["mstatus"].ToString();
                if (s222 == "Married")
                {
                    lblmaritalstatus.Text = s222;
                }
                else
                {
                    lblmaritalstatus.Text = "Unmarried";
                }

                txtacname.Text = ds1.Tables[0].Rows[0]["bankacname"].ToString();
                txtacnum.Text = ds1.Tables[0].Rows[0]["bankacnumber"].ToString();
                txtbankname.Text = ds1.Tables[0].Rows[0]["bankname"].ToString();
                txtbankadd.Text = ds1.Tables[0].Rows[0]["bankaddress"].ToString();
                txtifsc.Text = ds1.Tables[0].Rows[0]["bankifsc"].ToString();
                txtswift.Text = ds1.Tables[0].Rows[0]["bankswift"].ToString();
                txtbranchacaddress.Text = ds1.Tables[0].Rows[0]["bankacaddress"].ToString();
                txtaadhar.Text = ds1.Tables[0].Rows[0]["aadharnumber"].ToString();

                adharcity.Text = ds1.Tables[0].Rows[0]["aadharcity"].ToString();
                aadharplce.Text = ds1.Tables[0].Rows[0]["aadharplace"].ToString();
                pancity.Text = ds1.Tables[0].Rows[0]["pancity"].ToString();
                panplace.Text = ds1.Tables[0].Rows[0]["panplace"].ToString();
                
                txtpan.Text = ds1.Tables[0].Rows[0]["pannumber"].ToString();
                txtdrivenumber.Text = ds1.Tables[0].Rows[0]["dlicencenumber"].ToString();
                txtdriveplace.Text = ds1.Tables[0].Rows[0]["dissueplace"].ToString();
                txtdrivecity.Text = ds1.Tables[0].Rows[0]["dissuecitty"].ToString();

            //if (lblmaritalstatus.Text == "Unmarried")
            //{
            //    kid1.Visible = false;
            //    kid2.Visible = false;
            //    kid3.Visible = false;
            //    kid4.Visible = false;
            //}
            //else
            //{
            //    kid1.Visible = true;
            //    kid2.Visible = true;
            //    kid3.Visible = true;
            //    kid4.Visible = true;
            //}
            //string s2 = ds1.Tables[0].Rows[0]["prworkphone"].ToString();
            //if (s2.Length >= 10)
            //{

            //    prph1.Text = s2.Substring(0, 3);
            //    prph2.Text = s2.Substring(3, 3);
            //    prph3.Text = s2.Substring(6, 4);
            //}
            //string s1 = ds1.Tables[0].Rows[0]["prhomephone"].ToString();
            //if (s1.Length >= 10)
            //{

            //    hp11.Text = s1.Substring(0, 3);
            //    hp21.Text = s1.Substring(3, 3);
            //    hp31.Text = s1.Substring(6, 4);
            //}


            expyrs1.Text = ds1.Tables[0].Rows[0]["totexptrs"].ToString();
            if (expyrs1.Text == "0")
            {
                yearsmonths.Visible = false;
            }
            else
            {
                expmon1.Text = ds1.Tables[0].Rows[0]["totexpmonths"].ToString();
                fnarea1.Text = ds1.Tables[0].Rows[0]["functionalarea"].ToString();
                currind1.Text = ds1.Tables[0].Rows[0]["currentindustrytype"].ToString();
            }
            //expyrs.Text = ds1.Tables[0].Rows[0]["totexptrs1"].ToString();
            //if (expyrs.Text == "0")
            //{
            //    yearsmonths1.Visible = false;
            //}
            //else
            //{
            //    expmon.Text = ds1.Tables[0].Rows[0]["totexpmonths1"].ToString();
            //    fnarea.Text = ds1.Tables[0].Rows[0]["functionalarea1"].ToString();
            //    currind.Text = ds1.Tables[0].Rows[0]["previousindustrytype1"].ToString();
            //}
            //expyrs2.Text = ds1.Tables[0].Rows[0]["totexptrs2"].ToString();
            //if (expyrs2.Text == "0")
            //{
            //    Tr2.Visible = false;
            //}
            //else
            //{
            //    expmon2.Text = ds1.Tables[0].Rows[0]["functionalarea2"].ToString();
            //    lbldes2.Text = ds1.Tables[0].Rows[0]["functionalarea2"].ToString();
            //    lblcompany2.Text = ds1.Tables[0].Rows[0]["previousindustrytype2"].ToString();

            //}

            skills1.Text = ds1.Tables[0].Rows[0]["skills1"].ToString();
            if (skills1.Text == "")
            {
                trskills1.Visible = false;
            }
            else
            {
                sk1m.Text = ds1.Tables[0].Rows[0]["sk1months"].ToString();
                sk1yrs.Text = ds1.Tables[0].Rows[0]["sk1years"].ToString();
                sk1exp.Text = ds1.Tables[0].Rows[0]["sk1exp"].ToString();
            }


            skills2.Text = ds1.Tables[0].Rows[0]["skills2"].ToString();
            if (skills2.Text == "")
            {
                trskills2.Visible = false;
            }
            else
            {
                sk2yrs.Text = ds1.Tables[0].Rows[0]["sk2years"].ToString();
               sk2m.Text = ds1.Tables[0].Rows[0]["sk2months"].ToString();
                sk2exp.Text = ds1.Tables[0].Rows[0]["sk2exp"].ToString();
            }


            skills3.Text = ds1.Tables[0].Rows[0]["skills3"].ToString();
            if (skills3.Text == "")
            {
                trskills3.Visible = false;
            }
            else
            {
                sk3m.Text = ds1.Tables[0].Rows[0]["sk3months"].ToString();
                sk3yrs.Text = ds1.Tables[0].Rows[0]["sk3years"].ToString();
                sk3exp.Text = ds1.Tables[0].Rows[0]["sk3exp"].ToString();
            }


            skills4.Text = ds1.Tables[0].Rows[0]["skills4"].ToString();
            if (skills4.Text == "")
            {
                trskills4.Visible = false;
            }
            else
            {
               sk4m.Text = ds1.Tables[0].Rows[0]["sk4months"].ToString();
                sk4yrs.Text = ds1.Tables[0].Rows[0]["sk4years"].ToString();
                sk4exp.Text = ds1.Tables[0].Rows[0]["sk4exp"].ToString();
            }


            skills5.Text = ds1.Tables[0].Rows[0]["skills5"].ToString();
            if (skills5.Text == "")
            {
                trskills5.Visible = false;
            }
            else
            {
             sk5m.Text = ds1.Tables[0].Rows[0]["sk5months"].ToString();
                sk5yrs.Text = ds1.Tables[0].Rows[0]["sk5years"].ToString();
                sk5exp.Text = ds1.Tables[0].Rows[0]["sk5exp"].ToString();
            }


            skills6.Text = ds1.Tables[0].Rows[0]["skills6"].ToString();
            if (skills6.Text == "")
            {
                trskills6.Visible = false;
            }
            else
            {
                sk6m.Text = ds1.Tables[0].Rows[0]["sk6months"].ToString();
                sk6yrs.Text = ds1.Tables[0].Rows[0]["sk6years"].ToString();
                sk6exp.Text = ds1.Tables[0].Rows[0]["sk6exp"].ToString();
            }


            if (skills1.Text == "" && skills2.Text == "" && skills3.Text == "" && skills4.Text == "" && skills5.Text == "" && skills6.Text == "")
            {
                lblskills.Visible = true;
                lblskills.Text = " No Skills Entered";
            }



            // Eductioan Details.

            edu1.Text = ds1.Tables[0].Rows[0]["edu1"].ToString();
            if (edu1.Text == "")
            {
                tredu1.Visible = false;
            }
            else
            {
                ed1brd.Text = ds1.Tables[0].Rows[0]["ed1brd"].ToString();
                ed1sub.Text = ds1.Tables[0].Rows[0]["ed1sub"].ToString();
                ed1yr.Text = ds1.Tables[0].Rows[0]["ed1year"].ToString();
                ed1per.Text = ds1.Tables[0].Rows[0]["ed1per"].ToString();
            }



            edu2.Text = ds1.Tables[0].Rows[0]["edu2"].ToString();
            if (edu2.Text == "")
            {
                tredu2.Visible = false;
            }
            else
            {
                ed2brd.Text = ds1.Tables[0].Rows[0]["ed2brd"].ToString();
                ed2sub.Text = ds1.Tables[0].Rows[0]["ed2sub"].ToString();
                ed2yr.Text = ds1.Tables[0].Rows[0]["ed2year"].ToString();
                ed2per.Text = ds1.Tables[0].Rows[0]["ed2per"].ToString();
            }



            edu3.Text = ds1.Tables[0].Rows[0]["edu3"].ToString();
            if (edu3.Text == "")
            {
                tredu3.Visible = false;
            }
            else
            {
                ed3brd.Text = ds1.Tables[0].Rows[0]["ed3brd"].ToString();
                ed3sub.Text = ds1.Tables[0].Rows[0]["ed3sub"].ToString();
                ed3yr.Text = ds1.Tables[0].Rows[0]["ed3year"].ToString();
                ed3per.Text = ds1.Tables[0].Rows[0]["ed3per"].ToString();
            }

            edu4.Text = ds1.Tables[0].Rows[0]["edu4"].ToString();
            if (edu4.Text == "")
            {
                tredu4.Visible = false;
            }
            else
            {
                ed4brd.Text = ds1.Tables[0].Rows[0]["ed4brd"].ToString();
                ed4sub.Text = ds1.Tables[0].Rows[0]["ed4sub"].ToString();
                ed4yr.Text = ds1.Tables[0].Rows[0]["ed4year"].ToString();
                ed4per.Text = ds1.Tables[0].Rows[0]["ed4per"].ToString();
            }
            edu5.Text = ds1.Tables[0].Rows[0]["edu5"].ToString();
            if (edu5.Text == "")
            {
                tredu5.Visible = false;
            }
            else
            {
                ed5brd.Text = ds1.Tables[0].Rows[0]["ed5brd"].ToString();
                ed5sub.Text = ds1.Tables[0].Rows[0]["ed5sub"].ToString();
                ed5yr.Text = ds1.Tables[0].Rows[0]["ed5year"].ToString();
                ed5per.Text = ds1.Tables[0].Rows[0]["ed5per"].ToString();
            }
            edu6.Text = ds1.Tables[0].Rows[0]["edu6"].ToString();
            if (edu6.Text == "")
            {
                tredu6.Visible = false;
            }
            else
            {
                ed6brd.Text = ds1.Tables[0].Rows[0]["ed6brd"].ToString();
                ed6sub.Text = ds1.Tables[0].Rows[0]["ed6sub"].ToString();
                ed6yr.Text = ds1.Tables[0].Rows[0]["ed6year"].ToString();
                ed6per.Text = ds1.Tables[0].Rows[0]["ed6per"].ToString();
            }
            edu7.Text = ds1.Tables[0].Rows[0]["edu7"].ToString();
            if (edu7.Text == "")
            {
                tredu7.Visible = false;
            }
            else
            {
                ed7brd.Text = ds1.Tables[0].Rows[0]["ed7brd"].ToString();
                ed7sub.Text = ds1.Tables[0].Rows[0]["ed7sub"].ToString();
                ed7yr.Text = ds1.Tables[0].Rows[0]["ed7year"].ToString();
                ed7per.Text = ds1.Tables[0].Rows[0]["ed7per"].ToString();
            }

            if (edu1.Text == "" && edu2.Text == "" && edu3.Text == "" && edu4.Text == "" && edu5.Text == "" && edu6.Text == "" && edu7.Text == "")
            {
                lbledudet.Visible = true;
                lbledudet.Text = " No Education Details Entered";
            }
            txtempid.Text = ds1.Tables[0].Rows[0]["empid"].ToString();
         //   imgdisplay.ImageUrl = "http://www.aceindus.in/aceinduscoin/Emp_photos/" + ds1.Tables[0].Rows[0]["photo"].ToString();
            imgdisplay.ImageUrl = "~/admin/emp_photos/" + ds1.Tables[0].Rows[0]["photo"].ToString();

            //string FilePath = Server.MapPath("~/admin/resumes/" + ds1.Tables[0].Rows[0]["filename1"].ToString());
            //TextExtractor extractor = new TextExtractor(FilePath);
            //Response.Redirect("Admin_IndEmployee.aspx"+FilePath);
      //     pathfile.Text = FilePath;
     //      pathfile.Visible = true;

            //string text = extractor.ExtractText();
            //txtresume.Text = text.Replace(FilePath, text);
        }
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


    /* Folder Permissions Start*/

    public void ApplyPermissions()
    {
        GetPermissions();

        // Immigration Documents
        ImmigView = Convert.ToInt16(Session["ImmigView"]);
        ImmigPost = Convert.ToInt16(Session["ImmigPost"]);
        ImmigDel = Convert.ToInt16(Session["ImmigDel"]);
        ImmigDown = Convert.ToInt16(Session["ImmigDown"]);
        ImmigEdit = Convert.ToInt16(Session["ImmigEdit"]);

        if (ImmigView == 1)
        {
            tdlnkImmigDocs.Visible = true;
        }
        else if (ImmigView == 0)
        {
            tdlnkImmigDocs.Visible = false;
        }

        // Accounting Documents
        AccDel = Convert.ToInt16(Session["AccDel"]);
        AccDown = Convert.ToInt16(Session["AccDown"]);
        AccEdit = Convert.ToInt16(Session["AccEdit"]);
        AccPost = Convert.ToInt16(Session["AccPost"]);
        AccView = Convert.ToInt16(Session["AccView"]);
        if (AccView == 1)
        {
            tdlnkAccDos.Visible = true;
        }
        else if (AccView == 0)
        {
            tdlnkAccDos.Visible = false;
        }

        // HR
        HRDel = Convert.ToInt16(Session["HRDel"]);
        HRDown = Convert.ToInt16(Session["HRDown"]);
        HREdit = Convert.ToInt16(Session["HREdit"]);
        HRPost = Convert.ToInt16(Session["HRPost"]);
        HRView = Convert.ToInt16(Session["HRView"]);
        if (HRView == 1)
        {
            tdlnkHRDocs.Visible = true;
        }
        else if (HRView == 0)
        {
            tdlnkHRDocs.Visible = false;
        }

        // ARP
        ARPDel = Convert.ToInt16(Session["ARPDel"]);
        ARPDown = Convert.ToInt16(Session["ARPDown"]);
        ARPEdit = Convert.ToInt16(Session["ARPEdit"]);
        ARPPost = Convert.ToInt16(Session["ARPPost"]);
        ARPView = Convert.ToInt16(Session["ARPView"]);
        if (ARPView == 1)
        {
            tdlnkARPDocs.Visible = true;
        }
        else if (ARPView == 0)
        {
            tdlnkARPDocs.Visible = false;
        }

        // Employee
        EmpDocsDel = Convert.ToInt16(Session["EmpDocsDel"]);
        EmpDocsDown = Convert.ToInt16(Session["EmpDocsDown"]);
        EmpDocsPost = Convert.ToInt16(Session["EmpDocsPost"]);
        EmpDocsView = Convert.ToInt16(Session["EmpDocsView"]);
        if (EmpDocsView == 1)
        {
            tdlnkEmpDocs.Visible = true;
        }
        else if (EmpDocsView == 0)
        {
            tdlnkEmpDocs.Visible = false;
        }
        // Daily Reports
        DRDel = Convert.ToInt16(Session["DRDel"]);
        DRDown = Convert.ToInt16(Session["DRDown"]);
        DRPost = Convert.ToInt16(Session["DRPost"]);
        DRView = Convert.ToInt16(Session["DRView"]);
        if (DRView == 1)
        {
            tdlnkDR.Visible = true;
        }
        else if (DRView == 0)
        {
            tdlnkDR.Visible = false;
        }

        // Time & Attendance
        LeavesDel = Convert.ToInt16(Session["LeavesDel"]);
        LeavesEdit = Convert.ToInt16(Session["LeavesEdit"]);
        LeavesPost = Convert.ToInt16(Session["LeavesPost"]);
        LeavesView = Convert.ToInt16(Session["LeavesView"]);
        if (LeavesView == 1)
        {
            tdlnkLeaves.Visible = true;
        }
        else if (LeavesView == 0)
        {
            tdlnkLeaves.Visible = false;
        }

        // Excell
        ExelDel = Convert.ToInt16(Session["ExelDel"]);
        ExelDown = Convert.ToInt16(Session["ExelDown"]);
        ExelEdit = Convert.ToInt16(Session["ExelEdit"]);
        ExelPost = Convert.ToInt16(Session["ExelPost"]);
        ExelView = Convert.ToInt16(Session["ExelView"]);
        if (ExelView == 1)
        {
            tdlnkExcel.Visible = true;
        }
        else if (ExelView == 0)
        {
            tdlnkExcel.Visible = false;
        }

        if (ImmigView == 1 || AccView == 1 || HRView == 1 || ARPView == 1 || DRView == 1 || LeavesView == 1 || ExelView == 1 || EmpDocsView == 1)
        {
            trViewFolders.Visible = true;
        }
        else
        {
            trViewFolders.Visible = false;
        }
    }

    protected void lnkImmigDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("ImmigDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkAccDos_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("AccDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkHRDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("HRDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkARPDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("ARPDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkEmpDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("EmpDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkDR_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("DRDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkLeaves_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("Leaves");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkExcel_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("ExcelDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }
    protected void lnkWord_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        GetEmpDocs("WordDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    public void GetEmpDocs(string DocType1)
    {
        DocConditions(DocType1);
        Postedby = Session["uid"].ToString();


        if (Postedby == "admin" && LoginId == "admin")
        {
            dsall = obj.GetadminEmpDocs(DocType1);
        }
        else
        {
            dsall = obj.GetEmpDocs(DocType1, LoginId, Usertype);
        }

        System.Data.DataTable dt = dsall.Tables[0];
        String[] keycolumns = new String[] { "SubFolder" };
        RemoveDuplicates(dt, keycolumns);
        if (!dsall.Tables[0].Rows.Count.Equals(0))
        {
            dlEmpDocs.DataSource = dsall;
            dlEmpDocs.DataBind();
            dlEmpDocs.Visible = true;
            lbllMsg.Text = "";

        }
        else
        {
            dlSubFolderFiles.Visible = false;
            dlEmpDocs.Visible = false;
            trSubFiles.Visible = false;
            lbllMsg.Text = "No records found for " + DocName;

        }
    }
    protected void dlEmpDocs_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblSubFolder = (Label)e.Item.FindControl("lblSubFolder");
        LinkButton lnkBtnDownload = (LinkButton)e.Item.FindControl("lnkBtnDownload");
        LinkButton lnkFolderName = (LinkButton)e.Item.FindControl("lnkFolderName");
        LinkButton lnkBtnDeleteFile = (LinkButton)e.Item.FindControl("lnkBtnDeleteFile");
        LinkButton lnkBtnDeleteFolder = (LinkButton)e.Item.FindControl("lnkBtnDeleteFolder");
        if (lblSubFolder != null)
        {
            if (lblSubFolder.Text != "")
            {
                lnkFolderName.Visible = true;
                lnkBtnDownload.Visible = false;
                lnkBtnDeleteFile.Visible = false;
                lnkBtnDeleteFolder.Visible = true;
            }
            else
            {
                lnkBtnDownload.Visible = true;
                lnkFolderName.Visible = false;
                lnkBtnDeleteFile.Visible = true;
                lnkBtnDeleteFolder.Visible = false;
            }
        }
    }

    public void DocConditions(string DocType)
    {
        if (DocType == "AccDocs")
        {
            DocName = "Accounting Documents";
        }
        else if (DocType == "ImmigDocs")
        {
            DocName = "Immigration Documents";
        }
        else if (DocType == "HRDocs")
        {
            DocName = "HR Documents";
        }
        else if (DocType == "ARPDocs")
        {
            DocName = "ARP Documents";
        }
        else if (DocType == "DRDocs")
        {
            DocName = "Daily Reports";
        }
        else if (DocType == "Leaves")
        {
            DocName = "Leaves";
        }
        else if (DocType == "ExcelDocs")
        {
            DocName = "Excel Documents";
        }
        else if (DocType == "EmpDocs")
        {
            DocName = "Employee Documents";
        }
        else if (DocType == "WordDocs")
        {
            DocName = "Word Documents";
        }
    }

    public void GetPermissions()
    {
        ds = obj.GetUserPermissions1(Usertype, LoginId);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            Session.Add("ImmigDel", ds.Tables[0].Rows[0]["ImmigDocs_Delete"].ToString());
            Session.Add("ImmigDown", ds.Tables[0].Rows[0]["ImmigDocs_Download"].ToString());
            Session.Add("ImmigEdit", ds.Tables[0].Rows[0]["ImmigDocs_Edit"].ToString());
            Session.Add("ImmigPost", ds.Tables[0].Rows[0]["ImmigDocs_Post"].ToString());
            Session.Add("ImmigView", ds.Tables[0].Rows[0]["ImmigDocs_View"].ToString());

            Session.Add("HRDel", ds.Tables[0].Rows[0]["HRDocs_Delete"].ToString());
            Session.Add("HRDown", ds.Tables[0].Rows[0]["HRDocs_Download"].ToString());
            Session.Add("HREdit", ds.Tables[0].Rows[0]["HRDocs_Edit"].ToString());
            Session.Add("HRPost", ds.Tables[0].Rows[0]["HRDocs_Post"].ToString());
            Session.Add("HRView", ds.Tables[0].Rows[0]["HRDocs_View"].ToString());

            Session.Add("AccDel", ds.Tables[0].Rows[0]["AccDocs_Delete"].ToString());
            Session.Add("AccDown", ds.Tables[0].Rows[0]["AccDocs_Download"].ToString());
            Session.Add("AccEdit", ds.Tables[0].Rows[0]["AccDocs_Edit"].ToString());
            Session.Add("AccPost", ds.Tables[0].Rows[0]["AccDocs_Post"].ToString());
            Session.Add("AccView", ds.Tables[0].Rows[0]["AccDocs_View"].ToString());

            Session.Add("DRDel", ds.Tables[0].Rows[0]["DailyReports_Delete"].ToString());
            Session.Add("DRDown", ds.Tables[0].Rows[0]["DailyReports_Download"].ToString());
            Session.Add("DRPost", ds.Tables[0].Rows[0]["DailyReports_Post"].ToString());
            Session.Add("DRView", ds.Tables[0].Rows[0]["DailyReports_View"].ToString());

            Session.Add("LeavesDel", ds.Tables[0].Rows[0]["Leaves_Delete"].ToString());
            Session.Add("LeavesEdit", ds.Tables[0].Rows[0]["Leaves_Edit"].ToString());
            Session.Add("LeavesPost", ds.Tables[0].Rows[0]["Leaves_Post"].ToString());
            Session.Add("LeavesView", ds.Tables[0].Rows[0]["Leaves_View"].ToString());

            Session.Add("ARPDel", ds.Tables[0].Rows[0]["ARPDocs_Delete"].ToString());
            Session.Add("ARPDown", ds.Tables[0].Rows[0]["ARPDocs_Download"].ToString());
            Session.Add("ARPEdit", ds.Tables[0].Rows[0]["ARPDocs_Edit"].ToString());
            Session.Add("ARPPost", ds.Tables[0].Rows[0]["ARPDocs_Post"].ToString());
            Session.Add("ARPView", ds.Tables[0].Rows[0]["ARPDocs_View"].ToString());

            Session.Add("ExelDel", ds.Tables[0].Rows[0]["Excel_Delete"].ToString());
            Session.Add("ExelDown", ds.Tables[0].Rows[0]["Excel_Download"].ToString());
            Session.Add("ExelEdit", ds.Tables[0].Rows[0]["Excel_Edit"].ToString());
            Session.Add("ExelPost", ds.Tables[0].Rows[0]["Excel_Post"].ToString());
            Session.Add("ExelView", ds.Tables[0].Rows[0]["Excel_View"].ToString());

            Session.Add("EmpDocsDel", ds.Tables[0].Rows[0]["EmpDoc_Delete"].ToString());
            Session.Add("EmpDocsDown", ds.Tables[0].Rows[0]["EmpDoc_Download"].ToString());
            Session.Add("EmpDocsPost", ds.Tables[0].Rows[0]["EmpDoc_Post"].ToString());
            Session.Add("EmpDocsView", ds.Tables[0].Rows[0]["EmpDoc_View"].ToString());
        }
    }

    /// <summary>
    /// To remove duplicate values from data table
    /// </summary>
    /// <param name="tbl"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private System.Data.DataTable RemoveDuplicates(System.Data.DataTable tbl, String[] keyColumns)
    {
        int rowNdx = 0;
        try
        {
            while (rowNdx < tbl.Rows.Count - 1)
            {
                DataRow[] dups = FindDups(tbl, rowNdx, keyColumns);
                if (dups.Length > 0)
                {
                    foreach (DataRow dup in dups)
                    {
                        tbl.Rows.Remove(dup);
                    }
                }
                else
                {
                    rowNdx++;

                }
            }
        }
        catch (Exception ex)
        {

        }
        return tbl;
    }

    /// <summary>
    /// To find duplicate values
    /// </summary>
    /// <param name="tbl"></param>
    /// <param name="sourceNdx"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private DataRow[] FindDups(System.Data.DataTable tbl, int sourceNdx, String[] keyColumns)
    {
        ArrayList retVal = new ArrayList();
        try
        {
            DataRow sourceRow = tbl.Rows[sourceNdx];
            for (int i = sourceNdx + 1; i < tbl.Rows.Count; i++)
            {
                DataRow targetRow = tbl.Rows[i];
                if (IsDup(sourceRow, targetRow, keyColumns))
                {
                    if (retVal.Count.Equals(0))
                        retVal.Add(sourceRow);
                    //retVal.Add(targetRow);
                }
            }
        }
        catch (Exception ex)
        {

        }
        return (DataRow[])retVal.ToArray(typeof(DataRow));
    }
    /// <summary>
    /// Executes when the data row has duplicate
    /// </summary>
    /// <param name="sourceRow"></param>
    /// <param name="targetRow"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private bool IsDup(DataRow sourceRow, DataRow targetRow, String[] keyColumns)
    {
        bool retVal = true;
        try
        {
            foreach (String column in keyColumns)
            {
                if (sourceRow.Table.Columns.Contains(column))
                {
                    retVal = retVal && sourceRow[column].Equals(targetRow[column]);
                    if (!retVal) break;
                }
            }
        }
        catch (Exception ex)
        {

        }
        return retVal;
    }

    protected void lnkDownload(object sender, CommandEventArgs e)
    {
        //To get id of a particular applicant
        Int32 FId = Convert.ToInt16(e.CommandArgument.ToString());
        // Get directory path

        //Fill dataset
        ds = obj.GetOneEmpDocs(FId);

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            FileName = ds.Tables[0].Rows[0]["FileDocName"].ToString();
            folder = ds.Tables[0].Rows[0]["Folder"].ToString();
            subfolder = ds.Tables[0].Rows[0]["SubFolder"].ToString();
        }
        Response.Redirect("Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder);
    }

    protected void lnkView(object sender, CommandEventArgs e)
    {
        trSubFiles.Visible = true;
        DataSet dssubdoc = new DataSet();
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');
        lblFolder.Text = arg[0];
        lblSubFolder.Text = arg[1];

        obj.aFolderName = arg[0];
        obj.aSubFolderName = arg[1];
        obj.aDocType = arg[2];
        dssubdoc = obj.GetSubFolderDocuments(obj.aFolderName, obj.aSubFolderName);
        if (!dssubdoc.Tables[0].Rows.Count.Equals(0))
        {
            dlSubFolderFiles.DataSource = dssubdoc;
            dlSubFolderFiles.DataBind();
            dlSubFolderFiles.Visible = true;
            GetEmpDocs(obj.aDocType);
        }
        else
        {
            dlSubFolderFiles.Visible = false;
            GetEmpDocs(obj.aDocType);
        }
    }

    protected void lnkback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_IndEmployee.aspx");
    }
}
