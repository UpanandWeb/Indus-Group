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

public partial class admin_news : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }
        if (Session["Addp"].ToString() != "N")
        {
            crtopt.InnerHtml = "<a href='Admin_create_newevents.aspx' class='lblog'><font color='maroon'>Add News & Events</font></a>";
        }
        else
        {
            crtopt.InnerHtml = "";
        }
        if (!IsPostBack)
        {
            lblAcess.Text = Session["UserName"].ToString();
        }


        Binddata();

    }
    private void Binddata()
    {
        da = new SqlDataAdapter("select id,jobtitle,jobdesc,sdate,convert(varchar(20),pdate,101) as pdate from newsevents order by sdate desc", cn);
        ds = new DataSet();
        da.Fill(ds, "newsevents");
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
    protected string FormatUrl(int ID)
    {

        if (ID < 1)

            throw new ArgumentOutOfRangeException("id");

        return "news.aspx";

    }
    protected void GridView1_rowdatabound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
            //identifying the control in gridview
            LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkDelete");
            //raising javascript confirmationbox whenver user clicks on link button
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    protected string FormatUrlEd(int ID)
    {
        if (Session["Editp"].ToString() != "N")
        {
            if (ID < 1)

                throw new ArgumentOutOfRangeException("id");

            return "Admin_edit_newevents.aspx?id=" + ID;
        }

        else
        {
            // Errmsg.InnerHtml = "You Didn't Have Edit Permission...";
            return "Admin_Errors.aspx?flag=edit";
        }

    }



    //protected string FormatUrlDl(int ID)
    //{
    //    if (Session["Deletep"].ToString() != "N")
    //    {

    //        if (ID < 1)

    //            throw new ArgumentOutOfRangeException("id");

    //        return "Admin_delete_newevents.aspx?id=" + ID;
    //    }
    //    else
    //    {
    //        //  Errmsg.InnerHtml = "You Didn't Have Delete Permission...";
    //        return "Admin_Errors.aspx?flag=delete";
    //    }
    //}

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            LinkButton imgbtndel = sender as LinkButton;
            //getting particular row linkbutton
            GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
            //getting userid of particular row
            int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
            //string username = gvrow.Cells[0].Text;
            cn.Open();
            SqlCommand cmd = new SqlCommand("delete from newsevents where id=" + userid, cn);
            int result = cmd.ExecuteNonQuery();
            cn.Close();
            if (result == 1)
            {
                Binddata();
                //Displaying alert message after successfully deletion of user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Event details deleted successfully')", true);
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }

   

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}

