using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Careers1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //StateCountry countries = new StateCountry();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           

           // DataSet ds = new DataSet();
           //// ds = countries.GetCounty();
           // if (ds.Tables[0].Rows.Count > 0)
           // {
           //     for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
           //     {
           //         country.Items.Add("");
           //         country.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
           //         country.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
        //    }
        //}
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (CheckBox1.Checked)
        {
            args.IsValid = true;
        }
    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd2 = new SqlCommand("select F_name,L_name,E_mail,password,Phone from appUsers where E_mail=@mail and Phone=@pho", con);
        cmd2.Parameters.AddWithValue("@mail", txtmail.Text);
        cmd2.Parameters.AddWithValue("@pho", txtPhones.Text);
        SqlDataReader drs = cmd2.ExecuteReader();
        if (drs.Read())
        {
            string mail = drs["E_mail"].ToString();
            string pass = drs["password"].ToString();
            string fname = drs["F_name"].ToString();
            string lname = drs["L_name"].ToString();
            string phone = drs["Phone"].ToString();
            //SendMail(fname, lname, phone, mail, pass);
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "Success", "<script type='text/javascript'>alert('Please verify your e-mail address for login details with Indusgroup.');</script>");
        }
        con.Close();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("select F_name,L_name,Phone from appUsers where E_mail=@emai and password=@passw", con);
        cmd1.Parameters.AddWithValue("@emai", txtusername.Text);
        cmd1.Parameters.AddWithValue("@passw", txtpwd.Text);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            Session["AppUser"] = dr["F_name"].ToString();
            Session["APhone"] = dr["Phone"].ToString();
            Session["Usermail"] = txtusername.Text;
            lblerLogin.Text = "";
            dr.Dispose();
            con.Close();
            Response.Redirect("appointments.aspx");
        }
        else
        {
            con.Close();
            lblerLogin.Text = "Invalid Userid / password";
            modal1.Show();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
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
  public   void clearData()
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
    protected void country_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string y = country.SelectedItem.Value.ToString();
       // ds = countries.GetState(y);
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
    protected void Hyapp_Click(object sender, EventArgs e)
    {
        modal1.Show();      
    }
    protected void lnkforget_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    
    protected void hyper1_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Show();
    }
}