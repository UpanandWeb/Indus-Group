using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_EventEdit : System.Web.UI.Page
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
            ds= ob.evntperid(id);
            txt1.Text = ds.Tables[0].Rows[0]["title"].ToString();

            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["category"]))
                {
                    DropDownList1.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }
            }
            TextBox1.Text = ds.Tables[0].Rows[0]["content"].ToString();
        }
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string title = txt1.Text;
            string category = DropDownList1.SelectedValue;
            //string subcat = ddl.SelectedValue;
            string content = TextBox1.Text;

            string image = FileUpload1.FileName.ToString();
            string path = Base_dir1 + "photos/events/" + image;
            FileUpload1.SaveAs(path);
            string id = Request.QueryString["id"];
            ob.evntwithimg(title, category, image, content, id);


            string alert = "alert('Data Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }
        else
        {
            string title = txt1.Text;
            string category = DropDownList1.SelectedValue;
            //string subcat = ddl.SelectedValue;
            string content = TextBox1.Text;

         
            string id = Request.QueryString["id"];
            ob.evntoutimg(title, category, content, id);
            string alert = "alert('Data Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }

    }
	protected void  btnsub1_Click (object sender, EventArgs e)
	{
		Response.Redirect("Admin-Events.aspx");
	}
}