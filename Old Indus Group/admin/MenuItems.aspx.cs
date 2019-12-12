using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
 
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MenuItems : System.Web.UI.Page
{
    AdminCS obj = new AdminCS();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string s = "select distinct role,name,  country ,mid from indus_Roles";
            SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grid1.DataSource = ds;
            grid1.DataBind();
        }
    }

    protected void btnpost_Click(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }

    //protected void viewlnk_Click(object sender, EventArgs e)
    //{

    //}



    protected void emaillnk_Click(object sender, CommandEventArgs e)
    {
        string list_id;
        list_id = e.CommandArgument.ToString();

        string s1 = "select * from indus_Roles  where name='" + list_id + "'";
        SqlDataAdapter sda1 = new SqlDataAdapter(s1, sqlConnection);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);

        string mid = ds1.Tables[0].Rows[0]["mid"].ToString();

        string cont = ds1.Tables[0].Rows[0]["country"].ToString();
        string role = ds1.Tables[0].Rows[0]["role"].ToString();
        string name = ds1.Tables[0].Rows[0]["name"].ToString();

        string s2 = "select item from indus_Roles  where name='" + list_id + "' and mid='" + mid + "'";
        SqlDataAdapter sda2 = new SqlDataAdapter(s2, sqlConnection);
        DataSet ds2 = new DataSet();
        sda2.Fill(ds2);

        string menu = ds2.Tables[0].Rows[0]["item"].ToString();
        string s23 = "" ;

        for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
        {
            string s = ds2.Tables[0].Rows[i]["item"].ToString();
            s23 += s + ",";
        }
        string result1 = SendMail(cont, role, name, s23);

        string alert = "alert('Menu Items Mailed Successfully');location.replace('MenuItems.aspx')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }

    private string SendMail(string cont, string role, string name, string s66)
    {
        string Msg = "";

        Msg += "<table border='0'><tr><td><img src='http://igiit.com/images/logo2.gif' alt='Company Logo' /></td></tr><tr><td class='data1'>Dear " + name + ",</td></tr>"
            + "<tr><td height='10px'></td></tr>"
            + "<tr><td><h4>Your account Access  details are as follows:</h4></td></tr>"
            + "<tr><td><h5>Country Name : " + cont + "</h5></td></tr>"
            + "<tr><td><h5>Role : " + role + "</h5></td></tr>"
            + "<tr><td><h5>Name : " + name + "</h5></td></tr>"
            + "<tr><td><h5>Menu Item : " + s66 + "</h5></td></tr>"

            + "<tr><td>Please login with Your following Details can access in 1indus.com.<a href='http://1indus.com/admin/Admin_Login.aspx'>http://1indus.com/admin/Admin_Login.aspx'</a></td></tr>"
            + "<tr><td height='20px'></td></tr>"
            + "<tr><td height='50px'></td></tr>"
            + "<tr><td>Regards,</td></tr>"
            + "<tr><td><a href='http://igiit.com/'>Indus Group ,</a></td></tr>"
            + "<tr><td>703-593-1234. </td></tr>"
            + "</table>";

        string from = "test@1indus.com";
        string fromName = "1indus User Access Details ";
        string to = "vyarramsetty@1indus.com";
        string subject = "Your Access  Details of Indus Group.";
        string bodyText = Msg;

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", Msg);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    protected void editlnk_Click(object sender, CommandEventArgs e)
    {
        add1.Visible = true;
        add.Visible = false;
        string list_id;
        list_id = e.CommandArgument.ToString();
        Session["menuid"] = list_id;
        obj.FillUserType(ddrole);

        string s1 = "select distinct role,name,  country ,mid from indus_Roles  where name='" + list_id + "'";
        SqlDataAdapter sda1 = new SqlDataAdapter(s1, sqlConnection);
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            ddc.SelectedItem.Text = ds1.Tables[0].Rows[0]["country"].ToString();
            ddrole.SelectedItem.Text = ds1.Tables[0].Rows[0]["role"].ToString();
                txtname.Text = ds1.Tables[0].Rows[0]["name"].ToString();
            string mid=ds1.Tables[0].Rows[0]["mid"].ToString();

            //string s3 = "Select distinct name from indus_Roles where role='" + ds1.Tables[0].Rows[0]["role"].ToString() + "' and country='"
            //    + ds1.Tables[0].Rows[0]["country"].ToString() + "' and name='" + ds1.Tables[0].Rows[0]["name"].ToString() + "'";
            //SqlDataAdapter sda3 = new SqlDataAdapter(s3, sqlConnection);
            //DataSet ds3 = new DataSet();
            //sda3.Fill(ds3);
            //if (ds3.Tables[0].Rows.Count > 0)
            //{
            //    txtname.Text = ds3.Tables[0].Rows[0]["name"].ToString();
            //}

            string s2 = "select  item from indus_Roles  where name='" + list_id + "' and mid='"+mid+"'";
            SqlDataAdapter sda2 = new SqlDataAdapter(s2, sqlConnection);
            DataSet ds2 = new DataSet();
            sda2.Fill(ds2);

            dlitems.RepeatColumns = 5;
            dlitems.DataSource = ds2;
            dlitems.DataBind();

            ModalPopupExtender1.Show();
        }
    }

    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    if (ddrole.SelectedItem.Text != "Select User Type")
    //    {
    //        string name = ddname1.SelectedItem.Text;
    //        string s = "select * from UserType where UserType='" + ddrole.SelectedItem.Text + "' ";
    //        SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
    //        DataSet ds = new DataSet();
    //        sda.Fill(ds);
    //        string id = ds.Tables[0].Rows[0]["id"].ToString();
    //        foreach (DataListItem item in dlitems.Items)
    //        {

    //            CheckBox objName = item.FindControl("lnkitems") as CheckBox;
    //            if (objName.Checked == true)
    //            {
    //                string chechitem = Convert.ToString(objName.Text);

    //                sqlConnection.Open();
    //                string s1 = "insert into indus_Roles (country, role,name,item,mid) values('" + ddc.SelectedItem.Text + "','" + ddrole.SelectedItem.Text + "','" + name + "','" + chechitem + "','" + id + "') ";
    //                SqlCommand cmd = new SqlCommand(s1, sqlConnection);
    //                int i = cmd.ExecuteNonQuery();
    //                sqlConnection.Close();

    //                if (i == 1)
    //                {
    //                    string alert = "alert('Menu Items Added Successfully');location.replace('MenuItems.aspx')";
    //                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    //                }
    //            }
    //        }
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Please select User Role')", true);
    //    }
    //}

    //protected void ddrole_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string cont = ddc.SelectedItem.Text;
    //    string role = ddrole.SelectedItem.Text;
    //    string s = "Select country, fname from Users_Information where designation='" + role + "' and country='" + cont + "'";
    //    SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
    //    DataSet ds = new DataSet();
    //    sda.Fill(ds);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {

    //        ddname1.DataTextField = "fname";
    //        ddname1.DataSource = ds;
    //        ddname1.DataBind();
    //    }
    //    else
    //    {
    //        ddc.SelectedIndex = -1;
    //        ddrole.SelectedIndex = -1;
    //        string alert = "alert('No Employee name mentioned? Try again');";
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    //        ModalPopupExtender1.Show();
    //    }
    //}


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string name = txtname.Text;
        string cont = ddc.SelectedItem.Text;
        string role = ddrole.SelectedItem.Text;
        string id = Session["menuid"].ToString();
        string s2 = "Delete  from indus_Roles  where  name='"+id+"'";
        sqlConnection.Open();
        SqlCommand cmd = new SqlCommand(s2,sqlConnection);
        cmd.ExecuteNonQuery();
        sqlConnection.Close();

        foreach (DataListItem item in DataList1.Items)
        {

            CheckBox objName = item.FindControl("lnkitems1") as CheckBox;
            if (objName.Checked == true)
            {
                string chechitem = Convert.ToString(objName.Text);

                sqlConnection.Open();
                string s1 = "insert into indus_Roles (country, role,name,item,mid) values('" + cont + "','" + role + "','" + name + "','" + chechitem + "','" + id + "') ";
                SqlCommand cmd1 = new SqlCommand(s1, sqlConnection);
                int i = cmd1.ExecuteNonQuery();
                sqlConnection.Close();

                if (i == 1)
                {
                    string alert = "alert('Menu Items Added Successfully');location.replace('MenuItems.aspx')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                }
            }
        }
    }
  
    protected void btncancle_Click(object sender, EventArgs e)
    {

    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        add1.Visible = false;

        add.Visible = true;
        string s = "select mid,item from menuitems";
        SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        DataList1.RepeatColumns = 5;
        DataList1.DataSource = ds;
        DataList1.DataBind();
        ModalPopupExtender1.Show();
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        foreach (DataListItem row in dlitems.Items)
        {
            CheckBox check = row.FindControl("lnkitems") as CheckBox;
            check.Checked = false;
        }

        if (add.Visible == true)
        {
            foreach (DataListItem row in DataList1.Items)
            {
                CheckBox check = row.FindControl("lnkitems1") as CheckBox;
                check.Checked = false;
            }
        }
        ModalPopupExtender1.Show();
    }

    protected void imgbtn1_Command(object sender, CommandEventArgs e)
    {
        string list_id;
        list_id = e.CommandArgument.ToString();

        string s2 = "Delete  from indus_Roles  where  name='" + list_id + "'";
        sqlConnection.Open();
        SqlCommand cmd = new SqlCommand(s2, sqlConnection);
        cmd.ExecuteNonQuery();
        sqlConnection.Close();

        string alert = "alert('Menu items added Role is Deleted Successfully');location.replace('MenuItems.aspx')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

    }
}