using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using igiit.BussinessLogic;

public partial class submitresume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {

            StateCountry coun = new StateCountry();
            DataSet ds = new DataSet();
            ds = coun.GetCounty();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    ddlcountry.Items.Add("");
                    ddlcountry.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                    ddlcountry.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
            }

        }

    }
    private void StartUpLoad()
    {

        //get the file name of the posted Resume

        string Name = file.FileName.ToString();

        //sets the image path

        string FilePath = ("~/Resume/") + Name.ToString();
        //string imgPath = ConfigurationManager.AppSettings["imgPath"];

        //then save it to the Folder

        file.SaveAs(Server.MapPath(FilePath));



        //validates the posted file before saving

        if (file.PostedFile != null && file.PostedFile.FileName != "")
        {

            ExecuteInsert(Name, FilePath);

            Response.Write("Saved Successfully!");


        }

    }

    private void ExecuteInsert(string Name, string FilePath)
    {
        //making connection
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlCommand cmd = new SqlCommand("Sp_subResume", connection);
        try
        {
        
        //adding parameters to command
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@fname", SqlDbType.NVarChar, 50).Value = txtfname.Text;
        cmd.Parameters.Add("@lname", SqlDbType.NVarChar, 50).Value = txtlname.Text;
        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtemail.Text;
        cmd.Parameters.Add("@dname", SqlDbType.NVarChar, 50).Value = txtdname.Text;
        cmd.Parameters.Add("@passwd", SqlDbType.NVarChar, 50).Value = txtpwd.Text;
        cmd.Parameters.Add("@dob", SqlDbType.NVarChar, 50).Value = txtdob.Text;
        cmd.Parameters.Add("@mob_code", SqlDbType.NVarChar, 50).Value = txtcode.Text;
        cmd.Parameters.Add("@mobile", SqlDbType.NVarChar, 50).Value = txtmob.Text;
        cmd.Parameters.Add("@ph_code", SqlDbType.NVarChar, 50).Value = txtcod.Text;
        cmd.Parameters.Add("@ph_std", SqlDbType.NVarChar, 50).Value = txtstd.Text;
        cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 50).Value = txtemail.Text;
        cmd.Parameters.Add("@country", SqlDbType.NVarChar, 50).Value = ddlcountry.SelectedItem.Text;
        cmd.Parameters.Add("@pref_loc", SqlDbType.NVarChar, 4000).Value = ddljobloc.SelectedItem.Text;
        cmd.Parameters.Add("@exp_yrs", SqlDbType.NVarChar, 50).Value = ddlyears.SelectedItem.Value;
        cmd.Parameters.Add("@exp_mons", SqlDbType.NVarChar, 50).Value = ddlmonths.SelectedItem.Value;
        cmd.Parameters.Add("@func_area", SqlDbType.NVarChar, 50).Value = ddlfA.SelectedItem.Value;
        cmd.Parameters.Add("@key_skils", SqlDbType.NVarChar, 50).Value = txtfield.Text;
        cmd.Parameters.Add("@academic_qual", SqlDbType.NVarChar, 50).Value = ddlAcademic.SelectedItem.Value;
        cmd.Parameters.Add("@resume_name", SqlDbType.NVarChar, 4000).Value = Name;
        cmd.Parameters.Add("@resume_path", SqlDbType.NVarChar, 4000).Value = FilePath;

        //to open connection
        connection.Open();
        //to execute command
        cmd.ExecuteNonQuery();
        //to close connection
        connection.Close();  
        


        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Insert Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            connection.Close();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
        StartUpLoad();
        string strScript = "";
        strScript = "alert('Thanking you! You have Posted Your Resume successfully.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        txtfname.Text="";
        txtlname.Text="";
        txtemail.Text="";
        txtdname.Text="";
        txtpwd.Text="";
        txtdob.Text="";
        txtmob.Text="";
        txtemail.Text="";
        txtstd.Text = "";
        txtcod.Text = "";
        txtcode.Text = "";
        ddlcountry.SelectedIndex = 0;
        ddljobloc.SelectedIndex = 0;
        ddlyears.SelectedIndex = 0;
        ddlmonths.SelectedIndex = 0;
        ddlfA.SelectedIndex = 0;
        txtfield.Text="";
        ddlAcademic.SelectedIndex = 0;
        txtrepwd.Text = "";
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        StateCountry coun = new StateCountry();
        string x = ddlcountry.SelectedItem.Value.ToString();
        DataSet ds1 = new DataSet();
        ds1 = coun.GetState(x);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds1.Tables[0].Rows.Count; i++)
            {
                ddljobloc.Items.Add("");
                ddljobloc.Items[i].Text = ds1.Tables[0].Rows[i - 1]["txtState"].ToString();
                ddljobloc.Items[i].Value = ds1.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }

    }
    protected void custvalPwd_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txtpwd.Text.Length < 6 || txtpwd.Text.Length > 12)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
