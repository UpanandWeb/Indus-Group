using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Careers : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    StateCountry countries = new StateCountry();
    /// <summary>
    /// Displayig Country list
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
      
        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 60; // (60 sec = 1 min)
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            LoadData();

           // pnlLogin.Visible = false;
            DataSet ds = new DataSet();
            ds = countries.GetCounty();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    country.Items.Add("");
                    country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                    country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
            }

            SqlDataAdapter sda = new SqlDataAdapter("select * from Countryt_Master", con);
            DataSet d2s = new DataSet();
            sda.Fill(d2s);
            ddcountry.DataTextField = "CountryName";
            ddcountry.DataValueField = "CountryID";
            ddcountry.DataSource = d2s;
            ddcountry.DataBind();
            ddcountry.Items.Insert(0, "Select Country");
        }
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddcountry.SelectedItem.Text != "Select Country")
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from State_Master where intCountryId=" + ddcountry.SelectedValue + " order by txtstate asc", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DropDownList1.DataTextField = "txtstate";
            DropDownList1.DataValueField = "intState_Id";

            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select State");
        }
        else
        {
            DropDownList1.ClearSelection();
            DropDownList1.Items.Insert(0, "Select State");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadData();
    }

    public int CurrentPage
    {
        get
        {
            object obj = this.ViewState["_CurrentPage"];
            if (obj == null)
                return 0;
            else
                return (int)obj;
        }
        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }

    private void LoadData()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da11 = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,50)+'...' as JobDesc,joblocation from Careers where country='USA' and status=1  and added=2 order by id desc", con);
        ds = new DataSet();
        da11.Fill(ds, "Careers");
        GridView1.DataSource = ds.Tables["Careers"];
        GridView1.DataBind();
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (CheckBox1.Checked)
        {
            args.IsValid = true;
        }
    }

    protected void hyApp_Click(object sender, EventArgs e)
    {
        modal1.Show();
    }

    /// <summary>
    /// inserted jobseekers details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
    
        if (CheckBox1.Checked)
        {
            if (IsValid)
            {

         
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into appUsers(F_name,L_name,E_mail,password,Address,Country,State,city,Phone,Fax)" +
                    " values(@fna,@lna,@ema,@pass,@addr,@coun,@sta,@city,@pho,@fax)", con);
                cmd.Parameters.AddWithValue("@fna", txtNames.Text);
                cmd.Parameters.AddWithValue("@lna", txtLname.Text);
                cmd.Parameters.AddWithValue("@ema", txtcompanymailid.Text);
                cmd.Parameters.AddWithValue("@pass", txtrpwd.Text);
                cmd.Parameters.AddWithValue("@addr", txtstreetaddr.Text);
                cmd.Parameters.AddWithValue("@coun", country.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@sta", state.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@city", txtcity.Text);
                cmd.Parameters.AddWithValue("@pho", txtphone.Text);
                cmd.Parameters.AddWithValue("@fax", txtfax.Text);
                int succ = cmd.ExecuteNonQuery();
                con.Close();
                if (succ == 1)
                {
                    // SendMail(txtNames.Text, txtLname.Text, txtcompanymailid.Text, txtstreetaddr.Text, country.SelectedItem.Text,
                    //state.SelectedItem.Text, txtcity.Text, txtphone.Text, txtrpwd.Text);
                    clearData();
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "Success", "<script type='text/javascript'>alert('Registration Successfully ! For login details please verify your e-mail address.');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script type='text/javascript'>alert('Sorry !!! Registration Failed !');</script>");
                }
            }
            else
            {
                ModalPopupExtender2.Show();
            }
        }
    }

    protected void lnkforget_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Show();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select E_mail from appUsers where E_mail=@email", con);
        cmd.Parameters.AddWithValue("@email", txtcompanymailid.Text);
        SqlDataReader da = cmd.ExecuteReader();
        if (da.HasRows)
        {
            imgUncheck.Visible = true;
            imgstatus.Visible = false;
            txtcompanymailid.Text = "";
        }
        else
        {
            imgstatus.Visible = true;
            imgUncheck.Visible = false;
        }
        con.Close();
        ModalPopupExtender2.Show();
    }

    /// <summary>
    /// when country change states loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string y = country.SelectedItem.Value.ToString();
        ds = countries.GetState(y);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add("");
                state.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                state.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
        ModalPopupExtender2.Show();
    }
    /// <summary>
    /// when country change states loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string y = country.SelectedItem.Value.ToString();
        ds = countries.GetState(y);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                state.Items.Add("");
                state.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtState"].ToString();
                state.Items[i].Value = ds.Tables[0].Rows[i - 1]["intState_id"].ToString();
            }
        }
        ModalPopupExtender2.Show();
    }

    void clearData()
    {
        txtNames.Text = "";
        txtLname.Text = "";
        txtcompanymailid.Text = "";
        txtrpwd.Text = "";
        txtstreetaddr.Text = "";
        country.SelectedIndex = -1;
        state.SelectedIndex = -1;
        txtcity.Text = "";
        txtphone.Text = "";
        txtfax.Text = "";
    }
    //protected void SearchJobs_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("fulltime_jobs.aspx");
    //}

    //protected void btnseacj_Click(object sender, EventArgs e)
    //{
    //    if ((txttitle.Text != "") && (txtlocation.Text != ""))
    //    {
    //        DataSet ds = new DataSet();
    //        SqlDataAdapter da11 = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,40)+'...' as JobDesc,joblocation from Careers where country='USA' and status=1  and jobname like '%" + txttitle.Text + "%' and joblocation like '%" + txtlocation.Text + "%' order by id desc", con);
    //        ds = new DataSet();
    //        da11.Fill(ds, "Careers");
    //        if (ds.Tables[0].Rows.Count > 0)
    //        {
    //            GridView1.DataSource = ds.Tables["Careers"];
    //            GridView1.DataBind();
    //        }
    //        else
    //        {
    //            Page.ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script type='text/javascript'>alert('Sorry !!! No Job Posting Found !');</script>");
    //            txttitle.Text = "";
    //            txtlocation.Text = "";
    //        }
    //    }

    //}
    //protected void btncan_Click(object sender, EventArgs e)
    //{
    //    txttitle.Text = "";
    //    txtlocation.Text = "";
    //    LoadData();

    //}

    protected void btnsea_Click(object sender, EventArgs e)
    {
        if ((txtk.Text != ""))
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da11 = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,40)+'...' as JobDesc,joblocation from Careers where country='USA' and status=1  and jobname like '%" + txtk.Text + "%' order by id desc", con);
            ds = new DataSet();
            da11.Fill(ds, "Careers");
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables["Careers"];
                GridView1.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script type='text/javascript'>alert('Sorry !!! No Job Posting Found !');</script>");
            }
        }
      else  if ((txtk.Text != ""))
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da11 = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,40)+'...' as JobDesc,joblocation from Careers where country='USA' and status=1  and jobname like '%" + txtk.Text + "%' order by id desc", con);
            ds = new DataSet();
            da11.Fill(ds, "Careers");
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables["Careers"];
                GridView1.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script type='text/javascript'>alert('Sorry !!! No Job Posting Found !');</script>");
            }
        }
    }
}

