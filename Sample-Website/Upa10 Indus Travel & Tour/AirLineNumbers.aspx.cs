using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
/// <summary>
/// /airline pages
/// </summary>
public partial class AirLineNumbers : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    travelsadmin ad = new travelsadmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (txt.Text == "")
            {
                bind();
            }
            else
            {
                bind2(txt.Text);
                ViewState["view"] = txt.Text;
            }

        }
    }
    /// <summary>
    /// bind data for numbers
    /// </summary>
    public void bind()
    {
        DataSet ds = new DataSet();
        ds = tr.bindairlinesnum();
        gv.DataSource = ds;
        gv.DataBind();
    }
    public void bind2(string type)
    {
        DataSet ds = new DataSet();
        ds = ad.bindaairlinelike(type);
        gv.DataSource = ds;
        gv.DataBind();
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if(ViewState["view"]!=null)
        {
     

        string type = Convert.ToString(ViewState["view"]);
        gv.PageIndex = e.NewPageIndex;
        bind2(type);
        }
        else
        {

            gv.PageIndex = e.NewPageIndex;
            bind();
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        if (txt.Text == "")
        {
            bind();
        }
        else
        {
            bind2(txt.Text);
            ViewState["view"] = txt.Text;
        }
    }
}