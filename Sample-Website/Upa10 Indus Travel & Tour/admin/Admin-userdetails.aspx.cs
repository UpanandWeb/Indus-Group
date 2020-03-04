using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class admin_Admin_userdetails1 : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
        else
        {
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"];
                DataSet ds = new DataSet();
                ds = tr.binduserone(id);
                txtfname.Text = ds.Tables[0].Rows[0]["u_F_name"].ToString();
                txtlname.Text = ds.Tables[0].Rows[0]["u_L_name"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["u_email"].ToString();
                txtmobile.Text = ds.Tables[0].Rows[0]["u_mobile"].ToString();
                txtaddress.Text = ds.Tables[0].Rows[0]["u_address"].ToString();
                txtloginid.Text = ds.Tables[0].Rows[0]["u_loginId"].ToString();
                txtpassword.Text = ds.Tables[0].Rows[0]["u_password"].ToString();
                txtcnfpwd.Text = ds.Tables[0].Rows[0]["u_password"].ToString();
                txtaddress1.Text = ds.Tables[0].Rows[0]["u_address1"].ToString();
                txtcontact.Text = ds.Tables[0].Rows[0]["u_contact_no"].ToString();
                txtcountry.Text = ds.Tables[0].Rows[0]["u_country"].ToString();
                for (int i = 0; i < ddldesig.Items.Count; i++)
                {
                    if (ddldesig.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["u_designation"]))
                    {
                        ddldesig.Items[i].Selected = true;
                        break;
                    }
                }
                Button1.Visible = true;
                Button2.Visible = false;
            }
            else
            {
                Button1.Visible = false;
                Button2.Visible = true;
            }
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        int s = tr.loginidcheck(txtloginid.Text);
        if (s > 0)
        {
            lblstatus.Text = "User Id Already Exist";
            lblstatus.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lblstatus.Text = "User Id Available";
            lblstatus.ForeColor = System.Drawing.Color.Green;
        }

        if (lblstatus.Text == "User Id Available")
        {
            string u_F_name = txtfname.Text;
            string u_L_name = txtlname.Text;
            string u_designation = ddldesig.SelectedItem.Text;
            string u_email = txtemail.Text;
            string u_loginId = txtloginid.Text;
            string u_password = txtpassword.Text;
            string u_address = txtaddress.Text;
            string u_address1 = txtaddress1.Text;
            string u_mobile = txtmobile.Text;
            string u_contact_no = txtcontact.Text;
            string u_country = txtcountry.Text;
            int U_status = 1;
            tr.insertUser(u_F_name, u_L_name, u_loginId, u_password, u_designation, u_country, u_mobile, u_contact_no, u_email, u_address, U_status, u_address1);
            string alert = "alert('User details Submitted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            txtfname.Text = "";
            txtlname.Text = "";
            ddldesig.SelectedIndex = 0;
            txtemail.Text = "";
            txtloginid.Text = "";
            txtpassword.Text = "";
            txtcnfpwd.Text = "";
            txtaddress.Text = "";
            txtaddress1.Text = "";
            txtmobile.Text = "";
            txtcontact.Text = "";
            Response.Redirect("Admin-user.aspx");
        }
        else
        {
            string alert = "alert('User details already exists');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-user.aspx");
    }

    protected void txtedloginid_TextChanged(object sender, EventArgs e)
    {
        int s = tr.loginidcheck(txtloginid.Text);
        if (s > 0)
        {
            lblstatus.Text = "User Id Already Exist";
            lblstatus.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lblstatus.Text = "User Id Available";
            lblstatus.ForeColor = System.Drawing.Color.Green;
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            //int s = tr.loginidcheck(txtloginid.Text);
            //if (s > 0)
            //{
            //    lblstatus.Text = "User Id Already Exist";
            //    lblstatus.ForeColor = System.Drawing.Color.Red;
            //}
            //else
            //{
            //   lblstatus.Text = "User Id Available";
            //   lblstatus.ForeColor = System.Drawing.Color.Green;
            //}

            //if (lblstatus.Text == "User Id Available")
            //{
                string id = Request.QueryString["id"];
                string u_F_name = txtfname.Text;
                string u_L_name = txtlname.Text;
                string u_designation = ddldesig.SelectedItem.Text;
                string u_email = txtemail.Text;
                string u_loginId = txtloginid.Text;
                string u_password = txtpassword.Text;
                string u_address = txtaddress.Text;
                string u_address1 = txtaddress1.Text;
                string u_mobile = txtmobile.Text;
                string u_contact_no = txtcontact.Text;
                string u_country = txtcountry.Text;
               //int i=
                    tr.updateUser(u_F_name, u_L_name, u_loginId, u_password, u_designation, u_country, u_mobile, u_contact_no, u_email, u_address, u_address1, id);
                //if (i == 1)
                   
                    string alert = "alert('User details Updated');"; 
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                    //Response.Redirect("Admin-user.aspx");
               // }
                
           // }
            //else
            //{
            //    string alert = "alert('User details already exists');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            //}
        }
        else
        {
            Response.Redirect("Admin-user.aspx");
        }
    }
}