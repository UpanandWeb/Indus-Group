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

public partial class admin_Admin_Download_Applications : System.Web.UI.Page
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

            Bindnew();
        }
    }

    private void Bindnew()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_H1BApplications  order by fname Asc", con);
        da.Fill(ds, "IG_H1BApplications");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bindnew();
    }
    protected void lnkactivate_Command(object sender, CommandEventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string FID1 = GridView1.DataKeys[gvrow.RowIndex].Value.ToString();
        string Query = "";
        Query = "select * from IG_H1BApplications where aid='" + FID1 + "'";
        SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
        con.Open();
        SqlCommand cmd = new SqlCommand(Query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        string Fname = "";
        while (dr.Read())
        {
            Fname = dr["applicationname"].ToString();
        }
        con.Close();
        DataSet dsupload = new DataSet();
        sdaupload.Fill(dsupload);
        if (!dsupload.Tables[0].Rows.Count.Equals(0))
        {
            string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["applicationname"]);
            System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/H1BUpload/" + Fname));
            if (file.Exists)
            {
                Response.Clear();
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                Response.AddHeader("content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";// 
                Response.WriteFile(file.FullName);
                Response.End();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File doesnot Exist');", true);
            }
        }
    }
    protected void imgbtndel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IG_H1BApplications where aid=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Application Details has been deleted Successfully');location.replace('Admin-Download-Applications.aspx');", true);
        }
    }
}