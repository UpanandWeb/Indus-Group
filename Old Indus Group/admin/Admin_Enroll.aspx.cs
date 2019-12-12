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

public partial class Admin_Enroll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

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

    protected void course_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection Connection1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        if (course.SelectedIndex != 0)
        {
            try
            {

                string ucourse = Convert.ToString(course.SelectedValue);
                string s = "select * from wt_enroll where Course_Enroll= '" + ucourse + "'";
                SqlCommand cmd = new SqlCommand(s, Connection1);
                SqlDataAdapter da = new SqlDataAdapter(s, Connection1);
                DataSet ds = new DataSet();
                da.Fill(ds, "wt_enroll");
                int counts = ds.Tables[0].Rows.Count;
                int ncount = counts + 1;


                if (ucourse == "DWH/BO/COGNOS/Crystal Reports")
                {
                    admno.Text = "DW-" + ncount;
                }


                if (ucourse == "INFORMATICA")
                {
                    admno.Text = "IN-" + ncount;
                }
                if (ucourse == "BUSINESS ANALYST")
                {
                    admno.Text = "Ba-" + ncount;
                }
                if (ucourse == "QA Manual and Automated Testing")
                {
                    admno.Text = "QA-" + ncount;
                }
                if (ucourse == "ORACLE DBA")
                {
                    admno.Text = "OD-" + ncount;
                }
                if (ucourse == "ORACLE APPS")
                {
                    admno.Text = "OA-" + ncount;
                }
                if (ucourse == "SAP - FICO")
                {
                    admno.Text = "SF-" + ncount;
                }


                if (ucourse == ".NET / C# / ASP.NET / VB.NET")
                {
                    admno.Text = "NT-" + ncount;
                }
                if (ucourse == "SAP - HR")
                {
                    admno.Text = "SH-" + ncount;
                }

                if (ucourse == "People Soft - Technical and Functional")
                {
                    admno.Text = "PS-" + ncount;
                }
                if (ucourse == "Web Development")
                {
                    admno.Text = "WD-" + ncount;
                }

                if (ucourse == "JAVA / J2EE Training")
                {
                    admno.Text = "JT-" + ncount;
                }

                if (ucourse == "UNIX ADMIN")
                {
                    admno.Text = "UA-" + ncount;
                }
                if (ucourse == "PMP Certification")
                {
                    admno.Text = "PC-" + ncount;
                }
            }

            finally
            {
                if (Connection1 != null) Connection1.Close();
            }

        }
        else
        {
            admno.Text = "";
        }



    }




    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string username = "";
        string userlname = "";
        string useraddress = "";
        string usercity = "";
        string userstate = "";
        string usercountry = "";
        string userzip = "";
        string userwork = "";
        string userhome = "";
        string usermobile = "";
        string userfax = "";
        string useremail = "";
        string userqualification = "";
        string usercwork = "";
        string userenroll = "";
        string usercsdate = "";
        string useraboutus = "";
        string userrname = "";
        string userstatus = "";
        string usercomments = "";
        string fName = "";
 
        username = Convert.ToString(fname.Text);
        userlname = Convert.ToString(lname.Text);
        useraddress = Convert.ToString(address.Text);
        usercity = Convert.ToString(city.Text);
        userstate = Convert.ToString(state.Text);
        usercountry = Convert.ToString(country.Text);
        userzip = Convert.ToString(zip.Text);
        userwork = Convert.ToString(work.Text);
        userhome = Convert.ToString(home.Text);
        usermobile = Convert.ToString(mobile.Text);
        userfax = Convert.ToString(fax.Text);
        useremail = Convert.ToString(email.Text);
        userqualification = Convert.ToString(education.Text);
        usercwork = Convert.ToString(work.Text);
        userenroll = Convert.ToString(course.Text);
    
        if (resume.PostedFile != null)
        {
             int fLen = resume.PostedFile.ContentLength;
             if (fLen != 0)
             {
               fName = System.IO.Path.GetFileName(resume.PostedFile.FileName);
                 resume.PostedFile.SaveAs(Server.MapPath("Resumes/" + fName));
             }
           // HttpPostedFile myFile = resume.PostedFile;
            //int nFileLen = myFile.ContentLength;
            //userresume = myFile.FileName;
           // myFile.SaveAs(Server.MapPath("Resumes/" + userresume));
        }


        usercsdate = Convert.ToString(c_startfrom.Value);
        useraboutus = Convert.ToString(hear.Text);
        userrname = Convert.ToString(referral.Text);
        userstatus = Convert.ToString(imm_status.Text);
        usercomments = Convert.ToString(add_infm.Text);



        string streg = string.Empty;

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("insert into wt_enroll (Fname,Lname,Address,City,State,Country,Zip,Ph_Work,Ph_Home,Mobile_No,Fax,Email,Ed_Qual,Curr_Working,Course_Enroll,Admn_No,Resume_name,Join_Date,H_About,Ref_Name,Immig_Status,Addl_Info,Pdate) VALUES (@afname,@alname,@addr,@acity,@astate,@acountry,@azip,@awork,@ahome,@amobile,@afax,@aemail,@edu,@aworking,@acourse,@admn,@resume,@jdate,@about,@refname,@immig,@addl,@postdate);", connection);


        cmd.Parameters.Add(new SqlParameter("@afname", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@alname", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@addr", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@acity", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@astate", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@acountry", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@azip", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@awork", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@ahome", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@amobile", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@afax", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@edu", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@aworking", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@acourse", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@admn", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@resume", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@jdate", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@about", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@refname", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@immig", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@addl", SqlDbType.NVarChar, 20000));
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

        cmd.Parameters["@afname"].Value = username;
        cmd.Parameters["@alname"].Value = userlname;
        cmd.Parameters["@addr"].Value = useraddress;
        cmd.Parameters["@acity"].Value = usercity;
        cmd.Parameters["@astate"].Value = userstate;
        cmd.Parameters["@acountry"].Value = usercountry;
        cmd.Parameters["@azip"].Value = userzip;
        cmd.Parameters["@awork"].Value = userwork;
        cmd.Parameters["@ahome"].Value = userhome;
        cmd.Parameters["@amobile"].Value = usermobile;
        cmd.Parameters["@afax"].Value = userfax;
        cmd.Parameters["@aemail"].Value = useremail;
        cmd.Parameters["@edu"].Value = userqualification;
        cmd.Parameters["@aworking"].Value=userwork;
        cmd.Parameters["@acourse"].Value = userenroll;
        cmd.Parameters["@admn"].Value = Convert.ToString(admno.Text); ;
      //  int fLen = UploadFile.PostedFile.ContentLength;
        //string fName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName);
        //UploadFile.PostedFile.SaveAs(Server.MapPath("Resumes/" + fName));

        cmd.Parameters["@resume"].Value = fName;
        cmd.Parameters["@jdate"].Value = usercsdate;
        cmd.Parameters["@about"].Value = useraboutus;
        cmd.Parameters["@refname"].Value = userrname;
        cmd.Parameters["@immig"].Value = userstatus;
        cmd.Parameters["@addl"].Value = usercomments; 
        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        SendMail(username, userlname, useraddress, usercity, userstate, usercountry, userzip, userwork, userhome, usermobile, userfax, useremail, userqualification, usercomments, usercsdate, useraboutus, username, userenroll);

        Response.Redirect("Admin_Enroll.aspx?ret=ok");

    }

    private void SendMail(string FName, string LName, string Address, string City, string State, string Country, string Zip, string WPhone, string HPhone, string mobile, string Fax, string Mail, string education, string comment, string csdate, string aboutus, string refname, string course)
    {
        try
        {
            string Msg = "";
            string Phonenumber = HPhone;
            try
            {
                MailMessage mm = new MailMessage();
                mm.From = Mail;
                mm.To = "info@wizardstraining.net";
                Msg += "Student Name : '" + FName + "'" + " " + "'" + LName + "'" +

                           "<br>Email ID :'" + Mail + "'" +
                            "<br>Address:'" + Address + "'" +
                             "<br> City :'" + City + "'" +
                              "<br> State :'" + State + "'" +
                               "<br>Country :'" + Country + "'" +
                                "<br>Mobile Number : '" + mobile + "'" +
                              "<br>Home Phone : '" + Phonenumber + "'" +
                               "<br> Educational Qualification : '" + education + "'" +
                                   "<br>Course opted : '" + course + "'" +
                                       "<br>Course Starting Date : '" + csdate + "'" +
                                   "<br>He heard about you from : '" + aboutus + "'" +
                                       "<br>Referred Name : '" + refname + "'" +
                                      "<br>Comments : '" + comment + "'";
                mm.Subject = "Subject : Enrollment Details for igiit ";
                mm.BodyFormat = MailFormat.Html;

                 mm.Body = Msg;
                SmtpMail.Send(mm);
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
        catch (Exception ee)
        {
            lblerror.Text = ee.Message;
        }
        
    }




   
}
