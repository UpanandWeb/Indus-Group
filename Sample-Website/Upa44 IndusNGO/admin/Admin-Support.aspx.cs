using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Support : System.Web.UI.Page
{
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    home ob = new home();
    home2 ob2 = new home2();
    exception ec = new exception();
    string exep_page = "Admin-Support.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                mn.Visible = false;
                fr.Visible = false;
                rd.Visible = false;
                DataTable dt = new DataTable();
                dt = ob2.bindsupportmenu();
                DropDownList1.DataTextField = "menu_name";
                DropDownList1.DataValueField = "sid";
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "Select");
                frimg.Visible = false;
                bind();
                Td1.Visible = false;
                Td2.Visible = false;
                Td3.Visible = false;
            }
        }

    }


    protected void bind()
    {
        DataTable dt = new DataTable();
       dt= ob.bindsupportadmin();
       gv.DataSource = dt;
       gv.DataBind();
    }

    protected void bind1()
    {
        DataTable dt = new DataTable();
        dt = ob.bindsupportmenu();
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    protected void bind2()
    {
        DataTable dt = new DataTable();
        dt = ob.bindsupportimg();
        GridView3.DataSource = dt;
        GridView3.DataBind();
    }

    protected void bind3()
    {
        DataTable dt = new DataTable();
        dt = ob.bindspecialmenu();
        GridView4.DataSource = dt;
        GridView4.DataBind();
    }
    protected void rad1_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            fr.Visible = true;
            fr23.Visible = false;
            mn.Visible = false;
            DataTable dt = new DataTable();
            dt = ob2.bindsupportmenu();
            DropDownList1.DataTextField = "menu_name";
            DropDownList1.DataValueField = "sid";
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
            frimg.Visible = false;
        }
        catch (Exception ex)
        {
            ec.insert_exception(ex,exep_page);
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        fr.Visible = false;
        fr23.Visible = false;
        mn.Visible = true;
        frimg.Visible = false;
    }
    protected void post_Click(object sender, EventArgs e)
    {
        rd.Visible = true;
        fr.Visible = true;
        post.Visible = false;
        fr23.Visible = false;
        sp.Visible = false;
        ml.Visible = false;
        frimg.Visible = false;
        rad2.Visible = false;
        Td1.Visible = false;
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
      
        if (DropDownList1.SelectedValue == "3")
        {
            int sts1 = 1;
            string date1 = DateTime.Now.ToString();

            ob.insertsupport(txt1.Text, DropDownList1.SelectedValue, TextBox1.Text, date1, sts1);

            SqlDataAdapter ad1 = new SqlDataAdapter("select top 1 * from op_support order by sup_id desc", con1);

            DataSet ds1 = new DataSet();
            ad1.Fill(ds1);
            string id1 = ds1.Tables[0].Rows[0]["sup_id"].ToString();
            foreach (GridViewRow g1 in GridView1.Rows)
            {

                //SqlConnection con = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("insert into op_specialmemu(item_name,sup_id ,mealtype,sid,total ) values ('" + g1.Cells[0].Text + "'," + id1 + ",'" + DropDownList2.SelectedItem.Text + "','"+DropDownList1.SelectedValue+"','"+TextBox5.Text+"')", con1);

                con1.Open();

                cmd.ExecuteNonQuery();

                con1.Close();
            }

          //  SqlCommand cmd1 = new SqlCommand("select * from op_specialmemu where mealtype='Non Veg Meal'", con1);

          //  con1.Open();

          //string i=Convert.ToString(  cmd1.ExecuteScalar());
          //TextBox5.Text = i;

          //  con1.Close();
        }
        else
        {

            int sts = 1;
            string date = DateTime.Now.ToString();

            ob.insertsupport(txt1.SelectedItem.Text, DropDownList1.SelectedValue, TextBox1.Text, date, sts);

            SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support order by sup_id desc", con1);

            DataSet ds = new DataSet();
            ad.Fill(ds);
            string id = ds.Tables[0].Rows[0]["sup_id"].ToString();
            foreach (GridViewRow g1 in GridView1.Rows)
            {

                //SqlConnection con = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("insert into op_support_details(name ,details ,sup_id ,category ) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "'," + id + ",'" + DropDownList1.SelectedValue + "')", con1);

                con1.Open();

                cmd.ExecuteNonQuery();

                con1.Close();



            }
        }
        string str = "alert('Content Added.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }
	
	  protected void Cancelsub_Click(object sender, EventArgs e)
    {
		Response.Redirect("Admin-Support.aspx");
	}
	
    protected void btn3_Click(object sender, EventArgs e)
    {
        int sts = 1;
        ob.insertsupportmenu(TextBox2.Text,TextBox3.Text,sts);
        string str = "alert('Menu Added.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }
	
	  protected void Cancel31_Click(object sender, EventArgs e)
    {
     Response.Redirect("Admin-Support.aspx");
    }
	
	
    protected void Add_Click(object sender, EventArgs e)
    {

    
        DataTable dt = new DataTable();    
        dt.Columns.Add("item");    
        dt.Columns.Add("price");    
        //dt.Columns.Add("Student Class");    
  
        for (int row = 0; row < GridView1.Rows.Count; row++)    
        {    
            DataRow dr = dt.NewRow();    
            dr[0] = GridView1.Rows[row].Cells[0].Text;    
            dr[1] = GridView1.Rows[row].Cells[1].Text;

            if (GridView1.Rows[row].Cells[0].Text != "&nbsp;")
            {
                dr[0] = GridView1.Rows[row].Cells[0].Text.Trim();
            }
            else
            {
                dr[0] = GridView1.Rows[row].Cells[0].Text = "";
            }
            if (GridView1.Rows[row].Cells[1].Text != "&nbsp;")
            {
                dr[1] = GridView1.Rows[row].Cells[1].Text.Trim();
            }
            else
            {
                dr[1] = GridView1.Rows[row].Cells[1].Text = "";
            }

           
           // dr[2] = GridView1.Rows[row].Cells[2].Text;    
            dt.Rows.Add(dr);    
        }    
  
        dt.Rows.Add(txitme.Text, TextBox4.Text);
        ViewState["CurrentTable"] = dt;
        GridView1.DataSource = dt;    
        GridView1.DataBind(); 
   
        txitme.Text="";
        TextBox4.Text = "";
  
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       // SetRowData();
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["CurrentTable"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();

                for (int i = 0; i < GridView1.Rows.Count - 1; i++)
                {
                    GridView1.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
                }
               /// GridView1();
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "3")
        {
            sp.Visible = true;
            ml.Visible = true;
            Label2.Visible = false;
            TextBox4.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString();
        string cat = DropDownList3.SelectedItem.Text;
        string tit = txtsup.Text;
       string Base_dir1 = System.AppDomain.CurrentDomain.BaseDirectory;
       if (fd1.HasFile)
       {
          
           string img = fd1.FileName.ToString();
           //HttpFileCollection fileCollection = Request.Files;
           //for (int i = 1; i < fileCollection.Count; i++)
           //{
           //    HttpPostedFile uploadfile = fileCollection[i];
               string fileName = System.IO.Path.GetFileName(fd1.FileName);




               string path = Base_dir1 + "photos/support/" + fileName;
               fd1.SaveAs(path);

               string imgname = fileName;
               //if (uploadfile.ContentLength > 0)
               //{
               //    uploadfile.SaveAs(path);

               //    // lblMessage.Text += fileName + "Saved Successfully<br>";
               //}
               ob.insertsupportimag(fileName, cat, date, tit);
               string str = "alert('Image Added.');";
               Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);

               DropDownList3.SelectedIndex = 0;
               txtsup.Text = "";
           //}
       }

       else
       {
           string str = "alert('Select Image.');";
           Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
       }


    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        frimg.Visible = true;
        fr.Visible = false;
        fr23.Visible = false;
        mn.Visible = false;
        fr.Visible = false;
        fr23.Visible = false;
        mn.Visible = false;
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        gv.Visible = true;
        Td1.Visible = false;
        fr23.Visible = true;
        Td2.Visible = false;
        Td3.Visible = false;
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
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();  
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = ob.viewcat(id);
            string type = ds.Tables[0].Rows[0]["category"].ToString();
            if (type == "3")
            {
                ob.deletesupmenu(id);
            }
            else
            {
                ob.deletesupport(id);
            }

           
           
            ob.deletesubdata(id);
            string str = "alert('Record Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bind();
        }

        if (e.CommandName == "commandview1")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            ds = ob.bindstatusforsupport(id);

            string id1 = ds.Tables[0].Rows[0]["status"].ToString();
            if (id1 == "1")
            {
                ob.changestatusforsupport(id, "0");
                string str = "alert('status updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                bind();
            }
            else if (id1 == "0")
            {
                ob.changestatusforsupport(id, "1");
                string str = "alert('status updated');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                bind();
            }
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-Supportedit.aspx?id=" + id);
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        fr23.Visible = false;
        Td1.Visible = true;
        bind1();
        Td2.Visible = false;
        Td3.Visible = false;
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the TextBox control.
            LinkButton txtName = (e.Row.FindControl("lnkmore1") as LinkButton);

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
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind1();  
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ob.deletefromsupmenu(id);
            string str = "alert('Record Deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bind1();
        }

        if (e.CommandName == "commandview1")
        {
            string id = e.CommandArgument.ToString();
            DataSet ds = new DataSet();

          ds=  ob.bindstatusformenu(id);
          string id2 = ds.Tables[0].Rows[0]["status"].ToString();

          if (id2 == "1")
          {
             
              ob.changestatusformenu(id, "0");
              string str = "alert('status updated');";
              Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
              bind1();
          }
          else if (id2 == "0")
          {
              ob.changestatusformenu(id, "1");
              string str = "alert('status updated');";
              Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
              bind1();
          }
        }


        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-SupportMenuEdit.aspx?id=" + id);
        }
    }
    protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
    {
        Td1.Visible = false;
        fr23.Visible = false;
        Td2.Visible = true;
        bind2();
        Td3.Visible = false;
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind2();  
    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ob.deletefromsupportimg(id);
            string str = "alert('status updated');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bind2();
        }
        if (e.CommandName == "edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("Admin-SupportImageEdit.aspx?id=" + id);
        }
    }
    protected void RadioButton6_CheckedChanged(object sender, EventArgs e)
    {
        gv.Visible = true;
        Td1.Visible = false;
        fr23.Visible = false;
        Td2.Visible = false;
        Td3.Visible = true;
        bind3();
    }
    protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind3();  
    }
    protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            ob.deletefromfoodmenu(id);
            string str = "alert('record deleted');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            bind3();
        }
    }
    protected void btnsup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
}