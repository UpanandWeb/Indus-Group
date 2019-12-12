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

public partial class admin_Admin_CreateConsultancy : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                if (Request.QueryString["cid"] != null)
                {
                    uid = Request.QueryString["cid"].ToString();
                    if (uid != "")
                    {
                        SqlDataAdapter da = new SqlDataAdapter("select  * from ig_counsaltancy where cid='" + uid + "'", con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            CName.Text = ds.Tables[0].Rows[0]["cname"].ToString();
                            txtFname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                            txtLname.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                            txtDesg.Text = ds.Tables[0].Rows[0]["disgnation"].ToString();

                            txtMail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                            txtph.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                            txtLoc.Text = ds.Tables[0].Rows[0]["Current_Location"].ToString();
                            txtstatus.Text = ds.Tables[0].Rows[0]["Visa_status"].ToString();
                            txtRemark.Text = ds.Tables[0].Rows[0]["Discription"].ToString();
                            txtskill.Text = ds.Tables[0].Rows[0]["skill"].ToString();
                            btncancel.Visible = true;
                            btnsubmit.Visible = false;
                            btnupdate.Visible = true;


                        }
                    }
                }
                else
                {
                    btncancel.Visible = true;
                    btnsubmit.Visible = true;
                    btnupdate.Visible = false;
                }
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string pdate = System.DateTime.Now.ToString();
        con.Open();
        string s = "insert into ig_counsaltancy (pdate,cname,firstname,lastname,disgnation,emailid,mobile,Current_Location,Visa_status,Discription,skill) values             ('" + pdate + "','" + CName.Text + "','" + txtFname.Text + "','" + txtLname.Text + "','" + txtDesg.Text + "',            '" + txtMail.Text + "','" + txtph.Text + "','" + txtLoc.Text + "','" + txtstatus.Text + "','" + txtRemark.Text + "','" + txtskill.Text+ "') ";
        SqlCommand cmd = new SqlCommand(s, con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string strscpt = "alert ('Data Saved');location.replace('Emp-Consultancy.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            string strscpt = "alert ('Problem Occured Please Try again....');location.replace('Emp-Consultancy.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Consultancy.aspx");
    }
}