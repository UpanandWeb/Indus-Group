using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Admin_clients : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    public static string own = "";
    int CID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        //if (Request.QueryString["ret"] == "create")
        //{
        //    body1.Attributes.Add("onload", "return alertcreate()");
        //}
        //if (Request.QueryString["ret"] == "ok")
        //{
        //    body1.Attributes.Add("onload", "return alertdelete()");

        //}
        //if (Request.QueryString["ret"] == "edit")
        //{
        //    body1.Attributes.Add("onload", "return alertedit()");
        //}
        //if (Session["Addp"].ToString() != "N")
        //{
        //    crtopt.InnerHtml = "<a href='Admin_Createclient.aspx' class='lblog'><font color='maroon'>Add New Client</font></a>";
        //}
        //else
        //{
        //    crtopt.InnerHtml = "";
        //}
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            Bind();
        }
    }
    private void Bind()
    {
        da = new SqlDataAdapter("select * from clients  order by cid desc", cn);
        ds = new DataSet();
        da.Fill(ds, "clients");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
    //protected string FormatUrl(int ID)
    //{
    //    if (ID < 1)
    //        throw new ArgumentOutOfRangeException("sid");

    //    return "Admin_viewclient.aspx?sid=" + ID;
    //}
    //protected string FormatUrlEd(int ID)
    //{
    //    if (Session["Editp"].ToString() != "N")
    //    {
    //        if (ID < 1)
    //            throw new ArgumentOutOfRangeException("sid");
    //        return "Admin_Editclient.aspx?sid=" + ID;
    //    }
    //    else
    //    {
    //        // Errmsg.InnerHtml = "You Didn't Have Edit Permission...";
    //        return "Admin_Errors.aspx?flag=edit";
    //    }
    //}
    //protected string FormatUrlDl(int ID)
    //{
    //    if (Session["Deletep"].ToString() != "N")
    //    {
    //        if (ID < 1)
    //            throw new ArgumentOutOfRangeException("id");
    //        return "Admin_Careers_Delete.aspx?id=" + ID;
    //    }
    //    else
    //    {
    //      //  Errmsg.InnerHtml = "You Didn't Have Delete Permission...";
    //        return "Admin_Errors.aspx?flag=delete";
    //    }
    //}
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    //protected void FormatUrlDl(object sender, CommandEventArgs e)
    //{
    //    Int32 Did = Convert.ToInt32(e.CommandArgument.ToString());
    //    Session["Did"] = Did;
    //    lbldid.Text = Did.ToString();
    //    ModalPopupExtender1.Show();
    //}
    protected void imgbtnsmsdelete_Click(object sender, EventArgs e)
    {
        int i = 0;
        uid = Convert.ToInt32(Session["Did"]);
        if (Session["Deletep"].ToString() != "N")
        {
            if (lbldid.Text != "")
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("Delete from clients where cid='" + lbldid.Text + "'", cn);                
                  i = cmd.ExecuteNonQuery();
                  cn.Close();
                if (i == 1)
                {
                str = "alert('Client Details has been Deleted Successfully');location.replace('Admin_clients.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            //throw new ArgumentOutOfRangeException("id");
            {
                //Response.Redirect("Admin_Seminars_Delete.aspx?sid=" + lbldid.Text);
            }
            // ModalPopupExtender1.Hide();
            //else
            //{
            //    str = "alert('Client Details has been deleted Successfully');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //    ModalPopupExtender1.Hide();
            //}
        }
        else
        {
            //  Errmsg.InnerHtml = "You Didn't Have Delete Permission...";
            Response.Redirect("Admin_Errors.aspx?flag=delete");
        }
    }
    protected void imgnew_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_Createclient.aspx");
    }
    protected void imgedit_Click(object sender, ImageClickEventArgs e)
    {
     //   own = ConfigurationManager.AppSettings["owner"].ToString();
     //   if (lblAcess.Text == own)
     //   {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    CID = Convert.ToInt32(GridView1.DataKeys[i].Values[0].ToString());
                }
            }
            Response.Redirect("Admin_Editclient.aspx?sid=" + CID);
    //    }
    //    else
    //    {
            //str = "alert('You don't have rights to done this task');location.replace('Admin_clients.aspx');";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
      //      body1.Attributes.Add("onload", "return alertdelete()");
       // }
    }
    protected void imgdelete_Click(object sender, ImageClickEventArgs e)
    {
      //  own = ConfigurationManager.AppSettings["owner"].ToString();
      //  if (lblAcess.Text == own)
     //   {
            int ids = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    CID = Convert.ToInt32(GridView1.DataKeys[i].Values[0].ToString());
                }
            }
            try
            {
                int ID = CID;
                cn.Open();
                SqlCommand cmd = new SqlCommand("Delete from clients where cid='" + ID + "'", cn);
                ids = cmd.ExecuteNonQuery();
                cn.Close();
                if (ids == 1)
                {
                    str = "alert('Client Details has been Deleted Successfully');location.replace('Admin_clients.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        //}
        //else
        //{
        //    //str = "alert('You don't have rights to done this task');location.replace('Admin_clients.aspx');";
        //    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //    body1.Attributes.Add("onload", "return alertdelete()");
        //}

    }
    protected void imgview_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                CID = Convert.ToInt32(GridView1.DataKeys[i].Values[0].ToString());
            }
        }
        Response.Redirect("Admin_viewclient.aspx?sid=" + CID);
    }
}

