using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text.RegularExpressions;

public partial class admin_Admin_Invoice : System.Web.UI.Page
{
    string Str;
    Int32 uid;
    int usid; int statusid;
    string joinDate;
    string Releave_Date;
    string ReleaveDate;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string strscpt;
    string Base_Dir = System.AppDomain.CurrentDomain.BaseDirectory;
    int FID;
    int Emp_result;
    public static string own = "";
    string User_Result = string.Empty;
    exception err = new exception();
    static string excep_page = "Admin-Invoice.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {
        Str = Convert.ToString(Session["str1"]);
        lblerror.Visible = false;
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        if (!IsPostBack)
        {
            lblAcess.Text = Session["UserName"].ToString();
            Binddata();
            Bindnew();
            trnew1.Visible= true;
            GridView1.Visible = true;
            trnew2.Visible = true;
            MyGrid.Visible = false;
           // tr1.Visible = false;
            tr2.Visible = true;
            Bindnew1();
            trcurr1.Visible = false;
            tr3.Visible = false;
            tr4.Visible = false;
        }
    }

    private void Bindnew()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=1 and ctype='Vendors' order by cname Asc", con);
        da.Fill(ds, "IG_Invoice");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    private void Bindnew1()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=2 and ctype='Vendors' order by cname Asc", con);
        da.Fill(ds, "IG_Invoice");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
            tr1.Visible = true;
        }
        else
        {
            tr1.Visible = false;
        }
    }

    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=1 and ctype='Clients' order by cname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "IG_Invoice");

        if (ds.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds;
            MyGrid.DataBind();
        }
    }
    private void Binddata1()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=2 and ctype='Clients' order by cname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "IG_Invoice");

        if (ds.Tables[0].Rows.Count > 0)
        {
            tr3.Visible = true;
            tr4.Visible = true;
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        else
        {
            tr3.Visible = false;
            tr4.Visible = false;
        }
    }
    private void BindDeactivatedata()
    {
        SqlDataAdapter daDeactivate = new SqlDataAdapter("Select * from IG_Invoice where Status=2 order by cname Asc", con);
        DataSet dsDeactivate = new DataSet();
        daDeactivate.Fill(dsDeactivate, "IG_Invoice");
        if (dsDeactivate.Tables[0].Rows.Count > 0)
        {
            MyGridDeactivate.DataSource = dsDeactivate;
            MyGridDeactivate.DataBind();
        }
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //int cid = 0;
            //int cid1 = 0;
            //int cid2 = 0;
            //int cid3 = 0;

            string cid = "";
            string cid1 = "";
            string cid2 = "";
            string cid3 = "";

            string d1 = "";
            string d2 = "";
            string d3 = "";
            string d4 = "";

            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
                //cid = Convert.ToInt32(das.Tables[0].Rows[0]["idc"].ToString());
                //cid1 = Convert.ToInt32(das.Tables[0].Rows[0]["ipc"].ToString());
                //cid2 = Convert.ToInt32(das.Tables[0].Rows[0]["tspc"].ToString());
                //cid3 = Convert.ToInt32(das.Tables[0].Rows[0]["remarcksc"].ToString());

                cid = das.Tables[0].Rows[0]["idc1"].ToString();
                cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
                cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
                cid3 = das.Tables[0].Rows[0]["remarcksc1"].ToString();

                d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
                d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();

                d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
                d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();
            }
            con.Close();
           LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
            //LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
            //LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            //Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
            //Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");

            //if (lblJoinDate.Text != "")
            //{

            //}
            if (statusid == 2)
            {
                lnkactivate.Text = "Deactive";
            }
            else if (statusid == 1)
            {
                lnkactivate.Text = "Active";
            }
            //else if (statusid == 0)
            //{
            //    lnkactivate.Visible = true;
            //}

            Label dates1 = (Label)e.Row.FindControl("lblJoindatebt");
            if (d3 == "Other")
            {
                dates1.Text = d1;
            }
            else
            {
                dates1.Text = d3;
            }

            Label dates2 = (Label)e.Row.FindControl("lblJoindatebf");
            if (d4 == "Other")
            {
                dates2.Text = d1;
            }
            else
            {
                dates2.Text = d3;
            }

            Label lnkactivatea = (Label)e.Row.FindControl("lblJoindate");
            if (cid != "")
            {
                lnkactivatea.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);
            }
            else 
            {
                lnkactivatea.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate1 = (Label)e.Row.FindControl("lblName11");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
            }
            else 
            {
                lnkactivate1.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate12 = (Label)e.Row.FindControl("lblName112");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
            }
            else 
            {
                lnkactivate12.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww");
            if (cid3 != "")
            {
                lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid3);
            }
            else 
            {
                lnkactivate123.ForeColor = System.Drawing.Color.Black;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sno"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    protected void MyGrid_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //int cid = 0;
            //int cid1 = 0;
            //int cid2 = 0;
            //int cid3 = 0;

            string cid = "";
            string cid1 = "";
            string cid2 = "";
            string cid3 = "";

            string d1 = "";
            string d2 = "";
            string d3 = "";
            string d4 = "";
            string d5 = "";
            string d6 = "";
            string d7 = "";

            string d8 = "";
            string d9 = "";
            string d10 = "";

            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                //cid = Convert.ToInt32(das.Tables[0].Rows[0]["idc"].ToString());
                //cid1 = Convert.ToInt32(das.Tables[0].Rows[0]["ipc"].ToString());
                //cid2 = Convert.ToInt32(das.Tables[0].Rows[0]["tspc"].ToString());
                //cid3 = Convert.ToInt32(das.Tables[0].Rows[0]["remarcksc"].ToString());

                cid = das.Tables[0].Rows[0]["idc1"].ToString();
                cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
                cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
                cid3 = das.Tables[0].Rows[0]["remarcksc1"].ToString();

                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());

                d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
                d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();

                d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
                d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();

                d5 = das.Tables[0].Rows[0]["tspendingperiod1"].ToString();
                d6 = das.Tables[0].Rows[0]["invoiceperiod1"].ToString();
                d7 = das.Tables[0].Rows[0]["idate"].ToString();
            }
            con.Close();

            con.Open();
            SqlDataAdapter sscmd3 = new SqlDataAdapter(" select  a.sno,a.month1,a.year1,a.emp_id,a.ctype,a.status,a.tspc1,a.month2,a.emp_id + '-' + a.month2 + '-' + a.year2 as mn1  from (select DATEPART(month,invoiceperiod) as month1,(convert(varchar(3),datename(month, invoiceperiod))) as month2,cast((datepart(year,invoiceperiod)) as nvarchar(10)) as year2, datepart(year,invoiceperiod) as year1, * from IG_Invoice )a where a.sno=" + useriD, con);
            DataSet das3 = new DataSet();
            sscmd3.Fill(das3);
            if (das3.Tables[0].Rows.Count > 0)
            {
                d8 = das3.Tables[0].Rows[0]["mn1"].ToString();

                SqlDataAdapter sscmd31 = new SqlDataAdapter("select sum(hours) as act_h,sum(hour_type) as ot_h from emp_weekdetails where month_year='" + d8 + "'", con);
                DataSet das31 = new DataSet();
                sscmd31.Fill(das31);
                if (das31.Tables[0].Rows.Count > 0)
                {
                    d9 = das31.Tables[0].Rows[0]["act_h"].ToString();
                    d10 = das31.Tables[0].Rows[0]["ot_h"].ToString();
                }
            }
            con.Close();


            Label oth = (Label)e.Row.FindControl("lblhourwwwer");
            if (d10 == "")
            {
                oth.Text = "0";
            }
            else
            {
                oth.Text = d10;
            }

            Label acth = (Label)e.Row.FindControl("lblhourwww");
            if (d9 == "")
            {
                acth.Text = "0";
            }
            else
            {
                acth.Text = d9;
            }


            DateTime d = new DateTime();
            d = DateTime.UtcNow.Date;
            string day = d.ToString("MM-dd-yyyy");

            Label dates1 = (Label)e.Row.FindControl("lblJoindatebt9");
            if (d3 == "Other")
            {
                dates1.Text = d1;
            }
            else
            {
                dates1.Text = d3;
            }

            Label dates2 = (Label)e.Row.FindControl("lblJoindatebf9");
            if (d4 == "Other")
            {
                dates2.Text = d2;
            }
            else
            {
                dates2.Text = d4;
            }

           // LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
            //LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
            //LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            //Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
            //Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");

            //if (lblJoinDate.Text != "")
            //{

            //}
         //   if (statusid == 2)
         //   {
         //       lnkactivate.Text = "Activate";
         //   }
         //   else if (statusid == 1)
         //   {
        //        lnkactivate.Text = "Deactivate";
        //    }
            Label lnkactivate1 = (Label)e.Row.FindControl("lblName555");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
                if (DateTime.Parse(d6) < DateTime.Parse(day))
                {
                    lnkactivate1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
                }
            }
            else
            {
                lnkactivate1.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate12 = (Label)e.Row.FindControl("lblName566");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);

                if (DateTime.Parse(d5) < DateTime.Parse(day))
                {
                    lnkactivate12.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
                }
            }
            else
            {
                lnkactivate12.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate = (Label)e.Row.FindControl("lblJoindate9");
            if (cid != "")
            {
                lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);

                if (DateTime.Parse(d7) < DateTime.Parse(day))
                {
                    lnkactivate.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);
                }
            }
            else
            {
                lnkactivate.ForeColor = System.Drawing.Color.Black;
            }
            //Label lnkactivatea = (Label)e.Row.FindControl("lblJoindate9");
            //if (cid != "")
            //{
            //    lnkactivatea.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);
            //}
            //else 
            //{
            //    lnkactivatea.ForeColor = System.Drawing.Color.Black;
            //}

            //Label lnkactivate1 = (Label)e.Row.FindControl("lblName555");
            //if (cid1 != "")
            //{
            //    lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
            //}
            //else 
            //{
            //    lnkactivate1.ForeColor = System.Drawing.Color.Black;
            //}

            //Label lnkactivate12 = (Label)e.Row.FindControl("lblName566");
            //if (cid2 != "")
            //{
            //    lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
            //}
            //else 
            //{
            //    lnkactivate12.ForeColor = System.Drawing.Color.Black;
            //}

            Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww9");
            if (cid3 != "")
            {
                lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid3);
            }
            else 
            {
                lnkactivate123.ForeColor = System.Drawing.Color.Black;
            }

        }
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sno"));
        //    ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel11");
        //    lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        //}
    }

    protected void MyGridDeactivate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //int cid = 0;
            //int cid1 = 0;
            //int cid2 = 0;
            //int cid3 = 0;

            string cid = "";
            string cid1 = "";
            string cid2 = "";
            string cid3 = "";

            string d1 = "";
            string d2 = "";
            string d3 = "";
            string d4 = "";
            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                //cid = Convert.ToInt32(das.Tables[0].Rows[0]["idc"].ToString());
                //cid1 = Convert.ToInt32(das.Tables[0].Rows[0]["ipc"].ToString());
                //cid2 = Convert.ToInt32(das.Tables[0].Rows[0]["tspc"].ToString());
                //cid3 = Convert.ToInt32(das.Tables[0].Rows[0]["remarcksc"].ToString());

                cid = das.Tables[0].Rows[0]["idc1"].ToString();
                cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
                cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
                cid3 = das.Tables[0].Rows[0]["remarcksc1"].ToString();

                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());

                d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
                d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();

                d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
                d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();
            }
            con.Close();

            Label dates1 = (Label)e.Row.FindControl("lblJoindatebt8");
            if (d3 == "Other")
            {
                dates1.Text = d1;
            }
            else
            {
                dates1.Text = d3;
            }

            Label dates2 = (Label)e.Row.FindControl("lblJoindatebf8");
            if (d4 == "Other")
            {
                dates2.Text = d2;
            }
            else
            {
                dates2.Text = d4;
            }

            LinkButton lnkactivate = (LinkButton)e.Row.FindControl("lnkactivate");
           // LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
           // LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
           //// Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
           // Label lblReleavedate = (Label)e.Row.FindControl("lblJoindate8");
           // //if (lblJoinDate.Text != "")
           // //{

           // //}
           // if (lblReleavedate.Text != "")
           // {

           // }
            if (statusid == 2)
            {
                lnkactivate.Text = "Active";
            }
            else if (statusid == 1)
            {
                lnkactivate.Text = "Deactive";
            }

            Label lnkactivatea = (Label)e.Row.FindControl("lblJoindate8");
            if (cid != "")
            {
                lnkactivatea.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);
            }
            else
            {
                lnkactivatea.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate1 = (Label)e.Row.FindControl("lblName56621");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
            }
            else 
            {
                lnkactivate1.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate12 = (Label)e.Row.FindControl("lblName56633");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
            }
            else 
            {
                lnkactivate12.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww8");
            if (cid3 != "")
            {
                lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid3);
            }
            else 
            {
                lnkactivate123.ForeColor = System.Drawing.Color.Black;
            }

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sno"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                //Displaying alert message after successfully deletion of user
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Admin-Invoice.aspx');", true);
            }
    }


    protected void lnkdelrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow1 = imgbtndel.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
        string NEmailid = Convert.ToString(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            //string username = gvrow.Cells[0].Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
            Emp_result = cmd.ExecuteNonQuery();
            con.Close();
            //   con.Open();
            if (Emp_result == 1)
            {
                //Displaying alert message after successfully deletion of user             
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Admin-Invoice.aspx');", true);
            }
      //  }
    }

    protected void lnkdelrecord2(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Admin-Invoice.aspx');", true);
        }
        // }
    }

    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
            DataSet das = new DataSet();
            cmd.Fill(das);
           // string emailid = das.Tables[0].Rows[0]["username"].ToString();

            if (das.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Admin-InvoiceCreate.aspx?sno1=" + userid);
            }
            con.Close();
        //}
    }

    protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        // string emailid = das.Tables[0].Rows[0]["username"].ToString();

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-InvoiceCreate.aspx?sno1=" + userid);
        }
        con.Close();
        //}
    }

    protected void lnkviewrecord2(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        //getting particular row linkbutton
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        //getting userid of particular row
        int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
        //string username = gvrow.Cells[0].Text;
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        // string emailid = das.Tables[0].Rows[0]["username"].ToString();

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Admin-InvoiceCreate.aspx?sno1=" + userid);
        }
        con.Close();
        //}
    }


    protected void lnkactivate(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            statusid = 2;
            usid = Convert.ToInt32(e.CommandArgument.ToString());
            string date = System.DateTime.Now.ToString("MM/dd/yyyy");
            con.Open();
            SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                //Displaying alert message after successfully deletion of user
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');", true);
                Bindnew();
                Bindnew1();
               // tr1.Visible = true;
               // tr2.Visible = true;

            }
        //}
    }

    protected void lnkactivate1(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        statusid = 2;
        usid = Convert.ToInt32(e.CommandArgument.ToString());
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        con.Open();
        SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');", true);
            Binddata();
            Binddata1();
        }
        //}
    }

    protected void lnkactivate2(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        statusid = 1;
        usid = Convert.ToInt32(e.CommandArgument.ToString());
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        con.Open();
        SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Admin-Invoice.aspx');", true);
        }
        //}
    }
    protected void lnkactivate3(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
        statusid = 1;
        usid = Convert.ToInt32(e.CommandArgument.ToString());
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        con.Open();
        SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');", true);
            Binddata();
            Binddata1();
        }
        //}
    }


    //protected void lnkdeactivate(object sender, CommandEventArgs e)
    //{
    //    //own = ConfigurationManager.AppSettings["owner"].ToString();
    //    //if (lblAcess.Text == own)
    //    //{
    //        usid = Convert.ToInt32(e.CommandArgument.ToString());

    //        statusid = 1;
    //        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //        con.Open();
    //        SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',pdate='" + date + "' where sno=" + usid, con);
    //        int result = cmd.ExecuteNonQuery();
    //        con.Close();
    //        if (result == 1)
    //        {
    //            //Displaying alert message after successfully deletion of user
    //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Admin-Invoice.aspx');", true);
    //        }
    //    //}
    //}

    private void bindEmp_joinDate(string p, int statusid, string joinDate, string Releave_Date)
    {
        con.Open();
        joinDate = System.DateTime.Now.ToString();
        Releave_Date = "NULL";
        statusid = 1;
        con.Close();
    }

    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
    //        con.Open();
    //        SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
    //        DataSet das = new DataSet();
    //        sscmd.Fill(das);
    //        if (das.Tables[0].Rows.Count > 0)
    //        {
    //            statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
    //        }
    //        con.Close();
    //        LinkButton lnkactivatenew = (LinkButton)e.Row.FindControl("lnkactivate");
    //        LinkButton lnknotactivatenew = (LinkButton)e.Row.FindControl("lnknotact");
    //    }

    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sno"));
    //        ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");
    //        lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
    //    }
    //}


    public void SendMail1(string From, string To, string Body, string Subject)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");
        values.Add("from", From);
        values.Add("subject", Subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", To);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
    }

    protected void lnkbtncurrent_Click(object sender, EventArgs e)
    {
        trnew1.Visible = false;
        trnew2.Visible = false;
        trpre1.Visible = false;
        trpre2.Visible = false;
        trcurr1.Visible = true;
        trcurr2.Visible = true;
        MyGridDeactivate.Visible = false;
        MyGrid.Visible = true;
    }

    protected void lnkbtnpre_Click(object sender, EventArgs e)
    {
        trcurr1.Visible = false;
        trcurr2.Visible = false;
        trnew1.Visible = false;
        trnew2.Visible = false;
        trpre1.Visible = true;
        trpre2.Visible = true;
        MyGridDeactivate.Visible = true;
        BindDeactivatedata();
    }

    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Binddata();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bindnew();
    }

    protected void MyGridDeactivate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGridDeactivate.PageIndex = e.NewPageIndex;
        BindDeactivatedata();
    }

    //protected void imgus_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("Admin_Employee.aspx");
    //}
    //protected void imgind_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("Admin_IndEmployee.aspx");
    //}

    protected void lnkall_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=1 order by cname Asc", con);
        DataSet ds = new DataSet();
        da.Fill(ds, "IG_Invoice");

        if (ds.Tables[0].Rows.Count > 0)
        {
            trcurr2.Visible = false;
            trnew1.Visible = false;
            trnew2.Visible = false;
            trpre1.Visible = false;
            trpre2.Visible = false;

            MyGrid.Visible = false;
            MyGridDeactivate.Visible = false;
            GridView1.Visible = false;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        trcurr1.Visible = false;
        trcurr2.Visible = false;
        trnew1.Visible = true;
        trnew2.Visible = true;
        trpre1.Visible = false;
        trpre2.Visible = false;
        MyGridDeactivate.Visible = false;
        Bindnew();
        tr3.Visible = false;
        tr4.Visible = false;
    }

    protected void gridviewSorting_Sorting2(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (sortProperty == SortDirection.Ascending)
        {
            sortProperty = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView(BindGridView3());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        MyGridDeactivate.DataSource = sortedView;
        MyGridDeactivate.DataBind();
    }

    private DataTable BindGridView3()
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT *FROM dbo.IG_Invoice where status=2";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        return dtGridView;

    }
    protected void gridviewSorting_Sorting1(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (sortProperty == SortDirection.Ascending)
        {
            sortProperty = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView(BindGridView2());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        GridView1.DataSource = sortedView;
        GridView1.DataBind();
    }

    private DataTable BindGridView2()
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT *FROM dbo.IG_Invoice where ctype='Vendors'";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        return dtGridView;
    }

    protected void gridviewSorting_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (sortProperty == SortDirection.Ascending)
        {
            sortProperty = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            sortProperty = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView(BindGridView1());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        MyGrid.DataSource = sortedView;
        MyGrid.DataBind();
    }

    private DataTable BindGridView1()
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT *FROM dbo.IG_Invoice where ctype='Clients'";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        return dtGridView;
    }

    public SortDirection sortProperty
    {
        get
        {
            if (ViewState["SortingState"] == null)
            {
                ViewState["SortingState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortingState"];
        }
        set
        {
            ViewState["SortingState"] = value;
        }
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        Bindnew1();
    }
}