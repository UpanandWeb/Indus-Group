using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Travel_Ideas : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = new DataSet();
            ds = tr.bindideaone();
            lb.Text = ds.Tables[0].Rows[0]["title"].ToString();
            desc.Text = ds.Tables[0].Rows[0]["content"].ToString();

        }
    }

}