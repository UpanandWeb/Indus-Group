using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_menu : System.Web.UI.Page
{
    AdminCS obj = new AdminCS();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            obj.FillUserType(ddrole);

            string s = "select mid,item from menuitems";
            SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            dlitems.RepeatColumns = 5;
            dlitems.DataSource = ds;
            dlitems.DataBind();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (ddrole.SelectedItem.Text != "Select User Type")
        {
            string name=ddname.SelectedItem.Text;
            string s = "select * from UserType where UserType='" + ddrole.SelectedItem.Text + "' ";
            SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            string id = ds.Tables[0].Rows[0]["id"].ToString();
            foreach (DataListItem item in dlitems.Items)
            {

                CheckBox objName = item.FindControl("lnkitems") as CheckBox;
                if (objName.Checked == true)
                {
                    string chechitem = Convert.ToString(objName.Text);

                    sqlConnection.Open();
                    string s1 = "insert into indus_Roles (country, role,name,item,mid) values('" + ddc.SelectedItem.Text + "','" + ddrole.SelectedItem.Text + "','" + name + "','" + chechitem + "','" + id + "') ";
                    SqlCommand cmd = new SqlCommand(s1, sqlConnection);
                    int i = cmd.ExecuteNonQuery();
                    sqlConnection.Close();

                    if (i == 1)
                    {
                        string alert = "alert('Menu Items Added Successfully');location.replace('MenuItems.aspx')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                    }
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Please select User Role')", true);
        }
    }

    protected void ddrole_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cont = ddc.SelectedItem.Text;
        string role=ddrole.SelectedItem.Text;
        string s = "Select country, fname from Users_Information where designation='" + role + "' and country='"+cont+"'";
        SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {

            ddname.DataTextField = "fname";
            ddname.DataSource = ds;
            ddname.DataBind();
        }
        else
        {
            ddc.SelectedIndex = -1;
            ddrole.SelectedIndex = -1;
            string alert = "alert('No EMployee name mentioned? Try again');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }
    }
}