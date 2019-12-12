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

public partial class Admin_EmpView : System.Web.UI.Page
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
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    /// <summary>
    /// to perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);


            //lblUserId.Text = Request.QueryString["UserId"];
            usid = Request.QueryString["userid"].ToString();
            email=Request.QueryString["emailid"].ToString();

            //SqlDataReader dr;
            //string qry = "select * from Users_Information where EmailId='"+ email +"'";
            ////open database connection to connect to sql server
            //con.Open();
            //SqlCommand cmd = new SqlCommand(qry, con);
            //dr = cmd.ExecuteReader();
            ////close database connection to disconnect to sql server

            //while (dr.Read())
            //{
            //   LoginId = Convert.ToString(dr["usid"]);
                
            //}
           
                        
        }
        string streg = string.Empty;

        //if (!IsPostBack)
        //{
        //    ApplyPermissions();
            
        //}
        //Navigate and bind employee  details
        //ds = sdata.GetEmpDetails(usid);
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='"+usid+"' and username='" + email + "'", con);
        DataSet ds1 = new DataSet();
        da.Fill(ds1);
        con.Close();
        if (ds1.Tables[0].Rows.Count > 0)
        {            
            txtempid.Text = ds1.Tables[0].Rows[0]["empid"].ToString();
            txtemail.Text = ds1.Tables[0].Rows[0]["username"].ToString();
            conemail.Text = ds1.Tables[0].Rows[0]["emailid"].ToString();
            fname.Text = ds1.Tables[0].Rows[0]["firstname"].ToString();
            lname.Text = ds1.Tables[0].Rows[0]["lastname"].ToString();
            mname.Text = ds1.Tables[0].Rows[0]["middlename"].ToString();
            gend.Text = ds1.Tables[0].Rows[0]["gender"].ToString();
            fssn.Text = ds1.Tables[0].Rows[0]["ssn"].ToString();
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

            //string s = ds1.Tables[0].Rows[0]["workphone"].ToString();
            //if (s.Length >= 10)
            //{
            //    wp1.Text = s.Substring(0, 3);
            //    wp2.Text = s.Substring(3, 3);
            //    wp3.Text = s.Substring(6, 4);
            //}

            //string ss = ds1.Tables[0].Rows[0]["homephone"].ToString();
           

            //if (ss.Length >= 10)
            //{
            //    hp1.Text = ss.Substring(0, 3);
            //    hp2.Text = ss.Substring(3, 3);
            //    hp3.Text = ss.Substring(6, 4);
            //}
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

            birthcountry.Text = ds1.Tables[0].Rows[0]["prcountry"].ToString();
            birthaddress.Text = ds1.Tables[0].Rows[0]["prstreet"].ToString();
            prstate.Text = ds1.Tables[0].Rows[0]["prstate"].ToString();
            prcity.Text = ds1.Tables[0].Rows[0]["prcity"].ToString();
            przip.Text = ds1.Tables[0].Rows[0]["przip"].ToString();
            lblmaritalstatus.Text = ds1.Tables[0].Rows[0]["marital_status"].ToString();

            if (lblmaritalstatus.Text == "Unmarried")
            {
                kid1.Visible = false;
                kid2.Visible = false;
                kid3.Visible = false;
                kid4.Visible = false;
            }
            else
            {
                kid1.Visible = true;
                kid2.Visible = true;
                kid3.Visible = true;
                kid4.Visible = true;
            }
            string s2= ds1.Tables[0].Rows[0]["prworkphone"].ToString();
            if (s2.Length >= 10)
            {
               
                prph1.Text = s2.Substring(0, 3);
                prph2.Text = s2.Substring(3, 3);
                prph3.Text = s2.Substring(6, 4);
            }
            string s1 = ds1.Tables[0].Rows[0]["prhomephone"].ToString();
            if (s1.Length >= 10)
            {

                hp11.Text = s1.Substring(0, 3);
                hp21.Text = s1.Substring(3, 3);
                hp31.Text = s1.Substring(6, 4);
            }         
           

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
            expyrs.Text = ds1.Tables[0].Rows[0]["totexptrs1"].ToString();
            if (expyrs.Text == "0")
            {
                yearsmonths1.Visible = false;
            }
            else
            {
                expmon.Text  = ds1.Tables[0].Rows[0]["totexpmonths1"].ToString();
                fnarea.Text = ds1.Tables[0].Rows[0]["functionalarea1"].ToString();
                currind.Text = ds1.Tables[0].Rows[0]["previousindustrytype1"].ToString();
            }
            expyrs2.Text = ds1.Tables[0].Rows[0]["totexptrs2"].ToString();
            if (expyrs2.Text == "0")
            {
                Tr2.Visible = false;
            }
            else
            {
                expmon2.Text = ds1.Tables[0].Rows[0]["functionalarea2"].ToString();
                lbldes2.Text = ds1.Tables[0].Rows[0]["functionalarea2"].ToString();
                lblcompany2.Text = ds1.Tables[0].Rows[0]["previousindustrytype2"].ToString();
             
            }

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
            imgdisplay.ImageUrl = "Emp_photos\\" + ds1.Tables[0].Rows[0]["photo"].ToString();
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

    protected void lnkback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Employee.aspx");
    }


    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion

}
