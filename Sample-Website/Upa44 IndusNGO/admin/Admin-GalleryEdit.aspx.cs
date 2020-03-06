using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class admin_Admin_GalleryEdit : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    home ob = new home();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string gallgid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string innertype = Convert.ToString(ddl.SelectedItem.Text);
            gallgid = Convert.ToString(Request.QueryString["id"]);
            Session["id"] = gallgid;
            // binddata(gallgid);
            DataSet ds = new DataSet();
            ds = binddata(gallgid);
            txtimgname2.Text = ds.Tables[0].Rows[0]["title"].ToString();

            for (int i = 0; i < ddl.Items.Count; i++)
            {
                if (ddl.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["category"]))
                {
                    ddl.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;
                }
            }
            if (ddl.SelectedItem.Text == "Multiple Images")
            {
                displayformore.Visible = true;
                changetomultiple.Visible = true;
            }
            else
            {
                displayformore.Visible = false;
            }
            // if(ds.Tables[0].Rows[0]["category"].ToString()="Multiple Images")

        }
    }
    protected void btnupdatecontent_Click(object sender, EventArgs e)
    {
        //  gallgid = lblgid2.Text;

        // string galtype = GAEditddl.SelectedItem.Text;
        string id = Request.QueryString["id"];
        string title = txtimgname2.Text;
        string category = ddl.SelectedItem.Text;
        SqlCommand cmd = new SqlCommand("update orphan_gallery set title='" + title + "',category='" + category + "' where id='" + id + "' ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        string strScript = "alert('Content Updated');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);

    }
    protected void uploadmainimage_Click(object sender, EventArgs e)
    {
        // gallgid = lblgid2.Text;
        string id = Request.QueryString["id"];
        string title = txtimgname2.Text;
        //string category = ddl.SelectedItem.Text;
        //string tit = txt1.Text;
        // string content = "";
        //  string date = DateTime.Now.ToString();
        //string image = FileUpload1.FileName.ToString();
        //string path = Base_dir1 + "photos/gallery/" + image;
        // FileUpload1.SaveAs(path);
        if (FileUpload1.HasFile)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fl = Base_dir1 + "photos/gallery/" + filename;
            // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
            // string path = Server.MapPath(fl) + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(fl);
            string postdate = Convert.ToString(System.DateTime.Now.ToString());
            SqlCommand cmd = new SqlCommand("update orphan_gallery set title='" + title + "',imagename='" + filename + "',posteddate='" + postdate + "' where id='" + id + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string str = "alert('Main Image Updated successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

        }
        else
        {
            string str = "alert('Please Upload Image');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }

    }
    protected void ddlinnertype_SelectedIndexChanged(object sender, EventArgs e)
    {
        gallgid = Convert.ToString(Request.QueryString["id"]);
        string innertype = Convert.ToString(ddlinnertype.SelectedItem.Text);

        if (innertype == "Changed All Images")
        {
            singleimage.Visible = false;
            moreimage.Visible = true;
        }

        if (innertype == "Changes In Single Image")
        {
            moreimage.Visible = false;
            singleimage.Visible = true;
            changetomultiple.Visible = false;
            //tr3.Visible = true;
            //SqlDataAdapter dasingle = new SqlDataAdapter("select * from orphan_gallerymultiples where id=" +gallgid, con);
            //DataSet ds1 = new DataSet();
            //dasingle.Fill(ds1);
            DataSet ds1 = new DataSet();
            ds1 = multipleimages(gallgid);

            //ds1 = ba.admingallary1(gallgid);

            if (ds1.Tables[0].Rows.Count == 0 || ds1.Tables[0].Rows.Count == null)
            {
                singleimage.Visible = false;
            }

            else if (ds1.Tables[0].Rows.Count == 0 || ds1.Tables[0].Rows.Count < 0 || ds1.Tables[0].Rows.Count == null)
            {
                singleimage.Visible = true;
            }

            else if (ds1.Tables[0].Rows.Count > 0)
            {
                displaysingleimages();
                //DataTable dt = new DataTable();

                //dt.Columns.Add("id", typeof(int));
                //dt.Columns.Add("imagename", typeof(string));
                //dt.Columns.Add("did", typeof(int));
                //for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                //{
                //    string lll = ds1.Tables[0].Rows[i]["imagename"].ToString();
                //   //// string ll = ConfigurationManager.AppSettings["images"] + lll;
                //   // string ll =  "photos/gallery/" + lll;
                //    string l = ds1.Tables[0].Rows[i]["id"].ToString();
                //    int id = Convert.ToInt32(ds1.Tables[0].Rows[i]["did"].ToString());
                //    dt.Rows.Add(l, lll, id);
                //}
                //DataSet ds22 = new DataSet();
                //ds22.Tables.Add(dt);

                //ddlgetimages.DataSource = ds22;
                //ddlgetimages.DataBind();
                //singleimage.Visible = true;
            }
        }

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        gallgid = Convert.ToString(Request.QueryString["id"]);
        HttpFileCollection fileCollection = Request.Files;
        for (int i = 1; i < fileCollection.Count; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Path.GetFileName(uploadfile.FileName);
            string path = Base_dir1 + "photos/gallery/" + fileName;
            FileUpload2.SaveAs(path);

            string imgname = fileName;
            if (uploadfile.ContentLength > 0)
            {
                uploadfile.SaveAs(path);

                // lblMessage.Text += fileName + "Saved Successfully<br>";
            }
            string date = DateTime.Now.ToString();
            // DataSet ds = new DataSet();
            // ds = multipleimages(gallgid);
            SqlDataAdapter damultiple = new SqlDataAdapter("select * from orphan_gallerymultiples where id=" + gallgid, con);
            DataSet ds1 = new DataSet();
            damultiple.Fill(ds1);
            //string id = ds1.Tables[0].Rows[0]["id"].ToString();
            if (ds1.Tables.Count == 0)
            //if(id==null)
            {

                SqlCommand cmd = new SqlCommand("insert into orphan_gallerymultiples values('" + imgname + "','" + gallgid + "','" + date + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "alert('File inserted successfully.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
            else
            {
                //SqlCommand cmd = new SqlCommand("insert into orphan_gallerymultiples values('" + imgname + "','" + gid3 + "','"+date+"')", con);
                SqlCommand cmd = new SqlCommand("update orphan_gallerymultiples set imagename='" + fileName + "',posteddate='" + date + "' where id='" + gallgid + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "alert('File Updated successfully.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }

        }
    }
    protected void btnCancel2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Gallery.aspx");

    }
    public DataSet binddata(string id)
    {
        DataSet ds = new DataSet();
        ds = ob.galleryaddedid(id);


        return ds;
        //GAEditddl.Items.Insert(0, "Select Category");
        //GAEditddl.Items.Insert(1, "Home Image");
        // DataSet ds1 = new DataSet();
        //ds1 = ba.admingallaryview(cid);
        //GAEditddl.SelectedValue = ds.Tables[0].Rows[0]["category"].ToString();
    }
    protected void ddl_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (ddl.SelectedItem.Text == "Multiple Images")
        {
            // displayformore.Visible = true;
            changetomultiple.Visible = true;

        }
        else
        {
            displayformore.Visible = false;
            changetomultiple.Visible = false;
        }
    }
    public DataSet multipleimages(string id)
    {
        SqlDataAdapter dasingle = new SqlDataAdapter("select * from orphan_gallerymultiples where id=" + id, con);
        DataSet ds1 = new DataSet();
        dasingle.Fill(ds1);
        return ds1;
    }
    protected void ddlgetimages_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "editsingle")
        {
            //tr3.Visible = true;
            editsingleimage.Visible = true;
            singleimage.Visible = false;
            string did = e.CommandArgument.ToString();
            ViewState["did"] = did;
        }
    }
    protected void btnupload1_Click(object sender, EventArgs e)
    {
        string gallgid = Request.QueryString["id"];
        //string id = gallgid.ToString();
        if (FileUpload3.HasFile)
        {
            string did = ViewState["did"].ToString();
            SqlCommand cmdelete = new SqlCommand("delete from orphan_gallerymultiples where did=" + did, con);
            con.Open();
            cmdelete.ExecuteNonQuery();
            con.Close();
            //string filename = Path.GetFileName(FileUpload3.PostedFile.FileName);
            string image = FileUpload3.FileName.ToString();
            // string fl = Base_dir1 + "photos/gallery/" + filename;
            string fl = Base_dir1 + "photos/gallery/" + image;
            // string fl = System.Web.Configuration.WebConfigurationManager.AppSettings["images"];
            // string path = Server.MapPath(fl) + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload3.SaveAs(fl);
            string postdate = Convert.ToString(System.DateTime.Now.ToString());

            //SqlCommand cmd = new SqlCommand("update orphan_gallery set title='" + title + "',imagename='" + filename + "',posteddate='" + postdate + "' where id='" + id + "' ", con);
            SqlCommand cmd = new SqlCommand("insert into orphan_gallerymultiples values('" + image + "','" + gallgid + "','" + postdate + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string str = "alert('Image Updated successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            // displaysingleimages();
            DataSet ds1 = new DataSet();
            ds1 = multipleimages(gallgid);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                DataTable dt = new DataTable();

                dt.Columns.Add("id", typeof(int));
                dt.Columns.Add("imagename", typeof(string));
                dt.Columns.Add("did", typeof(int));
                for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                {
                    string lll = ds1.Tables[0].Rows[i]["imagename"].ToString();
                    //// string ll = ConfigurationManager.AppSettings["images"] + lll;
                    // string ll =  "photos/gallery/" + lll;
                    string l = ds1.Tables[0].Rows[i]["id"].ToString();
                    // string l = ds1.Tables[0].Rows[i]["id"].ToString();
                    int id = Convert.ToInt32(ds1.Tables[0].Rows[i]["did"].ToString());

                    dt.Rows.Add(l, lll, id);
                }
                DataSet ds22 = new DataSet();
                ds22.Tables.Add(dt);

                ddlgetimages.DataSource = ds22;
                ddlgetimages.DataBind();
                singleimage.Visible = true;
            }
            singleimage.Visible = true;

        }
        else
        {
            string str = "alert('Please Upload Image');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
    public void displaysingleimages()
    {
        DataSet ds1 = new DataSet();
        ds1 = multipleimages(gallgid);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("id", typeof(int));
            dt.Columns.Add("imagename", typeof(string));
            dt.Columns.Add("did", typeof(int));
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                string lll = ds1.Tables[0].Rows[i]["imagename"].ToString();
                //// string ll = ConfigurationManager.AppSettings["images"] + lll;
                // string ll =  "photos/gallery/" + lll;
                string l = ds1.Tables[0].Rows[i]["id"].ToString();
                // string l = ds1.Tables[0].Rows[i]["id"].ToString();
                int id = Convert.ToInt32(ds1.Tables[0].Rows[i]["did"].ToString());

                dt.Rows.Add(l, lll, id);
            }
            DataSet ds22 = new DataSet();
            ds22.Tables.Add(dt);

            ddlgetimages.DataSource = ds22;
            ddlgetimages.DataBind();

            // singleimage.Visible = true;
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        string gid3 = Request.QueryString["id"];
        if (FileUpload4.HasFile)
        {
            HttpFileCollection fileCollection = Request.Files;
            for (int i = 1; i < fileCollection.Count; i++)
            {
                HttpPostedFile uploadfile = fileCollection[i];
                string fileName = Path.GetFileName(uploadfile.FileName);
                string path = Base_dir1 + "photos/gallery/" + fileName;
                FileUpload4.SaveAs(path);

                string imgname = fileName;
                if (uploadfile.ContentLength > 0)
                {
                    uploadfile.SaveAs(path);

                    // lblMessage.Text += fileName + "Saved Successfully<br>";
                }
                string date = DateTime.Now.ToString();
                SqlCommand cmd = new SqlCommand("insert into orphan_gallerymultiples values('" + imgname + "','" + gid3 + "','" + date + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string str = "alert('File Uploaded successfully.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
    }
}