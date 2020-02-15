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

public partial class Admin_Admin_AddPost : System.Web.UI.Page
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

            Btnmainupload.Visible = false;
            otherimages.Visible = false;
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
            if (ds.Tables[0].Rows[0]["newspost"].ToString() == "1")
            {
                if (ddtype.SelectedItem.Text != "Select")
                {
                    if ((ddtype.SelectedItem.Text == "Work") ||(ddtype.SelectedItem.Text == "News"))
                    {
                        string type = ddtype.SelectedItem.Text;
                        string title = txttitle.Text;

                        string disc = txtdis.Text;
                        string pdate = System.DateTime.Now.ToString();
                        //string postby = txtuploaddedby.Text;
                        string postby = Session["username"].ToString();

                        string key = txtkeywords.Text;
                        string fppath = string.Empty;
                        string fppath1 = string.Empty;
                        string imgName = "";
                        if (mainupload.HasFile)
                        {
                            imgName = System.IO.Path.GetFileName(mainupload.PostedFile.FileName);
                            string strextension = System.IO.Path.GetExtension(mainupload.PostedFile.FileName);

                            if ((strextension == ".gif") || (strextension == ".jpeg") || (strextension == ".jpg") || (strextension == ".bmp") || (strextension == ".JPEG") || (strextension == ".png") || (strextension == ".PNG") || (strextension == ".JPG") || (strextension == ".GIF"))
                            {
                                //mainupload.PostedFile.SaveAs(Server.MapPath("~/admin/UploadImages/" + imgName));
                                mainupload.PostedFile.SaveAs(Server.MapPath("~/design/soroptimist/admin/UploadImages/" + imgName));

                                con.Open();
                                string s = "insert into ST_Posts(Post_Type,Title,Main_Image,Discription,Posted_Date,Posted_By,Keywords) values   ('" + type + "','" + title + "','" + imgName + "','" + disc + "','" + pdate + "','" + postby + "','" + key + "') ";
                                SqlCommand cmd = new SqlCommand(s, con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();
                                if (i == 1)
                                {
                                    string strscpt = "alert ('Data Saved');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);

                                    ddtype.SelectedIndex = -1;
                                    txttitle.Text = "";
                                    txtdis.Text = "";
                                    //txtuploaddedby.Text = "";
                                    txtkeywords.Text = "";

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
                }
                else
                {
                    string strscpt = "alert ('Please Select Post Type');";
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
    protected void Btnmainupload_Click(object sender, EventArgs e)
    {
        string id = Session["imgid"].ToString();
        Multiple_Images_upload(id);
        Session.Remove("imgid");
        string strScript = "alert('Images uploaded');location.replace('Admin-AddPost.aspx')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
    }
    public void Multiple_Images_upload(string gid3)
    {
        if (gid3 != "")
        {
            string userid = Convert.ToString(Session["UserName"]);
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
                    //string str = "alert('File Uploaded successfully.');";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('Sorry Try Again');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
        }
        else
        {
            string str = "alert('Upload New Image');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
    protected void ddtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddtype.SelectedItem.Text == "Work")
        {
            Btnmainupload.Visible = false;
            otherimages.Visible = false;
            des.Visible = true;
            btnsave.Visible = true;
            Btnmainupload1.Visible = false;
        }
        if (ddtype.SelectedItem.Text == "News")
        {
            Btnmainupload.Visible = false;
            otherimages.Visible = false;
            des.Visible = true;
            btnsave.Visible = true;
            Btnmainupload1.Visible = false;

        }
        if (ddtype.SelectedItem.Text == "Events")
        {
            Btnmainupload.Visible = true;
            otherimages.Visible = false;
            des.Visible = false;
            Btnmainupload1.Visible = true;
            btnsave.Visible = false;
        }
        if (ddtype.SelectedItem.Text == "Gallery")
        {
            Btnmainupload1.Visible = true;
            otherimages.Visible = false;
            des.Visible = false;
            Btnmainupload.Visible = true;
            btnsave.Visible = false;
        }
    }
    protected void Btnmainupload1_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["newspost"].ToString() == "1")
            {
                if (ddtype.SelectedItem.Text != "Select")
                {
                    if ((ddtype.SelectedItem.Text == "Events") || (ddtype.SelectedItem.Text == "Gallery"))
                    {
                        string type = ddtype.SelectedItem.Text;
                        string title = txttitle.Text;
                        string pdate = System.DateTime.Now.ToString();
                        string postby = Session["username"].ToString();
                        string key = txtkeywords.Text;

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
                                string s = "insert into ST_Gallery(Post_Type,Title,Main_Image,Posted_Date,Posted_By,Keywords) values   ('" + type + "','" + title + "','" + imgName + "','" + pdate + "','" + postby + "','" + key + "') ";
                                SqlCommand cmd = new SqlCommand(s, con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();
                                if (i == 1)
                                {

                                    lblmain.Text = "Main Image uploaded. Upload other images";
                                    lblmain.Visible = true;
                                    lblmsg.Visible = true;
                                    otherimages.Visible = true;
                                    SqlDataAdapter sda = new SqlDataAdapter(" select * from ST_Gallery order by gid desc", con);
                                    DataSet dse = new DataSet();
                                    sda.Fill(dse);
                                    if (dse.Tables[0].Rows.Count != 0)
                                    {
                                        Session["imgid"] = dse.Tables[0].Rows[0]["gid"].ToString();
                                    }
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
                }
                else
                {
                    string strscpt = "alert ('Please Select Post Type');";
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