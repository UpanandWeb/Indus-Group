using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Career : System.Web.UI.Page
{
    /// <summary>
    /// bind career pages
    /// </summary>
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }


    /// <summary>
    /// bind data to be displayed
    /// </summary>
    public void bind()
    {
        DataSet ds = new DataSet();
        ds = tr.bindjobs();
        gv.DataSource = ds;
        gv.DataBind();
    }

    /// <summary>
    /// for view of data in popups
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = tr.bindjobperid(id);
            string te = ds.Tables[0].Rows[0]["desp"].ToString();
            //desc.Text = te;
           
        }
    }


    /// <summary>
    /// display popups
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ViewDetails(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        //Label4.Text = "Selected Details :" + row.Cells[2].Text + "," + row.Cells[1].Text;
        LinkButton Lnk = (LinkButton)sender;
        //Label2.Text = Lnk.Text;
        DataSet ds = new DataSet();
        ds = tr.bindjobperid(Lnk.CommandArgument.ToString());
        string te = ds.Tables[0].Rows[0]["desp"].ToString();
        Label4.Text = te;
        Label4.Attributes.Add("style", "color: black;");
        //Show the modal popup extender
        GridViewDetails.Show();
    }


    protected void btnclose_Click(object sender, EventArgs e)
    {
        //Hide the modal popup extender
        GridViewDetails.Hide();
    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        LinkButton Lnk = (LinkButton)sender;
        string id = Lnk.CommandArgument.ToString();
        Response.Redirect("ApplyJob.aspx?jobcode=" + id);
    }
}