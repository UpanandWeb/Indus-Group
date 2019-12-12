using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Emp_page2 : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataSet ds1 = new DataSet();
    string usid = string.Empty;
    //Initialise object to bind and navigate countries
    StateCountry countries = new StateCountry();
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string strScript = "";
    int val;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            val = Convert.ToInt32(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                //lblid.Text = val;
            }
        }
    }
    protected void btnSave_Emp_Click1(object sender, EventArgs e)
    {
        if (termscond.Checked == true)
        {
            if (IsValid)
            {
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

                rtit = Convert.ToString(restitle.Text);
                //rfil = Convert.ToString(System.IO.Path.GetFileName(rfile.PostedFile.FileName));
                string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                if (rfile.HasFile)
                {
                    rfil = Path.GetFileName(rfile.PostedFile.FileName);
                    stras = rfil;
                    rpath = "Resume/" + stras.ToString();
                    string rpath1 = "admin/Resumes/" + stras.ToString();
                    rfile.SaveAs(Base_dir + rpath);
                    rfile.SaveAs(Base_dir + rpath1);
                }
                else
                {
                    rpath = "";
                }
                if (Fileupphoto.HasFile)
                {
                    rphoto = Fileupphoto.FileName.ToString();
                    //string st_img = System.IO.Path.GetFullPath(Fileupphoto.PostedFile.FileName);
                    //string st = System.IO.Directory.GetCurrentDirectory();\
                    using (System.Drawing.Image myImage = System.Drawing.Image.FromStream(Fileupphoto.PostedFile.InputStream))
                    {
                        if (myImage.Height == 135 && myImage.Width == 135)
                        {
                            photopath = Base_dir + "Emp_photos/" + rphoto;
                            string photopath1 = Base_dir + "admin/Emp_photos/" + rphoto;
                            Fileupphoto.SaveAs(photopath);
                            Fileupphoto.SaveAs(photopath1);
                        }
                        else
                        {
                            strScript = "alert('Image size is Too Large')";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                        }
                    }
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
                try
                {
                    connection.Open();
                    string strQry = "update employeereg1 set totexptrs=@exyr, totexpmonths=@exmn, rhead=@rtit, functionalarea=@fnar," +
                        " currentindustrytype=@cind, skills1=@sk1, sk1years=@sk1yr,sk1months=@sk1mnt, sk1exp=@sk1ex, skills2=@sk2, " +
                        "sk2years=@sk2yr,sk2months=@sk2mnt, sk2exp=@sk2ex, skills3=@sk3, sk3years=@sk3yr,sk3months=@sk3mnt, sk3exp=@sk3ex," +
                        "skills4=@sk4, sk4years=@sk4yr,sk4months=@sk4mnt, sk4exp=@sk4ex,skills5=@sk5, sk5years=@sk5yr,sk5months=@sk5mnt," +
                        " sk5exp=@sk5ex,skills6=@sk6, sk6years=@sk6yr,sk6months=@sk6mnt, sk6exp=@sk6ex, edu1=@ed1, ed1brd=@ed1bd, ed1sub=@ed1sb," +
                        " ed1year=@ed1y, ed1per=@ed1pe, edu2=@ed2, ed2brd=@ed2bd, ed2sub=@ed2sb, ed2year=@ed2y, ed2per=@ed2pe, edu3=@ed3, " +
                        "ed3brd=@ed3bd, ed3sub=@ed3sb, ed3year=@ed3y, ed3per=@ed3pe, edu4=@ed4, ed4brd=@ed4bd, ed4sub=@ed4sb, ed4year=@ed4y," +
                        " ed4per=@ed4pe, edu5=@ed5, ed5brd=@ed5bd, ed5sub=@ed5sb, ed5year=@ed5y, ed5per=@ed5pe, filename1=@rfil, resumetxt=@rtxt," +
                        " pdate=@pdate, status=@status,totexptrs1=@exyr1,totexptrs2=@exyr2,totexpmonths1=@exmn1,totexpmonths2=@exmn2," +
                        "functionalarea1=@fnar1,functionalarea2=@fnar2,previousindustrytype1=@cind1,previousindustrytype2=@cind2,rpath=@rpath," +
                        "Activeid=@Active_Id,photo=@pic,photopath=@picpath where userid= " + val;

                    SqlCommand cmd = new SqlCommand(strQry, connection);

                    cmd.Parameters.Add(new SqlParameter("@exyr", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@exmn", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@rtit", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@fnar", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@cind", SqlDbType.NVarChar, 50));

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
                    cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 20));
                    cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@exyr1", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@exyr2", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@exmn1", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@exmn2", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@fnar1", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@fnar2", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@cind1", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@cind2", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@rpath", SqlDbType.NVarChar, 10000));
                    //cmd.Parameters.Add(new SqlParameter("@pplc", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@Active_Id", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@pic", SqlDbType.NVarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@picpath", SqlDbType.NVarChar, 10000));

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
                    cmd.Parameters["@sk2mnt"].Value = sk2mnt;
                    cmd.Parameters["@sk2ex"].Value = sk2ex;

                    cmd.Parameters["@sk3"].Value = sk3;
                    cmd.Parameters["@sk3yr"].Value = sk3yr;
                    cmd.Parameters["@sk3mnt"].Value = sk3mnt;
                    cmd.Parameters["@sk3ex"].Value = sk3ex;

                    cmd.Parameters["@sk4"].Value = sk4;
                    cmd.Parameters["@sk4yr"].Value = sk4yr;
                    cmd.Parameters["@sk4mnt"].Value = sk4mnt;
                    cmd.Parameters["@sk4ex"].Value = sk4ex;

                    cmd.Parameters["@sk5"].Value = sk5;
                    cmd.Parameters["@sk5yr"].Value = sk5yr;
                    cmd.Parameters["@sk5mnt"].Value = sk5mnt;
                    cmd.Parameters["@sk5ex"].Value = sk5ex;

                    cmd.Parameters["@sk6"].Value = sk6;
                    cmd.Parameters["@sk6yr"].Value = sk6yr;
                    cmd.Parameters["@sk6mnt"].Value = sk6mnt;
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
                    int up = cmd.ExecuteNonQuery();
                    connection.Close();
                    if (up == 1)
                    {
                        //SendMailMessage(usid, fn, ln, pw);
                        strScript = "alert('All Details Registered successfully');location.replace('Default.aspx')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        //SendMail(usid, fn, ln);                       
                    }
                }
                catch (Exception ex)
                {
                    //to catch exception handled
                    lblmail.Text = ex.Message;
                }
            }
        }
        else
        {
            strScript = "alert('Agree the Terms and Conditions.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}