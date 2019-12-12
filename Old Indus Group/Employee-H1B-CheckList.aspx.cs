using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Employee_H1B_CheckList : System.Web.UI.Page
{
    string emailid = string.Empty;
     SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string Desig;
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
                //int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
                //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                emailid = Session["userid"].ToString();
                Desig = Convert.ToString(Session["Designation"]);

                SqlDataAdapter da = new SqlDataAdapter("select distinct Formname from IG_Admin_Forms where emailid='" + emailid + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dddownloadfile.DataTextField = "Formname";
                   // dddownloadfile.DataValueField = "fid";
                    dddownloadfile.DataSource = ds;
                    dddownloadfile.DataBind();
                    dddownloadfile.Items.Insert(0, "Select Form");
                }
            }
        }
    }
    protected void btndownload_Click(object sender, EventArgs e)
    {
        if (dddownloadfile.SelectedItem.Text == "H-1B Application CheckList  2019")
        {
            Response.Redirect("~/H1B/H-1B Application CheckList  2019.doc");
        }
        if (dddownloadfile.SelectedItem.Text == "H-4 Application CheckList 2019")
        {
            Response.Redirect("~/H1B/H-4 Application CheckList 2019.doc");
        }
        if (dddownloadfile.SelectedItem.Text == "H1-B Information Sheet for New Emp  2019")
        {
            Response.Redirect("~/H1B/H1-B Information Sheet for New Emp  2019.doc");
        }
        else
        {
            string strscpt = "alert ('Please Select form');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            emailid = Session["userid"].ToString();

            string Query = "";
            Query = "select * from employeereg1 where username='" + emailid + "'";
            SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
            con.Open();
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            string Fname = "";
            while (dr.Read())
            {
                Fname = dr["firstname"].ToString();
            }
            con.Close();
            string date = Convert.ToString(DateTime.Now);

            string doc = "";
            string imgName1 = "";
            string fppath1 = string.Empty;
            if (dddownloadfile.SelectedItem.Text == "H-1B Application CheckList  2019")
            {
                doc = "H-1B Application CheckList  2019";
            }
            if (dddownloadfile.SelectedItem.Text == "H-4 Application CheckList 2019")
            {
                doc = "H-4 Application CheckList 2019";
            }
            if (dddownloadfile.SelectedItem.Text == "H1-B Information Sheet for New Emp  2019")
            {
                doc = "H1-B Information Sheet for New Emp  2019";
            }
            else
            {
                string strscpt = "alert ('Please Select form');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }

            if (File1.HasFile)
            {
                imgName1 = System.IO.Path.GetFileName(File1.PostedFile.FileName);
                string strextension1 = System.IO.Path.GetExtension(File1.PostedFile.FileName);
                string filename = Fname + "-" + doc + "-" + imgName1;

                if ((strextension1 == ".doc") || (strextension1 == ".docx"))
                {
                    fppath1 = Server.MapPath("~/H1BUpload/" + filename);
                    File1.PostedFile.SaveAs(Server.MapPath("~/H1BUpload/" + filename));
                    resp.Visible = true;
                    resp.Text = fppath1;
                    con.Open();
                    string s = "insert into IG_H1BApplications(emailid,fname,applicationname,date) values('" + emailid + "','" + Fname + "','" + filename + "','" + date + "') ";
                    SqlCommand cmdw = new SqlCommand(s, con);
                    int i = cmdw.ExecuteNonQuery();
                    con.Close();
                    if (i == 1)
                    {
                        string strscpt = "alert ('File Uploaded Successfully');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
            }
            else
            {
                string strscpt = "alert ('Please Upload File');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
    }
}