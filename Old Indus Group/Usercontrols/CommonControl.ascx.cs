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
public partial class Usercontrols_CommonControl : System.Web.UI.UserControl
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
                if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
                {
                    string emp = Session["utype"].ToString();

                    if (emp == "Admin")
                    {
                        Admin_TopMenu.Visible = true;
                        Emp_topmenu.Visible = false;
                        Header1.Visible = false;

                    }
                    else
                    {
                        Admin_TopMenu.Visible = false;
                        Emp_topmenu.Visible = true;
                        Header1.Visible = true;

                    }
                }
            }
        }
    }
    
}