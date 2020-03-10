using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostResume : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    exception err = new exception();
    static string excep_page = "PostResume.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            
        }
    }

    /// <summary>
    /// summary description to Upload the file
    /// </summary>
    private void StartUpLoad()
    {
        string Name = FileUpload1.FileName.ToString();
        string FilePath = ("~/Resume/") + Name.ToString();
        FileUpload1.SaveAs(Server.MapPath(FilePath));

        if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
        {
            ExecuteInsert(Name, FilePath);
            Response.Write("Save Successfully!");
        }
    }

    /// <summary>
    /// summary description to insert resume details into table
    /// </summary>
    /// <param name="Name">File Name</param>
    /// <param name="FilePath">File path</param>
    private void ExecuteInsert(string Name, string FilePath)
    {
        string sql = "INSERT INTO post_resume (ufname,email,pwd,location,mob,expyrs,expmonths,skills,profileheading,industry,functionalarea,basiceducation,mastereducation,filename,filepath) VALUES "
                    + " (@ufname,@email,@pwd,@location,@mob,@expyrs,@expmonths,@skills,@profileheading,@industry,@functionalarea,@basiceducation,@mastereducation,@filename,@filepath)";
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlParameter[] param = new SqlParameter[15];
            param[0] = new SqlParameter("@ufname", SqlDbType.NVarChar, 50);
            param[1] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[2] = new SqlParameter("@pwd", SqlDbType.VarChar, 50);
            param[3] = new SqlParameter("@location", SqlDbType.VarChar, 150);
            param[4] = new SqlParameter("@mob", SqlDbType.VarChar, 20);
            param[5] = new SqlParameter("@expyrs", SqlDbType.VarChar, 50);
            param[6] = new SqlParameter("@expmonths", SqlDbType.NVarChar, 50);
            param[7] = new SqlParameter("@skills", SqlDbType.VarChar, 50);
            param[8] = new SqlParameter("@profileheading", SqlDbType.VarChar, 50);
            param[9] = new SqlParameter("@industry", SqlDbType.VarChar, 50);
            param[10] = new SqlParameter("@functionalarea", SqlDbType.VarChar, 50);
            param[11] = new SqlParameter("@basiceducation", SqlDbType.NVarChar, 50);
            param[12] = new SqlParameter("@mastereducation", SqlDbType.VarChar, 50);
            param[13] = new SqlParameter("@filename", SqlDbType.VarChar, 100);
            param[14] = new SqlParameter("@filepath", SqlDbType.VarChar, 100);

            param[0].Value = txtfullname.Text;
            param[1].Value = txtemail.Text;
            param[2].Value = txtpwd.Text;
            param[3].Value = txtlocation.Text;
            param[4].Value = txtmob.Text;
            param[5].Value = ddlyears.SelectedItem.Text;
            param[6].Value = ddlmonths.SelectedItem.Text;
            param[7].Value = txtskills.Text;
            param[8].Value = txtheadingprofile.Text;
            param[9].Value = ddlindustry.SelectedItem.Text;
            param[10].Value = ddlfunctionalarea.SelectedItem.Text;
            param[11].Value = ddlbasicedu.SelectedItem.Text;
            param[12].Value = ddlmasteredu.SelectedItem.Text;
            param[13].Value = Name;
            param[14].Value = FilePath;

            for (int i = 0; i < param.Length; i++)
            {
                cmd.Parameters.Add(param[i]);
            }
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }

        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ErrorPage.aspx");
        }

        finally
        {
            conn.Close();
        }
    }

    /// <summary>
    /// summary description for submit button to post the resume.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        StartUpLoad();
        string strScript = "";
        strScript = "alert('Thanking you! You have Posted Your Resume successfully.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        txtfullname.Text = "";
        txtemail.Text = "";
        txtpwd.Text = "";
        txtlocation.Text = "";
        txtmob.Text = "";
        ddlyears.SelectedItem.Text = "Years";
        ddlmonths.SelectedItem.Text = "Months";
        ddlindustry.SelectedItem.Text = "Select Industry Type";
        ddlfunctionalarea.SelectedItem.Text = "Select Functional Area";
        ddlbasicedu.SelectedItem.Text = "Select";
        ddlmasteredu.SelectedItem.Text = "Select";
    }

    /// <summary>
    /// summary code for reset button
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtfullname.Text = "";
        txtemail.Text = "";
        txtpwd.Text = "";
        txtlocation.Text = "";
        txtmob.Text = "";
        ddlyears.SelectedIndex = -1;
        ddlmonths.SelectedIndex = -1;
        ddlindustry.SelectedIndex = -1;
        ddlfunctionalarea.SelectedIndex = -1;
        ddlbasicedu.SelectedIndex = -1;
        ddlmasteredu.SelectedIndex = -1;
    }
}