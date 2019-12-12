using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Performance_Review_Edit : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
                SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
                ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                string id = Request.QueryString["eid"].ToString();
                SqlDataAdapter da = new SqlDataAdapter("select  * from IG_ExperienceDetails where eid='" + id + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtname.Text = ds.Tables[0].Rows[0]["empname"].ToString();
                    txtcal.Text = ds.Tables[0].Rows[0]["doj"].ToString();
                    dddign.ClearSelection();
                    dddign.Items.FindByText(ds.Tables[0].Rows[0]["Disgnation"].ToString()).Selected = true;
                    txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    txtmobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    txtaddress.Text = ds.Tables[0].Rows[0]["ContactAddress"].ToString();

                    txtp1.Text = ds.Tables[0].Rows[0]["Project1"].ToString();//Project1	Project1DurationFrom	Project1DurationTo	Project1Discription
                    txtp1f.Text = ds.Tables[0].Rows[0]["Project1DurationFrom"].ToString();
                    txtp1t.Text = ds.Tables[0].Rows[0]["Project1DurationTo"].ToString();
                    txtp1dis.Text = ds.Tables[0].Rows[0]["Project1Discription"].ToString();


                    if (ds.Tables[0].Rows[0]["Project2"].ToString() == "")
                    {
                        p2.Visible = false;
                        p21.Visible = false;
                        p22.Visible = false;
                    }
                    else
                    {
                        txtp2.Text = ds.Tables[0].Rows[0]["Project2"].ToString();
                        txtp2f.Text = ds.Tables[0].Rows[0]["Project2DurationFrom"].ToString();
                        txtp2t.Text = ds.Tables[0].Rows[0]["Project2DurationTo"].ToString();
                        txt2dis.Text = ds.Tables[0].Rows[0]["Project2Discription"].ToString();

                        p2.Visible = true;
                        p21.Visible = true;
                        p22.Visible = true;
                    }

                    if (ds.Tables[0].Rows[0]["Project3"].ToString() == "")
                    {
                        p3.Visible = false;
                        p31.Visible = false;
                        p32.Visible = false;
                    }
                    else
                    {
                        txtp3.Text = ds.Tables[0].Rows[0]["Project3"].ToString();
                        txtp3f.Text = ds.Tables[0].Rows[0]["Project3DurationFrom"].ToString();
                        txtp3t.Text = ds.Tables[0].Rows[0]["Project3DurationTo"].ToString();
                        txt3dis.Text = ds.Tables[0].Rows[0]["Project3Discription"].ToString();

                        p3.Visible = true;
                        p31.Visible = true;
                        p32.Visible = true;
                    }

                    if (ds.Tables[0].Rows[0]["Project4"].ToString() == "")
                    {
                        p4.Visible = false;
                        p41.Visible = false;
                        p42.Visible = false;
                    }
                    else
                    {
                        txtp4.Text = ds.Tables[0].Rows[0]["Project4"].ToString();
                        txtp4f.Text = ds.Tables[0].Rows[0]["Project4DurationFrom"].ToString();
                        txtp4t.Text = ds.Tables[0].Rows[0]["Project4DurationTo"].ToString();
                        txt4dis.Text = ds.Tables[0].Rows[0]["Project4Discription"].ToString();

                        p4.Visible = true;
                        p41.Visible = true;
                        p42.Visible = true;
                    }

                    if (ds.Tables[0].Rows[0]["Project5"].ToString() == "")
                    {
                        p5.Visible = false;
                        p51.Visible = false;
                        p52.Visible = false;
                    }
                    else
                    {
                        txtp5.Text = ds.Tables[0].Rows[0]["Project5"].ToString();
                        txtp5f.Text = ds.Tables[0].Rows[0]["Project5DurationFrom"].ToString();
                        txtp5t.Text = ds.Tables[0].Rows[0]["Project5DurationTo"].ToString();
                        txt5dis.Text = ds.Tables[0].Rows[0]["Project5Discription"].ToString();

                        p5.Visible = true;
                        p51.Visible = true;
                        p52.Visible = true;
                    }

                    if (ds.Tables[0].Rows[0]["Project6"].ToString() == "")
                    {
                        p6.Visible = false;
                        p61.Visible = false;
                        p62.Visible = false;
                    }
                    else
                    {
                        txtp6.Text = ds.Tables[0].Rows[0]["Project6"].ToString();
                        txtp6f.Text = ds.Tables[0].Rows[0]["Project6DurationFrom"].ToString();
                        txtp6t.Text = ds.Tables[0].Rows[0]["Project6DurationTo"].ToString();
                        txt6dis.Text = ds.Tables[0].Rows[0]["Project6Discription"].ToString();

                        p6.Visible = true;
                        p61.Visible = true;
                        p62.Visible = true;
                    }
                }
            }
        }
    }

    protected void lnkmore1_Click(object sender, EventArgs e)
    {
        if ((txtp1.Text != "") && (txtp1dis.Text != ""))
        {
            p2.Visible = true;
            p21.Visible = true;
            p22.Visible = true;
        }
        else
        {
            string script = "alert('Please Add Project Details')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void lnkcancel1_Click(object sender, EventArgs e)
    {
        p2.Visible = false;
        p21.Visible = false;
        p22.Visible = false;
        txtp2.Text = "";
        txtp2f.Text = "";
        txtp2t.Text = "";
        txt2dis.Text = "";
    }

    protected void lnkmore2_Click(object sender, EventArgs e)
    {
        if ((txtp2.Text != "") && (txt2dis.Text != ""))
        {
            p3.Visible = true;
            p31.Visible = true;
            p32.Visible = true;
        }
        else
        {
            string script = "alert('Please Add Project Details')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void lnkcancel2_Click(object sender, EventArgs e)
    {
        p3.Visible = false;
        p31.Visible = false;
        p32.Visible = false;
        txtp3.Text = "";
        txtp3f.Text = "";
        txtp3t.Text = "";
        txt3dis.Text = "";
    }

    protected void lnkmore3_Click(object sender, EventArgs e)
    {
        if ((txtp3.Text != "") && (txt3dis.Text != ""))
        {
            p4.Visible = true;
            p41.Visible = true;
            p42.Visible = true;
        }
        else
        {
            string script = "alert('Please Add Project Details')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void lnkcancel3_Click(object sender, EventArgs e)
    {
        p4.Visible = false;
        p41.Visible = false;
        p42.Visible = false;
        txtp4.Text = "";
        txtp4f.Text = "";
        txtp4t.Text = "";
        txt4dis.Text = "";
    }

    protected void lnkmore4_Click(object sender, EventArgs e)
    {
        if ((txtp4.Text != "") && (txt4dis.Text != ""))
        {
            p5.Visible = true;
            p51.Visible = true;
            p52.Visible = true;
        }
        else
        {
            string script = "alert('Please Add Project Details')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void lnkcancel4_Click(object sender, EventArgs e)
    {
        p5.Visible = false;
        p51.Visible = false;
        p52.Visible = false;
        txtp5.Text = "";
        txtp5f.Text = "";
        txtp5t.Text = "";
        txt5dis.Text = "";
    }

    protected void lnkmore5_Click(object sender, EventArgs e)
    {
        if ((txtp5.Text != "") && (txt5dis.Text != ""))
        {
            p6.Visible = true;
            p61.Visible = true;
            p62.Visible = true;
        }
        else
        {
            string script = "alert('Please Add Project Details')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string Name = txtname.Text;
        string jod = txtcal.Text;
        string disgnation = dddign.SelectedItem.Text;
        string email = txtemail.Text;
        string mobile = txtmobile.Text;
        string Address = txtaddress.Text;

        string P1 = txtp1.Text;
        string P1f = txtp1f.Text;
        string P1t = txtp1t.Text;
        string p1dis = txtp1dis.Text;

        string P2 = txtp2.Text;
        string P2f = txtp2f.Text;
        string P2t = txtp2t.Text;
        string p2dis = txt2dis.Text;

        string P3 = txtp3.Text;
        string P3f = txtp3f.Text;
        string P3t = txtp3t.Text;
        string p3dis = txt3dis.Text;

        string P4 = txtp4.Text;
        string P4f = txtp4f.Text;
        string P4t = txtp4t.Text;
        string p4dis = txt4dis.Text;

        string P5 = txtp5.Text;
        string P5f = txtp5f.Text;
        string P5t = txtp5t.Text;
        string p5dis = txt5dis.Text;

        string P6 = txtp6.Text;
        string P6f = txtp6f.Text;
        string P6t = txtp6t.Text;
        string p6dis = txt6dis.Text;

        string Date = System.DateTime.Now.ToString();

        string id = Request.QueryString["eid"].ToString();

        string qry = "update  IG_ExperienceDetails set Empname='" + Name + "', Doj='" + jod + "',Email='" + email + "',Mobile='" + mobile + "', Project1='" + P1 + "',Project1DurationFrom='" + P1f + "',Project1DurationTo='" + P1t + "',Project1Discription='" + p1dis + "',Project2='" + P2 + "',Project2DurationFrom='" + P2f + "',Project2DurationTo='" + P2t + "',Project2Discription='" + p2dis + "',Project3='" + P3 + "',Project3DurationFrom='" + P3f + "',Project3DurationTo='" + P3t + "',Project3Discription='" + p3dis + "',Project4='" + P4 + "',Project4DurationFrom='" + P4f + "',Project4DurationTo='" + P4t + "',Project4Discription='" + p4dis + "',Project5='" + P5 + "',Project5DurationFrom='" + P5f + "',Project5DurationTo='" + P5t + "',Project5Discription='" + p5dis + "',Project6='" + P6 + "',Project6DurationFrom='" + P6f + "',Project6DurationTo='" + P6t + "',Project6Discription='" + p6dis + "',ContactAddress='" + Address + "',disgnation='" + disgnation + "' where eid='"+id+"'";
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        sqlConnection.Open();
        SqlCommand cmd = new SqlCommand(qry, sqlConnection);
        int i = cmd.ExecuteNonQuery();
        sqlConnection.Close();
        if (i == 1)
        {
            string from = email;
            string fromName = Name;
            string to = "rr@1indus.com";
            string subject = "" + Name + " of Performance Review ";
            string bodyText = " Respected Sir/Madam  <br/><br/>";
            bodyText += "" + Name + " of Performance Review <br/><br/>";

            bodyText += "<b>Name : " + Name + "</b><br/><br/>";
            bodyText += "<b>Joing Date : " + jod + "</b><br/><br/>";
            bodyText += "<b>Designation: " + disgnation + "</b><br/><br/>";
            bodyText += "<b>Email Id : " + email + "</b><br/><br/>";
            bodyText += "<b>Mobile Number : " + mobile + "</b><br/><br/>";

            bodyText += "<b>Project 1 : " + P1 + "</b><br/><br/>";
            bodyText += "<b>Start Date : " + P1f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P1t + "</b><br/><br/>";
            bodyText += "<b>Discription : " + p1dis + "</b><br/><br/>";

            if (txtp2.Text != "")
            {
                bodyText += "<b>Project 1 : " + P2 + "</b><br/><br/>";
                bodyText += "<b>Start Date : " + P2f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P2t + "</b><br/><br/>";
                bodyText += "<b>Discription : " + p2dis + "</b><br/><br/>";
            }
            if (txtp3.Text != "")
            {
                bodyText += "<b>Project 1 : " + P3 + "</b><br/><br/>";
                bodyText += "<b>Start Date : " + P3f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P3t + "</b><br/><br/>";
                bodyText += "<b>Discription : " + p3dis + "</b><br/><br/>";
            }
            if (txtp4.Text != "")
            {
                bodyText += "<b>Project 1 : " + P4 + "</b><br/><br/>";
                bodyText += "<b>Start Date : " + P4f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P4t + "</b><br/><br/>";
                bodyText += "<b>Discription : " + p4dis + "</b><br/><br/>";
            }
            if (txtp5.Text != "")
            {
                bodyText += "<b>Project 1 : " + P5 + "</b><br/><br/>";
                bodyText += "<b>Start Date : " + P5f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P5t + "</b><br/><br/>";
                bodyText += "<b>Discription : " + p5dis + "</b><br/><br/>";
            }
            if (txtp6.Text != "")
            {
                bodyText += "<b>Project 1 : " + P6 + "</b><br/><br/>";
                bodyText += "<b>Start Date : " + P6f + "</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>End Date : " + P6t + "</b><br/><br/>";
                bodyText += "<b>Discription : " + p6dis + "</b><br/><br/>";
            }


            bodyText += "<b>Coommunication Address : " + Address + "</b><br/><br/>";

            string result1 = SendMail(from, fromName, to, subject, bodyText);

            clear();
            string script = "alert('Your Details received Successfully ')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }

    }

    public void clear()
    {
        txtname.Text = "";
        txtcal.Text = "";
        dddign.SelectedIndex = -1;
        txtemail.Text = "";
        txtmobile.Text = "";
        txtaddress.Text = "";

        txtp1.Text = "";
        txtp1f.Text = "";
        txtp1t.Text = "";
        txtp1dis.Text = "";

        txtp2.Text = "";
        txtp2f.Text = "";
        txtp2t.Text = "";
        txt2dis.Text = "";

        txtp3.Text = "";
        txtp3f.Text = "";
        txtp3t.Text = "";
        txt3dis.Text = "";

        txtp4.Text = "";
        txtp4f.Text = "";
        txtp4t.Text = "";
        txt4dis.Text = "";

        txtp5.Text = "";
        txtp5f.Text = "";
        txtp5t.Text = "";
        txt5dis.Text = "";

        txtp6.Text = "";
        txtp6f.Text = "";
        txtp6t.Text = "";
        txt6dis.Text = "";
    }

    private string SendMail(string from, string fromName, string to, string subject, string bodyText)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", bodyText);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    protected void btncancel2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Performance-Review.aspx");

    }
}