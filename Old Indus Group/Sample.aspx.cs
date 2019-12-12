using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sample : System.Web.UI.Page
{
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //   string x= GetUser_IP();
    //}

    //protected string GetUser_IP()
    //{
    //    string VisitorsIPAddr = string.Empty;
    //    if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
    //    {
    //        VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
    //    }
    //    else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
    //    {
    //        VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
    //    }
    //    return VisitorsIPAddr;
    //}

    //protected void ss_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Default.aspx");
    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Server.Transfer("Default.aspx");
    //}

    protected void Page_PreInit(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "PreInit";
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "Init";
    }

    protected void Page_InitComplete(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "InitComplete";
    }

    protected override void OnPreLoad(EventArgs e)
    {
        //Work and It will assign the values to label.
        //If the page is post back, then label contrl values will be loaded from view state.
        //E.g: If you string str = lblName.Text, then str will contain viewstate values.
        lblName.Text = lblName.Text + "<br/>" + "PreLoad";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "Load";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "btnSubmit_Click";
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "LoadComplete";
    }

    protected override void OnPreRender(EventArgs e)
    {
        //Work and It will assign the values to label.
        lblName.Text = lblName.Text + "<br/>" + "PreRender";
    }

    protected override void OnSaveStateComplete(EventArgs e)
    {
        //Work and It will assign the values to label.
        //But "SaveStateComplete" values will not be available during post back. i.e. View state.
        lblName.Text = lblName.Text + "<br/>" + "SaveStateComplete";
    }

    protected void Page_UnLoad(object sender, EventArgs e)
    {
        //Work and it will not effect label contrl, view stae and post back data.
        lblName.Text = lblName.Text + "<br/>" + "UnLoad";
    }
}