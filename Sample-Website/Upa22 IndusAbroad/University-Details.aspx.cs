using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class University_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string s = Request.QueryString["contry"];
            lblcont.Text = s;
            SqlDataAdapter ad = new SqlDataAdapter("select * from IA_University where country='" + s + "' order by uname asc", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            dtl.DataSource = ds;
            dtl.DataBind();
        }
    }
}