using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Admin_products : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                frimg.Visible = false;
                btncancel.Visible = false;
                binddata();
                
            }
            else {
                frimg.Visible = true;
                fr23.Visible = false;
                btncancel.Visible = true;
                tdbtnpost.Visible = false;
                tr2.Visible = false;
                td1.InnerText = "Edit Products details";
                string productid = Request.QueryString["id"].ToString();
                Session["id"] = productid;
                DataSet ds = new DataSet();
                ds = tr.bindeditproductsdata(productid);
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
    public void binddata()
    {
        DataSet ds = new DataSet();
        ds = tr.bindproductdata();
        gv.DataSource = ds;
        gv.DataBind();
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
                tr.insertproduct(title, img, content, sts, date);
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

                tr.insertproduct(title, img, content, sts, date);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            }
        }
        else if (Button3.Text == "Update")
        {
            string id = Request.QueryString["id"].ToString();
            string title = DropDownList3.SelectedItem.Text;
            string content = txt4.Text;
            int sts = 1;
            tr.updateproducteditdata(id, title, content, sts);
            string alert = "alert('Data Updated succesfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        frimg.Visible = true;
        tdbtnpost.Visible = false;
        fr23.Visible = false;
        td1.InnerText = "Add Products details";
    }
    protected void lnkmore_Click(object sender, EventArgs e)
    {

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
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

            ds = tr.bindstatusforproducts(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                tr.updatestatustoproducts(id,"0");
            }
            else
            {
                tr.updatestatustoproducts(id, "1");
            }
            string alert = "alert('Status Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            binddata();
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletefromproducts(id);
            string alert = "alert('Deleted Record');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            binddata();
        }

        if (e.CommandName == "Edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-products.aspx?id=" + id);
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-products.aspx");
    }
}
