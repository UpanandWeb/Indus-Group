using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Specialofferedit : System.Web.UI.Page
{
    travelsadmin ad = new travelsadmin();
    travelshome tr = new travelshome();
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();
            DataSet ds = new DataSet();
            ds = tr.bindperstatusoffer(id);

            for (int i = 0; i < DropDownList3.Items.Count; i++)
            {
                if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
                {
                    DropDownList3.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }
            }
            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["subcat"]))
                {
                    DropDownList1.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }
            }
            txt4.Text = ds.Tables[0].Rows[0]["content"].ToString();
            tr2.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-specialoffers.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();

        string title = DropDownList3.SelectedItem.Text;
        string sub = DropDownList1.SelectedItem.Text;
        string cont = txt4.Text;
        if (fd1.HasFile)
        {
            string img = fd1.FileName.ToString();
            string path = Base_dir1 + "photos/" + img;
            fd1.SaveAs(path);
            ad.updatespecialofferwithimg(id, title, sub, cont, img);
            string alert = "alert('Record Updated Successfully!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }
        else
        {
             ad.updatespecialoffer(id, title, sub, cont);
            string alert = "alert('Record Updated Successfully!');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        }
    }
    protected void lnk_Click(object sender, EventArgs e)
    {
        tr2.Visible = true;
    }
}