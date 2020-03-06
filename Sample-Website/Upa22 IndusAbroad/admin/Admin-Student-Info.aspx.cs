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
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                bind();
            }
        }
    }
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IA_Studentinfo order by userid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        MyGrid.DataSource = ds;
        MyGrid.DataBind();
    }

    protected void MyGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)MyGrid.Rows[e.RowIndex];
        string id = Convert.ToString(MyGrid.DataKeys[e.RowIndex].Value);

   
    }
    protected void imgbtnview_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string a = e.CommandArgument.ToString();
            Response.Redirect("Admin-Student-View.aspx?id="+a);
        }
    }

    protected void imgbtndel_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string a = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand("delete from  IA_Studentinfo where userid='" + a+"'", con);
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

    protected void lnkactivate_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "active")
        {
            string a = e.CommandArgument.ToString();
            SqlDataAdapter sda = new SqlDataAdapter("select * from  IA_Studentinfo where userid='" + a + "'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string aa = ds.Tables[0].Rows[0]["uStatus"].ToString();
                if (aa == "0")
                {
                    SqlCommand cmd = new SqlCommand("update  IA_Studentinfo set uStatus=1 where userid='" + a + "'", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i == 1)
                    {
                        string str = "alert('Status updated successfully.');relocation('Admin-Student-Info.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("update  IA_Studentinfo set uStatus=0 where userid='" + a + "'", con);
                    con.Open();
                    int i1 = cmd1.ExecuteNonQuery();
                    con.Close();
                    if (i1 == 1)
                    {
                        string str = "alert('Status updated successfully.');relocation('Admin-Student-Info.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
            }
        }
    }
}