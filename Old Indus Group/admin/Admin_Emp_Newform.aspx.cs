using System;
using System.Data;
using System.Configuration;
using System.Web.UI;
using System.Net.Mail;
using System.Data.SqlClient;
using System.IO;
using System.Web.Configuration;

public partial class Admin_Emp_Newform : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataSet ds1 = new DataSet();
    string usid = string.Empty;
    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string strScript = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (chkmarried.Checked)
        {
            trsname.Visible = true;
            trchname.Visible = true;
            trchgender.Visible = true;
            trchbdate.Visible = true;
        }
        else
        {
            trsname.Visible = false;
            trchname.Visible = false;
            trchgender.Visible = false;
            trchbdate.Visible = false;
        }
        if (!IsPostBack)
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

                    prcountry.Items.Add("");
                    prcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                    prcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
            }
        }
    }

    protected void btnSave_Emp_Click1(object sender, EventArgs e)
    {
        string un = txtemail.Text.ToString();
        DataSet ds = new DataSet();
        //ds = sdata.GetEmpDet(un);
        usid = txtemail.Text.ToString();
        if (IsValid)
        {
            string unm = "";
            //string eml = "";
            //string pw = "";
            string fn = "";
            string ln = "";
            string mn = "";
            //string ssn1 = "";
            string gn = "";
            string sn = "";
            string sb = "";
            //string ssn2 = "";
            string spg = "";
            string fatn = "";
            string motn = "";
            string k1 = "";
            string k2 = "";
            string k3 = "";
            string k1b = "";
            string k2b = "";
            string k3b = "";
            //string k1s = "";
            //string k2s = "";
            //string k3s = "";
            string k1g = "";
            string k2g = "";
            string k3g = "";
            string co = "";
            string str = "";
            string sta = "";
            string ci = "";
            string zp = "";
            string wp = "";
            string hp = "";
            string mb = "";
            string bd = "";
            string bco = "";
            string bsta = "";
            string bci = "";
            string cco = "";
            string pn = "";
            string pco = "";
            string idt = "";
            string exdt = "";
            string nco = "";
            //string cpport = "";
            string cpn1 = "";
            string cpph1 = "";
            string cpml1 = "";
            string cpadr1 = "";
            string cpn2 = "";
            string cpph2 = "";
            string cpml2 = "";
            string cpadr2 = "";
            string exyr = "";
            string exmn = "";
            string fnar = "";
            string cind = "";
            string exyr1 = "";
            string exmn1 = "";
            string fnar1 = "";
            string cind1 = "";
            string exyr2 = "";
            string exmn2 = "";
            string fnar2 = "";
            string cind2 = "";
            string sk1 = "";
            string sk1yr = "";
            string sk1mnt = "";
            string sk1ex = "";
            string sk2 = "";
            string sk2yr = "";
            string sk2mnt = "";
            string sk2ex = "";
            string sk3 = "";
            string sk3yr = "";
            string sk3mnt = "";
            string sk3ex = "";
            string sk4 = "";
            string sk4yr = "";
            string sk4mnt = "";
            string sk4ex = "";
            string sk5 = "";
            string sk5yr = "";
            string sk5mnt = "";
            string sk5ex = "";
            string sk6 = "";
            string sk6yr = "";
            string sk6mnt = "";
            string sk6ex = "";

            string ed1 = "";
            string ed1bd = "";
            string ed1sb = "";
            string ed1y = "";
            string ed1pe = "";
            string ed2 = "";
            string ed2bd = "";
            string ed2sb = "";
            string ed2y = "";
            string ed2pe = "";
            string ed3 = "";
            string ed3bd = "";
            string ed3sb = "";
            string ed3y = "";
            string ed3pe = "";

            string ed4 = "";
            string ed4bd = "";
            string ed4sb = "";
            string ed4y = "";
            string ed4pe = "";

            string ed5 = "";
            string ed5bd = "";
            string ed5sb = "";
            string ed5y = "";
            string ed5pe = "";

            string rtit = "";
            string rfil = "";
            string stras = "";
            string rpath = "";
            string rtxt = "";
            string pdt = "";
            int status = 0;
            string Mar_status = "";
            string prco = "";
            string prsta = "";
            string prcity = "";
            string praddress = "";
            string przp = "";
            string prwp = "";
            string prhp = "";
            string rphoto = "";
            string photopath = "";

            unm = Convert.ToString(txtemail.Text);
            //eml = Convert.ToString(conemail.Text);
            //pw = Convert.ToString(txtpwd.Text);
            fn = Convert.ToString(fname.Text);
            ln = Convert.ToString(lname.Text);
            mn = Convert.ToString(mname.Text);
            //ssn1 = Convert.ToString(FNssn.Text);
            gn = Convert.ToString(gend.SelectedItem.Text);
            sn = Convert.ToString(mmname.Text);
            sb = Convert.ToString(txtsb.Text);
            if (spgen.SelectedValue != "")
            {
                spg = Convert.ToString(spgen.SelectedItem.Text);
            }
            spg = "";
            //ssn2 = Convert.ToString(SNssn.Text);
            fatn = Convert.ToString(fatname.Text);
            motn = Convert.ToString(motname.Text);
            k1 = Convert.ToString(k1name.Text);
            k2 = Convert.ToString(k2name.Text);
            k3 = Convert.ToString(k3name.Text);
            k1b = Convert.ToString(txtk1bd.Text);
            k2b = Convert.ToString(txtk2bd.Text);
            k3b = Convert.ToString(txtk3bd.Text);

            //k1s = Convert.ToString(k1ssn.Text);
            //k2s = Convert.ToString(k2ssn.Text);
            //k3s = Convert.ToString(k3ssn.Text);
            if (k1gen.SelectedValue != "")
            {
                k1g = Convert.ToString(k1gen.SelectedItem.Text);
            }
            k1g = "";
            if (k2gen.SelectedValue != "")
            {
                k2g = Convert.ToString(k2gen.SelectedItem.Text);
            }
            k2g = "";
            if (k3gen.SelectedValue != "")
            {
                k3g = Convert.ToString(k3gen.SelectedItem.Text);
            }
            k3g = "";
            if (chkmarried.Checked)
            {
                Mar_status = "Married";
            }
            else
            {
                Mar_status = "Unmarried";
            }
            co = Convert.ToString(country.SelectedItem.Text);
            str = Convert.ToString(street.Text);
            sta = Convert.ToString(state.SelectedItem.Text);
            ci = Convert.ToString(city.SelectedItem.Text);
            zp = Convert.ToString(zip.Text);
            wp = Convert.ToString(wp1.Text + wp2.Text + wp3.Text);
            hp = Convert.ToString(hp1.Text + hp2.Text + hp3.Text);
            // mb = mobile .Text);
            //mb = Convert.ToString(mb1.Text + mb2.Text + mb3.Text);
            mb = Convert.ToString(txtmobile.Text);
            prco = Convert.ToString(prcountry.SelectedItem.Text);
            praddress = Convert.ToString(txtpraddress.Text);
            prsta = Convert.ToString(prstate.SelectedItem.Text);
            prcity = Convert.ToString(txtprcity.SelectedItem.Text);
            przp = Convert.ToString(txtprzip.Text);
            prwp = Convert.ToString(wpr1.Text + wpr2.Text + wpr3.Text);
            prhp = Convert.ToString(hpr1.Text + hpr2.Text + hpr3.Text);

            bd = Convert.ToString(txtbdate.Text);
            bco = Convert.ToString(bcountry.SelectedItem.Text);
            bsta = Convert.ToString(bstate.SelectedItem.Text);
            bci = Convert.ToString(bcity.SelectedItem.Text);
            cco = Convert.ToString(ccountry.SelectedItem.Text);
            pn = Convert.ToString(passno.Text);
            pco = Convert.ToString(pcountry.SelectedItem.Text);

            idt = Convert.ToString(txtisdate.Text);
            exdt = Convert.ToString(txtexpdate.Text);

            nco = Convert.ToString(ncountry.SelectedItem.Text);
            //cpport = Convert.ToString(pcountry.SelectedItem.Text);
            //cpassport.Text);
            cpn1 = Convert.ToString(cpname1.Text);
            cpph1 = Convert.ToString(cpphone1.Text);
            cpml1 = Convert.ToString(cpemail1.Text);
            cpadr1 = Convert.ToString(cpaddr1.Text);
            cpn2 = Convert.ToString(cpname2.Text);
            cpph2 = Convert.ToString(cpphone2.Text);
            cpml2 = Convert.ToString(cpemail2.Text);
            cpadr2 = Convert.ToString(cpaddr2.Text);
            exyr = Convert.ToString(expyrs.Text);
            exyr1 = Convert.ToString(expyrs1.Text);
            exyr2 = Convert.ToString(expyrs2.Text);
            exmn = Convert.ToString(expmon.Text);
            exmn1 = Convert.ToString(expmon1.Text);
            exmn2 = Convert.ToString(expmon2.Text);
            fnar = Convert.ToString(fnarea.Text);
            fnar1 = Convert.ToString(fnarea1.Text);
            fnar2 = Convert.ToString(fnarea2.Text);
            cind = Convert.ToString(currind.Text);
            cind1 = Convert.ToString(currind1.Text);
            cind2 = Convert.ToString(currind2.Text);
            sk1 = Convert.ToString(skills1.Text);
            sk1yr = Convert.ToString(sk1yrs.Text);
            sk1mnt = Convert.ToString(sk1mnts.Text);
            sk1ex = Convert.ToString(sk1exp.SelectedItem.Text);
            sk2 = Convert.ToString(skills2.Text);
            sk2yr = Convert.ToString(sk2yrs.Text);
            sk2mnt = Convert.ToString(sk2mnts.Text);
            sk2ex = Convert.ToString(sk2exp.SelectedItem.Text);
            sk3 = Convert.ToString(skills3.Text);
            sk3yr = Convert.ToString(sk3yrs.Text);
            sk3mnt = Convert.ToString(sk3mnts.Text);
            sk3ex = Convert.ToString(sk3exp.SelectedItem.Text);
            sk4 = Convert.ToString(skills4.Text);
            sk4yr = Convert.ToString(sk4yrs.Text);
            sk4mnt = Convert.ToString(sk4mnts.Text);
            sk4ex = Convert.ToString(sk4exp.SelectedItem.Text);
            sk5 = Convert.ToString(skills5.Text);
            sk5yr = Convert.ToString(sk5yrs.Text);
            sk5mnt = Convert.ToString(sk5mnts.Text);
            sk5ex = Convert.ToString(sk5exp.SelectedItem.Text);
            sk6 = Convert.ToString(skills6.Text);
            sk6yr = Convert.ToString(sk6yrs.Text);
            sk6mnt = Convert.ToString(sk6mnts.Text);
            sk6ex = Convert.ToString(sk6exp.SelectedItem.Text);

            ed1 = Convert.ToString(edu1.Text);
            ed1bd = Convert.ToString(ed1brd.Text);
            ed1sb = Convert.ToString(ed1sub.Text);
            ed1y = Convert.ToString(ed1yr.Text);
            //ed1pe = Convert.ToString(ed1per.Text);
            ed2 = Convert.ToString(edu2.Text);
            ed2bd = Convert.ToString(ed2brd.Text);
            ed2sb = Convert.ToString(ed2sub.Text);
            ed2y = Convert.ToString(ed2yr.Text);
            //ed2pe = Convert.ToString(ed2per.Text);
            ed3 = Convert.ToString(edu3.Text);
            ed3bd = Convert.ToString(ed3brd.Text);
            ed3sb = Convert.ToString(ed3sub.Text);
            ed3y = Convert.ToString(ed3yr.Text);
            // ed3pe = Convert.ToString(ed3per.Text);

            ed4 = Convert.ToString(edu4.Text);
            ed4bd = Convert.ToString(ed4brd.Text);
            ed4sb = Convert.ToString(ed4sub.Text);
            ed4y = Convert.ToString(ed4yr.Text);
            // ed4pe = Convert.ToString(ed4per.Text);

            ed5 = Convert.ToString(edu5.Text);
            ed5bd = Convert.ToString(ed5brd.Text);
            ed5sb = Convert.ToString(ed5sub.Text);
            ed5y = Convert.ToString(ed5yr.Text);
            //ed5pe = Convert.ToString(ed5per.Text);

            rtit = Convert.ToString(restitle.Text);
            //rfil = Convert.ToString(System.IO.Path.GetFileName(rfile.PostedFile.FileName));
            string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
            if (rfile.HasFile)
            {
                rfil = Path.GetFileName(rfile.PostedFile.FileName);
                stras = DateTime.Now.ToString("dd-MMM-yy") + rfil;
                rpath = "Resume/" + stras.ToString();
                rfile.SaveAs(Base_dir + rpath);
            }
            else
            {
                rpath = "";
            }
            if (Fileupphoto.HasFile)
            {
                rphoto = Fileupphoto.FileName.ToString();
                using (System.Drawing.Image myImage = System.Drawing.Image.FromStream(Fileupphoto.PostedFile.InputStream))
                {
                    if (myImage.Height == 117 && myImage.Width == 120)
                    {
                        photopath = Base_dir + "Emp_photos/" + rphoto;
                        Fileupphoto.SaveAs(photopath);
                    }
                    else
                    {

                        strScript = "alert('Image size is Too Large')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                    }


                }
                
                //string st_img = System.IO.Path.GetFullPath(Fileupphoto.PostedFile.FileName);
                //using (System.Drawing.Image Img = System.Drawing.Image.FromFile(st_img))
                //{
                //    //validates the posted file before saving
                //    if (Img.Width == 120 & Img.Height == 117)
                //    {
                //        //set theimage path
                //        //string dtym = DateTime.Now.ToString("dd-MMM-yy") + rphoto;
                //        photopath ="Emp_photos/" + rphoto;

                //        //then save it to the Folder
                //        Fileupphoto.SaveAs(Base_dir + photopath);
                //    }
                //    else
                //    {
                //        strScript = "alert('Image size is Too Large')";
                //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                //    }
                //}
            }
            else
            {
                photopath = "";
            }


            rtxt = Convert.ToString(txtres.Text);
            //pplc = Convert.ToString(pplace.Text);
            pdt = (System.DateTime.Today.Date).ToString();
            status = 0;
            Random rs = new Random();
            string Active_Id = Convert.ToString(rs.Next(10000));

            string streg = string.Empty;
            try
            {
                //Establish sql connection              
                //open database connection to connect to sql server
                connection.Open();

                string strQry = "insert into employeereg1(username,firstname, middlename, lastname, fathername, mothername, spousename, kid1, kid2, kid3, country1, state1, street, city1, zip, workphone, homephone, mobile,prcountry, prstate, prstreet, prcity, przip, prworkphone, prhomephone,marital_status, birthdate, cntryofcitizenship,birthcountry , birthstate,birthcity , passportno, passportissuedat, dateofissue, doexp, nationality, contactpersonname1, cp1phone, cp1email, cpaddress1, contactpersonname2, cp2phone2, cp2email, cpaddress2, totexptrs, totexpmonths, rhead, functionalarea, currentindustrytype, skills1, sk1years,sk1months, sk1exp, skills2, sk2years,sk2months, sk2exp, skills3, sk3years,sk3months, sk3exp,skills4, sk4years,sk4months, sk4exp,skills5, sk5years,sk5months, sk5exp,skills6, sk6years,sk6months, sk6exp, edu1, ed1brd, ed1sub, ed1year, ed1per, edu2, ed2brd, ed2sub, ed2year, ed2per, edu3, ed3brd, ed3sub, ed3year, ed3per, edu4, ed4brd, ed4sub, ed4year, ed4per, edu5, ed5brd, ed5sub, ed5year, ed5per, filename1, resumetxt, pdate, status,totexptrs1,totexptrs2,totexpmonths1,totexpmonths2,functionalarea1,functionalarea2,previousindustrytype1,previousindustrytype2,rpath,Activeid,photo,photopath) values(@un,@fn,@mn,@ln, @fatn, @motn,@spn,@k1,@k2,@k3,@co,@sta,@str,@ci,@zp,@wp,@hp,@mb,@prco, @prsta, @prstr,@prci, @przp, @prwp, @prhp,@Mar_status,@bdt,@cco,@bco,@bsta,@bci,@pn,@pco,@idt,@expd,@nco,@cpn1,@cpph1,@cpml1,@cpadr1,@cpn2,@cpph2,@cpml2,@cpadr2,@exyr,@exmn, @rtit,@fnar,@cind,@sk1,@sk1yr,@sk1mnt,@sk1ex,@sk2,@sk2yr,@sk2mnt,@sk2ex,@sk3,@sk3yr,@sk3mnt,@sk3ex,@sk4,@sk4yr,@sk4mnt,@sk4ex,@sk5,@sk5yr,@sk5mnt,@sk5ex,@sk6,@sk6yr,@sk6mnt,@sk6ex,@ed1,@ed1bd,@ed1sb,@ed1y,@ed1pe,@ed2,@ed2bd,@ed2sb,@ed2y,@ed2pe,@ed3,@ed3bd,@ed3sb,@ed3y,@ed3pe,@ed4,@ed4bd,@ed4sb,@ed4y,@ed4pe,@ed5,@ed5bd,@ed5sb,@ed5y,@ed5pe,@rfil,@rtxt,@pdate,@status,@exyr1,@exyr2,@exmn1,@exmn2,@fnar1,@fnar2,@cind1,@cind2,@rpath,@Active_Id,@pic,@picpath);insert into users_information (Fname,Lname,Designation,Country,UserId,Password,Address,PhNo,mobile,EmailId,Status) values(@Fname, @Lname,@Designation,@Country,@UserId,@Password,@Address,@PhNo,@mobile,@EmailId,@u_Status)";

                SqlCommand cmd = new SqlCommand(strQry, connection);
                cmd.Parameters.Add(new SqlParameter("@un", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@eml", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@pw", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@cpw", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@mn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar, 50));

                //cmd.Parameters.Add(new SqlParameter("@ssn1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@gn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@spg", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Mar_status", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sb", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@fatn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@motn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@spn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k3", SqlDbType.NVarChar, 50));

                //cmd.Parameters.Add(new SqlParameter("@k1s", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@k2s", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@k3s", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@k1b", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k2b", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k3b", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@k1g", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k2g", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@k3g", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@wp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@co", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sta", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@str", SqlDbType.NVarChar, 10000));
                cmd.Parameters.Add(new SqlParameter("@ci", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@zp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@hp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@mb", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@prwp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@prco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@prsta", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@prstr", SqlDbType.NVarChar, 10000));
                cmd.Parameters.Add(new SqlParameter("@prci", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@przp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@prhp", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@bdt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bci", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bsta", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@idt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@expd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@nco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpn1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpph1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpml1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpadr1", SqlDbType.NVarChar, 20000));
                cmd.Parameters.Add(new SqlParameter("@cpn2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpph2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpml2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpadr2", SqlDbType.NVarChar, 20000));

                cmd.Parameters.Add(new SqlParameter("@exyr", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@exmn", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@rtit", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@fnar", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cind", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@exyr1", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@exmn1", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@fnar1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cind1", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@exyr2", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@exmn2", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@fnar2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cind2", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@sk1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk1yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk1mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk1ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6mnt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6ex", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@ed1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed1bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed1sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed1y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed1pe", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed2bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed2sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed2y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed2pe", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@ed3", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed3bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed3sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed3y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed3pe", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed4", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed4bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed4sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed4y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed4pe", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed5", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed5bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed5sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed5y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed5pe", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@rfil", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@rpath", SqlDbType.NVarChar, 10000));
                cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 20));
                //cmd.Parameters.Add(new SqlParameter("@pplc", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@Active_Id", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@pic", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@picpath", SqlDbType.NVarChar, 10000));

                //Users Information
                cmd.Parameters.Add(new SqlParameter("@Fname", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Lname", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Designation", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Country", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@UserId", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 300));
                cmd.Parameters.Add(new SqlParameter("@PhNo", SqlDbType.NVarChar, 20));
                cmd.Parameters.Add(new SqlParameter("@mobile", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.NVarChar, 100));
                cmd.Parameters.Add(new SqlParameter("@u_Status", SqlDbType.Int));

                cmd.Parameters["@un"].Value = un;
                //cmd.Parameters["@eml"].Value = eml;
                //cmd.Parameters["@pw"].Value = pw;
                //cmd.Parameters["@cpw"].Value = pw;

                cmd.Parameters["@fn"].Value = fn;
                cmd.Parameters["@mn"].Value = mn;
                cmd.Parameters["@ln"].Value = ln;
                cmd.Parameters["@gn"].Value = gn;
                cmd.Parameters["@Mar_status"].Value = Mar_status;

                cmd.Parameters["@fatn"].Value = fatn;
                cmd.Parameters["@motn"].Value = motn;
                cmd.Parameters["@spn"].Value = sn;
                cmd.Parameters["@spg"].Value = spg;
                cmd.Parameters["@sb"].Value = sb;

                cmd.Parameters["@k1"].Value = k1;
                cmd.Parameters["@k2"].Value = k2;
                cmd.Parameters["@k3"].Value = k3;

                cmd.Parameters["@k1b"].Value = k1b;
                cmd.Parameters["@k2b"].Value = k2b;
                cmd.Parameters["@k3b"].Value = k3b;

                cmd.Parameters["@k1g"].Value = k1g;
                cmd.Parameters["@k2g"].Value = k2g;
                cmd.Parameters["@k3g"].Value = k3g;

                cmd.Parameters["@co"].Value = co;
                cmd.Parameters["@sta"].Value = sta;
                cmd.Parameters["@str"].Value = str;
                cmd.Parameters["@ci"].Value = ci;
                cmd.Parameters["@zp"].Value = zp;
                cmd.Parameters["@wp"].Value = wp;
                cmd.Parameters["@hp"].Value = hp;
                cmd.Parameters["@mb"].Value = mb;

                cmd.Parameters["@prco"].Value = prco;
                cmd.Parameters["@prsta"].Value = prsta;
                cmd.Parameters["@prstr"].Value = praddress;
                cmd.Parameters["@prci"].Value = prcity;
                cmd.Parameters["@przp"].Value = przp;
                cmd.Parameters["@prwp"].Value = prwp;
                cmd.Parameters["@prhp"].Value = prhp;

                if (bd != "")
                    cmd.Parameters["@bdt"].Value = Convert.ToDateTime(bd);
                else
                    cmd.Parameters["@bdt"].Value = "";

                cmd.Parameters["@cco"].Value = cco;
                cmd.Parameters["@bci"].Value = bci;

                cmd.Parameters["@bsta"].Value = bsta;

                cmd.Parameters["@bco"].Value = bco;

                cmd.Parameters["@pn"].Value = pn;
                if (idt != "")
                    cmd.Parameters["@idt"].Value = Convert.ToDateTime(idt);
                else
                    cmd.Parameters["@idt"].Value = "";

                if (exdt != "")
                    cmd.Parameters["@expd"].Value = Convert.ToDateTime(exdt);
                else
                    cmd.Parameters["@expd"].Value = "";

                cmd.Parameters["@nco"].Value = nco;
                cmd.Parameters["@pco"].Value = pco;
                cmd.Parameters["@cpn1"].Value = cpn1;
                cmd.Parameters["@cpph1"].Value = cpph1;
                cmd.Parameters["@cpml1"].Value = cpml1;
                cmd.Parameters["@cpadr1"].Value = cpadr1;
                cmd.Parameters["@cpn2"].Value = cpn2;
                cmd.Parameters["@cpph2"].Value = cpph2;
                cmd.Parameters["@cpml2"].Value = cpml2;
                cmd.Parameters["@cpadr2"].Value = cpadr2;

                if (exyr != "")
                    cmd.Parameters["@exyr"].Value = Convert.ToInt32(exyr);
                else
                    cmd.Parameters["@exyr"].Value = 0;

                if (exmn != "")
                    cmd.Parameters["@exmn"].Value = Convert.ToInt32(exmn);
                else
                    cmd.Parameters["@exmn"].Value = 0;

                if (exyr1 != "")
                    cmd.Parameters["@exyr1"].Value = Convert.ToInt32(exyr1);
                else
                    cmd.Parameters["@exyr1"].Value = 0;

                if (exmn1 != "")
                    cmd.Parameters["@exmn1"].Value = Convert.ToInt32(exmn1);
                else
                    cmd.Parameters["@exmn1"].Value = 0;

                if (exyr2 != "")
                    cmd.Parameters["@exyr2"].Value = Convert.ToInt32(exyr2);
                else
                    cmd.Parameters["@exyr2"].Value = 0;

                if (exmn2 != "")
                    cmd.Parameters["@exmn2"].Value = Convert.ToInt32(exmn2);
                else
                    cmd.Parameters["@exmn2"].Value = 0;

                cmd.Parameters["@rtit"].Value = rtit;
                cmd.Parameters["@fnar"].Value = fnar;
                cmd.Parameters["@cind"].Value = cind;

                cmd.Parameters["@fnar1"].Value = fnar1;
                cmd.Parameters["@cind1"].Value = cind1;

                cmd.Parameters["@fnar2"].Value = fnar2;
                cmd.Parameters["@cind2"].Value = cind2;

                cmd.Parameters["@sk1"].Value = sk1;
                cmd.Parameters["@sk1yr"].Value = sk1yr;
                cmd.Parameters["@sk1mnt"].Value = sk1mnt;
                cmd.Parameters["@sk1ex"].Value = sk1ex;

                cmd.Parameters["@sk2"].Value = sk2;
                cmd.Parameters["@sk2yr"].Value = sk2yr;
                cmd.Parameters["@sk2mnt"].Value = sk1mnt;
                cmd.Parameters["@sk2ex"].Value = sk2ex;

                cmd.Parameters["@sk3"].Value = sk3;
                cmd.Parameters["@sk3yr"].Value = sk3yr;
                cmd.Parameters["@sk3mnt"].Value = sk1mnt;
                cmd.Parameters["@sk3ex"].Value = sk3ex;

                cmd.Parameters["@sk4"].Value = sk4;
                cmd.Parameters["@sk4yr"].Value = sk4yr;
                cmd.Parameters["@sk4mnt"].Value = sk1mnt;
                cmd.Parameters["@sk4ex"].Value = sk4ex;

                cmd.Parameters["@sk5"].Value = sk5;
                cmd.Parameters["@sk5yr"].Value = sk5yr;
                cmd.Parameters["@sk5mnt"].Value = sk1mnt;
                cmd.Parameters["@sk5ex"].Value = sk5ex;

                cmd.Parameters["@sk6"].Value = sk6;
                cmd.Parameters["@sk6yr"].Value = sk6yr;
                cmd.Parameters["@sk6mnt"].Value = sk1mnt;
                cmd.Parameters["@sk6ex"].Value = sk6ex;

                cmd.Parameters["@ed1"].Value = ed1;
                cmd.Parameters["@ed1bd"].Value = ed1bd;
                cmd.Parameters["@ed1sb"].Value = ed1sb;
                cmd.Parameters["@ed1y"].Value = ed1y;
                cmd.Parameters["@ed1pe"].Value = ed1pe;
                cmd.Parameters["@ed2"].Value = ed2;
                cmd.Parameters["@ed2bd"].Value = ed2bd;
                cmd.Parameters["@ed2sb"].Value = ed2sb;
                cmd.Parameters["@ed2y"].Value = ed2y;
                cmd.Parameters["@ed2pe"].Value = ed2pe;
                cmd.Parameters["@ed3"].Value = ed3;
                cmd.Parameters["@ed3bd"].Value = ed3bd;
                cmd.Parameters["@ed3sb"].Value = ed3sb;
                cmd.Parameters["@ed3y"].Value = ed3y;
                cmd.Parameters["@ed3pe"].Value = ed3pe;

                cmd.Parameters["@ed4"].Value = ed4;
                cmd.Parameters["@ed4bd"].Value = ed4bd;
                cmd.Parameters["@ed4sb"].Value = ed4sb;
                cmd.Parameters["@ed4y"].Value = ed4y;
                cmd.Parameters["@ed4pe"].Value = ed4pe;

                cmd.Parameters["@ed5"].Value = ed5;
                cmd.Parameters["@ed5bd"].Value = ed5bd;
                cmd.Parameters["@ed5sb"].Value = ed5sb;
                cmd.Parameters["@ed5y"].Value = ed5y;
                cmd.Parameters["@ed5pe"].Value = ed5pe;

                cmd.Parameters["@rtxt"].Value = rtxt;
                cmd.Parameters["@rfil"].Value = rfil;
                cmd.Parameters["@rpath"].Value = rpath;
                cmd.Parameters["@pdate"].Value = pdt;
                cmd.Parameters["@status"].Value = status;
                cmd.Parameters["@pic"].Value = rphoto;
                cmd.Parameters["@picpath"].Value = photopath;


                if (Active_Id != "")
                {
                    cmd.Parameters["@Active_Id"].Value = Active_Id;
                }
                else
                {
                    cmd.Parameters["@Active_Id"].Value = "NotGenerated";
                }

                // Users_Information
                cmd.Parameters["@Fname"].Value = fn;
                cmd.Parameters["@Lname"].Value = ln;
                cmd.Parameters["@Designation"].Value = "Employee";
                cmd.Parameters["@Country"].Value = bco;
                cmd.Parameters["@UserId"].Value = "";
                cmd.Parameters["@Address"].Value = praddress;
                cmd.Parameters["@PhNo"].Value = hp;
                cmd.Parameters["@mobile"].Value = mb;
                cmd.Parameters["@EmailId"].Value = "";
                cmd.Parameters["@u_Status"].Value = status;
                cmd.Parameters["@Password"].Value = "";

                streg = cmd.ExecuteNonQuery().ToString();
                //close database connection to disconnect to sql server
                connection.Close();
                //SendMailMessage(usid, fn, ln, pw);
               
                strScript = "alert('Thanking you! You have been registered successfully.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                SendMail(usid, fn, ln);

                txtemail.Text = "";
                //conemail.Text = "";
                // txtpwd.Text = "";
                fname.Text = "";
                mname.Text = "";
                lname.Text = "";
                mmname.Text = "";
                txtsb.Text = "";
                k1name.Text = "";
                k2name.Text = "";
                k3name.Text = "";
                txtk1bd.Text = "";
                txtk2bd.Text = "";
                txtk3bd.Text = "";
                country.SelectedIndex = 0;
                prcountry.SelectedIndex = 0;
                street.Text = "";
                state.SelectedIndex = 0;
                city.SelectedItem.Text = "Select City";
                zip.Text = "";
                wp1.Text = "";
                wp2.Text = "";
                wp3.Text = "";
                hp1.Text = "";
                hp2.Text = "";
                hp3.Text = "";
                //mb1.Text = "";
                txtmobile.Text = "";
                txtpraddress.Text = "";
                prstate.SelectedIndex = 0;
                txtprcity.SelectedItem.Text = "Select City";
                txtprzip.Text = "";
                wpr1.Text = "";
                wpr2.Text = "";
                wpr3.Text = "";
                hpr1.Text = "";
                hpr2.Text = "";
                hpr3.Text = "";
                //mb2.Text = "";
                //mb3.Text = "";
                txtbdate.Text = "";
                bcountry.SelectedIndex = 0;
                bstate.SelectedIndex = 0;
                bcity.SelectedItem.Text = "Select City";
                ccountry.SelectedIndex = 0;
                passno.Text = "";
                pcountry.SelectedIndex = 0;
                txtisdate.Text = "";
                txtexpdate.Text = "";
                ncountry.SelectedIndex = 0;
                cpaddr1.Text = "";
                cpaddr2.Text = "";
                cpemail1.Text = "";
                cpemail2.Text = "";
                cpname1.Text = "";
                cpname2.Text = "";
                cpphone1.Text = "";
                cpphone2.Text = "";
                expyrs.Text = "";
                expmon.Text = "";
                fnarea.Text = "";
                currind.Text = "";
                skills1.Text = "";
                skills2.Text = "";
                skills3.Text = "";
                skills4.Text = "";
                skills5.Text = "";
                skills6.Text = "";
                sk1yrs.Text = "";
                sk2yrs.Text = "";
                sk3yrs.Text = "";
                sk4yrs.Text = "";
                sk5yrs.Text = "";
                sk6yrs.Text = "";
                sk1mnts.Text = "";
                sk2mnts.Text = "";
                sk3mnts.Text = "";
                sk4mnts.Text = "";
                sk5mnts.Text = "";
                sk6mnts.Text = "";
                sk1exp.SelectedIndex = 0;
                sk2exp.SelectedIndex = 0;
                sk3exp.SelectedIndex = 0;
                sk4exp.SelectedIndex = 0;
                sk5exp.SelectedIndex = 0;
                sk6exp.SelectedIndex = 0;
                edu1.Text = "";
                edu2.Text = "";
                edu3.Text = "";
                edu4.Text = "";
                edu5.Text = "";
                ed1brd.Text = "";
                ed2brd.Text = "";
                ed3brd.Text = "";
                ed4brd.Text = "";
                ed5brd.Text = "";
                ed1sub.Text = "";
                ed2sub.Text = "";
                ed3sub.Text = "";
                ed4sub.Text = "";
                ed5sub.Text = "";
                ed1yr.Text = "";
                ed2yr.Text = "";
                ed3yr.Text = "";
                ed4yr.Text = "";
                ed5yr.Text = "";
                restitle.Text = "";
                txtres.Text = "";
                fatname.Text = "";
                motname.Text = "";
            }
            catch (Exception ex)
            {
                //to catch exception handled
                lblmail.Text = ex.Message;
            }
        }
    }
    /// <summary>
    /// summary code to send mail 
    /// </summary>
    /// <param name="usid">User Id</param>
    /// <param name="un">Username</param>
    /// <param name="eml">Email id</param>
    /// <param name="pw">Password</param>
    private void SendMail(string usid, string fn, string ln)
    {
        string msg = "";
        Int32 User_Id = 0;
        string Act_id = "";
        try
        {
            SqlDataAdapter scmd = new SqlDataAdapter("select * from employeereg1 where username='" + usid + "'", connection);
            DataSet dss = new DataSet();
            scmd.Fill(dss);
            if (dss.Tables[0].Rows.Count > 0)
            {
                User_Id = Convert.ToInt32(dss.Tables[0].Rows[0]["userid"]);
                Act_id = Convert.ToString(dss.Tables[0].Rows[0]["Activeid"]);
            }
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("info@igiit.com");
            mm.To.Add(usid);
            msg += "Dear " + fn + " " + ln + ",<br><br>" +
                    "Username : " + usid + ",<br>" +
                    "To activate your account Please<a href='http://www.igiit.net/ActiveAccount.aspx?uid=" + User_Id + "&Activeid=" + Act_id + "'><b> Click Here to Verify Eamil</b></a>" +
                    "<br> " +
                    "<br>Thank you for Registering with info@igiit.com<br>";
            mm.Subject = "You are Registered with Indus Group";
            mm.IsBodyHtml = true;
            mm.Body = msg;
            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            lblmail.Text = ex.Message;
        }
    }
    /// <summary>
    /// Summarise to bound the states when we select any country
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void bcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = Convert.ToString(bcountry.SelectedValue);
        ds = ds = countries.GetState(x);
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
        string y = Convert.ToString(country.SelectedValue);
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
    protected void prcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        string z = Convert.ToString(prcountry.SelectedValue);
        ds = countries.GetState(z);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                prstate.Items.Add("");
                prstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                prstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        connection.Open();
        SqlCommand cmd = new SqlCommand("select * from employeereg1 where username=@uname", connection);
        cmd.Parameters.AddWithValue("@uname", txtemail.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            lblcheckavail.Visible = true;
            imgcheck1.Visible = true;
            //checkusername.Visible = true;
            imgcheck1.ImageUrl = "images/NotAvailable.jpg";
            lblcheckavail.Text = "Name Already Exist";
        }
        else
        {
            lblcheckavail.Visible = true;
            imgcheck1.Visible = true;
            //checkusername.Visible = true;
            imgcheck1.ImageUrl = "images/check.gif";
            lblcheckavail.Text = "Name Available";
        }
        connection.Close();
    }
    protected void bstate_SelectedIndexChanged(object sender, EventArgs e)
    {

        string x1 = Convert.ToString(bstate.SelectedValue);
        ds1 = countries.GetCity(x1);

        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                bcity.Items.Add("");
                bcity.Items[i].Text = ds1.Tables[0].Rows[i - 1]["CityName"].ToString();
                bcity.Items[i].Value = ds1.Tables[0].Rows[i - 1]["CityID"].ToString();
            }
        }
    }
    protected void prstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string z1 = Convert.ToString(prstate.SelectedValue);
        ds1 = countries.GetCity(z1);

        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                txtprcity.Items.Add("");
                txtprcity.Items[i].Text = ds1.Tables[0].Rows[i - 1]["CityName"].ToString();
                txtprcity.Items[i].Value = ds1.Tables[0].Rows[i - 1]["CityID"].ToString();
            }
        }
    }
    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        string y1 = Convert.ToString(state.SelectedValue);
        ds1 = countries.GetCity(y1);

        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                city.Items.Add("");
                city.Items[i].Text = ds1.Tables[0].Rows[i - 1]["CityName"].ToString();
                city.Items[i].Value = ds1.Tables[0].Rows[i - 1]["CityID"].ToString();
            }
        }
    }
}
