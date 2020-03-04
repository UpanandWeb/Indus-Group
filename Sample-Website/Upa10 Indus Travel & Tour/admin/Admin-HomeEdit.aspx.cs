using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Admin_HomeEdit : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    travelshome tr = new travelshome();
    string gallgid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //try
            //{

                gallgid = Convert.ToString(Request.QueryString["id"]);
                Session["id"] = gallgid;
                // binddata(gallgid);
                DataSet ds = new DataSet();

                ds = binddata(gallgid);
                //if (ds.Tables[0].Rows[0]["imagename"] == null)
                //{
                //    btnimg.Visible = true;
                //}
                if (ds.Tables[0].Rows[0]["title"].ToString() == "Welcome to Indus Travels")
                {
                    btnimg.Visible = false;
                    tr1.Visible = false;
                    subtitle.Visible = false;
                    for (int i = 0; i < DropDownList3.Items.Count; i++)
                    {
                        if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
                        {
                            DropDownList3.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;
                        }
                    }

                }
                else
                {
                    for (int i = 0; i < DropDownList3.Items.Count; i++)
                    {
                        if (DropDownList3.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["title"]))
                        {
                            DropDownList3.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;
                        }
                    }
                    //if (DropDownList1.Items.FindByValue(ds.Tables[0].Rows[0]["category"].ToString()) != null)
                    //{
                    //    DropDownList1.Items.FindByValue(ds.Tables[0].Rows[0]["category"].ToString()).Selected = true;
                    //}

                    //DropDownList1.DataTextField = ds.Tables[0].Columns["category"].ToString();
                    //DropDownList1.DataSource = ds;     //assigning datasource to the dropdownlist
                    //DropDownList1.DataBind();  //binding dropdownlist
                    // DropDownList1.SelectedValue= ds.Tables[0].Rows[0]["category"].ToString();
                    // DropDownList1.SelectedIndex =Convert.ToInt32(ds.Tables[0].Rows[0]["category"]);
                    // string id1=ds.Tables[0].Rows[0]["category"].ToString();
                    // DataSet ds1 = new DataSet();
                    // ds1 = tr.retrieveplace(id1);
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
                    //  DropDownList1.SelectedItem.Text = ds.Tables[0].Rows[0]["place"].ToString();
                    // DropDownList1.SelectedItem.Text = ds1.Tables[0].Rows[0]["place"].ToString();
                    // DropDownList1.DataSource = ds.Tables[0];
                    //  DropDownList1.DataBind();
                    for (int i = 0; i < DropDownList4.Items.Count; i++)
                    {
                        if (DropDownList4.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["subtitle"]))
                        {
                            DropDownList4.Items[i].Selected = true;

                            // DropDownList1.Items.Insert(0, "Select");
                            break;
                        }
                    }
                }

                txt4.Text = ds.Tables[0].Rows[0]["content"].ToString();
                txtpkg.Text = ds.Tables[0].Rows[0]["pkg_details"].ToString(); 


            //}
            //catch {
            //    Response.Redirect("Add-Data.aspx");
            //}
                int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
                ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
        }
    }
    public DataSet binddata(string id)
    {
        DataSet ds = new DataSet();
        //ds = ob.galleryaddedid(id);
        ds = tr.bindhomeedit(id);
        return ds;
        //GAEditddl.Items.Insert(0, "Select Category");
        //GAEditddl.Items.Insert(1, "Home Image");
        // DataSet ds1 = new DataSet();
        //ds1 = ba.admingallaryview(cid);
        //GAEditddl.SelectedValue = ds.Tables[0].Rows[0]["category"].ToString();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex == 1)
        {
            tr1.Visible = false;
            tr2.Visible = false;
            subtitle.Visible = false;
            btnimg.Visible = false;
           // DropDownList1.Items.Clear();
           // DropDownList4.Items.Clear();
        }
        else if (DropDownList3.SelectedIndex == 2)
        {
            DropDownList1.Items.Clear();
            tr1.Visible = true;
           // tr2.Visible = true;
            btnimg.Visible = true;
            DataSet ds = new DataSet();
            string id = DropDownList3.SelectedValue;
            ds = tr.bindplace(id);
            DropDownList1.DataSource = ds;

            DropDownList1.DataTextField = "place";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
            subtitle.Visible = true;
        }
        else if (DropDownList3.SelectedIndex == 3)
        {
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            //tr2.Visible = true;
            btnimg.Visible = true;
            DataSet ds = new DataSet();
            string id = DropDownList3.SelectedValue;
            ds = tr.bindplace(id);
            DropDownList1.DataSource = ds;

            DropDownList1.DataTextField = "place";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
            subtitle.Visible = true;
        }

    }
    protected void btnimgchg_Click(object sender, EventArgs e)
    {
        tr2.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        gallgid = Convert.ToString(Request.QueryString["id"]);
        if (fd1.HasFile)
        {
            //SqlCommand cmd=new SqlCommand("delete from It_home where id="+gallgid,con)           
            tr.deletefromhome(gallgid);
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
            string packagedetails = txtpkg.Text;
            tr.inserwithimgcontent(title, category, subcat, content, img, sts, date, sub,packagedetails);
            // tr.updatehomedata(gallgid, title, category, subcat, content);
            string alert = "alert('Data Updated Successfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            DropDownList1.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList4.SelectedIndex = 0;
            txt4.Text = "";
        }
        else {
            gallgid = Convert.ToString(Request.QueryString["id"]);
            string title = DropDownList3.SelectedItem.Text;
            string category = DropDownList3.SelectedValue;
            string subcat = DropDownList1.SelectedValue;
            string content = txt4.Text;
            int sts = 1;
            string sub = DropDownList4.SelectedItem.Text;
            //string sub = DropDownList1.SelectedValue;
            string date = DateTime.Now.ToString();
            string package = txtpkg.Text;
            tr.updatehomedata(title, category, subcat, content,sub,gallgid,package);
            string alert = "alert('Data Updated Successfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            //if (DropDownList1.SelectedItem.Text != "" || DropDownList3.SelectedItem.Text != "")
            //{
            //    DropDownList1.SelectedIndex = 0;
            //    DropDownList3.SelectedIndex = 0;
            //    txt4.Text = "";
            //    DropDownList4.SelectedIndex = 0;
            //}
            //else
            //{
            //    DropDownList4.SelectedIndex = 0;
            //    txt4.Text = "";
            //}


        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add-Data.aspx");
    }
}