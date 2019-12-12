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
using System.Data.SqlClient;

public partial class usercontrols_Emp_topmenu : System.Web.UI.UserControl
{
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        //if (((LinkButton)sender).ID == "home")
    //        //{
    //        //    home.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d23627");
    //        //}
    //        //if (((LinkButton)sender).ID == "empprof")
    //        //{
    //        //    empprof.ForeColor = System.Drawing.Color.Gray;
    //        //}

    //        //Cache["CurrentButton"] = (sender as LinkButton).ID;
    //        //switch ((sender as LinkButton).ID)
    //        //{
    //        //    case "home":
    //        //        home.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d23627");
    //        //        break;
    //        //    case "empprof":
    //        //        empprof.ForeColor = System.Drawing.Color.Gray;
    //        //        break;
    //        //    case "empinfo":
    //        //        empinfo.ForeColor = System.Drawing.Color.Gray;
    //        //        break;
    //        //    case "careers":
    //        //        careers.ForeColor = System.Drawing.Color.Gray;
    //        //        break;
    //        //    case "timesheet":
    //        //        timesheet.ForeColor = System.Drawing.Color.Gray;
    //        //        break;
    //        //    case "tdEmpDocs":
    //        //        tdEmpDocs.ForeColor = System.Drawing.Color.Gray;
    //        //        break;
    //        //}

    //       // home.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d23627");
    //       //empprof.ForeColor = System.Drawing.Color.Gray;
    //       //empinfo.ForeColor = System.Drawing.Color.Gray;
    //       //careers.ForeColor = System.Drawing.Color.Gray;
    //       //timesheet.ForeColor = System.Drawing.Color.Gray;
    //       //tdEmpDocs.ForeColor = System.Drawing.Color.Gray;

    //    }
    //}
    //protected void lnktime_Click(object sender, EventArgs e)
    //{
    //    string cont = Session["Country"].ToString();

    //    if (cont == "India")
    //    {
    //        string emailid =  Session["indemail"].ToString();

    //        Response.Redirect("Indemp-DailyTimesheet.aspx?username="+emailid);
    //    }
    //    else
    //    {
    //        Response.Redirect("Emp_Timesheet.aspx");

    //    }
    //}

   SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                //Session.Add("1username", username);
                //Session.Add("1userid", userid);
                //Session.Add("1uid", uid);
                //Session.Add("1email", email);
                //Session.Add("utype", utype);
                //Session.Add("country", contry);

                string s = "select distinct item  from indus_Roles where role='" + Session["utype"].ToString() + "' and mid='" + Session["1uid"]+ "' order by item asc";
                SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dlitems.RepeatColumns = 6;
                dlitems.DataSource = ds;
                dlitems.DataBind();

