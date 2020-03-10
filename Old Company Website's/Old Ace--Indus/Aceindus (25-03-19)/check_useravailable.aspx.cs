using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class check_useravailable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void txtUsername_TextChanged(object sender, EventArgs e)
    //{
    //    if (!string.IsNullOrEmpty(txtUsername.Text))
    //    {
    //        SqlConnection con = new SqlConnection(@"Persist Security Info=True;Initial Catalog=aceindus;Data Source=MNHBS3\SQLEXPRESS;Integrated Security = true;");
    //        con.Open();
    //        SqlCommand cmd = new SqlCommand("select * from client_register where uname=@uname", con);
    //        cmd.Parameters.AddWithValue("@uname", txtUsername.Text);
    //        SqlDataReader dr = cmd.ExecuteReader();
    //        if (dr.HasRows)
    //        {
    //            checkusername.Visible = true;
    //            imgstatus.ImageUrl = "images/NotAvailable.jpg";
    //            lblStatus.Text = "UserName Already Taken";
    //        }
    //        else
    //        {
    //            checkusername.Visible = true;
    //            imgstatus.ImageUrl = "images/Icon_Available.gif";
    //            lblStatus.Text = "UserName Available";
    //        }
    //    }
    //    else
    //    {
    //        checkusername.Visible = false;
    //    }
    //}

    [System.Web.Services.WebMethod]
    public static string CheckUserName(string userName)
    {
        string returnValue = string.Empty;
        try
        {
            string consString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            SqlConnection conn = new SqlConnection(consString);
            SqlCommand cmd = new SqlCommand("spx_CheckUserAvailability", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", userName.Trim());
            conn.Open();
            returnValue = cmd.ExecuteScalar().ToString();
            conn.Close();
        }
        catch
        {
            returnValue = "error";
        }
        return returnValue;
    }

}
