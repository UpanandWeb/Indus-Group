using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public partial class admin_Student_Info : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from [IA_Studentinfo] order by userid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        MyGrid.DataSource = ds;
        MyGrid.DataBind();
    }
    protected void MyGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)MyGrid.Rows[e.RowIndex];
        string id = Convert.ToString(MyGrid.DataKeys[e.RowIndex].Value);

        SqlCommand cmd = new SqlCommand("delete from  IA_Studentinfo where userid=" + id, con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string str = "alert('Record Deleted successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        bind();
    }
}