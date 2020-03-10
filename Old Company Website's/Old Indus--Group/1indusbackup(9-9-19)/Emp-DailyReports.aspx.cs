using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Emp_DailyReports : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string emailid = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                emailid = Session["userid"].ToString();

                SqlDataAdapter sdaaaaa = new SqlDataAdapter("select * from employeereg1 where emailid='" + emailid + "'  order by userid asc", con);
                DataSet dssss = new DataSet();
                sdaaaaa.Fill(dssss);
                if (dssss.Tables[0].Rows.Count > 0)
                {
                    txtFirstName.Text = dssss.Tables[0].Rows[0]["firstname"].ToString();
                    txtempid.Text = dssss.Tables[0].Rows[0]["empid"].ToString();
                    txtemailid.Text = dssss.Tables[0].Rows[0]["emailid"].ToString();
                    txtlast.Text = dssss.Tables[0].Rows[0]["lastname"].ToString();
                }

                Binddata(emailid);
               
               
            }
        }
    }

    private void Binddata(string emailid)
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_DailyReports where emailid='" + emailid + "' order by pdate desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
        gview1.Visible = false;
        gview.Visible = true;

        lnkshow.Visible = false;
        lnkcreate.Visible = true;
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata(emailid);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string pdate = System.DateTime.Now.ToString();
         DateTime d = new DateTime();
                             d = DateTime.UtcNow.AddHours(-4);
        con.Open();
        string s = "insert into IG_DailyReports(empid,firstname,lastname,emailid,mobile,subject,discription,pdate) values ('" + txtempid.Text + "','" + txtFirstName.Text + "','" + txtlast.Text + "','" + txtemailid.Text + "','" + txtmobile.Text + "','" + txtsubject.Text + "','" + txtdes.Text + "','" + d + "') ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string strscpt = "alert ('Data Saved');location.replace('Emp-DailyReports.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp-DailyReports.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }

       // empid,firstname,lastname,emailid,mobile,discription,pdate 
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-DailyReports.aspx");
    }

    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        gview.Visible = false;
        gview1.Visible = true;
        lnkshow.Visible = true;
        lnkcreate.Visible = false;
    }

    protected void lnkshow_Click(object sender, EventArgs e)
    {
        gview.Visible = true;
        gview1.Visible = false;
        lnkshow.Visible = false;
        lnkcreate.Visible = true;
    }
}