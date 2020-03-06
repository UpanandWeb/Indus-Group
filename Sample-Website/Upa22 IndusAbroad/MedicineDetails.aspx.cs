using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MedicineDetails : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

        string s = Request.QueryString["contry"];
        if (s == ""||s==null)
        {
            s = "Georgia";
        }
        lblcont.Text = s;
        SqlDataAdapter ad = new SqlDataAdapter("select * from IA_University where country='" + s + "' and status=3 order by uname asc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        dtl.DataSource = ds;
        dtl.DataBind();
       // nm.Visible = false;
       
    }


    protected void binddata(string s)
    {

        SqlDataAdapter ad = new SqlDataAdapter("select * from IA_University where country='" + s + "'and status=3 order by uname asc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        dtl.DataSource = ds;
        dtl.DataBind();
            
        }
    protected void imgau_Click(object sender, ImageClickEventArgs e)
    {
        string s = imgau.ToolTip;
        binddata(s);
        

    }

    protected void view()
    {
        string s = ImageButton2.ToolTip;
        binddata(s);
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string s = ImageButton2.ToolTip;
        binddata(s);
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        string s = ImageButton3.ToolTip;
        binddata(s);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        string s = ImageButton4.ToolTip;
        binddata(s);
    }
}
