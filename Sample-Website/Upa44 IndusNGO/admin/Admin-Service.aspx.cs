using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Service : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    home ob = new home();
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
                // DropDownList1_SelectedIndexChanged(bind(), null);
               fr.Visible = false;
               // bind();
               DataSet ds = new DataSet();
               ds = ob.bindsubmenu("1");
               DropDownList1.DataTextField = "subname";
               DropDownList1.DataValueField = "sid";
               DropDownList1.DataSource = ds;
               DropDownList1.DataBind();
               DropDownList1.Items.Insert(0, "Select");
               binddata();

            }
        }
        string get = DropDownList1.SelectedItem.Text;
    }
  



    protected void binddata()
    {
        DataSet sd = new DataSet();
        sd= ob.bindservices();
        gv.DataSource = sd;
        gv.DataBind();
    }

    protected void bind()
    {
        DataSet ds = new DataSet();
        ds = ob.bindsubmenu("1");
        DropDownList1.DataTextField = "subname";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataSource = ds;
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "Select");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string item = DropDownList1.SelectedItem.Text;
        //if (DropDownList1.SelectedItem.Text == "Select")
        //{
        //    ddl.Items.Clear();
        //}
         if(DropDownList1.SelectedItem.Text != "Select")
        {
            DataSet ds = new DataSet();
         //   ds = ob.bindsubmenucat("1", DropDownList1.SelectedValue);
            ds = ob.bindsubmenucat("1",DropDownList1.SelectedValue);

            ddl.DataTextField = "subcat_name";
            ddl.DataValueField = "cid";
            ddl.DataSource = ds;
            ddl.DataBind();
            ddl.Items.Insert(0, "Select");
        }
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string title = txt1.Text;
            string date = DateTime.Now.ToString();
            int category = Convert.ToInt32(DropDownList1.SelectedValue);
            int sub_cat = Convert.ToInt32(ddl.SelectedValue);
            string content = TextBox1.Text;

            string image = FileUpload1.FileName.ToString();
            string path = Base_dir1 + "photos/services/" + image;
            FileUpload1.SaveAs(path);
            ob.insertservices(title, category, sub_cat, content, date, image);

            string alert = "alert('Data Uploaded');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            txt1.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = "";
            ddl.SelectedIndex = 0;
        }
        else
        {
            string title = txt1.Text;
            string date = DateTime.Now.ToString();
            int category = Convert.ToInt32(DropDownList1.SelectedValue);
            int sub_cat = Convert.ToInt32(ddl.SelectedValue);
            string content = TextBox1.Text;

            string image = "";
            
            ob.insertservices(title, category, sub_cat, content, date, image);

            string alert = "alert('Data Uploaded');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            txt1.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = "";
            ddl.SelectedIndex = 0;
        }
    }
    protected void post_Click(object sender, EventArgs e)
    {
        fr.Visible = true;
        post.Visible = false;
        fr23.Visible = false;
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
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        binddata();  
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="delete")
        {
            int id = Convert.ToInt32( e.CommandArgument.ToString());
            ob.deleteservice(id);
            string strScript = "alert('Service Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
            binddata();
        }

        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-Serviceedit.aspx?id="+id);
        }
    }
	 protected void Cancel_Click(object sender, EventArgs e)
    {
	
		Response.Redirect("Admin-Home.aspx");
	}
}