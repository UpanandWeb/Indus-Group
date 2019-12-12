using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Company : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    int CID = 0;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        pnlcompany.Visible = false;
        pnlgrid.Visible = true;
        trbuttons.Visible = true;
        trmenu.Visible = true;
        trlbl.Visible = false;
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            CountryFill();
            StateFill(CID);
            Bind();
        }
    
    }

    public void CountryFill()
    {
        ds = new DataSet();
        ds = obj.Read_CountryMaster();
        country.DataSource = ds;
        country.DataTextField = "txtCountry_name";
        country.DataValueField = "intCountry_id";
        country.DataBind();
        country.Items.Insert(0, "Select Country");
    }

    public void StateFill(int intCountry_id)
    {
        DataSet ds1 = new DataSet();
        ds1 = obj.Read_StateMaster(intCountry_id);
        state.DataSource = ds1;
        state.DataTextField = "txtState";
        state.DataValueField = "intState_Id";
        state.DataBind();
        state.Items.Insert(0, "Select State");
    }

    //public void CityFill(int sid)
    //{
    //    DataSet ds2 = new DataSet();
    //    ds2 = obj.Read_CityMaster(sid);
    //    txtcity.DataSource = ds2;
    //    txtcity.DataTextField = "city";
    //    txtcity.DataValueField = "cid";
    //    txtcity.DataBind();
    //    txtcity.Items.Insert(0, "Select City");
    //}

    public void Bind()
    {
        ds = new DataSet();
        ds = obj.Bind_Client();
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblcomp.Text = "Results for 'Client'";
            lblerr.Text = "";
            gvedit.DataSource = ds;
            gvedit.DataBind();
        }
        else
        {
            lblerr.Text = "No Result Found for 'Client'";
            lblcomp.Text = "";
        }
    }
    protected void imgedit_Click(object sender, ImageClickEventArgs e)
    {
        // own = ConfigurationManager.AppSettings["owner"].ToString();
      //   if (lblAcess.Text == own)
      //   {
             edit();
      //   }
       //  else
       //      body1.Attributes.Add("onload", "return alertdelete12()");
    }
    protected void btnedit_Click(object sender, EventArgs e)
    {
      //  own = ConfigurationManager.AppSettings["owner"].ToString();
     //   if (lblAcess.Text == own)
     //   {
            edit();
    //    }
     //   else
      //      body1.Attributes.Add("onload", "return alertdelete12()");
    }

    public void edit()
    {
        pnlcompany.Visible = true;
        pnlgrid.Visible = false;
        trbuttons.Visible = false;
        trmenu.Visible = false;

        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                CID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }

        if (CID != 0)
        {
            ds = new DataSet();
            ds = obj.Read_CompanyInfo(CID);

            string CompanyType = ds.Tables[0].Rows[0]["CompanyType"].ToString();
            ddctype.SelectedIndex = ddctype.Items.IndexOf(ddctype.Items.FindByText(CompanyType));
            txtcompanyname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtusername.Text = ds.Tables[0].Rows[0]["CompanyOwner"].ToString();
            txtaddrforcommunication.Text = ds.Tables[0].Rows[0]["Address1"].ToString();       
           
            country.ClearSelection();
            country.Items.FindByText(ds.Tables[0].Rows[0]["Country"].ToString()).Selected = true;
          
            state.ClearSelection();
           //state.Items.FindByText(ds.Tables[0].Rows[0]["State"].ToString()).Selected = true;
            state.SelectedItem.Text = ds.Tables[0].Rows[0]["State"].ToString();
            txtcity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtcontactpersondesg.Text = ds.Tables[0].Rows[0]["cont_desig"].ToString();
            txtulr.Text = ds.Tables[0].Rows[0]["Website"].ToString();
            txtcompanymailid.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
            txtphone.Text = ds.Tables[0].Rows[0]["PhoneNo"].ToString();
            txtcontactperson.Text = ds.Tables[0].Rows[0]["cont_person"].ToString();
            txtfax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
            txtdesc.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            txtpwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
            txtconfirmpwd.Text = ds.Tables[0].Rows[0]["cpassword"].ToString();
        }
    }

    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (country.SelectedIndex!=0)
        {
            int CID = Convert.ToInt32(country.SelectedItem.Value.ToString());
            StateFill(CID);
        }

        pnlcompany.Visible = true;
        pnlgrid.Visible = false;
    }


    protected void gvedit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvedit.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void imgnew_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Company_Create.aspx");
    }

    

    protected void imgdelete_Click(object sender, ImageClickEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            for (int i = 0; i < gvedit.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    CID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                }
            }

            try
            {
                int ID = CID;
                obj.Delete_CompanyInfo(ID);
                Response.Redirect("Company.aspx");
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
       // }
      //  else
         //   body1.Attributes.Add("onload", "return alertdelete12()");
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < gvedit.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    CID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                }
            }

            string CompanyName = txtcompanyname.Text.ToString();
            string CompanyOwner = txtusername.Text.ToString();
            string Address1 = txtaddrforcommunication.Text.ToString();
           // string Address2 = txtaddr2.Text.ToString();
            string Country = country.SelectedItem.Text.ToString();
            string State = state.SelectedItem.Text.ToString();
            string City = txtcity.Text.ToString();
            string c_person = txtcontactperson.Text.ToString();
            string Website = txtulr.Text.ToString();
            string EmailID = txtcompanymailid.Text.ToString();
            string PhoneNo = txtphone.Text.ToString();
            string Cdesig = txtcontactpersondesg.Text.ToString();
            string Fax = txtfax.Text.ToString();
            string CompanyType = ddctype.SelectedItem.Text.ToString();
            string Description = txtdesc.Text.ToString();
            string Paswd = txtpwd.Text.ToString();
            string CPaswd = txtconfirmpwd.Text.ToString();
            obj.Edit_CompanyInfo(CompanyName, CompanyOwner, Address1, City, State, Country, c_person, Website, EmailID, PhoneNo, Cdesig, Fax, CompanyType, Description,Paswd,CPaswd, CID);
            Response.Redirect("Company.aspx");

        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void btnclient_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Client();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                Bind();
                lblcomp.Text = "Results for 'Client'";
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Client'";
            }
        }
    }

    protected void btnvendor_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Vendor();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblcomp.Text = "Results for 'Vendor'";
                lblerr.Text = "";
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Vendor'";
            }
        }
    }

    protected void btncompany_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Company();
        if (ds.Tables.Count > 0)
        {
            lblcomp.Text = "Results for 'Company'";
            gvedit.DataSource = ds;
            gvedit.DataBind();
            lblerr.Text = "";
        }
        else
        {
            lblcomp.Text = "";
            trlbl.Visible = true;
            pnlgrid.Visible = false;
            pnlcompany.Visible = false;
            lblerr.Text = "No Result Found for 'Company'";
        }
    }

    protected void btnsupplier_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Supplier();
        int count = Convert.ToInt32(ds.Tables.Count.ToString());
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcomp.Text = "Results for 'Supplier'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Supplier'";
            }
        }
    }

    protected void btngovt_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Government();
        int count = Convert.ToInt32(ds.Tables.Count.ToString());
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcomp.Text = "Results for 'Government'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Government'";
            }
        }
    }

    protected void btninternal_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Internal();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcomp.Text = "Results for 'Internal'";
                lblerr.Text = "";
                gvedit.DataSource = ds;
                gvedit.DataBind();
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Internal'";
            }
        }
    }

    protected void btnnotapp_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_NotApplicable();
        SqlDataAdapter sqlad=new SqlDataAdapter("select * from CompanyInfo where  companytype ='Not Applicable'",con);
        DataSet ds1 = new DataSet();
        sqlad.Fill(ds1);
        if (ds1.Tables.Count > 0)
        {
            if (ds1.Tables[0].Rows.Count > 0)
            {
                lblcomp.Text = "Results for 'Not Applicable'";
                lblerr.Text = "";
                gvedit.DataSource = ds1;
                gvedit.DataBind();
            }
            else
            {
                lblcomp.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlcompany.Visible = false;
                lblerr.Text = "No Result Found for 'Not Applicable'";
            }
        }
    }

    protected void imgview_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                CID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }
        Response.Redirect("Company_View.aspx?id=" + CID);

    }
}
