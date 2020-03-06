using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class admin_Admin_Homecontent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            fr.Visible = false;
            gv.Visible = true;
            bind();
            sc.Visible = false;
            im.Visible = false;
        }
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
      
        string category = ddl.SelectedItem.Text;
        string tit = txt1.SelectedItem.Text;
        string content = TextBox1.Text;
        string date = DateTime.Now.ToString();
        string sub = DropDownList1.SelectedItem.Text;
        string image = "";
        if (fd1.HasFile)
        {
             image = fd1.FileName.ToString();
            string path = Base_dir1 + "photos/support/" + image;
            fd1.SaveAs(path);
        }

        SqlCommand cmd = new SqlCommand("insert into orphan_home values('" + tit.Replace("'", "''") + "'," + 1 + ",'" + category + "','" + content.Replace("'", "''") + "','" + date + "','" + sub + "','"+image+"') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        string strScript = "alert('Content Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
        ddl.SelectedIndex = 0;
        txt1.SelectedIndex = 0;
        TextBox1.Text = "";
        DropDownList1.SelectedIndex = 0;
        im.Visible = false;
        sc.Visible = false;
    }
    protected void post_Click(object sender, EventArgs e)
    {
        fr.Visible = true;
        gv.Visible = false;
        post.Visible = false;
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select title,SUBSTRING(content, 1,50) as content,posteddate,category,id,status,su_cat  from orphan_home order by id desc ", con);
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
            SqlCommand cmd = new SqlCommand("delete  from orphan_home where id= " + id, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            bind();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
                Response.Redirect("Admin-HomecontentEdit.aspx?id=" + id);
        }
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();  
    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl.SelectedItem.Text == "Bottom")
        {
            txt1.Items[1].Enabled = false;
            txt1.Items[2].Enabled = false;
            sc.Visible = true;
            post.Visible = false;
txt1.Items[3].Enabled = true;
            txt1.Items[4].Enabled = true;
            txt1.Items[5].Enabled = true;
            txt1.Items[6].Enabled = true;
            txt1.Items[7].Enabled = true;
            txt1.Items[8].Enabled = true;
            txt1.Items[9].Enabled = true;
            txt1.Items[10].Enabled = true;
        }
        if (ddl.SelectedIndex == 2)
        {
            txt1.Items[3].Enabled = false;
            txt1.Items[4].Enabled = false;
            txt1.Items[5].Enabled = false;
            txt1.Items[6].Enabled = false;
            txt1.Items[7].Enabled = false;
            txt1.Items[8].Enabled = false;
            txt1.Items[9].Enabled = false;
            txt1.Items[10].Enabled = false;
        }
        if (ddl.SelectedItem.Text == "Top")
        {
            txt1.Items[1].Enabled = true;
            txt1.Items[2].Enabled = true;
            sc.Visible = false;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 4 || DropDownList1.SelectedIndex==5)
        {
            im.Visible = true;
        }
        else
        {
            im.Visible = false;
        }
    }
    protected void txt1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txt1.SelectedIndex == 1)
        {
            im.Visible = true;
        }
        else
        {
            im.Visible = false;
        }
    }
}