using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrols_Header1 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          // Session.RemoveAll();
          //  if (Session["userid"] != null && Session["Designation"] != null)

           // string a = Session["userid"].ToString();
            if ((Session["userid"] == null) ||(Session["userid"] == ""))
            {
                lnk1.Visible = true;
                lnkimg.Visible = true;
                lnkOut.Visible = false;
            }
            else
            {
                lnkOut.Visible = false;
                lnk1.Visible = false;
                lnkimg.Visible = false;
            }
        }
    }

    protected void lnk1_Click(object sender, EventArgs e)
    {
        lnk1.Visible = true;
        lnkimg.Visible = true;
        lnkOut.Visible = false;
        Response.Redirect("Login.aspx");
    }

    protected void lnkOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        lnk1.Visible = true;
        lnkimg.Visible = true;
        lnkOut.Visible = false;
        Response.Redirect("Default.aspx");
    }

    /// <summary>
    /// This function turns arbitrary strings containing a 
    /// URI into an appropriate absolute URI.  
    /// </summary>
    /// <param name="input">A relative or absolute URI (as a string)</param>
    /// <param name="baseUri">The base URI to use if the input parameter is relative.</param>
    /// <returns>An absolute URI</returns>
    //public static Uri MakeFullUri(string input, Uri baseUri)
    //{
    //    var tmp = new Uri(input, UriKind.RelativeOrAbsolute);
    //    //if it's absolute, return that
    //    if (tmp.IsAbsoluteUri)
    //    {
    //        return tmp;
    //    }
    //    // build relative on top of the base one instead
    //    return new Uri(baseUri, tmp);
    //}

    //protected void dd_Click(object sender, ImageClickEventArgs e)
    //{
    //    Uri baseUri = new Uri("http://1indus.com/india");
    //    Uri newUri = MakeFullUri("/some/path?abcd=123", baseUri);
    //}

    protected void lnkhome_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            //lnk1.Visible = true;
            //lnkimg.Visible = true;
            //lnkOut.Visible = false;

            string pageurl = "Default.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkcorporate_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Corporate.aspx");
        }
        else
        {
            //lnk1.Visible = true;
            //lnkimg.Visible = true;
            //lnkOut.Visible = false;

            string pageurl = "Corporate.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkservices_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Services.aspx");
        }
        else
        {
            string pageurl = "Services.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkcareers_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Careers.aspx");
        }
        else
        {
            string pageurl = "Careers.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkclients_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Clients.aspx");
        }
        else
        {
            string pageurl = "Clients.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkit_Click(object sender, EventArgs e)
    {
        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Itconsulting.aspx");
        }
        else
        {
            string pageurl = "Itconsulting.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkproducts_Click(object sender, EventArgs e)
    {

        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Products.aspx");
        }
        else
        {
            string pageurl = "Products.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnksupport_Click(object sender, EventArgs e)
    {

        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Support.aspx");
        }
        else
        {
            string pageurl = "Support.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
    protected void lnkfeedback_Click(object sender, EventArgs e)
    {

        if ((Session["userid"] == null) || (Session["userid"] == ""))
        {
            Response.Redirect("Feedback.aspx");
        }
        else
        {
            string pageurl = "Feedback.aspx";
            Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
}