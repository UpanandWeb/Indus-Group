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

public partial class admin_Admin_NewResume : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss tt");
        string fppath1 = string.Empty;
        string imgName1 = "";
        if (resupload.HasFile)
        {
            imgName1 = System.IO.Path.GetFileName(resupload.PostedFile.FileName);
            string strextension1 = System.IO.Path.GetExtension(resupload.PostedFile.FileName);

            if ((strextension1 == ".doc") || (strextension1 == ".docx"))
            {
                fppath1 = Server.MapPath("~/Current Resumes/" + txtcname.Text + imgName1);
                resupload.PostedFile.SaveAs(Server.MapPath("~/Current Resumes/" + txtcname.Text + imgName1));
                imgName1 = txtcname.Text + imgName1;

                int st=0 ;
                if (txtstatus.SelectedItem.Text == "New")
                {
                    st = 0;
                }
                if (txtstatus.SelectedItem.Text == "Process")
                {
                    st = 1;
                }
                if (txtstatus.SelectedItem.Text == "Complete")
                {
                    st = 2;
                }
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_insertresume", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cname", txtcname.Text);
                cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@rname", txtrec.Text);
                cmd.Parameters.AddWithValue("@location", txtloc.Text);
                cmd.Parameters.AddWithValue("@opento", txtopen.Text);
                cmd.Parameters.AddWithValue("@status", st);
                cmd.Parameters.AddWithValue("@resname", imgName1);
                cmd.Parameters.AddWithValue("@remarks", txtremarks.Text);
                cmd.Parameters.AddWithValue("@pdate", date);

                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    //String str = "alert('Resume Details has been Inserted Successfully');location.replace('Admin-Resumes.aspx');";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Details has been Inserted Successfully');location.replace('Admin-Resumes.aspx');", true);

                }
            }
            else
            {
                //String str = "alert('Unsupported File');";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Unsupported File');",true);

            }
        }
        else
        {
            //String str = "alert('Please Upload File');";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Please Upload File');", true);

        }
    }
}