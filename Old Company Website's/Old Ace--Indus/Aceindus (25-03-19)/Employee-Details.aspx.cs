using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.IO;

public partial class UserDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    string cotry = string.Empty;
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
    string Desig;
    DataSet ds2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }

            else
            {
                if (Session["userid"] != null)
                {
                    ds2 = GetCounty();

                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                        {
                            country.Items.Add("");
                            country.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                            country.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();

                            pcountry.Items.Add("");
                            pcountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                            pcountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();

                            ncountry.Items.Add("");
                            ncountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                            ncountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();

                            ccountry.Items.Add("");
                            ccountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                            ccountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();

                            //  bcountry.Items.Add("");
                            //    bcountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                            //   bcountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();

                            bcountry.DataTextField = "Country_name";
                            bcountry.DataValueField = "cid";
                            bcountry.DataSource = ds2;
                            bcountry.DataBind();
                            bcountry.Items.Insert(0, "Select Country");
                        }
                    }

                    emailid = Session["userid"].ToString();
                    // Desig = Convert.ToString(Session["Designation"]);
                    //SqlDataReader dr;
                    //string qry = "select * from employeereg1 where EmailId='" + emailid + "'";
                    ////open database connection to connect to sql server
                    //con.Open();
                    //SqlCommand cmd = new SqlCommand(qry, con);
                    //dr = cmd.ExecuteReader();
                    ////close database connection to disconnect to sql server

                    //while (dr.Read())
                    //{
                    //    LoginId = Convert.ToString(dr["UserId"]);
                    //    Session["LogInId"] = LoginId;
                    //}
                    //con.Close();

                    string streg = string.Empty;

                    SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeedoc where emailid='" + emailid + "' order by did asc", con);
                    DataSet dssss = new DataSet();
                    sdaaaaa.Fill(dssss);
                    if (dssss.Tables[0].Rows.Count > 0)
                    {
                        dlc.DataSource = dssss;
                        dlc.DataBind();
                    }
                    //Navigate and bind employee details
                    ds = GetEmpDet2(emailid);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
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
                        //fssn.Text = ds.Tables[0].Rows[0]["ssn"].ToString();
                        mmname.Text = ds.Tables[0].Rows[0]["spousename"].ToString();
                        sbd.Text = ds.Tables[0].Rows[0]["spousedob"].ToString();
                        //Spssn.Text = ds.Tables[0].Rows[0]["spousessn"].ToString();
                        //  spgen.Text = ds.Tables[0].Rows[0]["spousegender"].ToString();

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

                        //k1ssn.Text = ds.Tables[0].Rows[0]["child1ssn"].ToString();
                        //k2ssn.Text = ds.Tables[0].Rows[0]["child2ssn"].ToString();
                        //k3ssn.Text = ds.Tables[0].Rows[0]["child3ssn"].ToString();

                        // k1gen.Text = ds.Tables[0].Rows[0]["child1gender"].ToString();

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
                        //  k2gen.Text = ds.Tables[0].Rows[0]["child2gender"].ToString();
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

                        //  k3gen.Text = ds.Tables[0].Rows[0]["child3gender"].ToString();

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

                        //country.ClearSelection();
                        //country.Items.FindByText(ds.Tables[0].Rows[0]["country1"].ToString()).Selected = true;
                        //state.ClearSelection();
                        //state.Items.FindByText(ds.Tables[0].Rows[0]["state1"].ToString()).Selected = true;
                        //city.ClearSelection();
                        //city.Items.FindByText(ds.Tables[0].Rows[0]["city1"].ToString()).Selected = true;

                        if (ds.Tables[0].Rows[0]["country1"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["country1"].ToString() == "Select Country")
                            {
                                ds2 = GetCounty();

                                country.DataTextField = "Country_name";
                                country.DataValueField = "cid";
                                country.DataSource = ds2;
                                country.DataBind();
                                //for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                //{
                                //    country.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                                //    country.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();
                                //}
                            }
                            else
                            {
                                country.ClearSelection();
                                country.Items.FindByText(ds.Tables[0].Rows[0]["country1"].ToString()).Selected = true;
                            }
                        }

                        if (ds.Tables[0].Rows[0]["state1"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["state1"].ToString() == "Select State")
                            {
                                state.Items.Add("Select State");
                            }
                            else
                            {
                                if (country.SelectedItem.Text.ToString() != "Select Country")
                                {
                                    string y11 = country.SelectedItem.Value.ToString();
                                    ds2 = GetState(y11);

                                    if (ds2 != null)
                                    {
                                        state.DataTextField = "state_name";
                                        state.DataValueField = "sid";
                                        state.DataSource = ds2;
                                        state.DataBind();
                                        //if (ds2.Tables[0].Rows.Count > 0)
                                        //{
                                        //    for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                        //    {
                                        //        state.Items[i].Text = ds2.Tables[0].Rows[i - 1]["state_name"].ToString();
                                        //        state.Items[i].Value = ds2.Tables[0].Rows[i - 1]["sid"].ToString();
                                        //    }
                                        //}
                                    }
                                    state.ClearSelection();
                                    state.Items.FindByText(ds.Tables[0].Rows[0]["state1"].ToString()).Selected = true;
                                }
                            }
                        }

                        if (ds.Tables[0].Rows[0]["city1"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["city1"].ToString() == "Select City")
                            {
                                city.Items.Add("Select City");
                            }
                            else
                            {
                                if (state.SelectedItem.Text.ToString() != "Select State")
                                {
                                    string x22 = state.SelectedItem.Value.ToString();
                                    ds2 = GetCity(x22);

                                    if (ds2.Tables[0].Rows.Count > 0)
                                    {
                                        city.DataTextField = "city_name";
                                        city.DataValueField = "cityid";
                                        city.DataSource = ds2;
                                        city.DataBind();
                                        //for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                        //{
                                        //    city.Items[i].Text = ds2.Tables[0].Rows[i - 1]["city_name"].ToString();
                                        //    city.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cityid"].ToString();
                                        //}
                                    }
                                }
                                city.ClearSelection();
                                city.Items.FindByText(ds.Tables[0].Rows[0]["city1"].ToString()).Selected = true;
                            }
                        }

                        street.Text = ds.Tables[0].Rows[0]["street"].ToString();
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

                        if (ds.Tables[0].Rows[0]["birthcountry"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["birthcountry"].ToString() == "Select Country")
                            {
                                ds2 = GetCounty();

                                bcountry.DataTextField = "Country_name";
                                bcountry.DataValueField = "cid";
                                bcountry.DataSource = ds2;
                                bcountry.DataBind();
                                //for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                //{
                                //    bcountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                                //    bcountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();
                                //}
                            }
                            else
                            {
                                bcountry.ClearSelection();
                                bcountry.Items.FindByText(ds.Tables[0].Rows[0]["birthcountry"].ToString()).Selected = true;
                            }
                        }

                        if (ds.Tables[0].Rows[0]["birthstate"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["birthstate"].ToString() == "Select State")
                            {
                                bstate.Items.Add("Select State");
                            }
                            else
                            {
                                if (bcountry.SelectedItem.Text.ToString() != "Select Country")
                                {
                                    string y11 = bcountry.SelectedItem.Value.ToString();
                                    ds2 = GetState(y11);

                                    if (ds2 != null)
                                    {
                                        if (ds2.Tables[0].Rows.Count > 0)
                                        {
                                            bstate.DataTextField = "state_name";
                                            bstate.DataValueField = "sid";
                                            bstate.DataSource = ds2;
                                            bstate.DataBind();
                                            //for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                            //{
                                            //    bstate.Items[i].Text = ds2.Tables[0].Rows[i - 1]["state_name"].ToString();
                                            //    bstate.Items[i].Value = ds2.Tables[0].Rows[i - 1]["sid"].ToString();
                                            //}
                                        }
                                    }
                                    bstate.ClearSelection();
                                    bstate.Items.FindByText(ds.Tables[0].Rows[0]["birthstate"].ToString()).Selected = true;
                                }
                            }
                        }

                        if (ds.Tables[0].Rows[0]["birthcity"].ToString() != "")
                        {
                            if (ds.Tables[0].Rows[0]["birthcity"].ToString() == "Select City")
                            {
                                bcity.Items.Add("Select City");
                            }
                            else
                            {
                                if (bstate.SelectedItem.Text.ToString() != "Select State")
                                {
                                    string x22 = bstate.SelectedItem.Value.ToString();
                                    ds2 = GetCity(x22);

                                    if (ds2.Tables[0].Rows.Count > 0)
                                    {
                                        bcity.DataTextField = "city_name";
                                        bcity.DataValueField = "cityid";
                                        bcity.DataSource = ds2;
                                        bcity.DataBind();
                                        //for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                                        //{
                                        //    bcity.Items[i].Text = ds2.Tables[0].Rows[i - 1]["city_name"].ToString();
                                        //    bcity.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cityid"].ToString();
                                        //}
                                    }
                                }
                                bcity.ClearSelection();
                                bcity.Items.FindByText(ds.Tables[0].Rows[0]["birthcity"].ToString()).Selected = true;
                            }
                        }

                        if (ds.Tables[0].Rows[0]["cntryofcitizenship"].ToString() != "")
                        {
                            ds2 = GetCounty();

                            for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                            {
                                //   ccountry.Items.Add("");
                                ccountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                                ccountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();
                            }
                            ccountry.ClearSelection();
                            ccountry.Items.FindByText(ds.Tables[0].Rows[0]["cntryofcitizenship"].ToString()).Selected = true;
                        }

                        passno.Text = ds.Tables[0].Rows[0]["passportno"].ToString();
                        //  pcountry.Text = ds.Tables[0].Rows[0]["passportissuedat"].ToString();
                        if (ds.Tables[0].Rows[0]["passportissuedat"].ToString() != "")
                        {
                            ds2 = GetCounty();

                            for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                            {
                                //   ccountry.Items.Add("");
                                pcountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                                pcountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();
                            }
                            pcountry.ClearSelection();
                            pcountry.Items.FindByText(ds.Tables[0].Rows[0]["passportissuedat"].ToString()).Selected = true;
                        }
                        issdate.Text = ds.Tables[0].Rows[0]["dateofissue"].ToString();
                        expdate.Text = ds.Tables[0].Rows[0]["doexp"].ToString();

                        if (ds.Tables[0].Rows[0]["nationality"].ToString() != "")
                        {
                            ds2 = GetCounty();

                            for (int i = 1; i <= ds2.Tables[0].Rows.Count; i++)
                            {
                                //    ncountry.Items.Add("");
                                ncountry.Items[i].Text = ds2.Tables[0].Rows[i - 1]["Country_name"].ToString();
                                ncountry.Items[i].Value = ds2.Tables[0].Rows[i - 1]["cid"].ToString();
                            }
                            ncountry.ClearSelection();
                            ncountry.Items.FindByText(ds.Tables[0].Rows[0]["nationality"].ToString()).Selected = true;
                        }
                        // cpassport.Text = ds.Tables[0].Rows[0]["countryofpassport"].ToString();
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
                        txtaadhar.Text = ds.Tables[0].Rows[0]["aadharnumber"].ToString();
                        txtpan.Text = ds.Tables[0].Rows[0]["pannumber"].ToString();
                        txtdrivenumber.Text = ds.Tables[0].Rows[0]["dlicencenumber"].ToString();
                        txtdriveplace.Text = ds.Tables[0].Rows[0]["dissueplace"].ToString();
                        txtdrivecity.Text = ds.Tables[0].Rows[0]["dissuecitty"].ToString();
                        txtadharplace.Text = ds.Tables[0].Rows[0]["aadharplace"].ToString();
                        txtadharcity.Text = ds.Tables[0].Rows[0]["aadharcity"].ToString();
                        txtpanplace.Text = ds.Tables[0].Rows[0]["panplace"].ToString();
                        txtpancity.Text = ds.Tables[0].Rows[0]["pancity"].ToString();

                        // Skills

                        skills1.Text = ds.Tables[0].Rows[0]["skills1"].ToString();
                        //if (skills1.Text == "")
                        //{
                        //    trskills1.Visible = false;
                        //}
                        //else
                        //{
                        sk1mnts.Text = ds.Tables[0].Rows[0]["sk1months"].ToString();
                        sk1yrs.Text = ds.Tables[0].Rows[0]["sk1years"].ToString();
                        //   sk1exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk1exp"].ToString();
                        if ((ds.Tables[0].Rows[0]["sk1exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk1exp"].ToString() != null))
                        {
                            sk1exp.ClearSelection();
                            sk1exp.Items.FindByText(ds.Tables[0].Rows[0]["sk1exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk1exp.SelectedIndex = -1;
                        }
                        // }

                        skills2.Text = ds.Tables[0].Rows[0]["skills2"].ToString();
                        //if (skills2.Text == "")
                        //{
                        //    trskills2.Visible = false;
                        //}
                        //else
                        //{
                        sk2mnts.Text = ds.Tables[0].Rows[0]["sk2months"].ToString();
                        sk2yrs.Text = ds.Tables[0].Rows[0]["sk2years"].ToString();
                        //sk2exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk2exp"].ToString();
                        if ((ds.Tables[0].Rows[0]["sk2exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk2exp"].ToString() != null))
                        {
                            sk2exp.ClearSelection();
                            sk2exp.Items.FindByText(ds.Tables[0].Rows[0]["sk2exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk2exp.SelectedIndex = -1;
                        }
                        //   }

                        skills3.Text = ds.Tables[0].Rows[0]["skills3"].ToString();
                        //if (skills3.Text == "")
                        //{
                        //    trskills3.Visible = false;
                        //}
                        //else
                        //{
                        sk3mnts.Text = ds.Tables[0].Rows[0]["sk3months"].ToString();
                        sk3yrs.Text = ds.Tables[0].Rows[0]["sk3years"].ToString();
                        //sk3exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk3exp"].ToString();

                        if ((ds.Tables[0].Rows[0]["sk3exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk3exp"].ToString() != null))
                        {
                            sk3exp.ClearSelection();
                            sk3exp.Items.FindByText(ds.Tables[0].Rows[0]["sk3exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk3exp.SelectedIndex = -1;
                        }
                        // }

                        skills4.Text = ds.Tables[0].Rows[0]["skills4"].ToString();
                        //if (skills4.Text == "")
                        //{
                        //    trskills4.Visible = false;
                        //}
                        //else
                        //{
                        sk4mnts.Text = ds.Tables[0].Rows[0]["sk4months"].ToString();
                        sk4yrs.Text = ds.Tables[0].Rows[0]["sk4years"].ToString();
                        //sk4exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk4exp"].ToString();
                        if ((ds.Tables[0].Rows[0]["sk4exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk4exp"].ToString() != null))
                        {
                            sk4exp.ClearSelection();
                            sk4exp.Items.FindByText(ds.Tables[0].Rows[0]["sk4exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk4exp.SelectedIndex = -1;
                        }
                        // }

                        skills5.Text = ds.Tables[0].Rows[0]["skills5"].ToString();
                        //if (skills5.Text == "")
                        //{
                        //    trskills5.Visible = false;
                        //}
                        //else
                        //{
                        sk5mnts.Text = ds.Tables[0].Rows[0]["sk5months"].ToString();
                        sk5yrs.Text = ds.Tables[0].Rows[0]["sk5years"].ToString();
                        //sk5exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk5exp"].ToString();

                        if ((ds.Tables[0].Rows[0]["sk5exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk5exp"].ToString() != null))
                        {
                            sk5exp.ClearSelection();
                            sk5exp.Items.FindByText(ds.Tables[0].Rows[0]["sk5exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk5exp.SelectedIndex = -1;
                        }

                        //  }

                        skills6.Text = ds.Tables[0].Rows[0]["skills6"].ToString();
                        //if (skills6.Text == "")
                        //{
                        //    trskills6.Visible = false;
                        //}
                        //else
                        //{
                        sk6mnts.Text = ds.Tables[0].Rows[0]["sk6months"].ToString();
                        sk6yrs.Text = ds.Tables[0].Rows[0]["sk6years"].ToString();
                        //    sk6exp.SelectedItem.Text = ds.Tables[0].Rows[0]["sk6exp"].ToString();
                        if ((ds.Tables[0].Rows[0]["sk6exp"].ToString() != "") && (ds.Tables[0].Rows[0]["sk6exp"].ToString() != null))
                        {
                            sk6exp.ClearSelection();
                            sk6exp.Items.FindByText(ds.Tables[0].Rows[0]["sk1exp"].ToString()).Selected = true;
                        }
                        else
                        {
                            sk6exp.SelectedIndex = -1;
                        }

                        //  }

                        //if (skills1.Text == "" && skills2.Text == "" && skills3.Text == "" && skills4.Text == "" && skills5.Text == "" && skills6.Text == "")
                        //{
                        //    lblskills.Visible = true;
                        //    lblskills.Text = " No Skills Entered";
                        //}
                        // Eductioan Details.

                        edu1.Text = ds.Tables[0].Rows[0]["edu1"].ToString();
                        //if (edu1.Text == "")
                        //{
                        //    tredu1.Visible = false;
                        //}
                        //else
                        //{
                        ed1brd.Text = ds.Tables[0].Rows[0]["ed1brd"].ToString();
                        ed1sub.Text = ds.Tables[0].Rows[0]["ed1sub"].ToString();
                        ed1yr.Text = ds.Tables[0].Rows[0]["ed1year"].ToString();
                        ed1per.Text = ds.Tables[0].Rows[0]["ed1per"].ToString();
                        //  }

                        edu2.Text = ds.Tables[0].Rows[0]["edu2"].ToString();
                        //if (edu2.Text == "")
                        //{
                        //    tredu2.Visible = false;
                        //}
                        //else
                        //{
                        ed2brd.Text = ds.Tables[0].Rows[0]["ed2brd"].ToString();
                        ed2sub.Text = ds.Tables[0].Rows[0]["ed2sub"].ToString();
                        ed2yr.Text = ds.Tables[0].Rows[0]["ed2year"].ToString();
                        ed2per.Text = ds.Tables[0].Rows[0]["ed2per"].ToString();
                        //  }

                        edu3.Text = ds.Tables[0].Rows[0]["edu3"].ToString();
                        //if (edu3.Text == "")
                        //{
                        //    tredu3.Visible = false;
                        //}
                        //else
                        //{
                        ed3brd.Text = ds.Tables[0].Rows[0]["ed3brd"].ToString();
                        ed3sub.Text = ds.Tables[0].Rows[0]["ed3sub"].ToString();
                        ed3yr.Text = ds.Tables[0].Rows[0]["ed3year"].ToString();
                        ed3per.Text = ds.Tables[0].Rows[0]["ed3per"].ToString();
                        // }

                        edu4.Text = ds.Tables[0].Rows[0]["edu4"].ToString();
                        //if (edu4.Text == "")
                        //{
                        //    tredu4.Visible = false;
                        //}
                        //else
                        //{
                        ed4brd.Text = ds.Tables[0].Rows[0]["ed4brd"].ToString();
                        ed4sub.Text = ds.Tables[0].Rows[0]["ed4sub"].ToString();
                        ed4yr.Text = ds.Tables[0].Rows[0]["ed4year"].ToString();
                        ed4per.Text = ds.Tables[0].Rows[0]["ed4per"].ToString();
                        //  }

                        edu5.Text = ds.Tables[0].Rows[0]["edu5"].ToString();
                        //if (edu5.Text == "")
                        //{
                        //    tredu5.Visible = false;
                        //}
                        //else
                        //{
                        ed5brd.Text = ds.Tables[0].Rows[0]["ed5brd"].ToString();
                        ed5sub.Text = ds.Tables[0].Rows[0]["ed5sub"].ToString();
                        ed5yr.Text = ds.Tables[0].Rows[0]["ed5year"].ToString();
                        ed5per.Text = ds.Tables[0].Rows[0]["ed5per"].ToString();
                        //    }

                        edu6.Text = ds.Tables[0].Rows[0]["edu6"].ToString();
                        //if (edu6.Text == "")
                        //{
                        //    tredu6.Visible = false;
                        //}
                        //else
                        //{
                        ed6brd.Text = ds.Tables[0].Rows[0]["ed6brd"].ToString();
                        ed6sub.Text = ds.Tables[0].Rows[0]["ed6sub"].ToString();
                        ed6yr.Text = ds.Tables[0].Rows[0]["ed6year"].ToString();
                        ed6per.Text = ds.Tables[0].Rows[0]["ed6per"].ToString();
                        // }

                        edu7.Text = ds.Tables[0].Rows[0]["edu7"].ToString();
                        //if (edu7.Text == "")
                        //{
                        //    tredu7.Visible = false;
                        //}
                        //else
                        //{
                        ed7brd.Text = ds.Tables[0].Rows[0]["ed7brd"].ToString();
                        ed7sub.Text = ds.Tables[0].Rows[0]["ed7sub"].ToString();
                        ed7yr.Text = ds.Tables[0].Rows[0]["ed7year"].ToString();
                        ed7per.Text = ds.Tables[0].Rows[0]["ed7per"].ToString();
                        //  }

                        //if (edu1.Text == "" && edu2.Text == "" && edu3.Text == "" && edu4.Text == "" && edu5.Text == "" && edu6.Text == "" && edu7.Text == "")
                        //{
                        //    lbledudet.Visible = true;
                        //    lbledudet.Text = " No Education Details Entered";
                        //}

                        txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                        imgdisplay.ImageUrl = "~/admin/emp_photos/" + ds.Tables[0].Rows[0]["photo"].ToString();
                        //   }
                    }
                }
                else
                {

                }
            }
        }
    }

    public DataSet GetEmpDet2(string emailid)
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }

    //public void EnableControls(ControlCollection ctrl, bool isEnable)
    //{
    //    foreach (Control item in ctrl)
    //    {
    //        if (item.GetType() == typeof(Panel) || item.GetType() == typeof(HtmlGenericControl))
    //            EnableControls(item.Controls, isEnable);
    //        else if (item.GetType() == typeof(DropDownList))
    //            ((DropDownList)item).Enabled = isEnable;
    //        else if (item.GetType() == typeof(TextBox))
    //            ((TextBox)item).Enabled = isEnable;
    //        else if (item.GetType() == typeof(Button))
    //            ((Button)item).Enabled = isEnable;
    //        else if (item.GetType() == typeof(HtmlInputButton))
    //            ((HtmlInputButton)item).Disabled = !isEnable;
    //    }
    //}

    //firstname,middlename,middlename,fathername,mothername

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null )
        {
            string strscpt = "alert ('Your Session Expired Please Login again!');location.replace('login.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strUserid = Session["userid"].ToString();


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
            string marital = "";
            if (chkmarried.Checked == true)
            {
                marital = "Married";
            }
            else
            {
                marital = "Unmarried";
            }
            string nation = ncountry.SelectedItem.Text;
            string birthdate = bdate.Text;
            string birthcountry = bcountry.SelectedItem.Text;
            string birthstate = bstate.SelectedItem.Text;
            string birthcity = bcity.SelectedItem.Text;
            string citizencountry = ccountry.SelectedItem.Text;
            string passport = passno.Text;
            string passportissueat = pcountry.SelectedItem.Text;
            string passportissue = issdate.Text;
            string passportexp = expdate.Text;

            //family details
            string fathername = fatname.Text;
            string mothername = motname.Text;
            string spose = mmname.Text;
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

            string door = txtdoor.Text;
            string streer = street.Text;
            string city1 = city.SelectedItem.Text;
            string state1 = state.SelectedItem.Text;
            string contry = country.SelectedItem.Text;
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
            string adhar = txtaadhar.Text;
            string pan = txtpan.Text;
            string dnumber = txtdrivenumber.Text;
            string dplace = txtdriveplace.Text;
            string dcity = txtdrivecity.Text;
            string aplace = txtadharplace.Text;
            string acity = txtadharcity.Text;
            string pplace = txtpanplace.Text;
            string pcity = txtpancity.Text;

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

            // string s="";
            // string s1 = "";

            string fppath = string.Empty;
            string fppath1 = string.Empty;
            string imgName1 = "";
            string imgName = "";
            //ds = sdata.GetEmpDet2(emailid);
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //     s= ds.Tables[0].Rows[0]["photo"].ToString();
            //     s1 = ds.Tables[0].Rows[0]["filename1"].ToString();
            //}
            ds = GetEmpDet2(strUserid);
            if (txtimgfupload.HasFile)
            {
                imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
                string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);

                if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                {
                    fppath = Server.MapPath("~/emp_photos/" + strUserid + imgName);
                    txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/emp_photos/" + strUserid + imgName));
                    imgName = strUserid + imgName;
                }
                else
                {
                    string str = "alert('Please Try Image');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
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

                if ((strextension1 == ".doc") || (strextension1 == ".docx"))
                {
                    fppath1 = Server.MapPath("~/Resumes/" + strUserid + imgName1);
                    txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + strUserid + imgName1));
                    imgName1 = strUserid + imgName1;
                }
                else
                {
                    string str = "alert('Please Try Document');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            else
            {
                imgName1 = ds.Tables[0].Rows[0]["filename1"].ToString();
                fppath1 = ds.Tables[0].Rows[0]["rpath"].ToString();
            }

            if (filedoc.HasFile)
            {
                HttpFileCollection fileCollection = Request.Files;
                for (int i1 = 2; i1 < fileCollection.Count; i1++)
                {
                    HttpPostedFile uploadfile = fileCollection[i1];
                    string fileName = Path.GetFileName(uploadfile.FileName);

                    string ext = System.IO.Path.GetExtension(fileName);
                    if ((ext == ".gif") || (ext == ".jpeg") || (ext == ".jpg") || (ext == ".bmp") || (ext == ".JPEG") || (ext == ".png") || (ext == ".PNG") || (ext == ".JPG") || (ext == ".GIF"))
                    {
                        // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
                        string path = Server.MapPath("~/admin/Employee_Docs/" + strUserid + fileName);
                        filedoc.SaveAs(path);

                        string imgname23 = strUserid + fileName;
                        if (uploadfile.ContentLength > 0)
                        {
                            uploadfile.SaveAs(path);
                        }

                        int j = newgallargeimages(imgname23, strUserid);
                        if (j == 1)
                        {
                            path = "";
                        }
                    }
                    else
                    {
                        string str = "alert('Please Try Image');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
            }

            string date = System.DateTime.Now.ToString();
            int i = update(firstname, middlename, lastname, fathername, mothername, spose, gender, sgender, sdob, kid1n, kid2n, kid3n,
    kid1g, kid2g, kid3g, kid1dob, kid2dob, kid3dob, contry, state1, streer, city1, zip1, door, workp, homep, mobilep,
    birthdate, citizencountry, birthcity, birthstate, birthcountry, passport, passportissueat, passportissue, passportexp,
    nation, cnp1, cnp1p, cnp1mail, cnp1address, cnp2, cnp2p, cnp2mail, cnp2address, totalexpy, totalexpm, functionalarea, cindustry,
    sk1, sk1y, sk1m, sk1e, sk2, sk2y, sk2m, sk2e, sk3, sk3y, sk3m, sk3e, sk4, sk4y, sk4m, sk4e, sk5, sk5y, sk5m, sk5e, sk6, sk6y, sk6m, sk6e,
    ed1, ed1b, ed1s, ed1y, ed1p, ed2, ed2b, ed2s, ed2y, ed2p, ed3, ed3b, ed3s, ed3y, ed3p, ed4, ed4b, ed4s, ed4y, ed4p,
    ed5, ed5b, ed5s, ed5y, ed5p, ed6, ed6b, ed6s, ed6y, ed6p, ed7, ed7b, ed7s, ed7y, ed7p, imgName1, date, fppath1, imgName, fppath,
    bacname, acnumber, bname, badd, bifsc, bswift, bacadd, adhar, pan, dnumber, dplace, dcity, strUserid, marital, acity, aplace, pplace, pcity);

            if (i == 1)
            {
                string strscpt = "alert ('Your Details Updated');location.replace('Employee-Details.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
            else
            {
                string strscpt = "alert ('Your Details Not Updated ! Try Again');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        }

    

    private int newgallargeimages(string imgname23, string strUserid)
    {
        con.Open();
        string s = "insert into   employeedoc values('" + imgname23 + "','" + strUserid + "')";
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
        string badd, string bifsc, string bswift, string bacadd, string adhar, string pan, string dnumber, string dplace,
        string dcity, string strUserid, string marital, string acity, string aplace, string pplace, string pcity)
    {
        con.Open();
        string s = "update  employeereg1  set firstname='" + firstname + "',mstatus='" + marital + "',middlename='" + middlename + "',lastname='" + lastname + "',fathername='" + fathername + "', mothername='" + mothername + "',spousename='" + spose + "',gender='" + gender + "',spousegender='" + sgender + "',spousedob='" + sdob + "', kid1='" + kid1n + "',kid2='" + kid2n + "',kid3='" + kid3n + "',child1gender='" + kid1g + "',child2gender='" + kid2g + "',child3gender='" + kid3g + "',child1dob='" + kid1dob + "',child2dob='" + kid2dob + "',child3dob='" + kid3dob + "',country1='" + contry + "',state1='" + state1 + "',street='" + streer + "',city1='" + city1 + "',zip='" + zip1 + "',doorno='" + door + "',workphone='" + workp + "',homephone='" + homep + "',mobile='" + mobilep + "',birthdate='" + birthdate + "',cntryofcitizenship='" + citizencountry + "',birthcity='" + birthcity + "',birthstate='" + birthstate + "',birthcountry='" + birthcountry + "',passportno='" + passport + "',passportissuedat='" + passportissueat + "',dateofissue='" + passportissue + "',doexp='" + passportexp + "',nationality='" + nation + "',contactpersonname1='" + cnp1 + "',cp1phone='" + cnp1p + "',cp1email='" + cnp1mail + "',cpaddress1='" + cnp1address + "',contactpersonname2='" + cnp2 + "',cp2phone2='" + cnp2p + "',cp2email='" + cnp2mail + "',cpaddress2='" + cnp2address + "',totexptrs='" + totalexpy + "',totexpmonths='" + totalexpm + "',functionalarea='" + functionalarea + "',currentindustrytype ='" + cindustry + "',skills1 ='" + sk1 + "',sk1years ='" + sk1y + "',sk1months ='" + sk1m + "',sk1exp ='" + sk1e + "',skills2 ='" + sk2 + "',sk2years ='" + sk2y + "',sk2months ='" + sk2m + "',sk2exp='" + sk2e + "',skills3='" + sk3 + "',sk3years='" + sk3y + "',sk3months='" + sk3m + "',sk3exp='" + sk3e + "',skills4='" + sk4 + "',sk4years='" + sk4y + "',sk4months='" + sk4m + "',sk4exp='" + sk4e + "',skills5='" + sk5 + "',sk5years='" + sk5y + "',sk5months='" + sk5m + "',sk5exp='" + sk5e + "',skills6='" + sk6 + "',sk6years='" + sk6y + "',sk6months='" + sk6m + "',sk6exp='" + sk6e + "',edu1='" + ed1 + "',ed1brd='" + ed1b + "',ed1sub='" + ed1s + "',     ed1year='" + ed1y + "',ed1per='" + ed1p + "',edu2='" + ed2 + "',ed2brd='" + ed2b + "',ed2sub='" + ed2s + "',ed2year='" + ed2y + "',ed2per='" + ed2p + "',edu3='" + ed3 + "',ed3brd='" + ed3b + "', ed3sub='" + ed3s + "',        ed3year='" + ed3y + "',ed3per='" + ed3p + "',edu4='" + ed4 + "',ed4brd='" + ed4b + "',ed4sub='" + ed4s + "',ed4year='" + ed4y + "',        ed4per='" + ed4p + "',edu5='" + ed5 + "',ed5brd='" + ed5b + "',ed5sub='" + ed5s + "',ed5year='" + ed5y + "',ed5per='" + ed5p + "',edu6='" + ed6 + "',ed6brd='" + ed6b + "',ed6sub='" + ed6s + "',ed6year='" + ed6y + "',        ed6per='" + ed6p + "',edu7='" + ed7 + "',ed7brd='" + ed7b + "',ed7sub='" + ed7s + "',ed7year='" + ed7y + "',ed7per='" + ed7p + "',        filename1='" + imgName1 + "',pdate='" + date + "',rpath='" + fppath1 + "',photo='" + imgName + "',photopath='" + fppath + "',        bankacname='" + bacname + "',bankacnumber='" + acnumber + "',bankname='" + bname + "',        bankaddress='" + badd + "',bankifsc='" + bifsc + "',bankswift='" + bswift + "',bankacaddress='" + bacadd + "',aadharnumber='" + adhar + "',pannumber='" + pan + "',dlicencenumber='" + dnumber + "',dissueplace='" + dplace + "',dissuecitty='" + dcity + "',panplace='" + pplace + "',pancity='" + pcity + "',aadharplace='" + aplace + "',aadharcity='" + acity + "' where username='" + strUserid + "'";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp_Home.aspx");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null && Session["Designation"] == null)
        {
            string strscpt = "alert ('Your Session Expired Please Login again!');location.replace('login.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strUserid = Session["userid"].ToString();
            if (strUserid != "")
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
                string marital = "";
                if (chkmarried.Checked == true)
                {
                    marital = "Married";
                }
                else
                {
                    marital = "Unmarried";
                }
                string nation = ncountry.SelectedItem.Text;
                string birthdate = bdate.Text;
                string birthcountry = bcountry.SelectedItem.Text;
                string birthstate = bstate.SelectedItem.Text;
                string birthcity = bcity.SelectedItem.Text;
                string citizencountry = ccountry.SelectedItem.Text;
                string passport = passno.Text;
                string passportissueat = pcountry.SelectedItem.Text;
                string passportissue = issdate.Text;
                string passportexp = expdate.Text;

                //family details
                string fathername = fatname.Text;
                string mothername = motname.Text;
                string spose = mmname.Text;
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

                string door = txtdoor.Text;
                string streer = street.Text;
                string city1 = city.SelectedItem.Text;
                string state1 = state.SelectedItem.Text;
                string contry = country.SelectedItem.Text;
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
                string adhar = txtaadhar.Text;
                string pan = txtpan.Text;
                string dnumber = txtdrivenumber.Text;
                string dplace = txtdriveplace.Text;
                string dcity = txtdrivecity.Text;
                string aplace = txtadharplace.Text;
                string acity = txtadharcity.Text;
                string pplace = txtpanplace.Text;
                string pcity = txtpancity.Text;

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



                string fppath = string.Empty;
                string fppath1 = string.Empty;
                string imgName1 = "";
                string imgName = "";

                ds = GetEmpDet2(strUserid);
                if (txtimgfupload.HasFile)
                {
                    imgName = System.IO.Path.GetFileName(txtimgfupload.PostedFile.FileName);
                    string strextension = System.IO.Path.GetExtension(txtimgfupload.PostedFile.FileName);

                    if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                    {
                        fppath = Server.MapPath("~/emp_photos/" + strUserid + imgName);
                        txtimgfupload.PostedFile.SaveAs(Server.MapPath("~/admin/emp_photos/" + strUserid + imgName));
                        imgName = strUserid + imgName;
                    }
                    else
                    {
                        string str = "alert('Please Try Image');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
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

                    if ((strextension1 == ".doc") || (strextension1 == ".docx"))
                    {
                        fppath1 = Server.MapPath("~/Resumes/" + strUserid + imgName1);
                        txtresupload.PostedFile.SaveAs(Server.MapPath("~/admin/Resumes/" + strUserid + imgName1));
                        imgName1 = strUserid + imgName1;
                    }
                    else
                    {
                        string str = "alert('Please Try Document');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
                else
                {
                    imgName1 = ds.Tables[0].Rows[0]["filename1"].ToString();
                    fppath1 = ds.Tables[0].Rows[0]["rpath"].ToString();
                }

                if (filedoc.HasFile)
                {
                    HttpFileCollection fileCollection = Request.Files;
                    for (int i1 = 2; i1 < fileCollection.Count; i1++)
                    {
                        HttpPostedFile uploadfile = fileCollection[i1];
                        string fileName = Path.GetFileName(uploadfile.FileName);

                        string ext = System.IO.Path.GetExtension(fileName);
                        if ((ext == ".gif") || (ext == ".jpeg") || (ext == ".jpg") || (ext == ".bmp") || (ext == ".JPEG") || (ext == ".png") || (ext == ".PNG") || (ext == ".JPG") || (ext == ".GIF"))
                        {
                            string path = Server.MapPath("~/admin/Employee_Docs/" + strUserid + fileName);
                            filedoc.SaveAs(path);

                            string imgname23 = strUserid + fileName;
                            if (uploadfile.ContentLength > 0)
                            {
                                uploadfile.SaveAs(path);
                            }

                            int j = newgallargeimages(imgname23, strUserid);
                            if (j == 1)
                            {
                                path = "";
                            }
                        }
                        else
                        {
                            string str = "alert('Please Try Image');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        }
                    }
                }

                string date = System.DateTime.Now.ToString();
                int i = update(firstname, middlename, lastname, fathername, mothername, spose, gender, sgender, sdob, kid1n, kid2n, kid3n,
        kid1g, kid2g, kid3g, kid1dob, kid2dob, kid3dob, contry, state1, streer, city1, zip1, door, workp, homep, mobilep,
        birthdate, citizencountry, birthcity, birthstate, birthcountry, passport, passportissueat, passportissue, passportexp,
        nation, cnp1, cnp1p, cnp1mail, cnp1address, cnp2, cnp2p, cnp2mail, cnp2address, totalexpy, totalexpm, functionalarea, cindustry,
        sk1, sk1y, sk1m, sk1e, sk2, sk2y, sk2m, sk2e, sk3, sk3y, sk3m, sk3e, sk4, sk4y, sk4m, sk4e, sk5, sk5y, sk5m, sk5e, sk6, sk6y, sk6m, sk6e,
        ed1, ed1b, ed1s, ed1y, ed1p, ed2, ed2b, ed2s, ed2y, ed2p, ed3, ed3b, ed3s, ed3y, ed3p, ed4, ed4b, ed4s, ed4y, ed4p,
        ed5, ed5b, ed5s, ed5y, ed5p, ed6, ed6b, ed6s, ed6y, ed6p, ed7, ed7b, ed7s, ed7y, ed7p, imgName1, date, fppath1, imgName, fppath,
        bacname, acnumber, bname, badd, bifsc, bswift, bacadd, adhar, pan, dnumber, dplace, dcity, strUserid, marital, acity, aplace, pplace, pcity);

                if (i == 1)
                {
                    string strscpt = "alert ('Your Details Saved Successfully');location.replace('Employee-Details.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
        }
    }

    protected void bcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bcountry.SelectedItem.Text.ToString() != "Select Country")
        {
           // bcountry.Items.Clear();
            bstate.Items.Clear();
            bcity.Items.Clear();
            string x = bcountry.SelectedItem.Value.ToString();
            ds = GetState(x);
            if (ds.Tables[0].Rows.Count > 0)
            {
               // for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
             //   {
                    bstate.DataTextField = "state_name";
                    bstate.DataValueField = "sid";
                    bstate.DataSource = ds;
                    bstate.DataBind();
                    bstate.Items.Insert(0, "Select State");
                    bcity.Items.Add("Select City");


                    //bstate.Items.Add("Select");
                    //bstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["state_name"].ToString();
                    //bstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["sid"].ToString();
              //  }
            }
        }
        else
        {
            bstate.Items.Clear();
            bcity.Items.Clear();
            bstate.Items.Add("Select State");
            bcity.Items.Add("Select City");

        }
    }

    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (country.SelectedItem.Text.ToString() != "Select Country")
        {
            // country.Items.Clear();
            state.Items.Clear();
            city.Items.Clear();
            string y = country.SelectedItem.Value.ToString();
            ds = GetState(y);

            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    state.DataTextField = "state_name";
                    state.DataValueField = "sid";
                    state.DataSource = ds;
                    state.DataBind();
                    state.Items.Insert(0, "Select State");
                    city.Items.Add("Select City");

                    // for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                    //  {
                    //state.Items.Add("");
                    //state.Items[i].Text = ds.Tables[0].Rows[i - 1]["state_name"].ToString();
                    //state.Items[i].Value = ds.Tables[0].Rows[i - 1]["sid"].ToString();
                    //  }
                }
            }
        }
        else
        {
            state.Items.Clear();
            city.Items.Clear();
            state.Items.Add("Select State");
            city.Items.Add("Select City");
        }
    }

    protected void bstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bstate.SelectedItem.Text.ToString() != "Select State")
        {
            bcity.Items.Clear();
            string x = bstate.SelectedItem.Value.ToString();
            ds = GetCity(x);
            if (ds.Tables[0].Rows.Count > 0)
            {
                bcity.DataTextField = "city_name";
                bcity.DataValueField = "cityid";
                bcity.DataSource = ds;
                bcity.DataBind();
                bcity.Items.Insert(0, "Select City");

                //for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                //{
                //    bcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["city_name"].ToString();
                //    bcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                //}
            }
        }
        else
        {
            bcity.Items.Clear();
            bcity.Items.Add("Select City");
        }
    }

    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.SelectedItem.Text.ToString() != "Select State")
        {
            city.Items.Clear();
            string x = state.SelectedItem.Value.ToString();
            ds = GetCity(x);

            if (ds.Tables[0].Rows.Count > 0)
            {
                city.DataTextField = "city_name";
                city.DataValueField = "cityid";
                city.DataSource = ds;
                city.DataBind();
                city.Items.Insert(0, "Select City");
                //for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                //{
                //    city.Items.Add("Select");
                //    city.Items[i].Text = ds.Tables[0].Rows[i - 1]["city_name"].ToString();
                //    city.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                //}
            }
        }
        else
        {
            city.Items.Clear();
            city.Items.Add("Select City");
        }
    }

    public DataSet GetCounty()
    {
        DataSet ds = new DataSet();
        con.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from ig_country order by country_name Asc", con);
        sqlda.Fill(ds);
        con.Close();
        return ds;
    }

    public DataSet GetState(string id)
    {
        DataSet ds = new DataSet();
        con.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from ig_states where cid = " + id + " order by state_name Asc", con);
        sqlda.Fill(ds);
        con.Close();
        return ds;
    }

    public DataSet GetCity(string id1)
    {
        DataSet ds1 = new DataSet();
        con.Open();
        SqlDataAdapter sqlda1 = new SqlDataAdapter("select * from ig_city where sid = " + id1 + " order by city_name Asc", con);
        sqlda1.Fill(ds1);
        con.Close();
        return ds1;
    }

    protected void lnkphoto_Click(object sender, EventArgs e)
    {
        emailid = Session["userid"].ToString();

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
        else
        {
            string strscpt = "alert ('No image uploaded');');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }
    protected void lnkresume_Click(object sender, EventArgs e)
    {
        emailid = Session["userid"].ToString();

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
        else
        {
            string strscpt = "alert ('No Resume Upploaded');');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void upload_Click(object sender, EventArgs e)
    {
        string strUserid = Session["userid"].ToString();
        string fppath = string.Empty;
        string imgName = "";
        ds = GetEmpDet2(strUserid);
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
                    fppath = Server.MapPath("~/emp_photos/" + icertificate);
                    filedoc.PostedFile.SaveAs(Server.MapPath("~/admin/emp_photos/" + icertificate));
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

                        string strscpt = "alert ('Your Selected  Document Upload Successfully');');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
                else
                {
                    string strscpt = "alert ('Please Upload image');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
        }
    }

    private int newgallargeimages(string imgname23, string strUserid, string course)
    {
        con.Open();
        string s = "insert into   employeedoc values('" + imgname23 + "','" + strUserid + "','" + course + "')";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
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
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/emp_photos/" + Fname));
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

            }
        }
    }
    //public void daa()
    //{
    //    SqlCommand createtable = new SqlCommand("AT_Binddata");
    //    createtable.CommandType = CommandType.StoredProcedure;

    //    createtable.Parameters.AddWithValue("@Action", "bindoncoursename");
    //    createtable.Parameters.AddWithValue("@Coursename", "Advanced Dotnet") ;

    //    SqlDataAdapter sda = new SqlDataAdapter();
    //    createtable.Connection = con;
    //    sda.SelectCommand = createtable;
    //    con.Open();
    //    createtable.ExecuteNonQuery();
    //    sda.Fill(ds);
    //    con.Close();
    //}


    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}