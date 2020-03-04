using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_VisaEdit : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    travelsadmin ad = new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();
            DataSet ds = new DataSet();
          ds=  tr.bindvisaper(id);
          for (int i = 0; i < ddl.Items.Count; i++)
          {
              if (ddl.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["placename"]))
              {
                  ddl.Items[i].Selected = true;

                  // DropDownList1.Items.Insert(0, "Select");
                  break;

              }
          }
          txt1.Text = ds.Tables[0].Rows[0]["address"].ToString();
          txt2.Text = ds.Tables[0].Rows[0]["genrequirements"].ToString();
          txt3.Text = ds.Tables[0].Rows[0]["business_details"].ToString();
          txt4.Text = ds.Tables[0].Rows[0]["tourist_details"].ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
           string id = Request.QueryString["id"].ToString();
        string place = ddl.SelectedItem.Text;
        string address = txt1.Text;
        string gen = txt2.Text;
        string busi = txt3.Text;
        string tour = txt4.Text;
        ad.updatevisa(id, place, address, gen, busi, tour);
        string alert = "alert('Record Updated Successfully!');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-VisaData.aspx");
    }
}