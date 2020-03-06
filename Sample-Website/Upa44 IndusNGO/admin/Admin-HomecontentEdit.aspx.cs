using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_HomecontentEdit : System.Web.UI.Page
{
    home ob = new home();
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
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
                string id = Request.QueryString["id"];
                DataSet ds = new DataSet();
                ds = ob.bindhomeperid(id);
                txt1.Text = ds.Tables[0].Rows[0]["title"].ToString();
                for (int i = 0; i < ddl.Items.Count; i++)
                {
                    if (ddl.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["category"]))
                    {
                        ddl.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;

                    }

                }

                string subcat = ds.Tables[0].Rows[0]["su_cat"].ToString();
                sc.Visible = false;
                im.Visible = false;
                if (subcat != "")
                {
                    sc.Visible = true;
                    if (subcat == "Support")
                    {
                        im.Visible = true;
                    }
                    if (subcat == "How You Can Support Us")
                    {
                        im.Visible = true;
                    }
                    for (int i = 0; i < DropDownList1.Items.Count; i++)
                    {
                        if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["su_cat"]))
                        {
                            DropDownList1.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;

                        }

                    }
                }
                TextBox1.Text = ds.Tables[0].Rows[0]["content"].ToString();
            }

        }
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        string image="";
       if(fd1.HasFile)
       {
                image = fd1.FileName.ToString();
            string path = Base_dir1 + "photos/support/" + image;
            fd1.SaveAs(path);
       }

      
            string id = Request.QueryString["id"];
            ob.updatehome(txt1.Text, ddl.SelectedItem.Text, TextBox1.Text, id, DropDownList1.SelectedItem.Text, image);

         string strScript = "alert('Content Updated');";
         Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
    }
    protected void post_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Homecontent.aspx");
    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
}