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

public partial class Emp_Invoice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string emailid = string.Empty;
    int statusid;
    int Emp_result; int usid;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            if (Session["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (Session["userid"] != null)
                {
                    emailid = Session["userid"].ToString();
                    Binddata();
                    Bindnew();
                    trnew1.Visible = true;
                    GridView1.Visible = true;
                    trnew2.Visible = true;
                    lnkdownload.Visible = true;
                    lnkdownload1.Visible = true;


                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }
    }

    private DataSet Permission(string emailid)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select uid from Users_Information where userid='" + emailid + "'", con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter("select * from user_menu where mid='"+ds.Tables[0].Rows[0]["uid"].ToString()+"'", con);
            da1.Fill(ds1);

            return ds1;
        }
        else
            return null;
    }

    private void Bindnew()
     {
        DataSet ds1 = new DataSet();
      //  SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=1 and ctype='Vendors' order by efname asc ,tspc1 desc", con);
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where  ctype='Vendors'  order by status  asc,tspc1 desc", con);

        da.Fill(ds1, "IG_Invoice");
        if (ds1.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds1;
            GridView1.DataBind();

        }
        emailid = Session["userid"].ToString();

        DataSet ds = Permission(emailid);
        if (ds.Tables[0].Rows[0]["Invoicingview"].ToString() == "1")
        {
            GridView1.Columns[13].Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp_Home.aspx');", true);
        }

        if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
        {
            GridView1.Columns[14].Visible = true;
            GridView1.Columns[12].Visible = true;
        }
        else
        {
            GridView1.Columns[14].Visible = false;
            GridView1.Columns[12].Visible = false;

        }

        //if (ds.Tables[0].Rows[0]["Invoicingdelete"].ToString() == "1")
        //{
        //    GridView1.Columns[15].Visible = true;
        //}
        //else
        //{
        //    GridView1.Columns[15].Visible = false;
        //}
    }

    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from IG_Invoice where Status=1 and ctype='Clients' order by efname asc ,tspc1 desc", con);
        DataSet ds1 = new DataSet();
        da.Fill(ds1, "IG_Invoice");

        if (ds1.Tables[0].Rows.Count > 0)
        {
            MyGrid.DataSource = ds1;
            MyGrid.DataBind();
        }
        emailid = Session["userid"].ToString();

        DataSet ds = Permission(emailid);
        if (ds.Tables[0].Rows[0]["Invoicingview"].ToString() == "1")
        {
            MyGrid.Columns[13].Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp_Home.aspx');", true);
        }

        if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
        {
            MyGrid.Columns[14].Visible = true;
            MyGrid.Columns[12].Visible = true;

        }
        else
        {
            MyGrid.Columns[14].Visible = false;
            MyGrid.Columns[12].Visible = false;

        }

        //if (ds.Tables[0].Rows[0]["Invoicingdelete"].ToString() == "1")
        //{
        //    MyGrid.Columns[15].Visible = true;
        //}
        //else
        //{
        //    MyGrid.Columns[15].Visible = false;
        //}
    }

    private void BindDeactivatedata()
    {
        SqlDataAdapter daDeactivate = new SqlDataAdapter("Select * from IG_Invoice where Status=2 order by efname Asc", con);
        DataSet dsDeactivate = new DataSet();
        daDeactivate.Fill(dsDeactivate, "IG_Invoice");
        if (dsDeactivate.Tables[0].Rows.Count > 0)
        {
            MyGridDeactivate.DataSource = dsDeactivate;
            MyGridDeactivate.DataBind();
        }
        emailid = Session["userid"].ToString();

        DataSet ds = Permission(emailid);
        if (ds.Tables[0].Rows[0]["Invoicingview"].ToString() == "1")
        {
            MyGridDeactivate.Columns[14].Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp_Home.aspx');", true);
        }

        if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
        {
            MyGridDeactivate.Columns[15].Visible = true;
            MyGridDeactivate.Columns[13].Visible = true;

        }
        else
        {
            MyGridDeactivate.Columns[15].Visible = false;
            MyGridDeactivate.Columns[13].Visible = false;

        }

        //if (ds.Tables[0].Rows[0]["Invoicingdelete"].ToString() == "1")
        //{
        //    MyGridDeactivate.Columns[16].Visible = true;
        //}
        //else
        //{
        //   MyGridDeactivate.Columns[16].Visible = false;
        //}
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string cid = "";
            string cid1 = "";
            string cid2 = "";
            string cid3 = "";

            string d1 = "";
            string d2 = "";
            string d3 = "";
            string d4 = "";
            string d5 = "";

            int useriD = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "sno"));
            con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + useriD, con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            if (das.Tables[0].Rows.Count > 0)
            {
                cid = das.Tables[0].Rows[0]["idc1"].ToString();
                cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
                cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
                cid3 =das.Tables[0].Rows[0]["remarcksc1"].ToString();

                d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
                d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();

                d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
                d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();
                d5 = das.Tables[0].Rows[0]["tspendingperiod1"].ToString();

            }
            con.Close();

            DateTime d = new DateTime();
            d = DateTime.UtcNow.Date;
            string day = d.ToString("MM-dd-yyyy");

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
                dates2.Text = d2;
            }
            else
            {
                dates2.Text = d4;
            }

            //invoice date
            Label lnkactivate = (Label)e.Row.FindControl("lblJoindate");
            if (cid != "")
            {
                lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);

                if (DateTime.Parse(d5) < DateTime.Parse(day))
                {
                    lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                   // useriD = Request.QueryString["sno"].ToString();
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set idc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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

            //invoiceperiod
            Label lnkactivate1 = (Label)e.Row.FindControl("lblName11");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid1);
                if (DateTime.Parse(d5) < DateTime.Parse(day))
                {
                    lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set ipc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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

            //tspendingperiod
            Label lnkactivate12 = (Label)e.Row.FindControl("lblName112");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);
                if (DateTime.Parse(d5) < DateTime.Parse(day))
                {
                    lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set tspc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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
            //remarks
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
    }

    protected void MyGrid_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
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
                statusid = Convert.ToInt32(das.Tables[0].Rows[0]["status"].ToString());
                cid = das.Tables[0].Rows[0]["idc1"].ToString();
                cid1 = das.Tables[0].Rows[0]["ipc1"].ToString();
                cid2 = das.Tables[0].Rows[0]["tspc1"].ToString();
                cid3 = das.Tables[0].Rows[0]["remarcksc1"].ToString();
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

                SqlDataAdapter sscmd31 = new SqlDataAdapter("select sum(hours) as act_h,sum(hour_type) as ot_h from emp_weekdetails where month_year='" + d8+"'", con);
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

            LinkButton lnkactivatenew = (LinkButton)e.Row.FindControl("lnkactivate");
            //LinkButton lnkdeactivate = (LinkButton)e.Row.FindControl("lnkdeactivate");
            //LinkButton lnknotactivate = (LinkButton)e.Row.FindControl("lnknotact");
            //Label lblJoinDate = (Label)e.Row.FindControl("lblJoindate");
            //Label lblReleavedate = (Label)e.Row.FindControl("lblReleavedate");

            //if (lblJoinDate.Text != "")
            //{

            //}
            if (statusid == 2)
            {
                lnkactivatenew.Text = "Deactive";
                lnkactivatenew.ForeColor = System.Drawing.Color.Red;
            }
            else if (statusid == 1)
            {
                lnkactivatenew.Text = "Active";
                lnkactivatenew.ForeColor = System.Drawing.Color.Green;

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
            //invoiceperiod
            Label lnkactivate1 = (Label)e.Row.FindControl("lblName555");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid1);
                if (DateTime.Parse(d6) < DateTime.Parse(day))
                {
                    lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set ipc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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
            //tspendingperiod
            Label lnkactivate12 = (Label)e.Row.FindControl("lblName566");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid2);

                if (DateTime.Parse(d5) < DateTime.Parse(day))
                {
                    lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set tspc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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
            //idate
            Label lnkactivate = (Label)e.Row.FindControl("lblJoindate9");
            if (cid != "")
            {
                lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml(cid);

                if (DateTime.Parse(d7) < DateTime.Parse(day))
                {
                    lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0033");
                    SqlCommand cmd = new SqlCommand("update IG_Invoice set idc1='#FF0033' where sno=" + useriD + "", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
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
            //remarks
            Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww9");
            if (cid3 != "")
            {
                lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid3);
            }
            else 
            {
                lnkactivate123.ForeColor = System.Drawing.Color.Black;
            }
        }
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


                d1 = das.Tables[0].Rows[0]["id1"].ToString() + " - " + das.Tables[0].Rows[0]["id2"].ToString();
                d3 = das.Tables[0].Rows[0]["rinvoiceduration"].ToString();

                d2 = das.Tables[0].Rows[0]["id3"].ToString() + " - " + das.Tables[0].Rows[0]["id4"].ToString();
                d4 = das.Tables[0].Rows[0]["invoicedates"].ToString();

            }

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

            con.Close();
            Label lnkactivate = (Label)e.Row.FindControl("lblJoindate8");
            if (cid1 != "")
            {
                lnkactivate.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid);
            }
            else 
            {
                lnkactivate.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate1 = (Label)e.Row.FindControl("lblName56621");
            if (cid1 != "")
            {
                lnkactivate1.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid1);
            }
            else 
            {
                lnkactivate1.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate12 = (Label)e.Row.FindControl("lblName56633");
            if (cid2 != "")
            {
                lnkactivate12.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid2);
            }
            else 
            {
                lnkactivate12.ForeColor = System.Drawing.Color.Black;
            }

            Label lnkactivate123 = (Label)e.Row.FindControl("lblJoindateww8");
            if (cid3 != "")
            {
                lnkactivate123.ForeColor = System.Drawing.ColorTranslator.FromHtml( cid3);
            }
            else 
            {
                lnkactivate123.ForeColor = System.Drawing.Color.Black;
            }
        }
    }

    //protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}


    //protected void lnkdelrecord1(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow1 = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
    //    string NEmailid = Convert.ToString(GridView1.DataKeys[gvrow1.RowIndex].Value.ToString());
   
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
    //    Emp_result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (Emp_result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}

    //protected void lnkdelrecord2(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton imgbtndel = sender as ImageButton;
    //    GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
    //    int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("delete from IG_Invoice where sno=" + userid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Invoice Details has been deleted Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}

    protected void lnkviewrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);

        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Emp-InvoiceCreate.aspx?sno1=" + userid);
        }
        con.Close();
    }

    protected void lnkviewrecord1(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Emp-InvoiceCreate.aspx?sno1=" + userid);
        }
        con.Close();
    }

    protected void lnkviewrecord2(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnedit = sender as ImageButton;
        GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
        int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
        con.Open();
        SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
        DataSet das = new DataSet();
        cmd.Fill(das);
        if (das.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("Emp-InvoiceCreate.aspx?sno1=" + userid);
        }
        con.Close();
    }


    //protected void lnkactivate(object sender, CommandEventArgs e)
    //{
    //    statusid = 2;
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}

    //protected void lnkactivate1(object sender, CommandEventArgs e)
    //{
    //    statusid = 2;
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}

    //protected void lnkactivate2(object sender, CommandEventArgs e)
    //{
    //    statusid = 1;
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',rdate='" + date + "' where sno=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}


    //protected void lnkdeactivate(object sender, CommandEventArgs e)
    //{
    //    usid = Convert.ToInt32(e.CommandArgument.ToString());
    //    statusid = 1;
    //    string date = System.DateTime.Now.ToString("MM/dd/yyyy");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update IG_Invoice set status='" + statusid + "',pdate='" + date + "' where sno=" + usid, con);
    //    int result = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (result == 1)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);
    //    }
    //}

    private void bindEmp_joinDate(string p, int statusid, string joinDate, string Releave_Date)
    {
        con.Open();
        joinDate = System.DateTime.Now.ToString();
        Releave_Date = "NULL";
        statusid = 1;
        con.Close();
    }


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

        lnkdownload.Visible = false;
        lnkdownload1.Visible = true;

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

        lnkdownload.Visible = false;
        lnkdownload1.Visible = false;


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
        lnkdownload.Visible = true;
        lnkdownload1.Visible = false;

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            emailid = Session["userid"].ToString();
            DataSet ds = Permission(emailid);
            if (ds.Tables[0].Rows[0]["Invoicingpost"].ToString() == "1")
            {
                Response.Redirect("Emp-InvoiceCreate.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp-Invoice.aspx');", true);
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void imgedit1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["userid"] != null)
        {
            emailid = Session["userid"].ToString();
            DataSet ds = Permission(emailid);
            if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Emp-InvoiceCreate.aspx?sno=" + userid);
                }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp-Invoice.aspx');", true);
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void imgedit2_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["userid"] != null)
        {
            emailid = Session["userid"].ToString();
            DataSet ds = Permission(emailid);
            if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(MyGrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Emp-InvoiceCreate.aspx?sno=" + userid);
                }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp-Invoice.aspx');", true);
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void imgedit3_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["userid"] != null)
        {
            emailid = Session["userid"].ToString();
            DataSet ds = Permission(emailid);
            if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(MyGridDeactivate.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from IG_Invoice where sno=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Emp-InvoiceCreate.aspx?sno=" + userid);
                }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('You dont have permission');location.replace('Emp-Invoice.aspx');", true);
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
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

    //protected void btnFamily_Click(object sender, EventArgs e)
    //{
    //    DataTable dtGridView = new DataTable();
    //    string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by tspc1 asc";
    //    SqlCommand cmd = new SqlCommand(strSelect, con);
    //    SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
    //    dAdapter.Fill(dtGridView);
    //    GridView1.DataSource = dtGridView;
    //    GridView1.DataBind();
    //}
    //protected void btnFamily1_Click(object sender, EventArgs e)
    //{
    //    DataTable dtGridView = new DataTable();
    //    string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by tspendingperiod desc";
    //    SqlCommand cmd = new SqlCommand(strSelect, con);
    //    SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
    //    dAdapter.Fill(dtGridView);
    //    GridView1.DataSource = dtGridView;
    //    GridView1.DataBind();
    //}

    protected void btnFamily_Clickp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by ipc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }
    protected void  btnFamily1_Clickp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by invoiceperiod desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }

    protected void btnFamily_Clickpp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by idc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }
    protected void btnFamily1_Clickpp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by idate desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }

    protected void btnFamily_Clickppp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by remarcksc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }
    protected void btnFamily1_Clickppp(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Vendors' order by remarks desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        GridView1.DataSource = dtGridView;
        GridView1.DataBind();
    }


    protected void btnFamily12_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by tspc1 asc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }
    protected void btnFamily11_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by tspendingperiod desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }


    protected void sbtnFamily12_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by ipc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }
    protected void sbtnFamily11_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by invoiceperiod desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }

    protected void asbtnFamily12_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by idc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }
    protected void asbtnFamily11_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by idate desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }

    protected void rasbtnFamily12_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by remarcksc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }
    protected void rasbtnFamily11_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  ctype='Clients' order by remarks desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGrid.DataSource = dtGridView;
        MyGrid.DataBind();
    }



    protected void btnFamily121_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2' order by tspc1 asc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }
    protected void btnFamily111_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2'  order by tspendingperiod desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }

    protected void dbtnFamily121_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2' order by ipc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }
    protected void dbtnFamily111_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2'  order by invoiceperiod desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }

    protected void edbtnFamily121_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2' order by idc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }
    protected void edbtnFamily111_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2'  order by idate desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }

    protected void fedbtnFamily121_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2' order by remarcksc1 desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }
    protected void fedbtnFamily111_Click(object sender, EventArgs e)
    {
        DataTable dtGridView = new DataTable();
        string strSelect = "SELECT * FROM dbo.IG_Invoice where  status='2'  order by remarks desc";
        SqlCommand cmd = new SqlCommand(strSelect, con);
        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
        dAdapter.Fill(dtGridView);
        MyGridDeactivate.DataSource = dtGridView;
        MyGridDeactivate.DataBind();
    }

    protected void lnkdownload_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("select cname as Company_Name,efname as Employee_Name,elname as Employee_LastName,timesheet as Timesheet,invoice as Invoice_Required,rinvoiceduration as Invoice_Duration,invoicedates as Invoice_Dates,invoiceperiod +' - ' + invoiceperiod1 as Invoice_Period,tspendingperiod +' - '+ tspendingperiod1 as Timesheet_Pendingperiod,idate as Invoice_Date,cemail as Consultant_Email, hrate as Hour_Rate,ot as Overtime_Rate,remarks as Remarks  from IG_Invoice where ctype='Vendors' and status=1 order by cname asc", con);
        DataSet ds = new DataSet();
        cmd.Fill(ds);

        DataTable dt = ds.Tables[0];
        GridView GridView1 = new GridView();
        GridView1.AllowPaging = false;
        GridView1.DataSource = dt;
        GridView1.DataBind();

        //Response.ContentType = "application/pdf";

        //Response.AddHeader("content-disposition",

        //    "attachment;filename=DataTable.pdf");

        //Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //StringWriter sw = new StringWriter();

        //HtmlTextWriter hw = new HtmlTextWriter(sw);

        //GridView1.RenderControl(hw);

        //StringReader sr = new StringReader(sw.ToString());

        //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

        //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        //pdfDoc.Open();

        //htmlparser.Parse(sr);

        //pdfDoc.Close();

        //Response.Write(pdfDoc);
        //Response.End();

      //excel with string buider
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Vendors.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            //Apply text style to each Row
            GridView1.Rows[i].Attributes.Add("class", "textmode");
        }
        GridView1.RenderControl(hw);
        //style to format numbers to string
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();

    // excel with string
        //Response.ClearContent();
        //Response.Buffer = true;
        //Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Vendors.csv"));
        //Response.ContentType = "application/ms-excel";

        //string str = string.Empty;
        //DataTable dt = ds.Tables[0];
        //foreach (DataColumn dtcol in dt.Columns)
        //{
        //    Response.Write(str + dtcol.ColumnName);
        //    str = "\t";
        //}
        //Response.Write("\n");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    str = "";
        //    for (int j = 0; j < dt.Columns.Count; j++)
        //    {
        //        Response.Write(str + Convert.ToString(dr[j]));
        //        str = "\t";
        //    }
        //    Response.Write("\n");
        //}
        //Response.End();
    }

    protected void lnkdownload1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("select cname as Company_Name,efname as Employee_Name,elname as Employee_LastName,timesheet as Timesheet,invoice as Invoice_Required,rinvoiceduration as Invoice_Duration,invoicedates as Invoice_Dates,invoiceperiod +' - ' + invoiceperiod1 as Invoice_Period,tspendingperiod +' - '+ tspendingperiod1 as Timesheet_Pendingperiod,idate as Invoice_Date,cemail as Consultant_Email, hrate as Hour_Rate,ot as Overtime_Rate,remarks as Remarks  from IG_Invoice where ctype='Clients' and status=1 order by cname asc", con);
        DataSet ds = new DataSet();
        cmd.Fill(ds);
        DataTable dt = ds.Tables[0];
        GridView GridView1 = new GridView();
        GridView1.AllowPaging = false;
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Clients.xls"));


        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            //Apply text style to each Row
            GridView1.Rows[i].Attributes.Add("class", "textmode");
        }
        GridView1.RenderControl(hw);
        //style to format numbers to string
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "lnkactivatedata")
        {
            string id=e.CommandArgument.ToString();
            int status=2;
            SqlCommand cmd = new SqlCommand("update dbo.IG_Invoice set  status=" + status + " where sno=" + id, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);

        }
    }
    protected void MyGridDeactivate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deactiv")
        {
            string id = e.CommandArgument.ToString();
            int status = 1;
            SqlCommand cmd = new SqlCommand("update dbo.IG_Invoice set  status=" + status + " where sno=" + id, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);

        }
    }
    protected void MyGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "client")
        {
            string id = e.CommandArgument.ToString();
            int status = 2;
            SqlCommand cmd = new SqlCommand("update dbo.IG_Invoice set  status=" + status + " where sno=" + id, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Company Status  Updated Successfully');location.replace('Emp-Invoice.aspx');", true);

        }
    }
}