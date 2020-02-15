using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;

public partial class Admin_Admin_Create_User : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tr91.Visible = true;
            tr98.Visible = true;
            tr13.Visible = true;
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        //if (Session["User"] != null)
        //{
            if (lblStatus.Text == "User Available")
            {
                string username = txtUserId.Text;
                string pwd = txtPwd.Text;
                int status = 1;
                DateTime date = System.DateTime.Now;
                string efname = txtFName.Text;
                string elname = txtLName.Text;
                string desig = ddlUserType.SelectedItem.Text;
                string country = ddlCountry.SelectedItem.Text;
                string address = txtAddress.Text;
                string phone = txtConNumber.Text;
                string mobile = txtMobile.Text;
                string Email = txtEmailId.Text;

                string clientview;
                string clientpost;
                string clientedit;
                string clientdelete;
                if (CheckBox74.Checked == true) { clientview = "1"; } else { clientview = "0"; }
                if (CheckBox75.Checked == true) { clientpost = "1"; } else { clientpost = "0"; }
                if (CheckBox76.Checked == true) { clientedit = "1"; } else { clientedit = "0"; }
                if (CheckBox77.Checked == true) { clientdelete = "1"; } else { clientdelete = "0"; }

                string vendorview;
                string vendorpost;
                string vendoredit;
                string vendordelete;
                if (CheckBox80.Checked == true) { vendorview = "1"; } else { vendorview = "0"; }
                if (CheckBox81.Checked == true) { vendorpost = "1"; } else { vendorpost = "0"; }
                if (CheckBox82.Checked == true) { vendoredit = "1"; } else { vendoredit = "0"; }
                if (CheckBox83.Checked == true) { vendordelete = "1"; } else { vendordelete = "0"; }

                string usersview;
                string userspost;
                string usersedit;
                string usersdelete;
                string usersstatus;
                if (CheckBox9.Checked == true) { usersview = "1"; } else { usersview = "0"; }
                if (CheckBox12.Checked == true) { userspost = "1"; } else { userspost = "0"; }
                if (CheckBox18.Checked == true) { usersedit = "1"; } else { usersedit = "0"; }
                if (CheckBox22.Checked == true) { usersdelete = "1"; } else { usersdelete = "0"; }
                if (CheckBox23.Checked == true) { usersstatus = "1"; } else { usersstatus = "0"; }


                string qry = "insert into ST_USers(username,password,status,createddate,ufname,ulname,udesignation,Country,Address,Phone,mobile,Email,newsview,newspost,newsedit,newsdelete,galaryview,galerypost,galeryedit,galerydelete,usersview,userspost,usersedit,usersdelete,usersstatus)values";

                qry += "('" + username + "','" + pwd + "','" + status + "','" + date + "','" + efname + "','" + elname + "','" + desig + "','" + country + "','" + address + "','" + phone + "','" + mobile + "','" + Email + "','" + clientview + "','" + clientpost + "','" + clientedit + "','" + clientdelete + "','" + vendorview + "','" + vendorpost + "','" + vendoredit + "','" + vendordelete + "','" + usersview + "','" + userspost + "','" + usersedit + "','" + usersdelete + "','" + usersstatus + "')";
                con.Open();
                SqlCommand cmd1 = new SqlCommand(qry, con);
                int k = cmd1.ExecuteNonQuery();
                con.Close();

                if (k == 1)
                {
                    // string result1 = SendMail(country, email, mobile, name, role, userid, pwd, chechitemaa);

                  string  strScript = "alert('User Id is successfully Created');location.replace('Admin-Users.aspx')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                }
            //}
            //else
            //{
            //    string strScript = "alert('Sorry you Cant create new user id .Please make sure that user id is available or not');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            //}
        }
    }

    protected void txtUserId_TextChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();

        SqlDataAdapter sdaaaaa = new SqlDataAdapter("select count(*) as count from ST_USers where  username='" + txtUserId.Text + "'", con);
        DataSet dssss = new DataSet();
        sdaaaaa.Fill(dssss);

        if (dssss.Tables[0].Rows[0]["count"].ToString() == "0")
        {
            lblStatus.Text = "User Available";
            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblStatus.Visible = true;
        }
        else
        {
            lblStatus.Text = "User Already Exist";
            lblStatus.Visible = true;
            lblStatus.ForeColor = System.Drawing.Color.Red;


        }

    }
    protected void Clientyes_CheckedChanged(object sender, EventArgs e)
    {
        tr91.Visible = true;
    }
    protected void Clientno_CheckedChanged(object sender, EventArgs e)
    {
        tr91.Visible = false;
    }
    protected void CheckBox73_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox73.Checked == true)
        {
            CheckBox74.Checked = true;
            CheckBox75.Checked = true;
            CheckBox76.Checked = true;
            CheckBox77.Checked = true;
        }
        else
        {
            CheckBox74.Checked = false;
            CheckBox75.Checked = false;
            CheckBox76.Checked = false;
            CheckBox77.Checked = false;
        }
    }
    protected void CheckBox74_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox74.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }

    protected void CheckBox75_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox75.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }

    protected void CheckBox76_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox76.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }
    protected void CheckBox77_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox77.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }
    protected void Vendoryes_CheckedChanged(object sender, EventArgs e)
    {
        tr98.Visible = true;
    }
    protected void Vendorno_CheckedChanged(object sender, EventArgs e)
    {
        tr98.Visible = false;
    }
    protected void CheckBox79_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox79.Checked == true)
        {
            CheckBox80.Checked = true;
            CheckBox81.Checked = true;
            CheckBox82.Checked = true;
            CheckBox83.Checked = true;
        }
        else
        {
            CheckBox80.Checked = false;
            CheckBox81.Checked = false;
            CheckBox82.Checked = false;
            CheckBox83.Checked = false;
        }
    }

    protected void CheckBox80_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox80.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true &&  CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox81_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox81.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true  && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox82_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox82.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true &&  CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }


    protected void CheckBox83_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox83.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }
    protected void Usersyes_CheckedChanged(object sender, EventArgs e)
    {
        tr13.Visible = true;
    }
    protected void Usersno_CheckedChanged(object sender, EventArgs e)
    {
        tr13.Visible = false;
    }

    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox6.Checked == true)
        {
            CheckBox9.Checked = true;
            CheckBox12.Checked = true;
            CheckBox18.Checked = true;
            CheckBox22.Checked = true;
            CheckBox23.Checked = true;
        }
        else
        {
            CheckBox9.Checked = false;
            CheckBox12.Checked = false;
            CheckBox18.Checked = false;
            CheckBox22.Checked = false;
            CheckBox23.Checked = false;
        }
    }
    protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox9.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }

    protected void CheckBox12_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox12.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox18_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox18.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox22_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox22.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox23_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox23.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
 
   
    protected void lnkback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Users.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Users.aspx");
    }
}