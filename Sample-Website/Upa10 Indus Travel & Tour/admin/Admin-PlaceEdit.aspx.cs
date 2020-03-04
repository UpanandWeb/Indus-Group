using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Admin_PlaceEdit : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    string gallgid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gallgid = Convert.ToString(Request.QueryString["id"]);
            Session["id"] = gallgid;
            DataSet ds = new DataSet();

            ds = binddata(gallgid);

            string type = Convert.ToString(ds.Tables[0].Rows[0]["category"]);
            if (type == "2")
            {
                type = "Domestic Tours";
            }
            else
            {
                type = "International Tours";
            }
            for (int i = 0; i < DropDownList2.Items.Count; i++)
            {
                if (DropDownList2.Items[i].Text== type)
                {
                    DropDownList2.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;
                }
            }
            TextBox1.Text = ds.Tables[0].Rows[0]["place"].ToString();
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        }
    }
    public DataSet binddata(string id)
    {
        DataSet ds = new DataSet();
        //ds = ob.galleryaddedid(id);
       // ds = tr.bindhomeedit(id);
       ds = tr.bindplaceedit(gallgid);
        //ds = tr.bindhomeedit(gallgid);
        return ds;
        //GAEditddl.Items.Insert(0, "Select Category");
        //GAEditddl.Items.Insert(1, "Home Image");
        // DataSet ds1 = new DataSet();
        //ds1 = ba.admingallaryview(cid);
        //GAEditddl.SelectedValue = ds.Tables[0].Rows[0]["category"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        gallgid = Convert.ToString(Request.QueryString["id"]);
        string type = DropDownList2.SelectedItem.Value;
        string place = TextBox1.Text;
        tr.updateplacename(gallgid, type, place);

        string alert = "alert('Data Updated Successfully');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

    }
}