using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_H1B_CheckList : System.Web.UI.Page
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

            SqlDataAdapter da = new SqlDataAdapter("select lastname +' '+ firstname as name , * from employeereg1 where status=1 and empid like 'IGI%'  order by firstname asc", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddemp.DataTextField = "name";
                ddemp.DataValueField = "userid";
                ddemp.DataSource = ds;
                ddemp.DataBind();
                ddemp.Items.Insert(0, "Select Employee");
            }
        }
    }
    protected void h1checklist_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H1B-CheckList.aspx");
    }
    protected void h4application_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H4-CheckList.aspx");
    }
    protected void h1information_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-H1B-InformationSheet.aspx");
    }
    protected void downloadfile_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Download-Applications.aspx");
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string email = ddemp.SelectedValue;

        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            email = Findemail(email);
        }

        List<string> menulist = new List<string>();

        if (chk1.Checked == true)
        {
            string employee = "H-1B Application CheckList  2019";
            menulist.Add(employee);
        }
        if (chk2.Checked == true)
        {
            string employee = "H-4 Application CheckList 2019";
            menulist.Add(employee);
        }
        if (chk3.Checked == true)
        {
            string employee = "H1-B Information Sheet for New Emp  2019";
            menulist.Add(employee);
        }

        if (menulist.Count > 0)
        {
            for (int i = 0; i < menulist.Count; i++)
            {
                string chechitem = Convert.ToString(menulist[i]);

                con.Open();
                string s1 = "insert into IG_Admin_Forms (emailid, Formname) values('" + email + "','" + chechitem + "') ";
                SqlCommand cmd = new SqlCommand(s1, con);
                int i1 = cmd.ExecuteNonQuery();
                con.Close();
                if (i1 == 1)
                {
                    ddemp.SelectedIndex = -1;
                    chk1.Checked = false;
                    chk2.Checked = false;
                    chk3.Checked = false;

                    string strscpt = "alert ('Permission gave to Employee');";   
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
        }
        else
        {
            string strscpt = "alert ('Select any Checkbox');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            string id = ddemp.SelectedValue;
            SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["emailid"] = ds.Tables[0].Rows[0]["emailid"].ToString();
            }
        }
    }

    private string Findemail(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["emailid"].ToString();
    }
}