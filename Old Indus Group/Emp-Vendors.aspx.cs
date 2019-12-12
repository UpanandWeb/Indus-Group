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
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Emp_Vendors : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int statusid;
    public static string own = "";
    int usid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Binddata();
            }
        }
    }
    private void Binddata()
    {
        // serletter.Visible = false;

        SqlDataAdapter da = new SqlDataAdapter("Select * from vendors order by firm_name asc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds, "vendors");

        if (ds.Tables[0].Rows.Count > 0)
        {
            //pgd1.DataSource = ds.Tables["vendors"].DefaultView;

            //pgd1.CurrentPageIndex = CurrentPage;
            //pgd1.AllowPaging = true;
            //pgd1.PageSize = 25;

            //lnknxt.Enabled = !(pgd1.IsLastPage);
            //lnkprev.Enabled = !(pgd1.IsFirstPage);
            //if (lnknxt.Enabled == true)
            //{
            //    lnknxt.Visible = true;
            //}
            //else
            //{
            //    lnknxt.Visible = false;
            //}

            //if (lnkprev.Enabled == false)
            //{
            //    lnkprev.Visible = false;
            //}
            //else
            //{
            //    lnkprev.Visible = true;
            //}
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
            ViewState["data"] = ds;
        }
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (ViewState["data"] == null)
        {
            MyGrid.PageIndex = e.NewPageIndex;
            LinkButton letter = sender as LinkButton;
            string id = Convert.ToString(Session["serch"]);
            bindtype(id);
        }
        else
        {
            MyGrid.PageIndex = e.NewPageIndex;
            Binddata();
        }
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
            e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");

            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "vid"));
            sqlConnection.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from vendors where vid=" + useriD, sqlConnection);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
            }

            sqlConnection.Close();

            string emptylbl = "";
            Label lblcp = (Label)e.Row.FindControl("lbl333");
            emptylbl = das.Tables[0].Rows[0]["name"].ToString();
            if (emptylbl == "")
            {
                lblcp.Text = "*****";
                lblcp.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblcp.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl1 = "";
            Label lbldesig = (Label)e.Row.FindControl("lbl3333");
            emptylbl1 = das.Tables[0].Rows[0]["title"].ToString();
            if (emptylbl1 == "")
            {
                lbldesig.Text = "*****";
                lbldesig.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lbldesig.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl11 = "";
            Label lblemail = (Label)e.Row.FindControl("lbl33331");
            emptylbl11 = das.Tables[0].Rows[0]["venmail"].ToString();
            if (emptylbl11 == "")
            {
                lblemail.Text = "*****";
                lblemail.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblemail.ForeColor = System.Drawing.Color.Gray;
            }

            string emptylbl111 = "";
            Label lblmob = (Label)e.Row.FindControl("lbl333m");
            emptylbl111 = das.Tables[0].Rows[0]["mobile"].ToString();
            if (emptylbl111 == "")
            {
                lblmob.Text = "*****";
                lblmob.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmob.ForeColor = System.Drawing.Color.Gray;
            }


            //LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");

            //if (statusid == 2)
            //{
            //    lnkactivate.Text = "Deactive";
            //}
            //else if (statusid == 1)
            //{
            //    lnkactivate.Text = "Active";
            //}
            //else if (statusid == 0)
            //{
            //    lnkactivate.Text = "New";
            //}
        }
        //own = Session["UserName"].ToString();
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    // Hide the edit button when some condition is true
        //    // for example, the row contains a certain property
        //    if (own == "Recruiter")
        //    {
        //        ImageButton btnEdit = (ImageButton)e.Row.FindControl("imgbtndela");
        //        btnEdit.Visible = false;
        //        MyGrid.HeaderRow.Cells[7].Visible = false;
        //        MyGrid.Columns[7].ItemStyle.Width = 0;

        //        ImageButton btnEdit1 = (ImageButton)e.Row.FindControl("imgbtneditb");
        //        btnEdit1.Visible = false;
        //        MyGrid.HeaderRow.Cells[8].Visible = false;
        //        MyGrid.Columns[8].ItemStyle.Width = 0;
        //    }
        //}


    }
    protected void filter(object sender, EventArgs e)
    {
        ViewState.Clear();
        //  letter1.Visible = false;
        //string  letter = (string)e.CommandArgument;
        LinkButton letter = sender as LinkButton;
        Session["serch"] = letter.Text;
        bindtype(letter.Text);
    }

    protected void bindtype(string id)
    {
        id = Convert.ToString(Session["serch"]);
        SqlDataAdapter da = new SqlDataAdapter("select * from vendors where Firm_Name LIKE '" + id + "%'", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            //pgd2.DataSource = ds.Tables["Table"].DefaultView;
            //pgd2.CurrentPageIndex = CurrentPage1;
            //pgd2.AllowPaging = true;
            //pgd2.PageSize = 100;

            //lnknxt1.Enabled = !(pgd2.IsLastPage);
            //lnkprev1.Enabled = !(pgd2.IsFirstPage);
            //if (lnknxt1.Enabled == true)
            //{
            //    lnknxt1.Visible = true;
            //    serletter.Visible = true;
            //}
            //else
            //{
            //    lnknxt1.Visible = false;
            //}

            //if (lnkprev1.Enabled == false)
            //{
            //    lnkprev1.Visible = false;
            //}
            //else
            //{
            //    lnkprev1.Visible = true;
            //    serletter.Visible = true;

            //}

            MyGrid.DataSource = ds;
            MyGrid.DataBind();
            ViewState["type"] = ds;
        }

        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No Vendor Found !!!');location.replace('Emp-Vendors.aspx');", true);
        }
    }
    //protected void lnkactivate(object sender, CommandEventArgs e)
    //{
    //    own = ConfigurationManager.AppSettings["owner"].ToString();
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    SqlDataAdapter ad = new SqlDataAdapter("select * from vendors where vid= " + usid + "", sqlConnection);
    //    DataSet ds = new DataSet();
    //    ad.Fill(ds);
    //    statusid = Convert.ToInt32(ds.Tables[0].Rows[0]["status"].ToString());

    //    if (statusid == 0)
    //    {
    //        statusid = 1;
    //    }
    //    else if (statusid == 1)
    //    {
    //        statusid = 2;
    //    }
    //    else
    //    {
    //        statusid = 1;
    //    }

    //    string date = System.DateTime.Now.ToString("dd/MM/yyyy");
    //    sqlConnection.Open();
    //    SqlCommand cmd = new SqlCommand("update vendors set status='" + statusid + "',apbdate='" + date + "' where vid=" + usid, sqlConnection);
    //    int result = cmd.ExecuteNonQuery();
    //    sqlConnection.Close();
    //    if (result == 1)
    //    {
    //        //Displaying alert message after successfully deletion of user
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Vendor Status  Updated Successfully');location.replace('Emp-Vendors.aspx');", true);
    //    }
    //}


    protected void lbl1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ss")
        {
            string userid = e.CommandArgument.ToString();
            Response.Redirect("Emp-Createvendor.aspx?sid=" + userid);
        }
    }
   
    protected void btnVendor_Click(object sender, EventArgs e)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from vendors where firm_name like '" + txtsrchven.Text + "%'", sqlConnection);
        DataSet ds = new DataSet();
        ad.Fill(ds);
       
        if (ds.Tables[0].Rows.Count > 0)
        {
          //  MyGrid.Columns[6].Visible = false;
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }
}