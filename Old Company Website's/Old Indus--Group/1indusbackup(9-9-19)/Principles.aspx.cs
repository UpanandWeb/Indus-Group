using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class india_Principles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string path = Server.MapPath("~/admin//Emp_photos/a.txt");
                string readText = File.ReadAllText(path);
                lbldata.Text = readText;
            }
        }
    }

    //protected void TextBox1_TextChanged(object sender, EventArgs e)
    //{
    //    txtdata.Text = TextBox1.Text;
    //    string x = txtdata.Text;

    //}
}