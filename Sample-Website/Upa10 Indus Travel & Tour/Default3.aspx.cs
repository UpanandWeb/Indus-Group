using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Default3 : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
   
        DataSet ds = new DataSet();
        ds = tr.bindjobs();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void ViewDetails(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        Label4.Text = "Selected Details :" + row.Cells[2].Text + "," + row.Cells[1].Text;
        LinkButton Lnk = (LinkButton)sender;
        //Label2.Text = Lnk.Text;
        DataSet ds = new DataSet();
        ds = tr.bindjobperid(Lnk.CommandArgument.ToString());
        string te = ds.Tables[0].Rows[0]["desp"].ToString();
        Label4.Text = te;
        //Show the modal popup extender
        GridViewDetails.Show();
    }


    protected void btnclose_Click(object sender, EventArgs e)
    {
        //Hide the modal popup extender
        GridViewDetails.Hide();
    }
   
}