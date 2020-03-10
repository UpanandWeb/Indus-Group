using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// summary code to bind and display the user job post details
/// </summary>
public partial class Jobhistory : System.Web.UI.Page
{
    string emailid;
    //Establish sql connection
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //Initialise object to bind data.
    Binddata bd = new Binddata();
    string id;

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERID"] == null)
        {
            Response.Redirect("newaccount_login.aspx");
        }
        Binddata1();
        DataList1.Visible = false;
        DataList2.Visible = false;
        empdata.Visible = false;
        tblper.Visible = false;
        tblwrk.Visible = false;
        Binddata1();
        LinkButton3.Attributes.Add("onclick", "window.close();return false");
    }
    /// <summary>
    /// Summary code to bind the job post details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkjobs(object sender, EventArgs e)
    {
        MyGrid.Visible = true;
        Binddata1();
    }
    /// <summary>
    /// summary code to bind data
    /// </summary>
    public void Binddata1()
    {

        emailid = Convert.ToString(Session["USERID"]);
        string qry = "select * from jobhistory where emailid='" + emailid + "'";
        //open database connection to connect to sql server.
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter(qry, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        MyGrid.DataSource = ds;
        MyGrid.DataBind();
        //close database connection to disconnect to sql server
        conn.Close();
    }
    /// <summary>
    /// summary code to logout 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnklog(object sender, EventArgs e)
    {
       
        LinkButton3.Attributes.Add("onclick", "window.close();return false");
    }
    /// <summary>
    /// summary code to view the user profile who login
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkprof(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        DataList2.Visible = true;
        empdata.Visible = true;
        MyGrid.Visible = false;
        //open database connection to connect to sql server.
        conn.Open();
        string qry1 = "select id from JDT_PersonalInfo1 where email='"+emailid+"'";
        SqlCommand cmd = new SqlCommand(qry1, conn);
        SqlDataReader dr= cmd.ExecuteReader();
        while (dr.Read())
        {
            id = Convert.ToString(dr["id"]);
        }

        DataSet ds1 = new DataSet();
        //Naviagte and get all the details of job post
        ds1 = bd.GetJSDet(id);
        empdata.DataSource = ds1;
        empdata.DataBind();

        DataSet ds2 = new DataSet();
        //Naviagte and get all the details of job post through id
        ds2 = bd.GetJSEdu(id);
        DataList1.DataSource = ds2;
        DataList1.DataBind();

        DataSet ds3 = new DataSet();
        //Naviagte and get all the details of job post through id.
        ds3 = bd.GetJSWork(id);
        DataList2.DataSource = ds3;
        DataList2.DataBind();
        //close database connection to disconnect to sql server.
        conn.Close();
    }
    /// <summary>
    /// summary code for edit button to edit the job post details.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit(object sender, EventArgs e)
    {
        DataList1.Visible = false;
        DataList2.Visible = false;
        empdata.Visible = false;
        MyGrid.Visible = false;
        tblper.Visible = true;
        //open database connection to connect to sql server.
        conn.Open();
        string id1 = Convert.ToString(Session["ID"]);

        SqlCommand cmd = new SqlCommand("select * from JDT_PersonalInfo1 where id='" + id1 + "'", conn);
        SqlDataReader dar = cmd.ExecuteReader();
        while (dar.Read())
        {
            txtfname.Text = dar["fname"].ToString();
            txtlname.Text = dar["lname"].ToString();
            txtadressline1.Text = dar["addline1"].ToString();
            txtadresline2.Text = dar["addline2"].ToString();
            txtcity.Text = dar["city"].ToString();
            ddlstate.SelectedItem.Text = dar["state"].ToString();
            ddlCountry.SelectedItem.Text = dar["country"].ToString();
        }
        //close database connection to disconnect to sql server.
        conn.Close();
    }
    /// <summary>
    /// summary description to update the career job post details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnUpdate(object sender, EventArgs e)
    {
        DataList1.Visible = true;
        DataList2.Visible = true;
        empdata.Visible = true;
        MyGrid.Visible = false;

        //open database connection to connect to sql server.
        conn.Open();
        string id2 = Convert.ToString(Session["ID"]);
        SqlCommand cmd = new SqlCommand("update JDT_PersonalInfo1 set fname=@fname,lname=@lname,addline1=@add1,addline2=@add2,city=@city,state=@state,country=@country where id='" + id2 + "'", conn);
        cmd.Parameters.Add("@fname", SqlDbType.NVarChar, 50).Value = txtfname.Text;
        cmd.Parameters.Add("@lname", SqlDbType.NVarChar, 50).Value = txtlname.Text;
        cmd.Parameters.Add("@add1", SqlDbType.NVarChar, 50).Value = txtadressline1.Text;
        cmd.Parameters.Add("@add2", SqlDbType.NVarChar, 50).Value = txtadresline2.Text;
        cmd.Parameters.Add("@city", SqlDbType.NVarChar, 50).Value = txtcity.Text;
        cmd.Parameters.Add("@state", SqlDbType.NVarChar, 50).Value = ddlstate.SelectedItem.Text;
        cmd.Parameters.Add("@country", SqlDbType.NVarChar, 50).Value = ddlCountry.SelectedItem.Text;
        cmd.ExecuteNonQuery();

        //close database connection to disconnect to sql server.
        conn.Close();
        DataSet ds1 = new DataSet();

        //navigate and bind the job registration details
        ds1 = bd.GetJSDet(id2);
        empdata.DataSource = ds1;
        empdata.DataBind();

    }
    /// <summary>
    /// code for paging
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        MyGrid.DataBind();
        Binddata1();
    }
    /// <summary>
    /// summary description to edit the work experience details in registration page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit1(object sender, EventArgs e)
    {
        DataList1.Visible = false;
        DataList2.Visible = false;
        empdata.Visible = false;
        MyGrid.Visible = false;
        tblper.Visible = false;
        tblwrk.Visible = true;

        //open database connection to connect to sql server.
        conn.Open();
        string id1 = Convert.ToString(Session["ID"]);

        SqlCommand cmd2 = new SqlCommand("select * from JDT_WorkExp1 where id='" + id1 + "'", conn);
        SqlDataReader dr = cmd2.ExecuteReader();
        while (dr.Read())
        {
            txttitle.Text = dr["title"].ToString();
            txtexp.Text = dr["workexp"].ToString();
            ddlfrom.SelectedItem.Text = dr["frommnth"].ToString();
            txtfromyr.Text = dr["fromyear"].ToString();
            DropDownList1.SelectedItem.Text = dr["tomonth"].ToString();
            txttoyear.Text = dr["toyear"].ToString();
        }
        //close database connection to disconnect to sql server.
        conn.Close();
    }
    /// <summary>
    /// summary description to update the work experience details of registration page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnwork_Click(object sender, EventArgs e)
    {

        DataList1.Visible = true;
        DataList2.Visible = true;
        empdata.Visible = true;
        MyGrid.Visible = false;

        //open database connection to connect to sql server.
        conn.Open();
        string id2 = Convert.ToString(Session["ID"]);
        SqlCommand cmd = new SqlCommand("update JDT_WorkExp1 set title=@title,workexp=@workexp,frommnth=@frommnth,fromyear=@fromyear,tomonth=@tomonth,toyear=@toyear where id='" + id2 + "'", conn);
        cmd.Parameters.Add("@title", SqlDbType.NVarChar, 50).Value = txttitle.Text;
        cmd.Parameters.Add("@workexp", SqlDbType.NVarChar, 1500).Value = txtexp.Text;
        cmd.Parameters.Add("@frommnth", SqlDbType.NVarChar, 50).Value = ddlfrom.SelectedItem.Text;
        cmd.Parameters.Add("@fromyear", SqlDbType.NVarChar, 50).Value = txtfromyr.Text;
        cmd.Parameters.Add("@tomonth", SqlDbType.NVarChar, 50).Value = DropDownList1.SelectedItem.Text;
        cmd.Parameters.Add("@toyear", SqlDbType.NVarChar, 50).Value = txttoyear.Text;

        cmd.ExecuteNonQuery();
        //close database connection to disconnect to sql server.
        conn.Close();
        DataSet ds3 = new DataSet();

        //Navigate and get job post work experience details 
        ds3 = bd.GetJSWork(id2);
        DataList2.DataSource = ds3;
        DataList2.DataBind();
    }

}
