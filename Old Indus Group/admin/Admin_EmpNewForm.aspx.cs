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
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_EmpNewForm : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    int CID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        //if (Request.QueryString["ret"] == "ok")
        //{
        //    body1.Attributes.Add("onload", "return alertdelete()");

        //}
        //if (Request.QueryString["ret"] == "edit")
        //{
        //    body1.Attributes.Add("onload", "return alertedit()");

        //}
        if (Request.QueryString["ret"] == "create")
        {
            body1.Attributes.Add("onload", "return alertcreate()");

        }
        string streg = string.Empty;
        string usid = string.Empty;                
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            Binddata();
        }
    }
    private void Binddata()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("select ID,FamilyName,FName,MName,SSNo,passportno,I94No,CONVERT(VARCHAR(10), expdt_I94, 105) as expdt_I94," +
            "H1B_EAC,CONVERT(VARCHAR(10), Valid_EAC, 105)as Valid_EAC,I_EAC,CONVERT(VARCHAR(10), Valid_IEAC, 105) as Valid_IEAC," +
            "EAD,CONVERT(VARCHAR(10), Valid_EAD, 105) as Valid_EAD,I_485_EAC,CONVERT(VARCHAR(10), Valid_I485, 105) as Valid_I485," +
            "DOL_LCA,CONVERT(VARCHAR(10), Valid_LCA, 105) as Valid_LCA,DOL_PERM,CONVERT(VARCHAR(10), Valid_PERM, 105) as Valid_PERM from EmpForm order by ID Desc", con);
        da.Fill(ds, "EmpForm");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    //getting username from particular row
        //    string Uid = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ID"));
        //    //identifying the control in gridview
        //    LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkRecDelete");
        //    //raising javascript confirmationbox whenver user clicks on link button
        //    lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + Uid + "')");
        //} 
    }
    //protected void lnkdelrecord(object sender, EventArgs e)
    //{
    //     own = ConfigurationManager.AppSettings["owner"].ToString();
    //     if (lblAcess.Text == own)
    //     {
    //         LinkButton lnkRecDelete = sender as LinkButton;
    //         //getting particular row linkbutton
    //         GridViewRow gvrow = lnkRecDelete.NamingContainer as GridViewRow;
    //         //getting userid of particular row
    //         int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
    //         //string username = gvrow.Cells[0].Text;
    //         con.Open();
    //         SqlCommand cmd = new SqlCommand("delete from EmpForm where  ID=" + userid, con);
    //         int result = cmd.ExecuteNonQuery();
    //         con.Close();
    //         if (result == 1)
    //         {
    //             Binddata();
    //             //Displaying alert message after successfully deletion of user
    //             ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Employee details deleted successfully')", true);
    //         }
    //     }
    //     else
    //         body1.Attributes.Add("onload", "return alertdelete12()");
    //}
    //protected string EditUrl(string EID, int Id)
    //{
    //    //own = ConfigurationManager.AppSettings["owner"].ToString();
    //    //if (lblAcess.Text == own)
    //    //{
    //    if (Id < 0)
    //        throw new ArgumentOutOfRangeException("id");
    //    else
    //        return "Admin_EmpNewForm_Edit.aspx?uid=" + EID + " &vid=" + Id;
    //    //}
    //    //else
    //    //    body1.Attributes.Add("onload", "return alertdelete12()");
    //}

    protected void imgedit_Click(object sender, ImageClickEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    CID = Convert.ToInt32(GridView1.DataKeys[i].Values[0].ToString());
                }
            }
            Response.Redirect("Admin_EmpNewForm_Edit.aspx?vid=" + CID);
        //}
        //else
        //{
        //    //str = "alert('You don't have rights to done this task');location.replace('Admin_clients.aspx');";
        //    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //    body1.Attributes.Add("onload", "return alertdelete12()");
        //}
    }
    protected void imgdelete_Click(object sender, ImageClickEventArgs e)
    {          
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
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
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from EmpForm where  ID=" + ID, con);
                ids = cmd.ExecuteNonQuery();
                con.Close();
                if (ids == 1)
                {
                    Binddata();
                    //Displaying alert message after successfully deletion of user
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('H1B Visa details deleted successfully')", true);
            
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
        //    body1.Attributes.Add("onload", "return alertdelete12()");
        //}

    }

    protected void lnknew_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_EmpNewFrmCreate.aspx");
    }
}
