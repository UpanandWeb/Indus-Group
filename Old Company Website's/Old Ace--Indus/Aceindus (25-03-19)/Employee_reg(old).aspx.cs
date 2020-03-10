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
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
/// <summary>
/// Summarise to register employee
/// </summary>
public partial class Employee_reg : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                
    DataSet ds = new DataSet();
    string usid = string.Empty;
    string emailid = string.Empty;

    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {

        emailid = Request.QueryString["email"].ToString();

        string usid = string.Empty;
        //Initialise object to bind and navigate countries
        StateCountry countries = new StateCountry();
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

        //bind the values of registered employee from admin
        connection.Open();
        DataSet dsemp = new DataSet();
        SqlDataAdapter daemp = new SqlDataAdapter("select * from employeereg1 where emailid='"+ emailid +"'", connection);
        daemp.Fill(dsemp);

        if (!dsemp.Tables[0].Rows.Count.Equals(0))
        {

            txtemail.Text = dsemp.Tables[0].Rows[0]["emailid"].ToString();
            ctxtmail.Text = dsemp.Tables[0].Rows[0]["emailid"].ToString();
            txtpwd.Text = dsemp.Tables[0].Rows[0]["pwd"].ToString();
            fname.Text = dsemp.Tables[0].Rows[0]["firstname"].ToString();
            lname.Text = dsemp.Tables[0].Rows[0]["lastname"].ToString();
            
        }
        connection.Close();

    }
    /// <summary>
    /// summarise code when we click submit button by filling data in their data fields
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string un = txtemail.Text.ToString();
        DataSet ds = new DataSet();
        //ds = sdata.GetEmpDet(un);
        usid = txtemail.Text.ToString();
        if (IsValid)
        {
            string unm = "";
            string eml = "";
            string pw = "";
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
            string sk1 = "";
            string sk1yr = "";
            string sk1ex = "";
            string sk2 = "";
            string sk2yr = "";
            string sk2ex = "";
            string sk3 = "";
            string sk3yr = "";
            string sk3ex = "";
            string sk4 = "";
            string sk4yr = "";
            string sk4ex = "";
            string sk5 = "";
            string sk5yr = "";
            string sk5ex = "";
            string sk6 = "";
            string sk6yr = "";
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

            string ed6 = "";
            string ed6bd = "";
            string ed6sb = "";
            string ed6y = "";
            string ed6pe = "";

            string ed7 = "";
            string ed7bd = "";
            string ed7sb = "";
            string ed7y = "";
            string ed7pe = "";

            string rtit = "";
            string rfil = "";
            string rtxt = "";
            string pplc = "";
            string pdt = "";
            int status = 0;
            //string sdt = "";

            unm = Convert.ToString(txtemail.Text);
            eml = Convert.ToString(ctxtmail.Text);
            pw = Convert.ToString(txtpwd.Text);
            fn = Convert.ToString(fname.Text);
            ln = Convert.ToString(lname.Text);
            mn = Convert.ToString(mname.Text);
            //ssn1 = Convert.ToString(FNssn.Text);
            
            if (gend.SelectedValue != "")
            {
                gn = Convert.ToString(gend.SelectedItem.Text);
            }
            else
            {
                gn = "";
            }
            
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
            k1b =Convert.ToString(txtk1bd.Text);
            k2b =Convert.ToString(txtk2bd.Text);
            k3b =Convert.ToString(txtk3bd.Text);

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
            co = Convert.ToString(country.SelectedItem.Text);
            str = Convert.ToString(street.Text);
            sta = Convert.ToString(state.SelectedItem.Text);
            ci = Convert.ToString(city.Text);
            zp = Convert.ToString(zip.Text);
            wp = Convert.ToString(wp1.Text + wp2.Text + wp3.Text);
            hp = Convert.ToString(hp1.Text + hp2.Text + hp3.Text);
            // mb = mobile .Text);
            mb = Convert.ToString(mb1.Text + mb2.Text + mb3.Text);

            bd= Convert.ToString(txtbdate.Text);
            bco = Convert.ToString(bcountry.SelectedItem.Text);
            bsta = Convert.ToString(bstate.SelectedItem.Text);
            bci = Convert.ToString(bcity.Text);
            cco = Convert.ToString(ccountry.SelectedItem.Text);
            pn = Convert.ToString(passno.Text);
            pco = Convert.ToString(pcountry.SelectedItem.Text);

            idt=Convert.ToString(txtisdate.Text); 
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
            exmn = Convert.ToString(expmon.Text);
            fnar = Convert.ToString(fnarea.Text);
            cind = Convert.ToString(currind.Text);
            sk1 = Convert.ToString(skills1.Text);
            sk1yr = Convert.ToString(sk1yrs.Text);
            sk1ex = Convert.ToString(sk1exp.SelectedItem.Text);
            sk2 = Convert.ToString(skills2.Text);
            sk2yr = Convert.ToString(sk2yrs.Text);
            sk2ex = Convert.ToString(sk2exp.SelectedItem.Text);
            sk3 = Convert.ToString(skills3.Text);
            sk3yr = Convert.ToString(sk3yrs.Text);
            sk3ex = Convert.ToString(sk3exp.SelectedItem.Text);
            sk4 = Convert.ToString(skills4.Text);
            sk4yr = Convert.ToString(sk4yrs.Text);
            sk4ex = Convert.ToString(sk4exp.SelectedItem.Text);
            sk5 = Convert.ToString(skills5.Text);
            sk5yr = Convert.ToString(sk5yrs.Text);
            sk5ex = Convert.ToString(sk5exp.SelectedItem.Text);
            sk6 = Convert.ToString(skills6.Text);
            sk6yr = Convert.ToString(sk6yrs.Text);
            sk6ex = Convert.ToString(sk6exp.SelectedItem.Text);

            ed1 = Convert.ToString(edu1.Text);
            ed1bd = Convert.ToString(ed1brd.Text);
            ed1sb = Convert.ToString(ed1sub.Text);
            ed1y = Convert.ToString(ed1yr.Text);
            ed1pe = Convert.ToString(ed1per.Text);
            ed2 = Convert.ToString(edu2.Text);
            ed2bd = Convert.ToString(ed2brd.Text);
            ed2sb = Convert.ToString(ed2sub.Text);
            ed2y = Convert.ToString(ed2yr.Text);
            ed2pe = Convert.ToString(ed2per.Text);
            ed3 = Convert.ToString(edu3.Text);
            ed3bd = Convert.ToString(ed3brd.Text);
            ed3sb = Convert.ToString(ed3sub.Text);
            ed3y = Convert.ToString(ed3yr.Text);
            ed3pe = Convert.ToString(ed3per.Text);

            ed4 = Convert.ToString(edu4.Text);
            ed4bd = Convert.ToString(ed4brd.Text);
            ed4sb = Convert.ToString(ed4sub.Text);
            ed4y = Convert.ToString(ed4yr.Text);
            ed4pe = Convert.ToString(ed4per.Text);

            ed5 = Convert.ToString(edu5.Text);
            ed5bd = Convert.ToString(ed5brd.Text);
            ed5sb = Convert.ToString(ed5sub.Text);
            ed5y = Convert.ToString(ed5yr.Text);
            ed5pe = Convert.ToString(ed5per.Text);

            ed6 = Convert.ToString(edu6.Text);
            ed6bd = Convert.ToString(ed6brd.Text);
            ed6sb = Convert.ToString(ed6sub.Text);
            ed6y = Convert.ToString(ed6yr.Text);
            ed6pe = Convert.ToString(ed6per.Text);

            ed7 = Convert.ToString(edu7.Text);
            ed7bd = Convert.ToString(ed7brd.Text);
            ed7sb = Convert.ToString(ed7sub.Text);
            ed7y = Convert.ToString(ed7yr.Text);
            ed7pe = Convert.ToString(ed7per.Text);

            rtit = Convert.ToString(restitle.Text);

            rfil = rfile.FileName.ToString();
            //sets the image path
            string dttym = DateTime.Now.ToString("dd-MMM-yy") + rfil;
            string rpath = ("~/Resume/") + dttym.ToString();

            //then save it to the Folder
            rfile.SaveAs(Server.MapPath(rpath));
           
            //rfil = Convert.ToString(System.IO.Path.GetFileName(rfile.PostedFile.FileName));
            rtxt = Convert.ToString(txtres.Text);
            pplc = Convert.ToString(pplace.Text);
            pdt = (System.DateTime.Today.Date).ToString();
            status = 1;
            string streg = string.Empty;
            try
            {
                //open database connection to connect to sql server
                connection.Open();              

                string strQry = "Update employeereg1 set username=@un,emailid=@eml,pwd=@pw,confirmpwd=@cpw,firstname=@fn,middlename=@mn,lastname=@ln, fathername=@fatn, mothername=@motn,spousename=@spn,";
                strQry = strQry + "kid1=@k1,kid2=@k2,kid3=@k3,country1=@co,state1=@sta,street=@str,city1=@ci,zip=@zp,workphone=@wp,homephone=@hp,mobile=@mb,birthdate=@bdt,cntryofcitizenship=@cco,birthcity=@bco,";
                strQry = strQry + "birthstate=@bsta,birthcountry=@bco,passportno=@pn,passportissuedat=@pco,dateofissue=@idt,doexp=@expd,nationality=@nco,";
                strQry = strQry + "contactpersonname1=@cpn1,cp1phone=@cpph1,cp1email=@cpml1,cpaddress1=@cpadr1,contactpersonname2=@cpn2,cp2phone2=@cpph2,cp2email=@cpml2,cpaddress2=@cpadr2,";
                strQry = strQry + "totexptrs=@exyr,totexpmonths=@exmn, rhead=@rtit,functionalarea=@fnar,currentindustrytype=@cind,";
                strQry = strQry + "skills1=@sk1,sk1years=@sk1yr,sk1exp=@sk1ex,skills2=@sk2,sk2years=@sk2yr,sk2exp=@sk2ex,skills3=@sk3,sk3years=@sk3yr,sk3exp=@sk3ex,";
                strQry = strQry + "edu1=@ed1,ed1brd=@ed1bd,ed1sub=@ed1sb,ed1year=@ed1y,ed1per=@ed1pe,edu2=@ed2,ed2brd=@ed2bd,ed2sub=@ed2sb,ed2year=@ed2y,ed2per=@ed2pe,";
                strQry = strQry + "edu3=@ed3,ed3brd=@ed3bd,ed3sub=@ed3sb,ed3year=@ed3y,ed3per=@ed3pe,edu4=@ed4,ed4brd=@ed4bd,ed4sub=@ed4sb,ed4year=@ed4y,ed4per=@ed4pe,";
                strQry = strQry + "edu5=@ed5,ed5brd=@ed5bd,ed5sub=@ed5sb,ed5year=@ed5y,ed5per=@ed5pe,filename1=@rfil,resumetxt=@rtxt,pdate=@pdate,piss_place=@pplc,status=@status,rpath=@rpath where username='" + txtemail.Text + "'";



                SqlCommand cmd = new SqlCommand(strQry, connection);
                cmd.Parameters.Add(new SqlParameter("@un", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@eml", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pw", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cpw", SqlDbType.NVarChar, 50));

                cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@mn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar, 50));

                //cmd.Parameters.Add(new SqlParameter("@ssn1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@gn", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@spg", SqlDbType.NVarChar, 50));
                //                                                                cmd.Parameters.Add(new SqlParameter("@ssn2", SqlDbType.NVarChar, 50));
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
                cmd.Parameters.Add(new SqlParameter("@str", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ci", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@zp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@hp", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@mb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bdt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@cco", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bci", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bsta", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@bco", SqlDbType.NVarChar, 50));
                //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pn", SqlDbType.NVarChar, 50));
               //cmd.Parameters.Add(new SqlParameter("@cpco", SqlDbType.NVarChar, 50));
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

                cmd.Parameters.Add(new SqlParameter("@sk1", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk1yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk1ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk2ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk3ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk4ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5yr", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk5ex", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@sk6yr", SqlDbType.NVarChar, 50));
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
                cmd.Parameters.Add(new SqlParameter("@ed6", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed6bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed6sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed6y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed6pe", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed7", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed7bd", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed7sb", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed7y", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@ed7pe", SqlDbType.NVarChar, 50));


                cmd.Parameters.Add(new SqlParameter("@rfil", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 20));
                cmd.Parameters.Add(new SqlParameter("@pplc", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@rpath", SqlDbType.NVarChar, 4000));

                //cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));
                cmd.Parameters["@un"].Value = un;
                cmd.Parameters["@eml"].Value = eml;
                cmd.Parameters["@pw"].Value = pw;
                cmd.Parameters["@cpw"].Value = pw;

                cmd.Parameters["@fn"].Value = fn;
                cmd.Parameters["@mn"].Value = mn;
                cmd.Parameters["@ln"].Value = ln;
                cmd.Parameters["@gn"].Value = gn;
                //cmd.Parameters["@ssn1"].Value = ssn1;
                cmd.Parameters["@fatn"].Value = fatn;
                cmd.Parameters["@motn"].Value = motn;
                cmd.Parameters["@spn"].Value = sn;
                cmd.Parameters["@spg"].Value = spg;


                cmd.Parameters["@sb"].Value = sb;

                //cmd.Parameters["@ssn2"].Value = ssn2;

                cmd.Parameters["@k1"].Value = k1;
                cmd.Parameters["@k2"].Value = k2;
                cmd.Parameters["@k3"].Value = k3;

                cmd.Parameters["@k1b"].Value = k1b;
                cmd.Parameters["@k2b"].Value = k2b;
                cmd.Parameters["@k3b"].Value = k3b;

                //cmd.Parameters["@k1s"].Value = k1s;
                //cmd.Parameters["@k2s"].Value = k2s;
                //cmd.Parameters["@k3s"].Value = k3s;

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

                //cmd.Parameters["@cpco"].Value = cpport;

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

                cmd.Parameters["@rtit"].Value = rtit;
                cmd.Parameters["@fnar"].Value = fnar;
                cmd.Parameters["@cind"].Value = cind;

                cmd.Parameters["@sk1"].Value = sk1;
                cmd.Parameters["@sk1yr"].Value = sk1yr;
                cmd.Parameters["@sk1ex"].Value = sk1ex;
                cmd.Parameters["@sk2"].Value = sk2;
                cmd.Parameters["@sk2yr"].Value = sk2yr;
                cmd.Parameters["@sk2ex"].Value = sk2ex;
                cmd.Parameters["@sk3"].Value = sk3;
                cmd.Parameters["@sk3yr"].Value = sk3yr;
                cmd.Parameters["@sk3ex"].Value = sk3ex;

                cmd.Parameters["@sk4"].Value = sk4;
                cmd.Parameters["@sk4yr"].Value = sk4yr;
                cmd.Parameters["@sk4ex"].Value = sk4ex;

                cmd.Parameters["@sk5"].Value = sk5;
                cmd.Parameters["@sk5yr"].Value = sk5yr;
                cmd.Parameters["@sk5ex"].Value = sk5ex;

                cmd.Parameters["@sk6"].Value = sk6;
                cmd.Parameters["@sk6yr"].Value = sk6yr;
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

                cmd.Parameters["@ed6"].Value = ed6;
                cmd.Parameters["@ed6bd"].Value = ed6bd;
                cmd.Parameters["@ed6sb"].Value = ed6sb;
                cmd.Parameters["@ed6y"].Value = ed6y;
                cmd.Parameters["@ed6pe"].Value = ed6pe;

                cmd.Parameters["@ed7"].Value = ed7;
                cmd.Parameters["@ed7bd"].Value = ed7bd;
                cmd.Parameters["@ed7sb"].Value = ed7sb;
                cmd.Parameters["@ed7y"].Value = ed7y;
                cmd.Parameters["@ed7pe"].Value = ed7pe;


                cmd.Parameters["@rtxt"].Value = rtxt;
                cmd.Parameters["@rfil"].Value = dttym;
                cmd.Parameters["@pplc"].Value = pplc;

                cmd.Parameters["@pdate"].Value = pdt;
                cmd.Parameters["@pdate"].Value = pdt;
                cmd.Parameters["@status"].Value = status;
                cmd.Parameters["@rpath"].Value = rpath;
                streg = cmd.ExecuteNonQuery().ToString();
                //close database connection to disconnect to sql server
                connection.Close();

           
                SendMailMessage(usid,un,eml,pw);
                string strScript = "";
                strScript = "alert('Thanking you! You have been registered successfully.');location.replace('Default.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                //SendMail(UMail, UName);

                txtemail.Text = "";
                ctxtmail.Text = "";
                txtpwd.Text = "";
                fname.Text = "";
                mname.Text = "";
                lname.Text = "";
                //FNssn.Text = "";
                //SNssn.Text = "";
                mmname.Text = "";
                txtsb.Text  = "";
                k1name.Text = "";
                k2name.Text = "";
                k3name.Text = "";
                txtk1bd.Text  = "";
                txtk2bd.Text = "";
                txtk3bd.Text = "";
                //k1ssn.Text = "";
                //k2ssn.Text = "";
                //k3ssn.Text = "";
                country.SelectedIndex = 0;
                street.Text = "";
                state.SelectedIndex = 0;
                city.Text = "";
                zip.Text = "";
                wp1.Text = "";
                wp2.Text = "";
                wp3.Text = "";
                hp1.Text = "";
                hp2.Text = "";
                hp3.Text = "";
                mb1.Text = "";
                mb2.Text = "";
                mb3.Text = "";
                txtbdate.Text  = "";
                bcountry.SelectedIndex = 0;
                bstate.SelectedIndex = 0;
                bcity.Text = "";
                ccountry.SelectedIndex = 0;
                passno.Text = "";
                pcountry.SelectedIndex = 0;
                pplace.Text = "";
                txtisdate.Text  = "";
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
                edu6.Text = "";
                edu7.Text = "";
                ed1brd.Text = "";
                ed2brd.Text = "";
                ed3brd.Text = "";
                ed4brd.Text = "";
                ed5brd.Text = "";
                ed6brd.Text = "";
                ed7brd.Text = "";
                ed1sub.Text = "";
                ed2sub.Text = "";
                ed3sub.Text = "";
                ed4sub.Text = "";
                ed5sub.Text = "";
                ed6sub.Text = "";
                ed7sub.Text = "";
                ed1yr.Text = "";
                ed2yr.Text = "";
                ed3yr.Text = "";
                ed4yr.Text = "";
                ed5yr.Text = "";
                ed6yr.Text = "";
                ed7yr.Text = "";
                ed1per.Text = "";
                ed2per.Text = "";
                ed3per.Text = "";
                ed4per.Text = "";
                ed5per.Text = "";
                ed6per.Text = "";
                ed7per.Text = "";
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
    private void SendMailMessage(string usid, string un, string eml, string pw)
    {
        string msg = "";
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("akarnam@aceindus.in", eml);
            mm.To.Add(eml);
            msg += "Dear" + un + ",<br><br>" +
                    "UserName:" + un + ",<br>" +
                    "Password:" + pw + ",<br>" +
                    "<br>Thank you for Registering with aceindus.co.in<br>";                    
            mm.Subject = "You are Registered with Aceindus";
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
        string x = bcountry.SelectedItem.Value.ToString();
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
    /// <summary>
    /// summarise to bound the states when we select any country
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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