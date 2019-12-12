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
public partial class Admin_Enrolledit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        string uid = string.Empty;
        DataSet ds = new DataSet();

        uid = Request.QueryString["cid"].ToString();

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_enroll where UserId=" + uid, sqlConnection);
            imgtext.Fill(ds, "wt_FeedBack");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {

                fname.Text = ds.Tables[0].Rows[0]["Fname"].ToString();
                lname.Text = ds.Tables[0].Rows[0]["Lname"].ToString();
                address.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                city.Text = ds.Tables[0].Rows[0]["City"].ToString();
                state.Text = ds.Tables[0].Rows[0]["State"].ToString();
                country.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                zip.Text = ds.Tables[0].Rows[0]["Zip"].ToString();
                work.Text = ds.Tables[0].Rows[0]["Ph_Work"].ToString();
                home.Text = ds.Tables[0].Rows[0]["Ph_Home"].ToString();
                mobile.Text = ds.Tables[0].Rows[0]["Mobile_No"].ToString();
                fax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
                email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                education.Text = ds.Tables[0].Rows[0]["Ed_Qual"].ToString();
                workingon.Text = ds.Tables[0].Rows[0]["Curr_Working"].ToString();
                course.Text = ds.Tables[0].Rows[0]["Course_Enroll"].ToString();

                c_startfrom.Value = ds.Tables[0].Rows[0]["Join_Date"].ToString();
                hear.Text = ds.Tables[0].Rows[0]["H_About"].ToString();
                referral.Text = ds.Tables[0].Rows[0]["Ref_Name"].ToString();
                imm_status.Text = ds.Tables[0].Rows[0]["Immig_Status"].ToString();
                add_infm.Text = ds.Tables[0].Rows[0]["Addl_Info"].ToString();



            }

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




    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string usid = Request.QueryString["cid"].ToString();
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
           
        }


        usercsdate = Convert.ToString(c_startfrom.Value);
        useraboutus = Convert.ToString(hear.Text);
        userrname = Convert.ToString(referral.Text);
        userstatus = Convert.ToString(imm_status.Text);
        usercomments = Convert.ToString(add_infm.Text);



        string streg = string.Empty;

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("Update wt_enroll set Fname=@afname,Lname=@alname,Address=@addr,City=@acity,State=@astate,Country=@acountry,Zip=@azip,Ph_Work=@awork,Ph_Home=@ahome,Mobile_No=@amobile,Fax=@afax,Email=@aemail,Ed_Qual=@edu,Curr_Working=@aworking,Course_Enroll=@acourse,Resume_name=@resume,Join_Date=@jdate,H_About=@about,Ref_Name=@refname,Immig_Status=@immig,Addl_Info=@addl where UserId=" + usid + ";", connection);


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
        cmd.Parameters["@aworking"].Value = userwork;
        cmd.Parameters["@acourse"].Value = userenroll;

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
      Response.Redirect("Admin_Enrollhome.aspx?ret=ed");

    }
}
