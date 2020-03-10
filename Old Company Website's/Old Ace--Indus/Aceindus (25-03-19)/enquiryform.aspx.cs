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

public partial class enquiryform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblerrormsg.Text = "";
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
   
    protected void btnreset_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < chboxInterested.Items.Count; i++)
        {
            chboxInterested.Items[i].Selected = false;

        }

        txtname.Text = "";
        txtline1.Text = "";
        txtline2.Text = "";
        txtmobile.Text = "";
        txtphone.Text = "";
     
        txtemail.Text = "";
        ddlcountry.SelectedIndex = 0;
        ddlfind.SelectedIndex = 0;
        ddlstate.SelectedIndex = 0;

    }
    protected void btnsubmt_Click(object sender, EventArgs e)
    {
        //start of try-catch block: try is for insertion of form values
        try
        {
            //To put the selected checkbox list values 
            string strchkl = "";
            // To insert multiple selected checkbox list values into the database

            for (int i = 0; i < chboxInterested.Items.Count - 1; i++)
            {
                if (chboxInterested.Items[i].Selected)
                {

                    if (strchkl == "")
                    {
                        strchkl = chboxInterested.Items[i].Text;
                    }
                    else
                    {
                        strchkl += "," + chboxInterested.Items[i].Text;
                    }
                }
            }
            //making connection
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlCommand cmd = new SqlCommand("Sp_EnquiryForm", connection);
            
            //adding parameters to command
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = txtname.Text;
            cmd.Parameters.Add("@addr1", SqlDbType.NVarChar, 50).Value = txtline1.Text;
            cmd.Parameters.Add("@addr2", SqlDbType.NVarChar, 50).Value = txtline2.Text;
            cmd.Parameters.Add("@country", SqlDbType.NVarChar, 50).Value = ddlcountry.SelectedItem.Text;
            cmd.Parameters.Add("@state", SqlDbType.NVarChar, 50).Value = ddlstate.SelectedItem.Text;
            cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 50).Value = txtphone.Text;
            cmd.Parameters.Add("@mobile", SqlDbType.NVarChar, 50).Value = txtmobile.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtemail.Text;
            cmd.Parameters.Add("@findus", SqlDbType.NVarChar, 50).Value = ddlfind.SelectedItem.Value;
            cmd.Parameters.Add("@interestedin", SqlDbType.NVarChar, 4000).Value = strchkl; 
            //to open connection
            connection.Open();
            //to execute command
            cmd.ExecuteNonQuery();
            //to close connection
            connection.Close();
            string strScript = "";
            strScript = "alert('Your details are sended Sucessfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

           
        }
        catch (Exception ex)
        {
            lblerrormsg.Text = ex.Message;
        }
    }
    protected void chboxInterested_SelectedIndexChanged(object sender, EventArgs e)
    {
         for (int i = 0; i < chboxInterested.Items.Count; i++)
            {
                if (chboxInterested.Items[12].Selected == true)
                {
                       chboxInterested.Items[i].Selected = true;
                   
                }
                
            }
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
                ddlstate.Items.Add("");
                ddlstate.Items[i].Text = ds1.Tables[0].Rows[i - 1]["txtState"].ToString();
                ddlstate.Items[i].Value = ds1.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
    }
   
}

