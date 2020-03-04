using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Admin_TravelIdeaEdit : System.Web.UI.Page
{
      travelshome tr = new travelshome();
    travelsadmin ad = new travelsadmin();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        DataSet ds = new DataSet();
        ds = tr.bindperidea(id);
        //for (int i = 0; i < DropDownList3.Items.Count; i++)
        //{
        //    if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
        //    {
        //        DropDownList3.Items[i].Selected = true;
                DropDownList3.SelectedItem.Text=Convert.ToString(ds.Tables[0].Rows[0]["title"]);
                DropDownList3.Items.Insert(0, "Select");
              

            //}
        //}
        txt4.Text = ds.Tables[0].Rows[0]["content"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Travelideas.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        string tit = DropDownList3.SelectedItem.Text;
        string cont = txt4.Text;
        ad.updateidea(id, tit, cont);
        string alert = "alert('Record Updated Successfully!');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
    }
}