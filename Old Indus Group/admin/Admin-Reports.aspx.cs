using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;
//using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Reports : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    exception err = new exception();
    static string excep_page = "Admin-Reports.aspx";

    /// <summary>
    /// change id card with country wise dynamically
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
          // Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            Configuration config = WebConfigurationManager.OpenMachineConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
          
            if (ddc.SelectedItem.Text == "India")
            {          
                us.Visible = false;
                ind.Visible = true;         
                chk7.Text = "Aadhar Number";
                chk8.Text = "Pan Number";
            }
            else
            {
               
                 us.Visible = true;
                 ind.Visible = false;
                chk7.Text = "H1B Visa";
                chk8.Text = "Driving Licence NUmber";
            }
        }
    }

    /// <summary>
    /// Retriving Personal Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkpersonal_Click(object sender, EventArgs e)
    {
        //   try
        //   {
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select firstname,lastname,fathername,mothername,spousename,gender,spousegender,spousedob,kid1,kid2,kid3,child1gender,child2gender,child3gender,child1dob,child2dob,child3dob,country1,state1,street,city1,zip,doorno,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,birthstate,birthcountry,passportno,passportissuedat,dateofissue,doexp,nationality,joindate,releavedate from employeereg1 order by userid desc", con);
        }
        else
        {
            cmd = new SqlDataAdapter("select firstname,lastname,fathername,mothername,spousename,gender,spousegender,spousedob,kid1,kid2,kid3,child1gender,child2gender,child3gender,child1dob,child2dob,child3dob,child1ssn,child2ssn,child3ssn,country1,state1,street,city1,zip,doorno,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,birthstate,birthcountry,passportno,passportissuedat,dateofissue,doexp,nationality,joindate,releavedate from employeereg1 order by userid desc", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Personal Details.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;
        DataTable dt = ds.Tables[0];
        foreach (DataColumn dtcol in dt.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in dt.Rows)
        {
            str = "";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    /// Retriving Bank Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Bankdetails_Click(object sender, EventArgs e)
    {
        //try
        //{
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,bankacname,bankacnumber,bankname,bankaddress,bankifsc,bankswift,bankacaddress,aadharnumber from employeereg1 order by userid desc", con);
        }
        else
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,bankacname,bankacnumber,bankname,bankaddress,bankifsc,bankswift,bankacaddress,aadharnumber from employeereg1 order by userid desc", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Bank Details.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;
        DataTable dt = ds.Tables[0];
        foreach (DataColumn dtcol in dt.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in dt.Rows)
        {
            str = "";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    /// Retriving Emergency Contact Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkemergency_Click(object sender, EventArgs e)
    {
        //try
        //{
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2 from employeereg1 order by userid desc", con);
        }
        else
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2 from employeereg1 order by userid desc", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Emergency Details.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;
        DataTable dt = ds.Tables[0];
        foreach (DataColumn dtcol in dt.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in dt.Rows)
        {
            str = "";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    /// Retriving Professional Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkprofessional_Click(object sender, EventArgs e)
    {
        //try
        //{
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,designation,totexptrs,totexpmonths,functionalarea,currentindustrytype,skills1,sk1years,sk1months,sk1exp,skills2,sk2years,sk2months,sk2exp,skills3,sk3years,sk3months,sk3exp,skills4,sk4years,sk4months,sk4exp,skills5,sk5years,sk5months,sk5exp,skills6,sk6years,sk6months,sk6exp from employeereg1 order by userid desc", con);
        }
        else
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,totexptrs,totexpmonths,functionalarea,currentindustrytype,skills1,sk1years,sk1months,sk1exp,skills2,sk2years,sk2months,sk2exp,skills3,sk3years,sk3months,sk3exp,skills4,sk4years,sk4months,sk4exp,skills5,sk5years,sk5months,sk5exp,skills6,sk6years,sk6months,sk6exp from employeereg1 order by userid desc", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Professional.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;
        DataTable dt = ds.Tables[0];
        foreach (DataColumn dtcol in dt.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in dt.Rows)
        {
            str = "";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    /// Retriving Education Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void education_Click(object sender, EventArgs e)
    {
        //try
        //{
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,edu1,ed1brd,ed1sub,ed1year,ed1per,edu2,ed2brd,ed2sub,ed2year,ed2per,edu3,ed3brd,ed3sub,ed3year,ed3per,edu4,ed4brd,ed4sub,ed4year,ed4per,edu5,ed5brd,ed5sub,ed5year,ed5per,edu6,ed6brd,ed6sub,ed6year,ed6per,edu7,ed7brd,ed7sub,ed7year,ed7per from employeereg1 order by userid desc", con);
        }
        else
        {
            cmd = new SqlDataAdapter("select firstname,lastname,homephone,mobile,edu1,ed1brd,ed1sub,ed1year,ed1per,edu2,ed2brd,ed2sub,ed2year,ed2per,edu3,ed3brd,ed3sub,ed3year,ed3per,edu4,ed4brd,ed4sub,ed4year,ed4per,edu5,ed5brd,ed5sub,ed5year,ed5per,edu6,ed6brd,ed6sub,ed6year,ed6per,edu7,ed7brd,ed7sub,ed7year,ed7per from employeereg1 order by userid desc", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Education Details.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;
        DataTable dt = ds.Tables[0];
        foreach (DataColumn dtcol in dt.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in dt.Rows)
        {
            str = "";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    /// Retriving columns by data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        // try
        //  {
        if ((chk1.Checked == true) || (chk2.Checked == true) || (chk3.Checked == true) || (chk4.Checked == true) || (chk5.Checked == true) || (chk6.Checked == true) || (chk7.Checked == true) || (chk8.Checked == true) || (chk9.Checked == true) || (chk10.Checked == true) || (chk11.Checked == true) || (chk12.Checked == true) || (chifsc.Checked == true))
        {
            string firstname = "";
            string lastname = "";
            string emailid = "";
            string mobile = "";

            string bankacnumber = "";
            string bankname = "";
            string aadharnumber = "";
            string pannumber = "";

            string skills1 = "";
            string skills2 = "";
            string edu1 = "";
            string edu2 = "";

            string ifsc = "";
            string qry = "";
            List<string> primes = new List<string>();


            if (chk1.Checked == true)
            {
                firstname = "firstname,";
                primes.Add(firstname);
            }
            else
            {
                firstname = "";
            }

            if (chk2.Checked == true)
            {
                lastname = "lastname,";
                primes.Add(lastname);

            }
            else
            {
                lastname = "";
            }

            if (chk3.Checked == true)
            {
                emailid = "emailid,";
                primes.Add(emailid);

            }
            else
            {
                emailid = "";
            }

            if (chk4.Checked == true)
            {
                mobile = "mobile,";
                primes.Add(mobile);

            }
            else
            {
                mobile = "";
            }

            if (chk5.Checked == true)
            {
                bankacnumber = "bankacnumber,";
                primes.Add(bankacnumber);

            }
            else
            {
                bankacnumber = "";
            }

            if (chk6.Checked == true)
            {
                bankname = "bankname,";
                primes.Add(bankname);
            }
            else
            {
                bankname = "";
            }

            if (chk7.Checked == true)
            {
                if (ddc.SelectedItem.Text == "India")
                {
                    aadharnumber = "aadharnumber,";
                    primes.Add(aadharnumber);
                }
                else
                {
                    aadharnumber = "aadharnumber,";
                    primes.Add(aadharnumber);
                }
            }
            else
            {
                aadharnumber = "";
            }

            if (chk8.Checked == true)
            {
                pannumber = "pannumber,";
                primes.Add(pannumber);
            }
            else
            {
                pannumber = "";
            }

            if (chk9.Checked == true)
            {
                skills1 = "skills1,";
                primes.Add(skills1);
            }
            else
            {
                skills1 = "";
            }

            if (chk10.Checked == true)
            {
                skills2 = "skills2,";
                primes.Add(skills2);
            }
            else
            {
                skills2 = "";
            }

            if (chk11.Checked == true)
            {
                edu1 = "edu1,";
                primes.Add(edu1);
            }
            else
            {
                edu1 = "";
            }

            if (chk12.Checked == true)
            {
                edu2 = "edu2,";
                primes.Add(edu2);
            }
            else
            {
                edu2 = "";
            }

            if (chifsc.Checked == true)
            {
                ifsc = "bankifsc,";
                primes.Add(ifsc);
            }
            else
            {
                ifsc = "";
            }
            foreach (string item in primes)
            {
                qry += item;
            }

            qry = qry.Remove(qry.Length - 1);
            SqlDataAdapter cmd;
            //SqlDataAdapter cmd = new SqlDataAdapter("select " + firstname + "" + lastname + "" + emailid + "" + mobile + "" + bankacnumber + "" + bankname
            //    + "" + aadharnumber + "" + pannumber + "" + skills1 + "" + skills2 + "" + edu1 + "" + edu2 + " from employeereg1 order by userid desc", con);
            if (ddc.SelectedItem.Text == "India")
            {
                cmd = new SqlDataAdapter("select " + qry + " from employeereg1  where status=1 order by userid desc", con);
            }
            else
            {
                cmd = new SqlDataAdapter("select " + qry + " from employeereg1  where status=1 order by userid desc", con1);
            }
            DataSet ds = new DataSet();
            cmd.Fill(ds);
            chk1.Checked = false;
            chk2.Checked = false;
            chk3.Checked = false;
            chk4.Checked = false;
            chk5.Checked = false;
            chk6.Checked = false;
            chk7.Checked = false;
            chk8.Checked = false;
            chk9.Checked = false;
            chk10.Checked = false;
            chk11.Checked = false;
            chk12.Checked = false;
            chifsc.Checked = false;

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Details.xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;
            DataTable dt = ds.Tables[0];
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
        else
        {
            string alert = "alert('Please Select at least one Check Box')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", alert, true);
        }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    /// <summary>
    ///  retriving firstname by data in india
    /// </summary>
    /// <param name="prefixText"></param>
    /// <returns></returns>
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCompletionList(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.AppSettings["aceConnectionString"].ToString();
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("select firstname from employeereg1 where firstname like @City+'%'", con);
        cmd.Parameters.AddWithValue("@City", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> CityNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CityNames.Add(dt.Rows[i][3].ToString());
        }

        return CityNames;
    }

    /// <summary>
    ///  retriving firstname by data in usa
    /// </summary>
    /// <param name="prefixText"></param>
    /// <returns></returns>
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCompletionList1(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection con1 = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("select firstname from employeereg1 where firstname like @City+'%'", con1);
        cmd.Parameters.AddWithValue("@City", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> CityNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CityNames.Add(dt.Rows[i][3].ToString());
        }

        return CityNames;
    }
    /// <summary>
    ///  retriving firstname by data
    /// </summary>
    /// <param name="prefixText"></param>
    /// <returns></returns>
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        // try
        //  {
        if ((txtserch.Text != "") || (txtserchus.Text != ""))
        {
            string x = "";
            SqlDataAdapter cmd;
            if (ddc.SelectedItem.Text == "India")
            {
                x = txtserch.Text;
                cmd = new SqlDataAdapter("select * from employeereg1  where status=1 and firstname like '" + x + "%'", con);
            }
            else
            {
                x = txtserchus.Text;
                cmd = new SqlDataAdapter("select * from employeereg1  where status=1 and firstname like '" + x + "%'", con1);
            }
            DataSet ds = new DataSet();
            cmd.Fill(ds);

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "" + x + ".xls"));
            Response.ContentType = "application/ms-excel";
            string str = string.Empty;
            DataTable dt = ds.Tables[0];
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
        else
        {
            string alert = "alert('Please Enter First Name')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", alert, true);
        }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }


    //protected void Docfile_Click(object sender, EventArgs e)
    //{
    //    SqlDataAdapter cmd;
    //    if (ddc.SelectedItem.Text == "India")
    //    {
    //        cmd = new SqlDataAdapter("select * from employeereg1 where status=1 order by userid desc", con);
    //    }
    //    else
    //    {
    //        cmd = new SqlDataAdapter("select * from employeereg1 where status=1 order by userid desc", con1);
    //    }
    //    DataSet ds = new DataSet();
    //    cmd.Fill(ds);

    //    StringWriter strwritter = new StringWriter();
    //    HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
    //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //    {
    //        string name = ds.Tables[0].Rows[i]["firstname"].ToString() + " " + ds.Tables[0].Rows[i]["lastname"].ToString();
    //        Response.Clear();
    //        Response.Buffer = true;
    //        Response.ClearContent();
    //        Response.ClearHeaders();
    //        Response.Charset = "";
    //        string FileName = "" + name + ".doc";

    //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //        Response.ContentType = "application/msword";
    //        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
    //        Response.Write("Full Name (First & Last Name) :  " + name.ToString());
    //        Response.Write("\r\n Father Name & Contact Number  : " + ds.Tables[0].Rows[i]["fathername"].ToString() + "&" + ds.Tables[0].Rows[i]["mobile"].ToString());
    //        Response.Write("\r\n Mother  Name & Contact Number : " + ds.Tables[0].Rows[i]["mothername"].ToString() + "&" + ds.Tables[0].Rows[i]["mobile"].ToString());
    //        Response.Write("\r\n All Other Names Used (Include maiden name and names from marriage)  :");
    //        Response.Write("\r\n Present Address:(Street, City, State, Zip, Country) :" + ds.Tables[0].Rows[i]["street"].ToString() + ", " + ds.Tables[0].Rows[i]["city1"].ToString() + ", " + ds.Tables[0].Rows[i]["state1"].ToString() + ", " + ds.Tables[0].Rows[i]["zip"].ToString() + ", " + ds.Tables[0].Rows[i]["country1"].ToString());
    //        Response.Write("\r\n Permanent Address:(Street, City, State, Zip, Country) :" + ds.Tables[0].Rows[i]["street"].ToString() + ", " + ds.Tables[0].Rows[i]["city1"].ToString() + ", " + ds.Tables[0].Rows[i]["state1"].ToString() + ", " + ds.Tables[0].Rows[i]["zip"].ToString() + ", " + ds.Tables[0].Rows[i]["country1"].ToString());
    //        Response.Write("\r\n Birth Date (DD/MM/YYYY):" + ds.Tables[0].Rows[i]["birthdate"].ToString());
    //        Response.Write("\r\n Marital Status / Gender : " + ds.Tables[0].Rows[i]["mstatus"].ToString() + " / " + ds.Tables[0].Rows[i]["gender"].ToString());
    //        Response.Write("\r\n Birth Place:(City/Town, State, Country) : " + ds.Tables[0].Rows[i]["birthcity"].ToString() + ", " + ds.Tables[0].Rows[i]["birthstate"].ToString() + ", " + ds.Tables[0].Rows[i]["birthcountry"].ToString());
    //        Response.Write("\r\n PAN Number: " + ds.Tables[0].Rows[i]["pannumber"].ToString());
    //        Response.Write("\r\n AADHAAR Number:" + ds.Tables[0].Rows[i]["aadharnumber"].ToString());
    //        Response.Write("\r\n Driver’s License Number: : " + ds.Tables[0].Rows[i]["dlicencenumber"].ToString());
    //        Response.Write("\r\n Passport Number: " + ds.Tables[0].Rows[i]["passportno"].ToString());
    //        Response.Write("\r\n Contact Numbers at Work Location: " + ds.Tables[0].Rows[i]["workphone"].ToString());
    //        Response.Write("\r\n Contact Numbers in Native Place: " + ds.Tables[0].Rows[i]["homephone"].ToString());
    //        Response.Write("\r\n Personnel Email ID for Communication: " + ds.Tables[0].Rows[i]["emailid"].ToString());
    //        Response.Write("\r\n Spouse or Family Member Email ID for Communication: " + ds.Tables[0].Rows[i]["cp1email"].ToString());
    //        Response.Write("\r\n Bank Account Name, Number & IFSC Code: " + ds.Tables[0].Rows[i]["bankacname"].ToString() + ", " + ds.Tables[0].Rows[i]["bankacnumber"].ToString() + " & " + ds.Tables[0].Rows[i]["bankifsc"].ToString());
    //        Response.Write("\r\n Bank Name & Address:" + ds.Tables[0].Rows[i]["bankname"].ToString() + ", " + ds.Tables[0].Rows[i]["bankacaddress"].ToString());
    //        Response.Write("\r\n Emergency Contact Name, Relation & Numbers at Work Location: : " + ds.Tables[0].Rows[i]["cp1phone"].ToString() + "," + ds.Tables[0].Rows[i]["contactpersonname1"].ToString());
    //        Response.Write("\r\n Emergency Contact Name, Numbers & Relation in Family Member" + ds.Tables[0].Rows[i]["cp2phone2"].ToString() + "," + ds.Tables[0].Rows[i]["contactpersonname2"].ToString());
    //        Response.Write("\r\n Job Referral Name & Contact Number:");
    //        Response.Write("\r\n Qualification :" + ds.Tables[0].Rows[i]["edu2"].ToString());
    //        Response.Write("\r\n Joining Date : " + ds.Tables[0].Rows[i]["joindate"].ToString());
    //        Response.Write("\r\n Trainee / Full Time / Part Time :");
    //        Response.Write("\r\n Title & Salary offered : ");
    //        Response.Write(strwritter.ToString());
    //        Response.End();
    //    }
    //}

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddc_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddc.SelectedItem.Text == "India")
        {
            chk7.Text = "Aadhar Number";
            chk8.Text = "Pan Number";
        }
        else
        {
            chk7.Text = "H1B Visa";
            chk8.Text = "Driving Licence NUmber";
        }
    }

    /// <summary>
    /// ADD NEW TAB IN EMPLOYEE MONTH &YEAR WISE DATA 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Employee_Click(object sender, EventArgs e)
    {

        string year = ddlPayrollYr.SelectedItem.Text;
        string mon = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
        string value = mon + "-" + year;
        //{
        SqlDataAdapter cmd;
        if (ddc.SelectedItem.Text == "India")
        {
            cmd = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
        }
        else
        {
            cmd = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
        }
        DataSet ds = new DataSet();
        cmd.Fill(ds);
        bindmaingrid();
       // clearbox();
        //Response.ClearContent();
        //Response.Buffer = true;
        //Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Month WiseEmployeeHours.xls"));
        //Response.ContentType = "application/ms-excel";
        //string str = string.Empty;
        //DataTable dt = ds.Tables[0];
        //foreach (DataColumn dtcol in dt.Columns)
        //{
        //    Response.Write(str + dtcol.ColumnName);
        //    str = "\t";
        //}
        //Response.Write("\n");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    str = "";
        //    for (int j = 0; j < dt.Columns.Count; j++)
        //    {
        //        Response.Write(str + Convert.ToString(dr[j]));
        //        str = "\t";
        //    }
        //    Response.Write("\n");
        //}
        //Response.End();     
    }



    protected void ddlPayMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayMonth.SelectedItem.Text != "Select" || ddlPayMonth.SelectedItem.Text != "" || ddlPayrollYr.SelectedItem.Text != "Select" || ddlPayrollYr.SelectedItem.Text != "")
        {
            Session.Remove("Editid");
            bindmaingrid();
            // pn1.Visible = false;
            string mon = ddlPayMonth.SelectedItem.Text;
            string year = ddlPayrollYr.SelectedItem.Text;
            MonthwiseemployeeHours.Text = "MonthWise EmployeeHours " + mon + "-" + year;
        }
        else
        {
            grid.Visible = false;
        }
    }




    protected void bindmaingrid()
    {
        Div1.Visible = true;
        grid.Visible = true;


        string year = ddlPayrollYr.SelectedItem.Text;
        string mon = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
        string value = mon + "-" + year;
       // string str1 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
      //  string yer = ddlPayrollYr.SelectedItem.Text;

       // string value = str1 + "-" + yer;
        SqlDataAdapter ad = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvEmployeePay.Visible = true;
            gvEmployeePay.DataSource = dt;
            gvEmployeePay.DataBind();
            Label8.Visible = false;
        }
        else
        {
            int month_number = Convert.ToInt32(ddlPayMonth.SelectedValue);
            int month = month_number - 1;

            string nameofmonth = ddlPayMonth.Items.FindByValue(Convert.ToString(month)).Text;

            string str11 = nameofmonth.Substring(0, 3);
            string yer1 = ddlPayrollYr.SelectedItem.Text;
            string value1 = str11 + "-" + yer1;

            SqlDataAdapter ad1 = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                int month_number1 = Convert.ToInt32(ddlPayMonth.SelectedValue);
                int month1 = month_number1 - 2;

                string nameofmonth1 = ddlPayMonth.Items.FindByValue(Convert.ToString(month1)).Text;

                string str111 = nameofmonth1.Substring(0, 3);
                string yer11 = ddlPayrollYr.SelectedItem.Text;
                string value2 = str111 + "-" + yer11;            


                string str1e = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
                string yere = ddlPayrollYr.SelectedItem.Text;

                string valuee = str1e + "-" + yere;

                DataTable dt3 = new DataTable();
                dt3 = dt1;

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string strHr = dt1.Rows[i][6].ToString();
                    string strHr1 = dt1.Rows[i][42].ToString();

                    switch (str11)
                    {
                        case "Jan":
                            str11 = valuee;
                            break;
                        case "Feb":
                            str11 = valuee;
                            break;
                        case "Mar":
                            str11 = valuee;
                            break;
                        case "Apr":
                            str11 = valuee;
                            break;
                        case "May":
                            str11 = valuee;
                            break;
                        case "Jun":
                            str11 = valuee;
                            break;
                        case "Jul":
                            str11 = valuee;
                            break;
                        case "Aug":
                            str11 = valuee;
                            break;
                        case "Sep":
                            str11 = valuee;
                            break;
                        case "Oct":
                            str11 = valuee;
                            break;
                        case "Nov":
                            str11 = valuee;
                            break;
                        case "Dec":
                            str11 = valuee;
                            break;
                        default:
                            str11 = "Null";
                            break;
                    }                 
                }
                SqlDataAdapter ad22 = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
                DataTable dt22 = new DataTable();
                ad22.Fill(dt22);
                if (dt22.Rows.Count > 0)
                {
                    gvEmployeePay.Visible = true;
                    gvEmployeePay.DataSource = dt22;
                    gvEmployeePay.DataBind();
                    Label8.Visible = false;
                }

            }
            else
            {
                gvEmployeePay.Visible = false;
                grid.Visible = false;
                Label8.Visible = false;
            }
        }
    }

    protected void gvEmployeePay_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEmployeePay.PageIndex = e.NewPageIndex;
        bindmaingrid();
    }

    //protected void btn_Click(object sender, EventArgs e)
    //{

    //    try
    //    {

    //        string year = ddlPayrollYr.SelectedItem.Text;
    //        string month = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
    //        string mon = month + "-" + year;
    //        SqlDataAdapter ad = new SqlDataAdapter("select  * from monthpay order by mpid desc", con1);
    //        DataSet ds = new DataSet();
    //        ad.Fill(ds);
    //        string id = ds.Tables[0].Rows[0]["empid"].ToString();
    //        string date = DateTime.Now.ToString();
    //       // bindmaingrid();
    //        //foreach (GridViewRow g1 in gvEmployeePay.Rows)
    //        //{
    //        //    //string empid = Convert.ToString(ViewState["em"]);
    //        //    //string type = ddlHrType.SelectedValue;
    //        //    //string range = g1.Cells[0].Text;
    //        //    //string ac = g1.Cells[2].Text;
    //        //    //string ot = g1.Cells[5].Text;
    //        //    //string[] temp = range.Split('-');
    //        //    //string week1 = temp[0];
    //        //    //string week2 = temp[1];
    //        //    //string str1 = ddlMonth.SelectedItem.Text.Substring(0, 3);
    //        //    //string yer = ddlYear.SelectedItem.Text;
    //        //    //SqlCommand cmd = new SqlCommand("insert into emp_weekdetails(empid ,hours,hour_type,week_rangefrom,week_rangeto,month_year,actual_rate,ot_rate,mpid,createddate ) values ('" + empid + "', '" + g1.Cells[1].Text + "','" + g1.Cells[4].Text + "','" + week1 + "','" + week2 + "','" + str1 + "-" + yer + "','" + ac + "','" + ot + "'," + id + ",'" + date + "')", con);
    //        //    //cmd.ExecuteNonQuery();
    //        //}
    //        //con.Close();
    //        //string str = "alert('EmployeeMonthWise Details Added.');";
    //        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    //        Session["Editid"] = null;
    //        clearbox();

    //        //  pn1.Visible = false;
    //        //  ddlempid.SelectedValue = "0";
    //        bindmaingrid();
    //    }
    //    catch (Exception ex)
    //    {
    //        //  es.insert_exception(ex, page);
    //    }

    //}
    protected void lnkdownload_Click(object sender, EventArgs e)
    {       
        bindmaingrid();
      
        //clearbox();
        string str1 = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
        //string yer = ddlYear.SelectedItem.Text;
        string yer = ddlPayrollYr.SelectedItem.Text;
        string value = str1 + "-" + yer;
        SqlDataAdapter ad = new SqlDataAdapter("select DISTINCT ss.Cname,ss.efname,ss.elname,sa.empid,sa.actual_rate,ot_rate,CAST(sa.week_rangefrom AS DATE)week_rangefrom,CAST(sa.week_rangeto AS DATE)week_rangeto,sa.hours as actualhours,sa.hour_type as othours from IG_Invoice  ss,  emp_weekdetails sa where ss.emp_id=sa.empid And ss.status=1 and substring(month_year,11,10)='" + value + "'", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataTable d2 = new DataTable();
            DataColumn dc = new DataColumn();
            dc.ColumnName = "Client  Name";
            dc.Caption = "CName";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee name";
            dc.Caption = "efname";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee lastname";
            dc.Caption = "elname";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "Employee ID";
            dc.Caption = "empid";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "actual_rate";
            dc.Caption = "actual_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "ot_rate";
            dc.Caption = "ot_rate";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);
          
            dc = new DataColumn();
            dc.ColumnName = "week_rangefrom";
            dc.Caption = "week_rangefrom,{0:MM/dd/yyyy}";
            dc.DataType = Type.GetType("System.String");
           // dc.DataType = Convert.ToString(date.ToString("dd/MM/yyyy");
            d2.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "week_rangeto";
            dc.Caption = "week_rangeto,{0:MM/dd/yyyy}";
            dc.DataType = Type.GetType("System.String");
            d2.Columns.Add(dc);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = d2.NewRow();
                DataRow dr = dt.Rows[i];
                string id = dr[8].ToString();

                row["Client  Name"] = dt.Rows[i]["CName"].ToString();
                row["Employee name"] = dt.Rows[i]["efname"].ToString();
                row["Employee lastname"] = dt.Rows[i]["elname"].ToString();
                row["Employee ID"] = dt.Rows[i]["empid"].ToString();
                row["actual_rate"] = dt.Rows[i]["actual_rate"].ToString();
                row["ot_rate"] = dt.Rows[i]["ot_rate"].ToString();
                row["week_rangefrom"] = dt.Rows[i]["week_rangefrom"].ToString();
                row["week_rangeto"] = dt.Rows[i]["week_rangeto"].ToString();
                d2.Rows.Add(row);
                d2.Rows.Add("Date :", dt.Rows[i]["week_rangefrom"].ToString(), dt.Rows[i]["week_rangeto"].ToString(), dt.Rows[i]["actual_rate"].ToString(), dt.Rows[i]["ot_rate"].ToString(), dt.Rows[i]["CName"].ToString(), dt.Rows[i]["efname"].ToString(), dt.Rows[i]["elname"].ToString());
                d2.ImportRow(dr);

            }
        }

        DataTable d3 = new DataTable();
        d3 = dt;

        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "MonthWiseEmployeeData.xls"));
        Response.ContentType = "application/ms-excel";
        string str = string.Empty;

        foreach (DataColumn dtcol in d3.Columns)
        {
            Response.Write(str + dtcol.ColumnName);
            str = "\t";
        }
        Response.Write("\n");
        foreach (DataRow dr in d3.Rows)
        {
            str = "";
            for (int j = 0; j < d3.Columns.Count; j++)
            {
                Response.Write(str + Convert.ToString(dr[j]));
                str = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
    }
    protected void clearbox()
    {

        ddlPayrollYr.SelectedValue = string.Empty;
       // ddlPayrollYr.SelectedItem.Text = "";
        ddlPayMonth.SelectedValue=string.Empty;

    }
    protected void btnsearch_Click1(object sender, EventArgs e)
    {
            string year = ddlPayrollYr.SelectedItem.Text;
            string mon = ddlPayMonth.SelectedItem.Text.Substring(0, 3);
            string value = mon + "-" + year;
            SqlDataAdapter ad = new SqlDataAdapter(" select  * from emp_weekdetails where substring(month_year,11,10)='" + value + "'", con1);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string id = ds.Tables[0].Rows[0]["empid"].ToString();
            string date = DateTime.Now.ToString();
            Session["Editid"] = null;
            bindmaingrid();
            //clearbox();

    }

    }
