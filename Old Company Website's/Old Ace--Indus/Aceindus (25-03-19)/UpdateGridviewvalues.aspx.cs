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

public partial class UpdateGridviewvalues : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=MNHBS3\SQLEXPRESS;Integrated Security=true;Initial Catalog=venu;Persist Security Info=true;");
    private int userid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        userid = Convert.ToInt32(Request.QueryString["UserId"].ToString());
        if (!IsPostBack)
        {
            BindControlvalues();
        }
    }
    private void BindControlvalues()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from UserDetails where UserId=" + userid, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Close();
        DataSet ds = new DataSet();
        da.Fill(ds);
        lblUsername.Text = ds.Tables[0].Rows[0][1].ToString();
        txtfname.Text = ds.Tables[0].Rows[0][2].ToString();
        txtlname.Text = ds.Tables[0].Rows[0][3].ToString();
        txtemail.Text = ds.Tables[0].Rows[0][4].ToString();
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update UserDetails set FirstName='" + txtfname.Text + "',LastName='" + txtlname.Text + "',Email='" + txtemail.Text + "' where UserId=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowSuccess", "javascript:Showalert('" + lblUsername.Text + "')", true);
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
