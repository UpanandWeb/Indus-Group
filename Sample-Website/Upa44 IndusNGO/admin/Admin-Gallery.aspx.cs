using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class admin_Admin_Gallery : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                fr.Visible = false;
                // gv.Visible = false;
                Button1.Visible = false;
                bind();
                data.Visible = false;
            }
        }
      
    }
    
    protected void btnsub_Click(object sender, EventArgs e)
    {
        if (FileUpload2.HasFile)
        {
            string id = Convert.ToString(Session["id"]);
            Multiple_Images_upload(id);
        }
        else
        {

            string category = ddl.SelectedItem.Text;
            string tit = txt1.Text;
            string content = "";
            string date = DateTime.Now.ToString();
            string image = FileUpload1.FileName.ToString();
            if (FileUpload1.HasFile)
            {
                string path = Base_dir1 + "photos/gallery/" + image;
                FileUpload1.SaveAs(path);
                SqlCommand cmd = new SqlCommand("insert into orphan_gallery values('" + tit + "','" + 1 + "','" + category + "','" + image + "','" + content + "','" + date + "') ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string strScript = "alert('Content Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                ddl.SelectedIndex = 0;
                txt1.Text = "";
            }
            else {
                string strt = "alert('please upload file');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strt, true);
                //FileUpload1.Value = "";

            }
        }

        
        //TextBox1.Text = "";
    }
    protected void post_Click(object sender, EventArgs e)
    {
        data.Visible = true;
        fr.Visible = true;
        data1.Visible = false;
        Tr2.Visible = false;
        //Tr1.Visible = true;
        Button1.Visible = false;
        post.Visible = false;
        RegularExpressionValidator1.Visible = true;
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from orphan_gallery order by id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        gv.DataSource = ds;
        gv.DataBind();

    }

    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand("delete  from orphan_gallery where id= " + id, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            bind();
        }
        if (e.CommandName == "Edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-GalleryEdit.aspx?id="+id);
        }
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();  
    }
    
    protected void ddl_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (ddl.SelectedIndex == 1)
        {
            Tr2.Visible = true;
            // Tr1.Visible = false;
            Button1.Visible = true;
        }

        else {
            Tr2.Visible = false;
            Button1.Visible = false;
        }
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
                string path = Base_dir1 + "photos/gallery/" + fileName;
                FileUpload1.SaveAs(path);

                string imgname = fileName;
                if (uploadfile.ContentLength > 0)
                {
                    uploadfile.SaveAs(path);

                   // lblMessage.Text += fileName + "Saved Successfully<br>";
                }
                string date = DateTime.Now.ToString();
                SqlCommand cmd = new SqlCommand("insert into orphan_gallerymultiples values('" + imgname + "','" + gid3 + "','"+date+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "alert('File Uploaded successfully.');";
                   Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
               // int j = bal.newgallargeimages(imgname, gid3);
              //  es.updategal1(userid, gid3);
                //if (j == 1)
                //{
                //    GAddl.SelectedIndex = -1;
                //    subddl.SelectedIndex = -1;
                //    btnUpload.Visible = false;
                //    FileUpload1.Visible = false;
                //    path = "";
                //    string str = "alert('File Uploaded successfully.');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                //}
                //else
                //{
                //    string str = "alert('Sorry Try Again');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                //}
            }
        }
        else
        {
            string str = "alert('Upload New Image');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
        string category = ddl.SelectedItem.Text;
        string tit = txt1.Text;
        string content = "";
        string date = DateTime.Now.ToString();
        string image = FileUpload1.FileName.ToString();
        string path = Base_dir1 + "photos/gallery/" + image;
        FileUpload1.SaveAs(path);
        SqlCommand cmd = new SqlCommand("insert into orphan_gallery values('" + tit + "','" + 1 + "','" + category + "','" + image + "','" + content + "','" + date + "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from orphan_gallery order by posteddate desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        string id = ds.Tables[0].Rows[0]["id"].ToString();
        Session["id"] = id;
        string strScript = "alert('Content Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
        //ddl.SelectedIndex = 0;
      //  txt1.Text = "";
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
}