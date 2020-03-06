using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_SupportImageEdit : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            DataSet ds = new DataSet();
            ds = ob.bindsupportimg(id);

            for (int i = 0; i < DropDownList3.Items.Count; i++)
            {
                if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["category"]))
                {
                    DropDownList3.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }

            txtsup.Text = ds.Tables[0].Rows[0]["title"].ToString();

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        if (fd1.HasFile)
        {
           
            string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
            string img = fd1.FileName.ToString();
            //HttpFileCollection fileCollection = Request.Files;
            //for (int i = 1; i < fileCollection.Count; i++)
            //{
            //    HttpPostedFile uploadfile = fileCollection[i];
            string fileName = System.IO.Path.GetFileName(fd1.FileName);




            string path = Base_dir1 + "photos/support/" + fileName;
            fd1.SaveAs(path);

            string imgname = fileName;
            //if (uploadfile.ContentLength > 0)
            //{
            //    uploadfile.SaveAs(path);

            //    // lblMessage.Text += fileName + "Saved Successfully<br>";
            //}
            ob.updatesupportimgwithimg(fileName, DropDownList3.SelectedItem.Text, txtsup.Text, id);
            string str = "alert('Image updated.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

            DropDownList3.SelectedIndex = 0;
            txtsup.Text = "";

        }
        else
        {
            ob.updatesupportimg(DropDownList3.SelectedItem.Text, txtsup.Text, id);
            string str = "alert('Image updated.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Support.aspx");
    }
}