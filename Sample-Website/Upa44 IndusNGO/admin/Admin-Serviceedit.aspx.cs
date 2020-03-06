using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Serviceedit : System.Web.UI.Page
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
            string id = Request.QueryString["id"];
            DataSet ds = new DataSet();
            ds = ob.bindserid(id);
            txt1.Text = ds.Tables[0].Rows[0]["title"].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0]["content"].ToString();
            DataSet ds1 = new DataSet();
            ds1 = ob.bindsubmenu("1");
            DropDownList1.DataTextField = "subname";
            DropDownList1.DataValueField = "sid";
            DropDownList1.DataSource = ds1;
            DropDownList1.DataBind();
            DataSet ds2 = new DataSet();

            
            //ddl.Items.Insert(0, "Select");

            //FileUpload1.FileName.ToString(); = ds.Tables[0].Rows[0]["imagename"].ToString();
            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["subname"]))
                {
                    DropDownList1.Items[i].Selected = true;
                    
                   // DropDownList1.Items.Insert(0, "Select");
                    break;
                   
                }
            }
            ds2 = ob.bindsubmenucat("1", DropDownList1.SelectedValue);

            ddl.DataTextField = "subcat_name";
            ddl.DataValueField = "cid";
            ddl.DataSource = ds2;
            ddl.DataBind();
            for (int i = 0; i < ddl.Items.Count; i++)
            {
                if (ddl.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["subcat_name"]))
                {
                    ddl.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "Select")
        {
            DataSet ds = new DataSet();
            //   ds = ob.bindsubmenucat("1", DropDownList1.SelectedValue);
            ds = ob.bindsubmenucat("1", DropDownList1.SelectedValue);

            ddl.DataTextField = "subcat_name";
            ddl.DataValueField = "cid";
            ddl.DataSource = ds;
            ddl.DataBind();
            ddl.Items.Insert(0, "Select");
        }
    }
    protected void post_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Service.aspx");
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
         string id = Request.QueryString["id"];
         if (FileUpload1.HasFile)
         {

             string title = txt1.Text;
             string category = DropDownList1.SelectedValue;
             string subcat = ddl.SelectedValue;
             string content = TextBox1.Text;

             string image = FileUpload1.FileName.ToString();
             string path = Base_dir1 + "photos/services/" + image;
             FileUpload1.SaveAs(path);
             //ob.insertservices(title, category, sub_cat, content, date, image);


             ob.updateserwithimg(title, category, subcat, content, image, id);
             string alert = "alert('Data Updated');";
             Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
         }
         else
         {
             string title = txt1.Text;
             string category = DropDownList1.SelectedValue;
             string subcat = ddl.SelectedValue;
             string content = TextBox1.Text;

             
             //ob.insertservices(title, category, sub_cat, content, date, image);


             ob.updateserwithoutimg(title, category, subcat, content, id);
             string alert = "alert('Data Updated');";
             Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
         }
    }
}