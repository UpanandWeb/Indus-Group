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

public partial class Admin_States_Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }

        if (!IsPostBack)
        {

            FillDrop(country, "select intCountry_id,txtCountry_name from Country_Master", "intCountry_id", "txtCountry_name", "Select Country");

        }

    }


    protected void FillDrop(System.Web.UI.WebControls.DropDownList dp, string stm, string ValueFld, string TextFld, string dfltTxt)
    {
        //SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["DB_Connect"]);
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        con.Open();
        SqlCommand cmd = new SqlCommand(stm, con);
        SqlDataReader rdr = cmd.ExecuteReader();
        try
        {

            dp.DataValueField = ValueFld;
            dp.DataTextField = TextFld;
            dp.DataSource = rdr;
            dp.DataBind();
        }
        finally
        {
            if (!(rdr == null))
            {
                rdr.Close();
            }
            dp.Items.Insert(0, dfltTxt);
            dp.SelectedIndex = 0;
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        string arrlx = string.Empty;


        string useremail = emailid.Text.ToString();

        string[] myArr = useremail.Split(new Char[] { ',' });
        string streg = string.Empty;

        for (int i = 0; i <= myArr.Length - 1; i++)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("insert into State_Master (txtState,intCountryId,dtEntrydate) VALUES(@aemail,@acontid,@postdate)", connection);

            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acontid", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

            //cmd.Parameters["@aemail"].Value = useremail;
            cmd.Parameters["@aemail"].Value = myArr[i].ToString();
            cmd.Parameters["@acontid"].Value = Convert.ToString(country.SelectedItem.Value);
            cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();


            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        Response.Redirect("Admin_States_Create.aspx?ret=ok");

    }
}
