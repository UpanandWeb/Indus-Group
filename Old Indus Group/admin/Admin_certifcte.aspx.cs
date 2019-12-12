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
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_certifcte : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        btnsubmit.Attributes.Add("onClick", "return validatefields()");
        getdetails.Attributes.Add("onclick", "return alertfield()");
      //  btnsubmit.Attributes.Add("onclick", "return alertexam()");
       

           if (Request.QueryString["ret"] == "exist")
          {
              body1.Attributes.Add("onload", "return alertexist()");
             

          }
        btnsubmit.Visible = false;
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
      
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
    protected void getdetails_Click(object sender, EventArgs e)
    {



        string uid = string.Empty;
        DataSet ds = new DataSet();
         DataSet dss = new DataSet();

        uid = Convert.ToString(admno.Text);

          SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext1 = new SqlDataAdapter("Select * from wt_certificate where course_id='" + uid  +"'", sqlConnection1);
        imgtext1.Fill(dss, "wt_certificate");

        if (!dss.Tables[0].Rows.Count.Equals(0))
        {
            Response.Redirect("Admin_certifcte.aspx?ret=exist");
        }
        else
        {

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from wt_enroll where Admn_No='" + uid + "'", sqlConnection);
            imgtext.Fill(ds, "wt_enroll");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtid.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
                fname.Text = ds.Tables[0].Rows[0]["Fname"].ToString();
                lname.Text = ds.Tables[0].Rows[0]["Lname"].ToString();
                address.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                city.Text = ds.Tables[0].Rows[0]["City"].ToString();
                state.Text = ds.Tables[0].Rows[0]["State"].ToString();
                country.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                //  zip.Text = ds.Tables[0].Rows[0]["Zip"].ToString();
                //  work.Text = ds.Tables[0].Rows[0]["Ph_Work"].ToString();
                // home.Text = ds.Tables[0].Rows[0]["Ph_Home"].ToString();
                mobile.Text = ds.Tables[0].Rows[0]["Mobile_No"].ToString();
                // fax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
                email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                education.Text = ds.Tables[0].Rows[0]["Ed_Qual"].ToString();
                workingon.Text = ds.Tables[0].Rows[0]["Curr_Working"].ToString();
                course.Text = ds.Tables[0].Rows[0]["Course_Enroll"].ToString();
                btnsubmit.Visible = true;

                //  c_startfrom.Value = ds.Tables[0].Rows[0]["Join_Date"].ToString();
                //  hear.Text = ds.Tables[0].Rows[0]["H_About"].ToString();
                //   referral.Text = ds.Tables[0].Rows[0]["Ref_Name"].ToString();
                //  imm_status.Text = ds.Tables[0].Rows[0]["Immig_Status"].ToString();
                //    add_infm.Text = ds.Tables[0].Rows[0]["Addl_Info"].ToString();



            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        string streg = string.Empty;
        string fName1=string.Empty;
           string fName2=string.Empty;
           string fName3=string.Empty;
           string fName4=string.Empty;
        string enid=string.Empty;
        enid=txtid.Text.ToString();


           if (FileUpload1.PostedFile != null)
        {
             int fLen = FileUpload1.PostedFile.ContentLength;
             if (fLen != 0)
             {
               fName1 = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                 FileUpload1.PostedFile.SaveAs(Server.MapPath("Certificates/" + enid + fName1));
             }
           }
   if (FileUpload2.PostedFile != null)
        {
             int fLen = FileUpload2.PostedFile.ContentLength;
             if (fLen != 0)
             {
               fName2 = System.IO.Path.GetFileName(FileUpload2.PostedFile.FileName);
               FileUpload2.PostedFile.SaveAs(Server.MapPath("Certificates/" + enid + fName2));
             }
   }
          if (FileUpload3.PostedFile != null)
        {
             int fLen = FileUpload3.PostedFile.ContentLength;
             if (fLen != 0)
             {
               fName3 = System.IO.Path.GetFileName(FileUpload3.PostedFile.FileName);
               FileUpload3.PostedFile.SaveAs(Server.MapPath("Certificates/" + enid + fName3));
             }
          }
          if (FileUpload4.PostedFile != null)
          {
              int fLen = FileUpload4.PostedFile.ContentLength;
              if (fLen != 0)
              {
                  fName4 = System.IO.Path.GetFileName(FileUpload4.PostedFile.FileName);
                  FileUpload4.PostedFile.SaveAs(Server.MapPath("Certificates/" + enid + fName4));
              }
          }

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();

        SqlCommand cmd = new SqlCommand("insert into wt_certificate (enroll_id,course_id,Exp_years,Exp_months,Skills,Fn_area,Ind_type,Edu_qual,Major,PG,P_pg,exam_name1,certificate1,exam_name2,certificate2,exam_name3,certificate3,exam_name4,certificate4,Pdate) VALUES (@enid,@cid,@aexp_years,@aexp_months,@askills,@afn_area,@aind_type,@aedu_qual,@amajor,@apg,@ap_pg,@exam1,@cert1,@exam2,@cert2,@exam3,@cert3,@exam4,@cert4,@postdate);", connection);

        cmd.Parameters.Add(new SqlParameter("@enid", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cid", SqlDbType.NVarChar, 50));

        cmd.Parameters.Add(new SqlParameter("@aexp_years", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@aexp_months", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@askills", SqlDbType.NVarChar, 20000));
        cmd.Parameters.Add(new SqlParameter("@afn_area", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@aind_type", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@aedu_qual", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@amajor", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@apg", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@ap_pg", SqlDbType.NVarChar, 50));

        cmd.Parameters.Add(new SqlParameter("@exam1", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cert1", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@exam2", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cert2", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@exam3", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cert3", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@exam4", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@cert4", SqlDbType.NVarChar, 50));

      



        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

        cmd.Parameters["@enid"].Value = Convert.ToString(txtid.Text.Replace("'", "''").Trim());
        cmd.Parameters["@cid"].Value = Convert.ToString(admno.Text);


        cmd.Parameters["@aexp_years"].Value = Convert.ToString(expyear.Text);

        cmd.Parameters["@aexp_months"].Value = Convert.ToString(expmonths.Text);
        cmd.Parameters["@askills"].Value = Convert.ToString(txtskill.Text);
        
        cmd.Parameters["@afn_area"].Value = Convert.ToString(fnarea.Text);
        cmd.Parameters["@aind_type"].Value = Convert.ToString(indtype.Text);

        cmd.Parameters["@aedu_qual"].Value = Convert.ToString(edu.Text);
        cmd.Parameters["@amajor"].Value = Convert.ToString(edu_major.Text);

       cmd.Parameters["@apg"].Value = Convert.ToString(pgcourse.Text);
       cmd.Parameters["@ap_pg"].Value = Convert.ToString(post_pg.Text);

       // cmd.Parameters["@apg"].Value = pgcourse.SelectedValue.ToString();
      //  cmd.Parameters["@ap_pg"].Value = post_pg.SelectedValue.ToString();

        cmd.Parameters["@exam1"].Value = Convert.ToString(exam1.Text);
        cmd.Parameters["@cert1"].Value = fName1;

        cmd.Parameters["@exam2"].Value = Convert.ToString(exam2.Text);
        cmd.Parameters["@cert2"].Value = fName2;

        cmd.Parameters["@exam3"].Value = Convert.ToString(exam3.Text);
        cmd.Parameters["@cert3"].Value = fName3;

        cmd.Parameters["@exam4"].Value = Convert.ToString(exam4.Text);
        cmd.Parameters["@cert4"].Value = fName4;


        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();


        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();

        Response.Redirect("Admin_certifcte.aspx?ret=ok");

    }
}
