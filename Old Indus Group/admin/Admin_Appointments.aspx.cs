using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class admin_Admin_Appointments : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            try
            {
                string date = Request.QueryString["date"].ToString();
                lblFullDate.Text = Convert.ToDateTime(date).ToLongDateString();
            }
            catch
            {
                lblFullDate.Text = DateTime.Now.ToLongDateString();
            }
            for (int i = 0; i <= 30; i++)
            {
                DateTime dt = DateTime.Now;
                DateTime ddt1 = dt.AddDays(i);
                ddlDates.Items.Add(ddt1.ToShortDateString());
            }
            lblUser.Text = Session["UserName"].ToString();
            //lblUser.Text = "admin";
            bindgrid();
        }
    }

    /// <summary>
    /// display appointments by user name
    /// </summary>
    void bindgrid()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from time_period", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Gridview1.DataSource = ds;
        Gridview1.DataBind();
    }

    protected void ddlDates_bind(object sender, EventArgs e)
    {
        lblFullDate.Text = Convert.ToDateTime(ddlDates.SelectedItem.Text).ToLongDateString();
        bindgrid();
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int s1 = 0, s2 = 0, comtime = (int)DateTime.Now.Hour; 
        string s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8 = "", time = "";
        string sda = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbltime = (Label)e.Row.FindControl("lblEst");
            // time = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
            time = lbltime.Text;

            //con.Open();
            SqlDataAdapter sscmd = new SqlDataAdapter("select * from appointments where ti_est='" + time + "' and app_date='" + sda + "'", con);
            DataSet das = new DataSet();
            sscmd.Fill(das);
            //    Label l1 = (Label)e.Row.FindControl("lblEst");
            Label l2 = (Label)e.Row.FindControl("lblBooked");
            LinkButton l3 = (LinkButton)e.Row.FindControl("lnkAvilable");
            Label l4 = (Label)e.Row.FindControl("txtPhone");
            Label l5 = (Label)e.Row.FindControl("lblComments");
            Label l6 = (Label)e.Row.FindControl("lblType");
            Image l7 = (Image)e.Row.FindControl("imgCal");
            Label l8 = (Label)e.Row.FindControl("txtmobile");
            Label l9 = (Label)e.Row.FindControl("txtAppoint");
            if (das.Tables[0].Rows.Count > 0)
            {
                s2 = Convert.ToInt32(das.Tables[0].Rows[0]["book_status"].ToString());
                if (lblUser.Text == das.Tables[0].Rows[0]["username"].ToString())
                {

                    //int comtime = (int)DateTime.Now.Hour;
                    string[] tim12 = time.Split(':');
                    int ctime1 = Convert.ToInt32(tim12[0]);
                    if (ctime1 >= comtime)
                    {
                        s1 = Convert.ToInt32(das.Tables[0].Rows[0]["calimg_status"].ToString());
                        //s3 = das.Tables[0].Rows[0]["ti_est"].ToString();
                        s4 = das.Tables[0].Rows[0]["app_titile"].ToString();
                        s5 = das.Tables[0].Rows[0]["phone"].ToString();
                        s6 = das.Tables[0].Rows[0]["mobile"].ToString();
                        s7 = das.Tables[0].Rows[0]["app_descr"].ToString();
                        s8 = das.Tables[0].Rows[0]["app_type"].ToString();

                        l4.Text = s5;
                        if (s4.Length > 15)
                            l9.Text = s4.Substring(0, 15);
                        else
                            l9.Text = s4;

                        l9.ToolTip = s4;
                        if (s7.Length > 50)
                            l5.Text = s7.Substring(0, 50);
                        else
                            l5.Text = s7;
                        l5.ToolTip = s7;
                        l6.Text = s8;
                        l8.Text = s6;
                        l9.Text = s4;

                    }

                }
            }
            else
            {
                s2 = 0;
            }
            //    con.Close();

            string[] tim123 = time.Split('-');
            string[] time1234 = tim123[1].Split(':');
            int ctime2 = Convert.ToInt32(time1234[0]);
            string date2 = DateTime.Now.ToLongDateString();

            if ((ctime2 > comtime) && (date2 == lblFullDate.Text) || (date2 != lblFullDate.Text))
            {
                l3.Enabled = true;
            }
            else
            {
                l3.ForeColor = System.Drawing.Color.Gray;
                l3.Text = "Time Out";
                l3.Enabled = false;
                l3.Font.Underline = false;
            }
            if (s1 == 0)
            {
                l7.Visible = false;
            }
            else
            {
                l7.Visible = true;
            }
            if (s2 == 0)
            {
                l2.Visible = false;
                //l3.Style.Add("color", "Green");
                //l3.Text = "Avilable";
                l3.Visible = true;
                //l3.Enabled = true;
            }
            else
            {
                l2.Visible = true;
                //l3.Style.Add("color", "Red");
                //l3.Text = "Booked";

                //l3.Font - Underline = false;
                l3.Visible = false;
                //l3.Enabled = false;
            }
            //    if (s3 == "") { }
            //    else { }
            if (s4 == "") { l9.Visible = false; }
            else { l9.Visible = true; }
            if (s5 == "") { l4.Visible = false; }
            else { l4.Visible = true; }
            if (s6 == "") { l8.Visible = false; }
            else { l8.Visible = true; }
            if (s7 == "") { l5.Visible = false; }
            else { l5.Visible = true; }
            if (s8 == "") { l6.Visible = false; }
            else { l6.Visible = true; }
        }

    }

    protected void lnkMyapntmt_Click(object sender, EventArgs e)
    {
        //Admin_Myappointments.aspx
        Response.Redirect("Admin_Myappointments.aspx");
    }

    /// <summary>
    /// add apointment
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAdd_click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into appointments(username,ti_est,app_date,phone,mobile,app_titile,app_type,app_descr,calimg_status,book_status) " +
            "values (@user,@tim,@dat,@pho,@mob,@tit,@type,@des,1,1)", con);

        cmd.Parameters.AddWithValue("@user", lblUser.Text);
        cmd.Parameters.AddWithValue("@tim", txtEstInsert.Text);
        string sdate=Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
        cmd.Parameters.AddWithValue("@dat", sdate);
        cmd.Parameters.AddWithValue("@pho", txtphno.Text);
        cmd.Parameters.AddWithValue("@mob", txtmbno.Text);
        cmd.Parameters.AddWithValue("@tit", txtapptitle.Text);
        cmd.Parameters.AddWithValue("@type", ddlType.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@des", txtDescr.Text);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        bindgrid();

        if (i == 1)
        {
            //SendMail(lblUser.Text, txtEstInsert.Text, sdate, ddlType.SelectedItem.Text, txtapptitle.Text, txtDescr.Text);
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Appointment booked sucessfully');</script>");
            //body1.Attributes.Add("onload", "return Booked()");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Error! while booking appointment');</script>");
            //body1.Attributes.Add("onload", "return Error()");
        }        
    }
    protected void immg_command(object sender, CommandEventArgs e)
    {
        int id = ((sender as ImageButton).NamingContainer as GridViewRow).RowIndex;
        Label lblphone = (Label)Gridview1.Rows[id].FindControl("txtPhone");
        Label lblest = (Label)Gridview1.Rows[id].FindControl("lblEst");
        Label lblmobile= (Label)Gridview1.Rows[id].FindControl("txtmobile");
        Label lblcomm = (Label)Gridview1.Rows[id].FindControl("lblComments");
        Label lbltype = (Label)Gridview1.Rows[id].FindControl("lblType");
        Label lbltitle = (Label)Gridview1.Rows[id].FindControl("txtAppoint");
        txtEditPhone.Text = lblphone.Text;
        txtEditMobil.Text = lblmobile.Text;
        txtEditApmt.Text = lbltitle.Text;
        if (lbltype.Text != "")
        {
            ddlEditType.SelectedValue = lbltype.Text;
        }        
        txtEditDesc.Text = lblcomm.ToolTip.ToString();
        txtEditEst.Text = lblest.Text;
        lblExtra.Text = lblest.Text;
        modal2.Show();
    }
    protected void avil_command(object sender, CommandEventArgs e)
    {
        int id = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        Label lblest = (Label)Gridview1.Rows[id].FindControl("lblEst");
        txtEstInsert.Text = lblest.Text;
        modal1.Show();
    }

    /// <summary>
    /// delete appointment
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void cancelEdit_Click(object sender, EventArgs e)
    {
        con.Open();
        string sdate1 = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
        SqlCommand cmd1 = new SqlCommand("delete from appointments where ti_est=@est and app_date=@dat and username=@user", con);
        cmd1.Parameters.AddWithValue("@est", txtEditEst.Text);
        cmd1.Parameters.AddWithValue("@dat", sdate1);
        cmd1.Parameters.AddWithValue("@user", lblUser.Text);
        int i = cmd1.ExecuteNonQuery();
        con.Close();
        bindgrid();
        if (i == 1)
        {
            //CancelMail(lblUser.Text, sdate1, txtEditEst.Text);

            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Appointment cancel successfully');</script>");

         //   body1.Attributes.Add("onload", "return CanelApp()");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Error! while canceling appointment');</script>");
            //body1.Attributes.Add("onload", "return Error()");
        }
    }
    /// <summary>
    /// update apointment
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        con.Open();
        string sdate1 = Convert.ToDateTime(lblFullDate.Text).ToShortDateString();
        SqlCommand cmd = new SqlCommand("update appointments set ti_est=@tim,mobile=@mob,app_titile=@tit,app_type=@type,app_descr=@des " +
            "where ti_est=@extest and app_date=@dat and username=@user", con);
        cmd.Parameters.AddWithValue("@tim", txtEditEst.Text);
        cmd.Parameters.AddWithValue("@mob", txtEditMobil.Text);
        cmd.Parameters.AddWithValue("@tit", txtEditApmt.Text);
        cmd.Parameters.AddWithValue("@type", ddlEditType.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@des", txtEditDesc.Text);
        cmd.Parameters.AddWithValue("@dat", sdate1);
        cmd.Parameters.AddWithValue("@user", lblUser.Text);
        cmd.Parameters.AddWithValue("@extest", lblExtra.Text);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        bindgrid();
        if (i == 1)
        {
            //editMail(lblUser.Text, txtEditEst.Text, sdate1, ddlEditType.SelectedItem.Text, txtEditApmt.Text, txtEditDesc.Text);
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Appointment updated sucessfully');</script>");
            //body1.Attributes.Add("onload", "return Update()");
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "message", "<script type='text/javascript'>alert('Error! while updating appointment');</script>");
            
    }
    //private void SendMail(string fname, string time, string date, string type, string titl, string desc)
    //{
    //    string Msg = "";
    //    MailMessage mm = new MailMessage();
    //    mm.From = new MailAddress("info@igiit.com");
    //    mm.To.Add(Label1.Text);
    //    mm.Bcc.Add("hr@igiit.com");
    //    mm.Bcc.Add("ravi_iginc@yahoo.com");
    //    Msg += "<br/> Hello Mr/Mrs. " + fname + " <br/>" +
    //        "It is our plessure to meet with you as per schedule time <br/> <u>Your scheduled time is : </u> <br/>" +
    //             "Time : " + time +
    //            "<br>" +
    //             "<br>Date : " + date +
    //             "<br/>" +
    //           "<br>Title : " + titl +
    //          "<br>" +
    //           "<br>Type : " + type +
    //          "<br>" +
    //          "<br>Description : " + desc +
    //             "<br/>" +
    //            "<br>Place : Indusgroup Office" +
    //           "<br/><br/>" + "Request you to be on scheduled time for better opportunity.";
    //    mm.Subject = "Your appointment schedule with Indusgroup management";
    //    mm.IsBodyHtml = true;
    //    mm.Body = Msg;
    //    SmtpClient smtp = new SmtpClient();
    //    try
    //    {
    //        smtp.Send(mm);
    //    }
    //    catch
    //    {
    //    }
    //}
    //private void editMail(string fname, string time, string date, string type, string titl, string desc)
    //{
    //    string Msg = "";
    //    MailMessage mm = new MailMessage();
    //    mm.From = new MailAddress("info@igiit.com");
    //    mm.To.Add(Label1.Text);
    //    mm.Bcc.Add("hr@igiit.com");
    //    mm.Bcc.Add("ravi_iginc@yahoo.com");
    //    Msg += "<br/> Hello Mr/Mrs. " + fname + " <br/>" +
    //        "It is our plessure to meet with you as per schedule time <br/> <u>Your scheduled time is changed: </u> <br/>" +
    //             "Time : " + time +
    //            "<br>" +
    //             "<br>Date : " + date +
    //             "<br/>" +
    //           "<br>Title : " + titl +
    //          "<br>" +
    //           "<br>Type : " + type +
    //          "<br>" +
    //          "<br>Description : " + desc +
    //             "<br/>" +
    //            "<br>Place : Indusgroup Office" +
    //           "<br/><br/>" + "Request you to be on scheduled time for better opportunity.";
    //    mm.Subject = "Your appointment schedule is changed with Indusgroup management";
    //    mm.IsBodyHtml = true;
    //    mm.Body = Msg;
    //    SmtpClient smtp = new SmtpClient();
    //    try
    //    {
    //        smtp.Send(mm);
    //    }
    //    catch
    //    {
    //    }
    //}
    //private void CancelMail(string fname, string date, string time)
    //{
    //    string Msg = "";
    //    MailMessage mm = new MailMessage();
    //    mm.From = new MailAddress("info@igiit.com");
    //    mm.To.Add(Label1.Text);
    //    mm.Bcc.Add("hr@igiit.com");
    //    mm.Bcc.Add("ravi_iginc@yahoo.com");
    //    Msg += "<br/> Hello Mr/Mrs. " + fname + "<br/>" +
    //        "Your schedule time appointment Canceled on fallowing date and time :<br/>" +
    //             "<br>time : " + time +
    //            "<br>" +
    //             "<br>date : " + date +
    //             "<br/>" +
    //             "<br>place : Indusgroup Office" +
    //             "<br/>"
    //           + "<br/>Book your appointments to arrange a meeting with Chairman / Manager / HR in Indusgroup. " +
    //           " <a href='appointments.aspx' target='_blank' style='font-size:11pt; color:BlueViolet'>Login Here</a> <br/>";
    //    mm.Subject = "Message from Indusgroup regarding Cancel appointment";
    //    mm.IsBodyHtml = true;
    //    mm.Body = Msg;
    //    SmtpClient smtp = new SmtpClient();
    //    try
    //    {
    //        smtp.Send(mm);
    //    }
    //    catch
    //    {
    //    }
    //}
}
