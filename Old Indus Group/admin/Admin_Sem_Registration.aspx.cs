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
 
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Admin_Sem_Registration : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from seminar_enquiry  order by sid desc", cn);
        ds = new DataSet();
        da.Fill(ds, "seminars");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void FormatUrlDl(object sender, CommandEventArgs e)
    {

        Int32 Did = Convert.ToInt32(e.CommandArgument.ToString());
        Session["Did"] = Did;
        lbldid.Text = Did.ToString();
        ModalPopupExtender1.Show();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    protected void imgbtnsmsdelete_Click(object sender, EventArgs e)
    {
        own = ConfigurationManager.AppSettings["owner"].ToString();
        if (lblAcess.Text == own)
        {
            uid = Convert.ToInt32(Session["Did"]);
            if (Session["Deletep"].ToString() != "N")
            {
                if (lbldid.Text != "")
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("delete from seminar_enquiry where sid=" + lbldid.Text, cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    //Response.Redirect("Admin_Seminars_Delete.aspx?sid=" + lbldid.Text);
                    Bind();
                    body1.Attributes.Add("onload", "return alertdelete()");
                }
            }
            else
            {
                Response.Redirect("Admin_Errors.aspx?flag=delete");
            }
        }
        else
            body1.Attributes.Add("onload", "return alertdelete12()");
    }
}
