using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_User : System.Web.UI.Page
{
    home ob = new home();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            bind();
            tr2.Visible = false;
        }

    }
    public void bind()
    {
        DataSet ds = new DataSet();
        ds = ob.userdata();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
    //[System.Web.Services.WebMethod(EnableSession = true)]
    //public static string checkUserName(string IDVal)
    //{
    //     //string email = txtemail.Text;
    //    //DataSet ds = new DataSet();
    //    //ds= ob.checkuser(email);
    //    //if(ds.Tables[0].Rows.Count>0)
    //    //{
    //    //     string strScript = "alert('Email Id Already Registred');";
    //    //// Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
    //    //    //txtemail.Text="";
    //    //}

    //}


    protected void btnsub_Click(object sender, EventArgs e)
    {
        string fname = txtfname.Text;
        string lname = txtlname.Text;
        string email = txtemail.Text;
        string deg = ddldesig.SelectedItem.Text;
        string userid = txtuserid.Text;
        string pwd = txtpassword.Text;
        string cpwd = txtcnfpwd.Text;
        string add = txtaddress.Text;
        string add2 = txtaddress1.Text;
        string mob = txtmobile.Text;
        string date = DateTime.Now.ToString();
        int sts = 1;

     ob.insertuser( fname,  lname,  deg,  email,  userid,  pwd,  cpwd,  add,  add2,  mob, sts,date);
     string strScript = "alert('User Created');";
         Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
            txtfname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
             txtmobile.Text = "";
            ddldesig.SelectedIndex = 0;
            txtuserid.Text = "";
            txtpassword.Text = "";
            txtcnfpwd.Text = "";
            txtaddress.Text = "";
            txtaddress1.Text = "";
            


    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        string email = txtemail.Text;
        DataSet ds = new DataSet();
        ds= ob.checkuser(email);
        if(ds.Tables[0].Rows.Count>0)
        {
             string strScript = "alert('Email Id Already in Use');";
         Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
            txtemail.Text="";
        }

        
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        string user = txtuserid.Text;
        DataSet ds = new DataSet();
        ds = ob.checkuserid(user);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string strScript = "alert('User Id Already in Use');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
            txtuserid.Text = "";
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            SqlDataAdapter ad = new SqlDataAdapter("select status from OP_user where id= " + id, con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string id1 = ds.Tables[0].Rows[0]["status"].ToString();
                if (id1 == "1")
                {
                    int sts=0;
                    ob.updatests(sts, id);
                    string strScript = "alert('Status updated');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                    bind();
                }
                else if (id1 == "0")
                {
                    int sts = 1;
                    ob.updatests(sts, id);
                    string strScript = "alert('Status Updated');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                    bind();
                }
            }
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ob.deleteuser(id);
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-Useredit.aspx?id=" + id);
           // ob.deleteuser(id);
        }
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();  
    }
    protected void gv_DataBound(object sender, EventArgs e)
    {
    
    }
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the TextBox control.
            LinkButton txtName = (e.Row.FindControl("LinkButton1") as LinkButton);

            //Find the DropDownList control.
            if (txtName.Text == "1")
            {
                txtName.Text = "Active";
            }
            else
            {
                txtName.Text = "Deactivate";
            }
         
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        tr2.Visible = true;
        tr1.Visible = false;
    }
}