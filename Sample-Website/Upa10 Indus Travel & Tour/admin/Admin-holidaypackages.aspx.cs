using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Admin_specialoffers : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    newtravels1 travels = new newtravels1();
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                frimg.Visible = false;
                btncancel.Visible = false;
                bind();
            }
            else
            {
                frimg.Visible = true;
                fr23.Visible = false;
                Button3.Visible = false;
                Button1.Text = "Update";
                td1.InnerText = "Edit Package Details";
                string pkgid = Request.QueryString["id"].ToString();
                Session["id"] = pkgid;
                DataSet ds = new DataSet();
                ds = travels.bindpackageedit(pkgid);
                for (int i = 0; i < DropDownList3.Items.Count; i++)
                {
                    if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
                    {
                        DropDownList3.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;
                    }
                }
                for (int i = 0; i < ddlpackage.Items.Count; i++)
                {
                    if (ddlpackage.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["pkgtype"]))
                    {
                        ddlpackage.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;
                    }
                }
                string id = ds.Tables[0].Rows[0]["category"].ToString();
                DataSet ds1 = new DataSet();
                ds1 = tr.bindplace(id);
                DropDownList1.DataTextField = "place";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataSource = ds1;
                DropDownList1.DataBind();
                for (int i = 0; i < DropDownList1.Items.Count; i++)
                {
                    if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["place"]))
                    {
                        DropDownList1.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;

                    }
                }
                for (int i = 0; i < DropDownList4.Items.Count; i++)
                {
                    if (DropDownList4.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["subtitle"]))
                    {
                        DropDownList4.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;
                    }
                }

                txt4.Text = ds.Tables[0].Rows[0]["content"].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0]["pkg_details"].ToString();
               

            }

 
            }

        }
    protected void bind()
    {
        DataSet ds = new DataSet();
        ds = tr.bindpackages();
        gv.DataSource = ds;
        gv.DataBind();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DataSet ds = new DataSet();
        //string id = DropDownList3.SelectedValue;
        
        string id = DropDownList3.SelectedItem.Value;
        ds = tr.bindplace(id);
        DropDownList1.DataSource = ds;

        DropDownList1.DataTextField = "place";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "Select");
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        frimg.Visible = true;
        fr23.Visible = false;
        Button3.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Submit")
        {
            if (fd1.HasFile)
            {
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                string packtype = ddlpackage.SelectedItem.Text;
                int sts = 1;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string pkg = TextBox2.Text;
               travels.inserwithimgcontenttour(title, cat, subcat, content, img, sts, date, sub, pkg,packtype);
                
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
                DropDownList4.SelectedIndex = 0;
            }
            else
            {

                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = "";
                int sts = 1;
                string packtype = ddlpackage.SelectedItem.Text;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string pkg = TextBox2.Text;
               travels.inserwithimgcontenttour(title, cat, subcat, content, img, sts, date, sub, pkg,packtype);
                
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
                DropDownList4.SelectedIndex = 0;
            }
        }
        else if (Button1.Text == "Update")
        {
            string gallgid = Convert.ToString(Request.QueryString["id"]);
            if (fd1.HasFile)
            {
                //SqlCommand cmd=new SqlCommand("delete from It_home where id="+gallgid,con)           
                
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                string title = DropDownList3.SelectedItem.Text;
                string category = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string content = txt4.Text;
                int sts = 1;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string packtype = ddlpackage.SelectedItem.Text;
                string packagedetails =TextBox2.Text;
               // tr.inserwithimgcontent(title, category, subcat, content, img, sts, date, sub, packagedetails,packtype);
                // tr.updatehomedata(gallgid, title, category, subcat, content);
                travels.updatehomedatawithimgtour(title, category, subcat, content, sub,packtype, gallgid, img);
                string alert = "alert('Data Updated Successfully');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                txt4.Text = "";
            }
            else
            {
                gallgid = Convert.ToString(Request.QueryString["id"]);
                string title = DropDownList3.SelectedItem.Text;
                string category = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string content = txt4.Text;
                string packtype = ddlpackage.SelectedItem.Text;
                int sts = 1;
                string sub = DropDownList4.SelectedItem.Text;
                //string sub = DropDownList1.SelectedValue;
                string date = DateTime.Now.ToString();
                string package = TextBox2.Text;
                travels.updatehomedatatour(title, category, subcat, content, sub, gallgid, package,packtype);
                string alert = "alert('Data Updated Successfully');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            }
        }
    }
    
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

            ds = tr.bindstatusperid(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                tr.updatestatus(id, "0");
            }
            else
            {
                tr.updatestatus(id, "1");
            }
            string alert = "alert('Status Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            tr.deletefromhome(id);
            string alert = "alert('Deleted Record');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind();
        }

        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-holidaypackages.aspx?id=" + id);
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-holidaypackages.aspx");
    }
}
