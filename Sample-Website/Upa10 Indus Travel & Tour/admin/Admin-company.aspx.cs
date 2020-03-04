using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_company : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
       // fr23.Visible = false;
        
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                frimg.Visible = false;
                btncancel.Visible = false;
                binddata();
            }
            else
            {
                frimg.Visible = true;
                fr23.Visible = false;
                btncancel.Visible = true;
                tdbtn.Visible = false;
                tr2.Visible = false;
                td1.InnerText = "Edit Company Details";
                string companyid = Request.QueryString["id"].ToString();
                Session["id"] = companyid;
                DataSet ds = new DataSet();
                ds = tr.bindeditcompanydata(companyid);
                for (int i = 0; i < DropDownList3.Items.Count; i++)
                {
                    if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
                    {
                        DropDownList3.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;
                    }
                }
                txt4.Text = ds.Tables[0].Rows[0]["content"].ToString();
                Button1.Text = "Update";
            }
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        }
    }
    protected void binddata()
    {
        DataSet ds = new DataSet();
        ds = tr.bindcompanydata();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        frimg.Visible = true;
        fr23.Visible = false;
        tdbtn.Visible = false;
        td1.InnerText = "Add Company Details";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Submit")
        {
            if (fd1.HasFile)
            {
                string title = DropDownList3.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string content = txt4.Text;
                int sts = 1;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                tr.insertcompany(title, img, content, sts, date);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            }
            else
            {
                string title = DropDownList3.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string content = txt4.Text;
                int sts = 1;
                string img = " ";

                tr.insertcompany(title, img, content, sts, date);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            }
        }
        else if (Button1.Text =="Update")
        {
            string id = Request.QueryString["id"].ToString();
            string title = DropDownList3.SelectedItem.Text;
            string content = txt4.Text;
            int sts = 1;
            tr.updatecompanydata(id,title, content, sts);
            string alert = "alert('Data Updated succesfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                }
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

            ds = tr.bindstatusforcompany(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                tr.updatestatustocompany(id, "0");
            }
            else
            {
                tr.updatestatustocompany(id, "1");
            }
            string alert = "alert('Status Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            binddata();
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletefromcompany(id);
            string alert = "alert('Deleted Record');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            binddata();
        }

        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-company.aspx?id=" + id);
        }
    }
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the TextBox control.
            LinkButton txtName = (e.Row.FindControl("lnkmore") as LinkButton);

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
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-company.aspx");
    }
}