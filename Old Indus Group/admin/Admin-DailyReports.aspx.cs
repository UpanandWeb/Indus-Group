using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Admin_DailyReports : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                Binddata();

                SqlDataAdapter da = new SqlDataAdapter("select lastname +' '+ firstname as name , * from employeereg1 where status=1 and empid like 'IGI%'  order by firstname asc", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddemp.DataTextField = "name";
                    ddemp.DataValueField = "userid";
                    ddemp.DataSource = ds;
                    ddemp.DataBind();
                    ddemp.Items.Insert(0, "Select Employee");
                }
            }
        }
    }

    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_DailyReports order by pdate asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }


    protected void ddemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddemp.SelectedItem.Text != "Select Employee")
        {
            string id = ddemp.SelectedValue;
            SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["emailid"] = ds.Tables[0].Rows[0]["emailid"].ToString();
            }
            ddmonth.SelectedIndex = -1;
            ddyear.SelectedIndex = -1;
            //total.Visible = false;
        }
    }
    protected void ddmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddyear.SelectedItem.Text != "Year")
        {
            string year = ddyear.SelectedItem.Text;
            string lnk = ddmonth.SelectedValue;
            string email = ddemp.SelectedValue;


            if (ddemp.SelectedItem.Text != "Select Employee")
            {
                email = Findemail(email);
               // Binddata(lnk, year, email);
            }
        }
        else
        {
            ddmonth.SelectedIndex = -1;
            string strscpt = "alert ('Please select Year');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }
    private string Findemail(string email)
    {
        string id = ddemp.SelectedValue;
        SqlDataAdapter da = new SqlDataAdapter("select * from employeereg1 where userid='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["emailid"].ToString();
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
            MyGrid.PageIndex = e.NewPageIndex;
            Binddata();
    }

    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IG_DailyReports where idr=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Report Details has been deleted Successfully');location.replace('Admin-DailyReports.aspx');", true);
        }
    }

    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_DailyReports where idr=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-DailyReportsView.aspx?sid=" + userid);
        }
        con.Close();
    }

    protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_DailyReports where idr=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-DailyReportsView.aspx?sid1=" + userid);
        }
        con.Close();
    }
}