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

public partial class admin_Admin_systemip : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (Request.QueryString["ret"] == "create")
        {
            body1.Attributes.Add("onload", "return alertcreate()");

        }

        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }
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
            Bind();
        }

    }

    private void Bind()
    {
        da = new SqlDataAdapter("select * from track1 order by tid desc", cn);
        ds = new DataSet();
        da.Fill(ds);
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

            throw new ArgumentOutOfRangeException("sid");

        return "Admin_viewclient.aspx?sid=" + ID;

    }


    protected string FormatUrlEd(int ID)
    {
        if (Session["Editp"].ToString() != "N")
        {
            if (ID < 1)

                throw new ArgumentOutOfRangeException("sid");

            return "Admin_Editclient.aspx?sid=" + ID;
        }

        else
        {
            // Errmsg.InnerHtml = "You Didn't Have Edit Permission...";
            return "Admin_Errors.aspx?flag=edit";
        }
    }

    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    protected void FormatUrlDl(object sender, CommandEventArgs e)
    {
        Int32 Did = Convert.ToInt32(e.CommandArgument.ToString());
        Session["Did"] = Did;
        lbldid.Text = Did.ToString();
        ModalPopupExtender1.Show();
    }
    protected void imgbtnsmsdelete_Click(object sender, EventArgs e)
    {
        int i = 0;
        uid = Convert.ToInt32(Session["Did"]);
        if (Session["Deletep"].ToString() != "N")
        {

            if (lbldid.Text != "")
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("Delete from track1 where tid='" + lbldid.Text + "'", cn);
                i = cmd.ExecuteNonQuery();
                cn.Close();
                if (i == 1)
                {
                    str = "alert('Record Deleted Successfully');location.replace('Admin_systemip.aspx');";
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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbltime = (Label)e.Row.FindControl("Label3");
            if (lbltime.Text != null)
            {
                lbltime.Text= DateTime.Parse(lbltime.Text).ToString("dd-MMM-yyyy hh:mm:ss tt");
                string strgroupids = lbltime.Text.ToString();
                strgroupids = strgroupids.Remove(strgroupids.Length - 2);
                lbltime.Text = strgroupids;
            }
        }
    }
}

