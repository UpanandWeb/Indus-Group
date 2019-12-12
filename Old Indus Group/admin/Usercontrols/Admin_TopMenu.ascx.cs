using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Usercontrols_Admin_TopMenu : System.Web.UI.UserControl
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"] == null)
            {

                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                // string s = "select distinct item  from indus_Roles where role='" + Session["utype"].ToString() + "' and mid='"+Session["xId"].ToString()+"' order by item asc";

                //if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
                //{
                //    string emp = Session["utype"].ToString();

                //    if (emp == "Admin")
                //    {
                //        imglogo.Visible = true;
                //    }
                //    else
                //    {
                //        imglogo.Visible = false;
                //    }

                    string s = "select distinct item  from indus_Roles where role='" + Session["utype"].ToString() + "' and mid='" + Session["xId"].ToString() + "' order by item asc";

                    SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    dlitems.RepeatColumns = 6;
                    dlitems.DataSource = ds;
                    dlitems.DataBind();
              //  }
            }
        }
    }

    protected void lnkitems_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandArgument == "itemlist")
        {
            LinkButton lnk = (LinkButton)(sender);
            string text = lnk.Text;
            string s = "select * from menuitems  where item='" + text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            //if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
            //{
            //    string emp = Session["utype"].ToString();

            //    if (emp == "Admin")
            //    {
            string s1 = ds.Tables[0].Rows[0]["item_url"].ToString();
            Response.Redirect(s1);
            //}
            //else
            //{
            //    string s11 = ds.Tables[0].Rows[0]["item_url1"].ToString();
            //    Response.Redirect("../"+s11);
            //}
        }
    }

    protected void lnkALog_click(object sender, EventArgs e)
    {
        Session.Abandon();

        //if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
        //{
        //    string emp = Session["utype"].ToString();

        //    if (emp == "Admin")
        //    {
                Response.Redirect("Admin_Login.aspx");
        //    }
        //    else
        //    {
        //        Response.Redirect("../Login.aspx");
        //    }
        //}
    }
}
