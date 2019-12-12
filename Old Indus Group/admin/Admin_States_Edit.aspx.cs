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

public partial class Admin_States_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = string.Empty;
        DataSet ds = new DataSet();

        uid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from State_Master where intState_Id=" + uid, connection);
            imgtext.Fill(ds, "State_Master");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                emailid.Text = ds.Tables[0].Rows[0]["txtState"].ToString();
                country.Text = ds.Tables[0].Rows[0]["intCountryId"].ToString();

            }

            FillDrop(country, "select intCountry_id,txtCountry_name from Country_Master", "intCountry_id", "txtCountry_name", "Select Country");
        }

    }


    protected void FillDrop(System.Web.UI.WebControls.DropDownList dp, string stm, string ValueFld, string TextFld, string dfltTxt)
    {
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
        try
        {
            string streg = string.Empty;
            string usid = Request.QueryString["cid"].ToString();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("Update State_Master set txtState=@aemail,intCountryId=@acontid,dtEntrydate=@postdate where intState_Id=" + usid + ";", connection);

            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acontid", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

            cmd.Parameters["@aemail"].Value = emailid.Text.ToString();
            cmd.Parameters["@acontid"].Value = Convert.ToString(country.SelectedItem.Value);
            cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();


            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();

            Response.Redirect("Admin_States.aspx?ret=edit");

        }
        catch
        {
        }

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_States.aspx");
    }
}
