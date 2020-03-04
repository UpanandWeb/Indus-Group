using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage3 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Session["user"] == null)
            //{

            //}
            //else
            //{
            //    lg.Text = "Log Out";
            //    string name = Convert.ToString(Session["user"]);
            //    //lblname.Text = name;
            //}
        }
    }
}
