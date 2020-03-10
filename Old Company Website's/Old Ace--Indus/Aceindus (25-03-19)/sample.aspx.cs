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

public partial class sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }
    protected void BindGridview()
    {
        SqlConnection con = new SqlConnection("Data Source=MNHBS3/SQLEXPRESS;Integrated Security=true;Initial Catalog=venu;Persist Security Info=true;");
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from UserDetails", con);


        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Close();
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvrecords.DataSource = ds;
        gvrecords.DataBind();
    }
}
