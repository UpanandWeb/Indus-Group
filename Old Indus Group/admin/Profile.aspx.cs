using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;
using System.Web.Configuration;

public partial class admin_Profile : System.Web.UI.Page
{
    string id="";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
                SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
                ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                id = Session["LoginId"].ToString();
                SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Users_Information where UserId= '" + id + "'", con);
                DataSet dsgetUserIdData = new DataSet();
                imgtext.Fill(dsgetUserIdData, "Users_Information");

                if (!dsgetUserIdData.Tables[0].Rows.Count.Equals(0))
                {
                    txtedfname.Text = dsgetUserIdData.Tables[0].Rows[0]["FName"].ToString();
                    txtedlname.Text = dsgetUserIdData.Tables[0].Rows[0]["LName"].ToString();
                    txtedpwd.Text = dsgetUserIdData.Tables[0].Rows[0]["Password"].ToString();
                    txtedaddress.Text = dsgetUserIdData.Tables[0].Rows[0]["Address"].ToString();
                    txtUserId.Text = dsgetUserIdData.Tables[0].Rows[0]["UserId"].ToString();
                    txtedcontact.Text = dsgetUserIdData.Tables[0].Rows[0]["PhNo"].ToString();
                    txtedmob.Text = dsgetUserIdData.Tables[0].Rows[0]["mobile"].ToString();
                    txtedmail.Text = dsgetUserIdData.Tables[0].Rows[0]["EmailId"].ToString();
                }
            }
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string cFName = Convert.ToString(txtedfname.Text);
        string cLName = Convert.ToString(txtedlname.Text);
        string cUserId = Convert.ToString(txtUserId.Text);
        string cPassword = Convert.ToString(txtedpwd.Text);
        string cAddress = Convert.ToString(txtedaddress.Text);
        string cContactNo = Convert.ToString(txtedcontact.Text);
        string cMobile = Convert.ToString(txtedmob.Text);

        string qry = "update Users_Information set 	Password='" + cPassword + "',	FName='" + cFName + "',	LName='" + cLName + "',	";
        qry += "  Address='" + cAddress + "',mobile='" + cMobile + "',	PhNo='" + cContactNo + "' where UserId='" + cUserId + "'";

        con.Open();
        SqlCommand cmd1 = new SqlCommand(qry, con);
        int k = cmd1.ExecuteNonQuery();
        con.Close();

        if (k == 1)
        {
            string strScript = "alert('Details successfully Updated');location.replace('Profile.aspx')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Home.aspx");
    }
}