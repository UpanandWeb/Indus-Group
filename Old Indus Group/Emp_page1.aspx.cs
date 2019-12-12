using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Emp_page1 : System.Web.UI.Page
{

    DataSet ds = new DataSet();
    DataSet ds1 = new DataSet();
    Int32 val;
    Int32 usersinfo_id;
    string usid = string.Empty;
    string Email;
    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string strScript = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["mail"] != null)
        {
            Email = Request.QueryString["mail"].ToString();
            txtemail.Text = Email;
            txtemail.ReadOnly = true;
            GetEmployeeDetails(Email);
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
            ds = countries.GetCounty();

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    country.Items.Add("");
                    country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();

                    pcountry.Items.Add("");
                    pcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    pcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();

                    ncountry.Items.Add("");
                    ncountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    ncountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();

                    ccountry.Items.Add("");
                    ccountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    ccountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();

                    bcountry.Items.Add("");
                    bcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    bcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();

                    prcountry.Items.Add("");
                    prcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtcountry_name"].ToString();
                    prcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intcountry_id"].ToString();
                }
            }

        }

    }
    public void GetEmployeeDetails(string empEmail)
    {
        SqlDataAdapter sdEmployeeDetails = new SqlDataAdapter("select userid,username,emailid,firstname,lastname from employeereg1 where username='" + Email + "'", connection);
        DataSet dsEmployeeDetails = new DataSet();
        sdEmployeeDetails.Fill(dsEmployeeDetails);
        if (dsEmployeeDetails.Tables[0].Rows.Count > 0)
        {
            fname.Text = Convert.ToString(dsEmployeeDetails.Tables[0].Rows[0]["firstname"]);
            lname.Text = Convert.ToString(dsEmployeeDetails.Tables[0].Rows[0]["lastname"]);
            fname.Enabled = true;
            lname.Enabled = true;

        }
    }
    protected void btnSave_Emp_Click(object sender, EventArgs e)
    {
        string un = txtemail.Text.ToString();
        DataSet ds = new DataSet();
        //ds = sdata.GetEmpDet(un);
        usid = txtemail.Text.ToString();

        SqlDataAdapter sqlde = new SqlDataAdapter("select e.*,u.* from employeereg1 e inner join users_information u on e.username=u.EmailId where username='" + Email + "'", connection);
        DataSet dse = new DataSet();
        sqlde.Fill(dse);
        if (dse.Tables[0].Rows.Count > 0)
        {
            val = Convert.ToInt32(dse.Tables[0].Rows[0]["userid"]);
            usersinfo_id = Convert.ToInt32(dse.Tables[0].Rows[0]["uid"]);

        }

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
            string cpn1 = "";
            string cpph1 = "";
            string cpml1 = "";
            string cpadr1 = "";
            string cpn2 = "";
            string cpph2 = "";
            string cpml2 = "";
            string cpadr2 = "";
            int status = 0;
            string Mar_status = "";
            string prco = "";
            string prsta = "";
            string prcity = "";
            string praddress = "";
            string przp = "";
            string prwp = "";
            string prhp = "";
            //string rphoto = "";
            //string photopath = "";

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
            spg = "";
            if (spgen.SelectedValue != "")
            {
                spg = Convert.ToString(spgen.SelectedItem.Text);
            }
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
            k1g = "";
            if (k1gen.SelectedValue != "")
            {
                k1g = Convert.ToString(k1gen.SelectedItem.Text);
            }
            k2g = "";
            if (k2gen.SelectedValue != "")
            {
                k2g = Convert.ToString(k2gen.SelectedItem.Text);
            }
            k3g = "";
            if (k3gen.SelectedValue != "")
            {
                k3g = Convert.ToString(k3gen.SelectedItem.Text);
            }
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
            wp = Convert.ToString(wp1.Text);
            hp = Convert.ToString(hp1.Text);
            // mb = mobile .Text);
            //mb = Convert.ToString(mb1.Text + mb2.Text + mb3.Text);
            mb = Convert.ToString(txtmobile.Text);
            prco = Convert.ToString(prcountry.SelectedItem.Text);
            praddress = Convert.ToString(txtpraddress.Text);
            prsta = Convert.ToString(prstate.SelectedItem.Text);
            prcity = Convert.ToString(txtprcity.SelectedItem.Text);
            przp = Convert.ToString(txtprzip.Text);
            prwp = Convert.ToString(wpr1.Text);
            prhp = Convert.ToString(hpr1.Text);

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

            try
            {
                //Establish sql connection              
                //open database connection to connect to sql server
                connection.Open();

                // string strQry = "insert into employeereg1(username,firstname, middlename, lastname, fathername, mothername, spousename, kid1, kid2, kid3, country1, state1, street, city1, zip, workphone, homephone, mobile,prcountry, prstate, prstreet, prcity, przip, prworkphone, prhomephone,marital_status, birthdate, cntryofcitizenship,birthcountry , birthstate, birthcity , passportno, passportissuedat, dateofissue, doexp, nationality, contactpersonname1, cp1phone, cp1email, cpaddress1, contactpersonname2, cp2phone2, cp2email, cpaddress2) values(@un,@fn,@mn,@ln, @fatn, @motn,@spn,@k1,@k2,@k3,@co,@sta,@str,@ci,@zp,@wp,@hp,@mb,@prco, @prsta, @prstr,@prci, @przp, @prwp, @prhp,@Mar_status,@bdt,@cco,@bco,@bsta,@bci,@pn,@pco,@idt,@expd,@nco,@cpn1,@cpph1,@cpml1,@cpadr1,@cpn2,@cpph2,@cpml2,@cpadr2);insert into users_information (Fname,Lname,Designation,Country,UserId,Password,Address,PhNo,mobile,EmailId,Status) values(@Fname, @Lname,@Designation,@Country,@UserId,@Password,@Address,@PhNo,@mobile,@EmailId,@u_Status)";
                string StrUQuery = "update employeereg1 set firstname=@fn, middlename=@mn, gender=@gn, lastname=@ln, fathername=@fatn, mothername=@motn, spousename=@spn, kid1=@k1, kid2=@k2, kid3=@k3, country1=@co, state1=@sta, street=@str, city1=@ci, zip=@zp, workphone=@wp, homephone=@hp, mobile=@mb,prcountry=@prco, prstate=@prsta, prstreet=@prstr, prcity=@prci, przip=@przp, prworkphone=@prwp, prhomephone=@prhp,marital_status=@Mar_status, birthdate=@bdt, cntryofcitizenship=@cco,birthcountry= @bco, birthstate=@bsta, birthcity=@bci , passportno=@pn, passportissuedat=@pco, dateofissue=@idt, doexp=@expd, nationality=@nco, contactpersonname1=@cpn1, cp1phone=@cpph1, cp1email=@cpml1, cpaddress1=@cpadr1, contactpersonname2=@cpn2, cp2phone2=@cpph2, cp2email=@cpml2, cpaddress2=@cpadr2 where userid= " + val;

                string strIQuery = "update users_information set Fname=@Fname,Lname=@Lname,Designation=@Designation,Country=@Country,Address=@Address,Status=@u_Status where uid=" + usersinfo_id;


                //string strIQuery="insert into users_information (Fname,Lname,Designation,Country,UserId,Password,Address,PhNo,mobile,EmailId,Status) values(@Fname, @Lname,@Designation,@Country,@UserId,@Password,@Address,@PhNo,@mobile,@EmailId,@u_Status)";

                SqlCommand cmd = new SqlCommand(StrUQuery, connection);
                SqlCommand cmd1 = new SqlCommand(strIQuery, connection);
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

                // Users_Information
                cmd1.Parameters.Add(new SqlParameter("@Fname", SqlDbType.NVarChar, 50));
                cmd1.Parameters.Add(new SqlParameter("@Lname", SqlDbType.NVarChar, 50));
                cmd1.Parameters.Add(new SqlParameter("@Designation", SqlDbType.NVarChar, 50));
                cmd1.Parameters.Add(new SqlParameter("@Country", SqlDbType.NVarChar, 50));
                //cmd1.Parameters.Add(new SqlParameter("@UserId", SqlDbType.NVarChar, 50));
                //cmd1.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50));
                cmd1.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 300));
                //cmd1.Parameters.Add(new SqlParameter("@PhNo", SqlDbType.NVarChar, 20));
                //cmd1.Parameters.Add(new SqlParameter("@mobile", SqlDbType.NVarChar, 50));
                //cmd1.Parameters.Add(new SqlParameter("@EmailId", SqlDbType.NVarChar, 100));
                cmd1.Parameters.Add(new SqlParameter("@u_Status", SqlDbType.Int));

                cmd1.Parameters["@Fname"].Value = fn;
                cmd1.Parameters["@Lname"].Value = ln;
                cmd1.Parameters["@Designation"].Value = "Employee";
                cmd1.Parameters["@Country"].Value = bco;
                //cmd1.Parameters["@UserId"].Value = "";
                cmd1.Parameters["@Address"].Value = praddress;
                //cmd1.Parameters["@PhNo"].Value = hp;
                //cmd1.Parameters["@mobile"].Value = mb;
                //cmd1.Parameters["@EmailId"].Value = "";
                cmd1.Parameters["@u_Status"].Value = status;
                //cmd1.Parameters["@Password"].Value = "";

                int s = cmd.ExecuteNonQuery();
                int u = cmd1.ExecuteNonQuery();
                connection.Close();
                SendMail(usid, fn, ln);
                //SendMailMessage(usid, fn, ln, pw);
                if (s > 0 && u > 0)
                {

                    //SqlDataAdapter  sqlads = new SqlDataAdapter("select max(userid) as uid from employeereg1", connection);
                    //DataSet dss = new DataSet();
                    //sqlads.Fill(dss);
                    //if (dss.Tables[0].Rows.Count > 0)
                    //{
                    //    val = Convert.ToInt32(dss.Tables[0].Rows[0]["uid"]);
                    //}
                    //strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Emp_page2.aspx?id=' + val')";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    Response.Redirect("Emp_page2.aspx?id=" + val);
                }
            }
            catch (Exception ex)
            {
                //to catch exception handled
                lblmail.Text = ex.Message;
            }
        }
    }
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
           // MailMessage mm = new MailMessage();
            //mm.From = new MailAddress("info@igiit.com");
            //mm.To.Add(usid);
            msg += "Dear " + fn + " " + ln + ",<br><br>" +
                    "Username : " + usid + ",<br>" +
                    "To activate your account Please<a href='http://www.igiit.net/ActiveAccount.aspx?uid=" + User_Id + "&Activeid=" + Act_id + "'><b> Click Here to Verify Eamil</b></a>" +
                    "<br> " +
                    "<br>Thank you for Registering with info@igiit.com<br>";
            //mm.Subject = "You are Registered with Indus Group";
           // mm.IsBodyHtml = true;
           // mm.Body = msg;
            //SmtpClient smtp = new SmtpClient();
            //smtp.Send(mm);
        }
        catch (Exception ex)
        {
            lblmail.Text = ex.Message;
        }
    }

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
}


