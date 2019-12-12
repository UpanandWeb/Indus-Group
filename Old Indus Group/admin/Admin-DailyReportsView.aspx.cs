using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_DailyReportsView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string emailid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                if (Request.QueryString["sid"] != null)
                {
                    string usid = string.Empty;

                    usid = Request.QueryString["sid"].ToString();
                    SqlDataAdapter da = new SqlDataAdapter("Select * from IG_DailyReports where idr='" + usid + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtFirstName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                        txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                        txtemailid.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                        txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        txtsubject.Text = ds.Tables[0].Rows[0]["subject"].ToString();
                        txtdes.Text = ds.Tables[0].Rows[0]["discription"].ToString();

                        txtFirstName.Enabled = false;
                        txtlast.Enabled = false;
                        txtempid.Enabled = false;
                        txtemailid.Enabled = false;
                        txtmobile.Enabled = false;
                        txtsubject.Enabled = false;
                        txtdes.Enabled = false;
                    }
                }
                if (Request.QueryString["sid1"] != null)
                {
                    string usid = string.Empty;

                    usid = Request.QueryString["sid1"].ToString();
                    SqlDataAdapter da = new SqlDataAdapter("Select * from IG_DailyReports where idr='" + usid + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtFirstName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                        txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                        txtemailid.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                        txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                        txtsubject.Text = ds.Tables[0].Rows[0]["subject"].ToString();
                        txtdes.Text = ds.Tables[0].Rows[0]["discription"].ToString();
                    }
                }
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-DailyReports.aspx");
    }

}