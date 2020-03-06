using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_UserEdit : System.Web.UI.Page
{
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
                string id = Request.QueryString["id"].ToString();

                DataSet ds = new DataSet();
                ds = ob.binduserdata(id);
                txtfname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                txtlname.Text = ds.Tables[0].Rows[0]["lname"].ToString();
              txtemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
              txtuserid.Text = ds.Tables[0].Rows[0]["userid"].ToString();
              txtpassword.Text = ds.Tables[0].Rows[0]["pwd"].ToString();
              txtcnfpwd.Text = ds.Tables[0].Rows[0]["cnfpwd"].ToString();
              txtaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
              txtaddress1.Text = ds.Tables[0].Rows[0]["address2"].ToString();
              txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
             // ddldesig.SelectedItem.Text = ds.Tables[0].Rows[0]["designation"].ToString();
              for (int i = 0; i < ddldesig.Items.Count; i++)
              {
                  if (ddldesig.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["designation"]))
                  {
                      ddldesig.Items[i].Selected = true;
                      break;
                  }
              }


            }
        }

    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        string fname = txtfname.Text;
        string lname = txtlname.Text;
        string email = txtemail.Text;
        string deg = ddldesig.SelectedItem.Text;
        string userid = txtuserid.Text;
        string pwd = txtpassword.Text;
        string cpwd = txtcnfpwd.Text;
        string add = txtaddress.Text;
        string add2 = txtaddress1.Text;
        string mob = txtmobile.Text;

        string id = Request.QueryString["id"].ToString();
        ob.edituserdata(fname, lname, deg, email, userid, pwd, cpwd, add, add2, mob, id);

        string strScript = "alert('Updated Successfully');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-User.aspx");
    }
}