                string s1 = "select * from Users_Information where userid='" + Session["userid"].ToString() + "' ";
                SqlDataAdapter sda1 = new SqlDataAdapter(s1, sqlConnection);
                DataSet ds1 = new DataSet();
                sda1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    lblfname.Text = ds1.Tables[0].Rows[0]["fname"].ToString();
                    lbllastname.Text = ds1.Tables[0].Rows[0]["lname"].ToString();

                }
            }
        }
    }

    protected void lnkitems_Command(object sender, CommandEventArgs e)
    {

        if (e.CommandArgument == "itemlist")
        {
            LinkButton lnk = (LinkButton)(sender);
            string text = lnk.Text;

            if (text == "Daily Timesheet")
            {
                //if (Session["userid"] != null)
                if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
                {
                    if (Session["country"].ToString() == "USA")
                    {
                        //  Response.Redirect("Emp_Timesheet.aspx?userid=" + Session["1email"].ToString());
                       // Response.Redirect("Emp_Timesheet.aspx");
                        string path = HttpContext.Current.Request.Url.AbsolutePath;
                        string s22 = "";

                            if (path.Contains("admin/admin_payroll.aspx"))
                            {
                                s22 = path.Remove(path.IndexOf("admin/admin_payroll.aspx"), "admin/admin_payroll.aspx".Length);
                                Response.Redirect(s22 + "Emp_Timesheet.aspx");
                            }

                            if (path.Contains("admin/admin_payrolla1.aspx"))
                            {
                                s22 = path.Remove(path.IndexOf("admin/admin_payrolla1.aspx"), "admin/admin_payrolla1.aspx".Length);
                                Response.Redirect(s22 + "Emp_Timesheet.aspx");
                            }

                            if (path.Contains("admin/admin-pendingaccounts.aspx"))
                            {
                                s22 = path.Remove(path.IndexOf("admin/admin-pendingaccounts.aspx"), "admin/admin-pendingaccounts.aspx".Length);
                                Response.Redirect(s22 + "Emp_Timesheet.aspx");
                            }
                            else
                            {
                                Response.Redirect("Emp_Timesheet.aspx");
                            }

                    }
                    else
                    {
                        // Response.Redirect("Indemp-DailyTimesheet.aspx?userid=" + Session["1email"].ToString());
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");

                }
            }

            string s = "select * from menuitems  where item='" + text+ "'";
            SqlDataAdapter sda = new SqlDataAdapter(s, sqlConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
            {
                string emp = Session["utype"].ToString();

                if (emp == "Admin")
                {
                    string s1 = ds.Tables[0].Rows[0]["item_url"].ToString();
                    Response.Redirect("../" + s1);
                }
                else
                {
                    string s11 = ds.Tables[0].Rows[0]["item_url1"].ToString();

                    string path = HttpContext.Current.Request.Url.AbsolutePath;
                    string s22 = "";

                    if (path.Contains("admin/admin_payroll.aspx"))
                    {
                        s22 = path.Remove(path.IndexOf("admin/admin_payroll.aspx"), "admin/admin_payroll.aspx".Length);
                        Response.Redirect(s22 + s11);
                    }
                    //if (s11.Contains("admin_payroll.aspx"))
                    //{
                    //    Response.Redirect(s11);
                    //}

                    if (path.Contains("admin/admin_payrolla1.aspx"))
                    {
                        s22 = path.Remove(path.IndexOf("admin/admin_payrolla1.aspx"), "admin/admin_payrolla1.aspx".Length);
                        Response.Redirect(s22 + s11);
                    }
                    //if (s11.Contains("admin_payrolla1.aspx"))
                    //{
                    //    Response.Redirect(s11);
                    //}

                    if (path.Contains("admin/admin-pendingaccounts.aspx"))
                    {
                        s22 = path.Remove(path.IndexOf("admin/admin-pendingaccounts.aspx"), "admin/admin-pendingaccounts.aspx".Length);
                        Response.Redirect(s22 + s11);
                    }
                    //if (s11.Contains("admin-pendingaccounts.aspx"))
                    //{
                    //    Response.Redirect(s11);
                    //}
                                   
                    else
                    {
                        Response.Redirect(s11);
                    }
                }
            }
        }
    }

    protected void lnkALog_click(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;

        if ((Session["utype"].ToString() != null) || (Session["utype"].ToString() != ""))
        {
            string emp = Session["utype"].ToString();

            if (emp == "Admin")
            {
                Session.Clear();

                Response.Redirect("../Admin_Login.aspx");
            }
            else
            {
              string  s22 = "";
              string s11 = "Login.aspx";

              if (path.Contains("admin/admin_payroll.aspx"))
              {
                  s22 = path.Remove(path.IndexOf("admin/admin_payroll.aspx"), "admin/admin_payroll.aspx".Length);
                  Response.Redirect(s22 + s11);
              }

              if (path.Contains("admin_payrolla1.aspx"))
              {
                  s22 = path.Remove(path.IndexOf("admin/admin_payrolla1.aspx"), "admin/admin_payrolla1.aspx".Length);
                  Response.Redirect(s22 + s11);
              }

              if (path.Contains("admin/admin-pendingaccounts.aspx"))
              {
                  s22 = path.Remove(path.IndexOf("admin/admin-pendingaccounts.aspx"), "admin/admin-pendingaccounts.aspx".Length);
                  Response.Redirect(s22 + s11);
              }
              else
              {
                  Session.Clear();

                    Response.Redirect("Login.aspx");
              }
            }
        }
    }
}