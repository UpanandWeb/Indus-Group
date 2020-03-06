using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Admin_Courses : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
            divsub.Visible = false;
            bindcountry();
        }
    }

    protected void bindcountry()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from [cg_Country_Master] order by intCountry_id desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        ddlcon.DataSource = ds;
        ddlcon.DataBind();
        ddlcon.DataTextField = "txtCountry_name";
        ddlcon.DataValueField = "intCountry_id";
        ddlcon.DataBind();
        ddlcon.Items.Insert(0, "Select");

        
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course order by id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GalleryDatalist.DataSource = ds;
        GalleryDatalist.DataBind();
    }
    protected void btnpost_Click(object sender, EventArgs e)
    {
        GalleryDatalist.Visible = false;
        divsub.Visible = true;
        Button1.Visible = false;

        t.Attributes.Add("padding-left", "10px");
    }
    protected void GalleryDatalist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GalleryDatalist.Rows[e.RowIndex];
        string id = Convert.ToString(GalleryDatalist.DataKeys[e.RowIndex].Value);

        SqlCommand cmd = new SqlCommand("delete from  IB_course where id=" + id, con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string str = "alert('Record Deleted successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        bind();
    }
    protected void GalleryDatalist_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course where id=" + id, con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            cor.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
            SqlDataAdapter ad123 = new SqlDataAdapter("select * from [cg_Country_Master] ", con);
            DataSet ds123 = new DataSet();
            ad123.Fill(ds123);
            ddlcon.DataSource = ds123;
            Session["id"] = id;
            ddlcon.DataTextField = "txtCountry_name";
            ddlcon.DataValueField = "intCountry_id";
            ddlcon.DataBind();
            for (int i = 0; i < ddlcon.Items.Count; i++)
            {
                if (ddlcon.Items[i].Text == Convert.ToString(ds123.Tables[0].Rows[0]["txtCountry_name"]))
                {
                    ddlcon.Items[i].Selected = true;
                    break;
                }
            }
            txtt.Text = ds.Tables[0].Rows[0]["University"].ToString();
            divsub.Visible = true;
            GalleryDatalist.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
        //SqlCommand cmd = new SqlCommand("update IB_course set CourseName='" + cor.Text + "',Country='" + ddlcon.SelectedItem.Text + "',University='" + txtt.Text + "' where id= " + id, con);
        //    con.Open();
        //   int j= cmd.ExecuteNonQuery();
        //    con.Close();
        //    if (j == 1)
        //    {
        //        Label3.Visible = true;
        //    }


        }
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course where id=" + id, con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            cor.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
            SqlDataAdapter ad123 = new SqlDataAdapter("select * from [cg_Country_Master] ", con);
            DataSet ds123 = new DataSet();
            ad123.Fill(ds123);
            ddlcon.DataSource = ds123;
            Session["id"] = id;
            ddlcon.DataTextField = "txtCountry_name";
            ddlcon.DataValueField = "intCountry_id";
            ddlcon.DataBind();
            for (int i = 0; i < ddlcon.Items.Count; i++)
            {
                if (ddlcon.Items[i].Text == Convert.ToString(ds123.Tables[0].Rows[0]["txtCountry_name"]))
                {
                    ddlcon.Items[i].Selected = true;
                    break;
                }
            }
            txtt.Text = ds.Tables[0].Rows[0]["University"].ToString();
            Button2.Visible = false;
            btnupload.Visible = false;
            txtt.Attributes.Add("Read-Only", "true");
            ddlcon.Attributes.Add("Disabled", "true");
            cor.Attributes.Add("Read-Only", "true");

        }
    }
    protected void GalleryDatalist_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = Convert.ToString(Session["id"]);
        SqlCommand cmd = new SqlCommand("update IB_course set CourseName='" + cor.Text + "',Country='" + ddlcon.SelectedItem.Text + "',University='" + txtt.Text + "' where id= " + id, con);
        con.Open();
        int j = cmd.ExecuteNonQuery();
        con.Close();
        if (j == 1)
        {
            Label3.Visible = true;
            Label3.Text = "Course Updated Successfully";
        }

    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        int sts=0;
	string date =DateTime.Now.ToString();
        SqlCommand cmd = new SqlCommand("insert into [dbo].[IB_course] (CourseName,University,Country,Status,Posteddate) values ('" + cor.Text + "','" + txtt.Text + "','" + ddlcon.SelectedItem.Text + "'," + sts + ",'"+date+"')", con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            Label3.Visible = true;
		cor.Text="";
		txtt.Text="";
		ddlcon.SelectedIndex=0;
        }
    }
}