using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_SupportEdit : System.Web.UI.Page
{
    home ob = new home();
    home2 ob2 = new home2();
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];

            DataSet ds = new DataSet();

            ds = ob.bindsupedit1(id);
            txt1.Text = ds.Tables[0].Rows[0]["title"].ToString();

            DataTable dt = new DataTable();
            dt = ob.bindsupportmenu();
            DropDownList1.DataTextField = "menu_name";
            DropDownList1.DataValueField = "sid";
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
            TextBox1.Text = ds.Tables[0].Rows[0]["content"].ToString();

            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["menu_name"]))
                {
                    DropDownList1.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }
            ml.Visible = false;
            DataSet ds31 = new DataSet();
            ds31 = ob.bindsupporteditwithgrid(id, DropDownList1.SelectedValue);
            GridView1.Visible = false;
            GridView2.DataSource = ds31;
            GridView2.DataBind();
            GridView2.Visible = true;
            if (DropDownList1.SelectedValue == "3")
            {

                DataSet ds1 = new DataSet();
                ds1 = ob.bindfoodedit(id);
                for (int i = 0; i < DropDownList2.Items.Count; i++)
                {
                    if (DropDownList2.Items[i].Text == Convert.ToString(ds1.Tables[0].Rows[0]["mealtype"]))
                    {
                        DropDownList2.Items[i].Selected = true;

                        // DropDownList1.Items.Insert(0, "Select");
                        break;

                    }

                }

                DataSet ds3 = new DataSet();
                ds3 = ob.bindsupporteditwithgridfood(id, DropDownList1.SelectedValue);
                this.GridView1.Columns[1].Visible = false;
                GridView1.DataSource = ds3;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
                Label2.Visible = false;
                TextBox4.Visible = false;
            }
            else
            {
               
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
            string id = Request.QueryString["id"];

            DataSet ds = new DataSet();

            ds = ob.bindsupedit1(id);
            for (int i = 0; i < DropDownList2.Items.Count; i++)
            {
                if (DropDownList2.Items[i].Text == Convert.ToString(ds.Tables[0].Rows[0]["menu_name"]))
                {
                    DropDownList2.Items[i].Selected = true;

                    // DropDownList1.Items.Insert(0, "Select");
                    break;

                }

            }


        }
    }
    protected void Add_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "3")
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("item_name");
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

        }
        else
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("name");
            dt.Columns.Add("details");
            //dt.Columns.Add("Student Class");    

            for (int row = 0; row < GridView2.Rows.Count; row++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = GridView2.Rows[row].Cells[0].Text;
                dr[1] = GridView2.Rows[row].Cells[1].Text;

                if (GridView2.Rows[row].Cells[0].Text != "&nbsp;")
                {
                    dr[0] = GridView2.Rows[row].Cells[0].Text.Trim();
                }
                else
                {
                    dr[0] = GridView2.Rows[row].Cells[0].Text = "";
                }
                if (GridView2.Rows[row].Cells[1].Text != "&nbsp;")
                {
                    dr[1] = GridView2.Rows[row].Cells[1].Text.Trim();
                }
                else
                {
                    dr[1] = GridView2.Rows[row].Cells[1].Text = "";
                }


                // dr[2] = GridView1.Rows[row].Cells[2].Text;    
                dt.Rows.Add(dr);
            }

            dt.Rows.Add(txitme.Text, TextBox4.Text);
            ViewState["CurrentTable"] = dt;
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        txitme.Text = "";
        TextBox4.Text = "";

    }
    protected void btnsub_Click(object sender, EventArgs e)
    {


        string id1 = Request.QueryString["id"];
        if (DropDownList1.SelectedValue == "3")
        {
            int sts1 = 1;
            string date1 = DateTime.Now.ToString();

            ob.updatesupport1(txt1.Text, DropDownList1.SelectedValue, TextBox1.Text, id1);

            SqlDataAdapter ad = new SqlDataAdapter("select * from op_specialmemu where sup_id=" + id1, con1);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("delete from op_specialmemu where sup_id= " + id1, con1);
                con1.Open();
                cmd.ExecuteNonQuery();
                con1.Close();
            }

            foreach (GridViewRow g1 in GridView1.Rows)
            {

                //SqlConnection con = new SqlConnection(connStr);

              //  SqlCommand cmd = new SqlCommand("update op_specialmemu set item_name='" + g1.Cells[0].Text + "',mealtype='" + DropDownList2.SelectedItem.Text + "',sid='" + DropDownList1.SelectedValue + "',total='" + TextBox5.Text + "' where sup_id= " + id1, con1);

                SqlCommand cmd = new SqlCommand("insert into op_specialmemu(item_name,sup_id ,mealtype,sid,total ) values ('" + g1.Cells[0].Text + "'," + id1 + ",'" + DropDownList2.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','" + TextBox5.Text + "')", con1);

                con1.Open();

                cmd.ExecuteNonQuery();

                con1.Close();
            }
        }
        else
        {
             int sts = 1;
            string date = DateTime.Now.ToString();
            ob.updatesupport1(txt1.Text, DropDownList1.SelectedValue, TextBox1.Text, id1);
          //  ob.insertsupport(txt1.Text, DropDownList1.SelectedValue, TextBox1.Text, date, sts);

            SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_details where sup_id=" + id1, con1);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("delete from op_support_details where sup_id= " + id1, con1);
                con1.Open();
                cmd.ExecuteNonQuery();
                con1.Close();
            }
       
            foreach (GridViewRow g1 in GridView2.Rows)
            {

                //SqlConnection con = new SqlConnection(connStr);

               // SqlCommand cmd = new SqlCommand("update op_support_details set  name='"+g1.Cells[0].Text+"',details='"+g1.Cells[1].Text+"',category='"+DropDownList1.SelectedValue+"' where sup_id= "+id1,con1);

                SqlCommand cmd = new SqlCommand("insert into op_support_details(name ,details ,sup_id ,category ) values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "'," + id1 + ",'" + DropDownList1.SelectedValue + "')", con1);

                con1.Open();

                cmd.ExecuteNonQuery();

                con1.Close();



            }
        }

         string str = "alert('Data Updated.');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Support.aspx");
    }
}

