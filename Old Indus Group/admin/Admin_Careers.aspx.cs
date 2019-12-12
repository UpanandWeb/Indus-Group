using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class igiit_Admin_Admin_Careers : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    public static string own = "";

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

        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            Bind();

            //own = Session["UserName"].ToString();
            //if (own == "Recruiter")
            //{
            //    pj.Visible = true;
            //    anj.Visible = true;
            //    pr.Visible = false;
            //    ar.Visible = false;
            //    pj.Style.Add(HtmlTextWriterStyle.FontSize, "22px");

            //}
            //else
            //{
                pj.Visible = true;
                anj.Visible = true;
                pr.Visible = true;
                ar.Visible = true;
            //}
        }
    }
    /// <summary>
    /// displayed jobseekers
    /// </summary>
    private void Bind()
    {
        //own = Session["UserName"].ToString();
        //if (own == "Recruiter")
        //{
        //    da = new SqlDataAdapter("select case when status=1 then 'Active' when status=0 then 'Deactive' end as status1, *, convert(varchar(12),pdate,113)post from Careers where added=2 order by id desc", cn);
        //}
        //else
        //{
       // da = new SqlDataAdapter("select case when status=1 then 'Active' when status=0 then 'Deactive' end as status1, *, convert(varchar(12),pdate,113)post from Careers where added=1  order by id desc", cn);

            da = new SqlDataAdapter("select case when status=1 then 'Active' when status=0 then 'Deactive' end as status1, *, convert(varchar(12),pdate,113)post from Careers  order by id desc", cn);
       // }
        ds = new DataSet();
        da.Fill(ds, "Careers");
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
        return "Admin_Careers.aspx";
    }

    /// <summary>
    /// edit specific jobseeker data
    /// </summary>
    /// <param name="ID"></param>
    /// <returns></returns>
    protected string FormatUrlEd(int ID)
    {
        if (Session["Editp"].ToString() != "N")
        {
            if (ID < 1)
                throw new ArgumentOutOfRangeException("id");

            return "Admin_Careers_Edit.aspx?id=" + ID;
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
      //  own = ConfigurationManager.AppSettings["owner"].ToString();
    //    if (lblAcess.Text == own)
    //    {
            uid = Convert.ToInt32(Session["Did"]);
            if (Session["Deletep"].ToString() != "N")
            {
                if (uid > 1)
                    //throw new ArgumentOutOfRangeException("id");
                    Response.Redirect("Admin_Careers_Delete.aspx?id=" + uid);
                ModalPopupExtender1.Hide();
            }
            else
            {
                //  Errmsg.InnerHtml = "You Didn't Have Delete Permission...";
                Response.Redirect("Admin_Errors.aspx?flag=delete");
            }

       // }
      //  else
      //      body1.Attributes.Add("onload", "return alertdelete12()");
    }

    protected void chkall_CheckedChanged(object sender, EventArgs e)
    {
        int currentcount = 0;
        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkall");
        if (chkall.Checked == true)
        {
            foreach (GridViewRow gvOrdr in GridView1.Rows)
            {
                CheckBox chkIndividual = (CheckBox)gvOrdr.FindControl("chkone");
                chkIndividual.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow gvOrdr in GridView1.Rows)
            {
                CheckBox chkIndividual = (CheckBox)gvOrdr.FindControl("chkone");
                chkIndividual.Checked = false;
            }
        }
    }

    //protected void subgrid_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    string statusid = "";
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //      int   useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id"));
    //      SqlDataAdapter da = new SqlDataAdapter("select status , case when status=1 then 'Active' when status=0 then 'Deactive' end as status1 from  Careers order by id desc", cn);
    //        DataSet dsSelItems = new DataSet();
    //        da.Fill(dsSelItems);

    //            statusid = Convert.ToString(dsSelItems.Tables[0].Rows[0]["status1"]);

    //        //if (dsSelItems.Tables[0].Rows.Count > 0)
    //        //{

    //        //    statusid = Convert.ToString(dsSelItems.Tables[0].Rows[0]["status1"]);
    //        //}
    //        LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
    //        LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
    //        if (statusid == "Active")
    //        {
    //            lnkactivate.Visible = false;
    //            lnkdeactivate.Visible = true;
    //        }
    //        else
    //        {
    //            lnkactivate.Visible = true;
    //            lnkdeactivate.Visible = false;
    //        }
    //    }
    //}

    //protected void lnkactivate_click(object sender, EventArgs e)
    //{
    //    LinkButton imgbtnact = sender as LinkButton;
    //    GridViewRow gvrow1 = imgbtnact.NamingContainer as GridViewRow;
    //    int usid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Values["id"].ToString());
    //    cn.Open();
    //    SqlCommand cmd = new SqlCommand("update Careers set status=1 where id=" + usid + "", cn);
    //    cmd.ExecuteNonQuery();
    //    cn.Close();

    //    string strscpt = "alert('email status is Activated sucessfully');location.replace('Admin_Careers.aspx');";
    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //}

    //protected void lnkdeactivate_click(object sender, EventArgs e)
    //{
    //    LinkButton imgbtnact = sender as LinkButton;
    //    GridViewRow gvrow1 = imgbtnact.NamingContainer as GridViewRow;
    //    int usid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Values["id"].ToString());
    //    cn.Open();
    //    SqlCommand cmd = new SqlCommand("update Careers set status=0 where id=" + usid + "", cn);
    //    cmd.ExecuteNonQuery();
    //    cn.Close();
    //    string strscpt = "alert('Email status is deactivated sucessfully');location.replace('Admin_Careers.aspx');";
    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //}

    /// <summary>
    /// activate or deactivate jobseeker
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkactivate_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "DataCommand")
        {
            int usid = Convert.ToInt32(e.CommandArgument.ToString());
            SqlDataAdapter da = new SqlDataAdapter("select status from  Careers  where id=" + usid + "", cn);
            DataSet dsSelItems = new DataSet();
            da.Fill(dsSelItems);
            if (dsSelItems.Tables[0].Rows[0]["status"].ToString() == "1")
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("update Careers set status=0 where id=" + usid + "", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                string strscpt = "alert('Job status is deactivated sucessfully');location.replace('Admin_Careers.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
            else
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("update Careers set status=1 where id=" + usid + "", cn);
                cmd.ExecuteNonQuery();
                cn.Close();

                string strscpt = "alert('Job status is Activated sucessfully');location.replace('Admin_Careers.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        string s11 = Session["UserName"].ToString();

        if (s11 == "Recruiter")
        {
           // GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
            GridView1.Columns[8].Visible = false;

        }
        else
        {
           // GridView1.Columns[6].Visible = true;
            GridView1.Columns[7].Visible = true;
            GridView1.Columns[8].Visible = true;

        }
    }
}

