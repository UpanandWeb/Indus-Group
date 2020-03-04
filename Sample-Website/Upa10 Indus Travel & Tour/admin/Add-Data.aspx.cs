using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Add_Data : System.Web.UI.Page
{
    string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                frimg.Visible = true;
                sec.Visible = false;
                fr23.Visible = false;
                rd1.Visible = false;
                rdsec.Visible = false;
                Button3.Visible = false;
                dl.Visible = false;
                tr1.Visible = false;
                subtitle.Visible = false;
               
            }
            else
            {
                sec.Visible = false;

                bind();
                frimg.Visible = false;
                fr23.Visible = true;
                rd1.Visible = true;
                rdsec.Visible = true;
                Button3.Visible = true;
                rdsec.Visible = true;
            }
        }
        int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }

    protected void bind()
    {
        DataSet ds = new DataSet();
        ds = tr.bindhomedata();
        gv.DataSource = ds;
        gv.DataBind();
    }

    protected void bind2()
    {
        DataSet ds = new DataSet();
        ds = tr.bindplacedata();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (fd1.HasFile)
        {
            if (DropDownList3.SelectedIndex == 4)
            {
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                int sts = 1;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                tr.addspecialoffer(title, cat, subcat, content, img, sts, date);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
                Response.Redirect("Admin-specialoffers.aspx");
            }
            else if  (DropDownList3.SelectedIndex == 5)
            {
                pkg.Visible = false;
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                tr1.Visible = false;
                subtitle.Visible = false;
                fd1.SaveAs(path);
                int sts = 1;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                tr.addtourimg(title, img,content, sts);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
            }
            else if (DropDownList3.SelectedIndex == 6 || DropDownList3.SelectedIndex == 7 || DropDownList3.SelectedIndex == 8 | DropDownList3.SelectedIndex == 9)
            {
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                int sts = 1;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                string pg = "";
                tr.addedservices(title,cat,subcat, content,img, sts,date,pg);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
            }
            else if (DropDownList3.SelectedIndex == 10)
            {
                string title = DropDownList3.SelectedItem.Text;
                string cat = DropDownList3.SelectedValue;
                string subcat = DropDownList1.SelectedValue;
                string img = fd1.FileName.ToString();
                string path = Base_dir1 + "photos/" + img;
                fd1.SaveAs(path);
                int sts = 1;
                string content = txt4.Text;
                string sub = DropDownList4.SelectedItem.Text;
                string date = DateTime.Now.ToString();
                tr.addtourimg(title, img, content, sts);
                string alert = "alert('Data Added');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                txt4.Text = "";
            }
            else if (DropDownList3.SelectedIndex == 2 || DropDownList3.SelectedIndex == 3)
            {
                
                //string title = DropDownList3.SelectedItem.Text;
                //string cat = DropDownList3.SelectedValue;
                //string subcat = DropDownList1.SelectedValue;
                //string img = fd1.FileName.ToString();
                //string path = Base_dir1 + "photos/" + img;
                //fd1.SaveAs(path);
                //int sts = 1;
                //string content = txt4.Text;
                //string sub = DropDownList4.SelectedItem.Text;
                //string date = DateTime.Now.ToString();
                //string pkg = TextBox2.Text;
                //tr.inserwithimgcontent(title, cat, subcat, content, img, sts, date, sub,pkg);
                //string alert = "alert('Data Added');";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                //DropDownList1.SelectedIndex = 0;
                //DropDownList3.SelectedIndex = 0;
                //txt4.Text = "";
                //DropDownList4.SelectedIndex = 0;
            }

            else
            {
               // string title = DropDownList3.SelectedItem.Text;
               // string cat = DropDownList3.SelectedValue;
               // string subcat = DropDownList1.SelectedValue;
               // string img = fd1.FileName.ToString();
               // string path = Base_dir1 + "photos/" + img;
               // fd1.SaveAs(path);
               // int sts = 1;
               // string content = txt4.Text;
               // string sub = DropDownList4.SelectedItem.Text;
               // string date = DateTime.Now.ToString();
               // string pkg = TextBox2.Text;
               //// tr.inserwithimgcontent(title, cat, subcat, content, img, sts, date, sub,pkg);
               // string alert = "alert('Data Added');";
               // Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
               // DropDownList1.SelectedIndex = 0;
               // DropDownList3.SelectedIndex = 0;
               // txt4.Text = "";
            }
        }
            
        else
        {
            //string title = DropDownList3.SelectedItem.Text;
            //string cat = "1";
            //string subcat ="1";
            //string img = "";
           
           
            //int sts = 1;
            //string content = txt4.Text;
            //string date = DateTime.Now.ToString();
            //  string sub=DropDownList4.SelectedValue;
            //  string pkg = TextBox2.Text;
            //tr.inserwithimgcontent(title, cat, subcat, content, img, sts, date,sub,pkg);
            //string alert = "alert('Data Added');";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            //DropDownList1.SelectedIndex = 0;
            //DropDownList3.SelectedIndex = 0;
            //txt4.Text = "";
        }

    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex == 1)
        {
            pkg.Visible = false;
            tr1.Visible = false;
            tr2.Visible = false;
            subtitle.Visible = false;
        }
        // else if (DropDownList3.SelectedIndex == 2)
        //{
        //    //pkg.Visible = true;
        //    //DropDownList1.Items.Clear();
        //    //tr1.Visible =true;
        //    //tr2.Visible = true;
        //    // DataSet ds = new DataSet();
        //    // string id= DropDownList3.SelectedValue;
        //    // ds=tr.bindplace(id);
        //    //DropDownList1.DataSource = ds;
       
        //    //DropDownList1.DataTextField = "place";
        //    //DropDownList1.DataValueField = "id";
        //    //DropDownList1.DataBind();
        //    //DropDownList1.Items.Insert(0, "Select");
        //    //subtitle.Visible = true;
        //    //pkg.Visible = true;
        //}
        //else if (DropDownList3.SelectedIndex == 3)
        //{
        //    pkg.Visible = true;
        //    DropDownList1.Items.Clear();
        //    tr1.Visible = true;
        //    tr2.Visible = true;
        //    DataSet ds = new DataSet();
        //    string id = DropDownList3.SelectedValue;
        //    ds = tr.bindplace(id);
        //    DropDownList1.DataSource = ds;

        //    DropDownList1.DataTextField = "place";
        //    DropDownList1.DataValueField = "id";
        //    DropDownList1.DataBind();
        //    DropDownList1.Items.Insert(0, "Select");
        //    subtitle.Visible = true;
        //    pkg.Visible = true;
        //}
        //else if (DropDownList3.SelectedIndex == 4)
        //{
        //    DropDownList1.Items.Clear();
        //    tr1.Visible = true;
        //    tr2.Visible = true;
        //    subtitle.Visible = false;
        //    DropDownList1.Items.Add("Special Offers on Hotels");
        //    DropDownList1.Items.Add("Speical Offers on Tickets");
        //    DropDownList1.Items.Add("Tourism Summer Vacation");
        //    DropDownList1.Items.Add("Honeymoon Packages");
        //    DropDownList1.Items.Add("International Hotels");
        //    DropDownList1.Items.Add("Value Added Benefits");
        //    DropDownList1.Items.Insert(0, "Select");
        //}
        else if (DropDownList3.SelectedIndex == 2 || DropDownList3.SelectedIndex == 7)
        {
            tr1.Visible = false;
            pkg.Visible = false;
        }
        else if (DropDownList3.SelectedIndex == 3)
        {
            pkg.Visible = false;
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            tr2.Visible = true;
            DropDownList1.Items.Add("Exotic Kashmir");
            DropDownList1.Items.Add("Golden Triangle Holiday");
            DropDownList1.Items.Add("Experience Andamans");
            DropDownList1.Items.Add("Exotic Kashmir");
            DropDownList1.Items.Add("Heritage Travel India");
            DropDownList1.Items.Add("Scenic Kerala");
            DropDownList1.Items.Insert(0, "Select");
            //tr1.Visible = false;
        }
        else if (DropDownList3.SelectedIndex == 4)
        {
            pkg.Visible = false;
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            tr2.Visible = true;
            DropDownList1.Items.Add("Australia Holiday Packages");
            DropDownList1.Items.Add("Europe Tour Packages");
            DropDownList1.Items.Add("Experience Andamans");
            DropDownList1.Items.Add("New Zealand Tour Packages");
            DropDownList1.Items.Add("South East Asia Tours");
            DropDownList1.Items.Add("Srilanka Tours");
            DropDownList1.Items.Insert(0, "Select");
            //tr1.Visible = false;
        }
        else if (DropDownList3.SelectedIndex == 5)
        {
            pkg.Visible = false;
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            tr2.Visible = true;
            DropDownList1.Items.Add("France , Swiss Paris");
         
            DropDownList1.Items.Add("Highlights Of Turkey");
            DropDownList1.Items.Add("Hongkong With Macau Package");
            DropDownList1.Items.Add("Luxury in Singapore");
        
            DropDownList1.Items.Add("Maldives With Cochin Stopover");
            DropDownList1.Items.Insert(0, "Select");
            //tr1.Visible = false;
        }
        else if (DropDownList3.SelectedIndex == 6)
        {
            pkg.Visible = false;
            DropDownList1.Items.Clear();
            tr1.Visible = true;
            tr2.Visible = true;
            DropDownList1.Items.Add("Domestic and International Air Ticketing");
            DropDownList1.Items.Add("Holiday packages");
            DropDownList1.Items.Add("Passport and Visa Assistance");
            DropDownList1.Items.Add("Travel Insurance");
            DropDownList1.Items.Add("Rail and Bus Tickets");
      
            DropDownList1.Items.Insert(0, "Select");
            //tr1.Visible = false;
        }
        //else if (DropDownList3.SelectedIndex == 2 || DropDownList3.SelectedIndex == 3)
        //{
        //    DropDownList1.Items.Clear();
        //    subtitle.Visible = true;
        //    tr1.Visible = true;
        //    tr2.Visible = true;
        //}
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            frimg.Visible = true;
            sec.Visible = false;
        }
        else
        {
            frimg.Visible = false;
            sec.Visible = false;
        }
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked == true)
        {
            frimg.Visible = false;
            sec.Visible = true;
        }
        else
        {
            frimg.Visible = false;
            sec.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt16( DropDownList2.SelectedValue);
        string name = TextBox1.Text;
        int sts = 1;
        tr.insertplace(id, name,sts);
        string alert = "alert('Place Added');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
        DropDownList2.SelectedIndex = 0;
        TextBox1.Text = "";
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
            Label lb = (e.Row.FindControl("lbltitle1") as Label);
            if (lb.Text == "Welcome to Indus Travels")
            {
                Label lb1 = (e.Row.FindControl("lblcate1") as Label);
                lb1.Text = "NA";
            }
            Label lb2 = (e.Row.FindControl("lbldate1") as Label);
            string dt = lb2.Text;
            string[] Separate = dt.Split(' ');
            string desiredDate = Separate[0];
            lb2.Text = desiredDate;
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

           ds= tr.bindstatusperid(id);
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
            Response.Redirect("Admin-HomeEdit.aspx?id=" + id);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        frimg.Visible = true;
        rd1.Visible = false;
        fr23.Visible = false;
        Button3.Visible = false;
        subtitle.Visible = false;
    }
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        secondgv.Visible = true;
        fr23.Visible = false;
        RadioButton3.Checked = false;
        bind2();
        Button4.Visible = true;
        Button3.Visible = false;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

            ds = tr.bindstatusperplace(id);
            string sts = ds.Tables[0].Rows[0]["status"].ToString();
            if (sts == "1")
            {
                tr.updateplacestatus(id, "0");
            }
            else
            {
                tr.updateplacestatus(id, "1");
            }
            string alert = "alert('Status Updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind2();
        }
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();

            tr.deletefromplace(id);
            string alert = "alert('Record Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
            bind2();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-PlaceEdit.aspx?id=" + id);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
            Label lbl = (e.Row.FindControl("lbltitle1") as Label);

            if (lbl.Text == "3")
            {
                lbl.Text = "International Tours";
            }
            else
            {
                lbl.Text = "Domestic Tours";
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        fr23.Visible = true;
        secondgv.Visible = false;
        RadioButton4.Checked = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        sec.Visible = true;
    }
}