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

public partial class Admin_Admin_Edit_Events : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            if (Request.QueryString["cid"] != null)
            {
                string id = Request.QueryString["cid"].ToString();
                SqlDataAdapter da = new SqlDataAdapter("select * from   ST_Gallery  where gid= '" + id + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txttitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    txtkeywords.Text = ds.Tables[0].Rows[0]["Keywords"].ToString();

                    imgmain.ImageUrl = "~/design/soroptimist/admin/UploadImages/" + ds.Tables[0].Rows[0]["Main_Image"].ToString();

                    SqlDataAdapter da1 = new SqlDataAdapter("select * from   ST_Sub_Gallery  where gid= '" + id + "'", con);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds1;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }

    protected DataSet Permission()
    {
        if (Session["username"] != null)
        {
            string user = Session["username"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select * from   ST_USers where status=1 and username='" + user + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        else
        {
            return null;
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["galeryedit"].ToString() == "1")
            {
                string title = txttitle.Text;
                string pdate = System.DateTime.Now.ToString();
                string postby = Session["username"].ToString();

                string key = txtkeywords.Text;
                string id= Request.QueryString["cid"].ToString();

                con.Open();
                string s = "update ST_Gallery set Title='" + title + "',Posted_Date='" + pdate + "',Posted_By='" + postby + "',Keywords='" + key + "' where gid='"+id+"'";
                SqlCommand cmd = new SqlCommand(s, con);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    Multiple_Images_upload(id);
                    string strscpt = "alert ('Data Saved');location.replace('Admin-Events.aspx')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);

                    txttitle.Text = "";
                    txtkeywords.Text = "";
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    public void Multiple_Images_upload(string gid3)
    {
        if (gid3 != "")
        {
            if (otherupload.HasFile)
            {
                con.Open();
                string s2 = "delete ST_Sub_Gallery where gid='" + gid3 + "'";
                SqlCommand cmd2 = new SqlCommand(s2, con);
                int j2 = cmd2.ExecuteNonQuery();
                con.Close();
                if (j2 == 1)
                {

                }

                //   string userid = Convert.ToString(Session["UserName"]);
                HttpFileCollection fileCollection = Request.Files;
                for (int i = 1; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);

                    string path = Server.MapPath(("~/design/soroptimist/admin/UploadImages/" + fileName));
                    otherupload.SaveAs(path);

                    string imgname = fileName;
                    if (uploadfile.ContentLength > 0)
                    {
                        uploadfile.SaveAs(path);
                    }

                    string pdate = System.DateTime.Now.ToString();
                    string postby = Session["username"].ToString();


                    con.Open();
                    string s = "insert into ST_Sub_Gallery(GId,Sub_Image,Posted_Date,Posted_By) values   ('" + gid3 + "','" + fileName + "','" + pdate + "','" + postby + "') ";
                    SqlCommand cmd = new SqlCommand(s, con);
                    int j = cmd.ExecuteNonQuery();
                    con.Close();
                    if (j == 1)
                    {
                        path = "";
                    }
                    else
                    {
                        string str = "alert('Sorry Try Again');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
            }
        }
        else
        {
            string str = "alert('Session expired PLs Login again');location.replace('Default.aspx')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
    protected void Btnmainupload1_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["galeryedit"].ToString() == "1")
            {
                string title = txttitle.Text;
                string pdate = System.DateTime.Now.ToString();
                string postby = Session["username"].ToString();
                string key = txtkeywords.Text;
                    string id= Request.QueryString["cid"].ToString();

                string fppath = string.Empty;
                string fppath1 = string.Empty;
                string imgName = "";
                if (mainupload.HasFile)
                {
                    imgName = System.IO.Path.GetFileName(mainupload.PostedFile.FileName);
                    string strextension = System.IO.Path.GetExtension(mainupload.PostedFile.FileName);

                    if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                    {
                        mainupload.PostedFile.SaveAs(Server.MapPath("~/design/soroptimist/admin/UploadImages/" + imgName));

                        con.Open();
                        string s = "update  ST_Gallery set Title='" + title + "',Main_Image='" + imgName + "',Posted_Date='" + pdate + "',Posted_By='" + postby + "',Keywords='" + key + "' where gid='" + id + "'";
                        SqlCommand cmd = new SqlCommand(s, con);
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i == 1)
                        {

                            lblmain.Text = "Main Image uploaded. if you want change other images , Please upload";
                            lblmain.Visible = true;
                        }

                    }
                    else
                    {
                        string strscpt = "alert ('Upload  a image format');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
                else
                {
                    string strscpt = "alert ('Upload  a image');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
                
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}