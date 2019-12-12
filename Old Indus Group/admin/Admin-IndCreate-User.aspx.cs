using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_IndCreate_User : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        ccal.EndDate = DateTime.UtcNow.AddHours(-4);
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

            if (Request.QueryString["userid"] != null)
            {
                uid = Request.QueryString["userid"].ToString();
                if (uid != "")
                {
                    SqlDataAdapter da = new SqlDataAdapter("select  * from employeereg1 where userid='" + uid + "'", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                        txtempname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                        txtphone.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        txtemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                        txtpwd.Text = ds.Tables[0].Rows[0]["pwd"].ToString();
                        txtrate.Text = ds.Tables[0].Rows[0]["hrate"].ToString();
                        txtdate.Text = ds.Tables[0].Rows[0]["rdate"].ToString();
                        txtaddress.Text = ds.Tables[0].Rows[0]["street"].ToString();
                        txtbank.Text = ds.Tables[0].Rows[0]["bankname"].ToString();
                        txtrout.Text = ds.Tables[0].Rows[0]["bankifsc"].ToString();
                        txtaccount.Text = ds.Tables[0].Rows[0]["bankacnumber"].ToString();

                        Button1.Visible = true;
                        btnsaveout.Visible = false;

                    }
                }
                else
                {
                    Button1.Visible = false;
                    btnsaveout.Visible = true;
                }
            }
        }
    }

    protected void btnsaveout_Click(object sender, EventArgs e)
    {
        string email = txtemail.Text;
        string pwd1 = txtpwd.Text;

        string date = DateTime.UtcNow.ToString("MM-dd-yyyy");
        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from employeereg1 where  emailid='" + email + "'  ", con);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);
        if ((dssss.Tables[0].Rows[0]["count"].ToString() == "0"))
        {
            string sym = ddsymbol.SelectedItem.Text;
            con.Open();
            string s = "insert into employeereg1(empid,firstname,lastname,mobile,username,emailid,pwd,hrate,rdate,street,bankname,bankswift,bankacnumber,country1,status,joindate,ratesymbol) values       ('" + txtempid.Text + "','" + txtempname.Text + "','" + txtlast.Text + "','" + txtphone.Text + "','" + txtemail.Text + "','" + txtemail.Text + "','" + pwd1 + "','" + txtrate.Text + "','" + txtdate.Text + "','" + txtaddress.Text + "','" + txtbank.Text + "','" + txtrout.Text + "','" + txtaccount.Text + "','USA',1,'" + date + "','" + sym + "') ";
            SqlCommand cmd = new SqlCommand(s, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                string strscpt = "alert ('Employee Details Saved');location.replace('Admin-IndCreate-User.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Already Email id Entered');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-IndUserDetails.aspx");
    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-IndUserDetails.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        uid = Request.QueryString["userid"].ToString();
        SqlCommand cmd = new SqlCommand("update employeereg1 set empid='" + txtempid.Text + "',firstname='" + txtempname.Text + "',lastname='" + txtlast.Text + "',mobile='" + txtphone.Text + "',username='" + txtemail.Text + "',emailid='" + txtemail.Text + "',pwd='" + txtpwd.Text + "',hrate='" + txtrate.Text + "',ratesymbol='" + ddsymbol.SelectedItem.Text + "',street='" + txtaddress.Text + "',bankname='" + txtbank.Text + "',bankswift='" + txtrout.Text + "',bankacnumber='" + txtaccount.Text + "',rdate='" + txtdate.Text + "' where userid=" + uid + "", con);
        con.Open();
        int i = cmd.ExecuteNonQuery();

        con.Close();
        if (i == 1)
        {
            string strscpt = "alert ('Employee Details Saved');location.replace('Admin-IndUserDetails.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        Response.Redirect("Admin-IndUserDetails.aspx");
    }
}