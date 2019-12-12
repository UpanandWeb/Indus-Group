using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System.Data.OleDb;
using System.Web.Configuration;
using System.Net.Mail;

public partial class admin_Admin_Principles : System.Web.UI.Page
{
    public string schtimezone = "";
    private string pdate = string.Empty;

    string Msg = "";
    string strScript = string.Empty;
    string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";

    /// <summary> 
    ///  Loaded Previous image templates in dropdownlist
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlDataAdapter cmd1 = new SqlDataAdapter("Select * from Template order by id desc ", con);
            DataSet ds = new DataSet();
            cmd1.Fill(ds);
            Ddltemplate.DataTextField = "tempname";
            Ddltemplate.DataSource = ds;
            Ddltemplate.DataBind();
            Ddltemplate.Items.Insert(0,"Select Template");
            Btnshow2.Visible = false;

            //SqlDataAdapter cmd1111 = new SqlDataAdapter("Select * from sample1", con1);
            //DataSet ds111 = new DataSet();
            //cmd1111.Fill(ds111);
            //DataList1.DataSource = ds111;
            //DataList1.DataBind();


            SqlDataAdapter cmd2 = new SqlDataAdapter("Select * from SavedTemplate  order by sid desc ", con);
            DataSet ds2 = new DataSet();
            cmd2.Fill(ds2);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                ddsaved.DataTextField = "filename";
                ddsaved.DataSource = ds2;
                ddsaved.DataBind();
                ddsaved.Items.Insert(0, "Select Saved Template");
            }
            else
            {
                ddsaved.Items.Insert(0, "No Saved Template");
            }
        }
    }

    /// <summary>
    /// For adding new image template  and pdf , word files
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void addTemplate_Click(object sender, EventArgs e)
    {
        txtHtml.Text = "";
        if (TemplateUpload.HasFile)
        {
            string filename = TemplateUpload.FileName;
            Session["ownTempalte"] = filename;
            string ext = System.IO.Path.GetExtension(filename);
            if (ext == ".png" || ext == ".gif" || ext == ".jpg" || ext == ".jpeg" || ext == ".PNG" || ext == ".GIF" || ext == ".JPG" || ext == ".JPEG")
            {
                using (System.Drawing.Image myImage = System.Drawing.Image.FromStream(TemplateUpload.PostedFile.InputStream))
                {
                    if (myImage.Height == 1000 && myImage.Width == 1200)
                    {
                        string strUploadFileName = "admin/images/" + filename;
                        string strUploadFileName1 = "images/" + filename;
                        TemplateUpload.SaveAs(Base_dir + strUploadFileName);
                        tempsave(filename);
                    }
                    else
                    {
                        strScript = "alert('Please upload template using 1200 * 1000 dimensions')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strScript, true);
                    }
                }
            }
            else if ((ext == ".docx") || (ext == ".DOCX"))  //|| (ext == ".TXT") || (ext == ".txt")
            {
                string strUploadFileName = "admin/images/" + filename;
                string strUploadFileName1 = "images/" + filename;
                TemplateUpload.SaveAs(Base_dir + strUploadFileName);
                tempsave1(filename, strUploadFileName, ext);
                string pathq = Server.MapPath("~/admin//images/" + filename);
                var doc = new Aspose.Words.Document(pathq);
                txtHtml.Text = doc.ToTxt();
                string x = txtHtml.Text;
                x = x.Remove(0, 79);
                txtHtml.Text = x;
            }

            else if ((ext == ".pdf") || (ext == ".PDF"))
            {
                string strUploadFileName = "admin/images/" + filename;
                string strUploadFileName1 = "images/" + filename;
                TemplateUpload.SaveAs(Base_dir + strUploadFileName);
                tempsave1(filename, strUploadFileName, ext);

                string pathq = Server.MapPath("~/admin//images/" + filename);

                PdfReader reader = new PdfReader(pathq);
                StringBuilder text1 = new StringBuilder();
                for (int i = 1; i <= reader.NumberOfPages; i++)
                {
                    text1.Append(PdfTextExtractor.GetTextFromPage(reader, i));
                }
               //// string language = "en-us";
               // string language = "telugu-ind";


               // //Detect User's Language.
               // if (Request.UserLanguages != null)
               // {
               ////     //Set the Language.
               //     language = Request.UserLanguages[0];
               // }

               // txtHtml.Text = language;

                txtHtml.Text = text1.ToString();
                tempsave2(text1);

                txtHtml.Text = text1.Replace("\r\n", Environment.NewLine).ToString();
            }

            else if ((ext == ".xls") || (ext == ".xlsx") || (ext == ".XLS") || (ext == ".XLSX"))
            {
                string strUploadFileName = "admin/images/" + filename;
                string strUploadFileName1 = "images/" + filename;
                TemplateUpload.SaveAs(Base_dir + strUploadFileName);
                tempsave1(filename, strUploadFileName, ext);

                string conString = string.Empty;
                string pathq = Server.MapPath("~/admin//images/" + filename);

                switch (ext)
                {
                    case ".xls":
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx":
                        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                        break;
                }
                conString = string.Format(conString, pathq);
                using (OleDbConnection excel_con = new OleDbConnection(conString))
                {
                    excel_con.Open();
                    string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                    DataSet ExcelDataSet = new DataSet();
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                    {
                        oda.Fill(dt);

                        DataSet dss = new DataSet();
                        dss.Tables.Add(dt);
                        string x = "";
                        for (int i = 0; dss.Tables[0].Rows.Count > 0; i++)
                        {
                            for (int j = 0; dss.Tables[0].Columns.Count > 0; j++)
                            {
                                x = dss.Tables[0].Rows[i][j].ToString();
                                x = x + x;
                            }
                        }

                        txtHtml.Text = x;

                        //SqlCommand Comm1 = new SqlCommand("", con);
                        //con.Open();
                        //SqlDataReader DR1 = Comm1.ExecuteReader();
                        //if (DR1.Read())
                        //{
                        //    txtHtml.Text = DR1.GetValue(0).ToString();
                        //}
                    }
                }
            }
        }
    }

    /// <summary>
    ///  
    /// </summary>
    /// <param name="text1"></param>
    private void tempsave2(StringBuilder text1)
    {
        con1.Open();
       // SqlCommand cmd = new SqlCommand("insert into sample1 (id) values('" + text1 + "')", con);
        SqlCommand cmd = new SqlCommand("IG_SavePrincipestemplate12", con1);
        cmd.CommandType = CommandType.StoredProcedure;
        byte[] byteArray = Encoding.UTF8.GetBytes(Convert.ToString(text1));
        cmd.Parameters.AddWithValue("@id", byteArray);
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    /// <summary>
    /// SAVING  file extension, file name and path
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="pa"></param>
    /// <param name="ext"></param>
    private void tempsave1(string filename, string pa,string ext)
    {
        con.Open();
        string date = System.DateTime.Now.ToString();
        string temp = "";
        string email = "";
        string createText = "";
        SqlCommand cmd = new SqlCommand("IG_SavePrincipestemplate", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@filename", filename);
        cmd.Parameters.AddWithValue("@Templatename", temp);
        cmd.Parameters.AddWithValue("@emails", email);
        cmd.Parameters.AddWithValue("@Description", createText);
        cmd.Parameters.AddWithValue("@saveddate", date);
        cmd.Parameters.AddWithValue("@fpath", pa);
        cmd.Parameters.AddWithValue("@ext", ext);


         cmd.ExecuteNonQuery();
        con.Close();

        SqlDataAdapter cmd1 = new SqlDataAdapter("Select * from SavedTemplate  order by sid desc ", con);
        DataSet ds = new DataSet();
        cmd1.Fill(ds);
        ddsaved.DataTextField = "filename";
        ddsaved.DataSource = ds;
        ddsaved.DataBind();
        ddsaved.Items.Insert(0, "Select Saved Template");

    }
    /// <summary>
    ///  saving image name
    /// </summary>
    /// <param name="strUploadFileName"></param>
    private void tempsave(string strUploadFileName)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Template (tempname) values('" + strUploadFileName + "')",con);
        cmd.ExecuteNonQuery();
        con.Close();

        SqlDataAdapter cmd1 = new SqlDataAdapter("Select * from Template  order by id desc ", con);
        DataSet ds = new DataSet();
        cmd1.Fill(ds);
        Ddltemplate.DataTextField = "tempname";
        Ddltemplate.DataSource = ds;
        Ddltemplate.DataBind();
        Ddltemplate.Items.Insert(0, "Select Template");
    }

    protected void Ddltemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtHtml.Text = "";
        string strUploadFileName1 = "images/" + Ddltemplate.SelectedItem.Text;
        HtmlImage img = new HtmlImage();
        Msg = Msg + "<table width='1200' align='center' border='0' cellSpacing='0'cellPadding='0'>";
        Msg = Msg + "<tbody><tr><td height='1000' width='1200' align='left' vAlign='top' style='background-image: url(" + strUploadFileName1 + "); background-repeat: repeat-y;'>";
        Msg = Msg + "<div id='event_details' style='padding-top:160px;'>";
        Msg = Msg + "<h3>Type Text Here <span id='cover_title'></span></h3></div></td></tr></table>";
        txtHtml.Text = Msg + txtHtml.Text;
        ddsaved.SelectedIndex = -1;

    }

    protected void btnpreview_Click(object sender, EventArgs e)
    {
        tdpanelPreview.Visible = true;
        if (Iframe2.Visible != true)
        {
            Btnshow2.Visible = true;
            FreeTextBox1.Text = txtHtml.Text;
            FreeTextBox1.Enabled = true;
            previewpanel.Visible = true;
            ModalPopupExtender2.Show();
        }
    }

    protected void Btnclose_Click(object sender, ImageClickEventArgs e)
    {
        Btnshow2.Visible = false;
        previewpanel.Visible = false;
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/admin//Emp_photos/a.txt");
        string email = "";
        if (txtemails.Text !="")
        {
            email = txtemails.Text;
        }

        string createText = txtHtml.Text + Environment.NewLine;
        File.WriteAllText(path, createText);
        sendmail(email, createText);

        string strscpt = "alert ('Mail Sent successfully');location.replace('Admin-Principles.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    }

    /// <summary>
    /// send mail with principle
    /// </summary>
    /// <param name="to"></param>
    /// <param name="subject"></param>
    /// <param name="bodyText"></param>
    /// <param name="from"></param>
    /// <param name="fromName"></param>
    /// <returns></returns>
    //public static string SendEmail(string to, string subject, string bodyText, string from, string fromName)
    //{
    //    WebClient client = new WebClient();
    //    NameValueCollection values = new NameValueCollection();
    //    values.Add("username", USERNAME);
    //    values.Add("api_key", API_KEY);
    //    values.Add("from", from);
    //    values.Add("from_name", fromName);
    //    values.Add("to", to);
    //    values.Add("subject", subject);
    //    values.Add("body_html", bodyText);

    //    byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
    //    return Encoding.UTF8.GetString(response);
    //}

    protected void sendmail(string email,string msg)
    {
        

        try
        {
            MailMessage msgs = new MailMessage();
            string to = txtemails.Text;
            string[] Multiple = to.Split(',');

            foreach (string multiple_email in Multiple)
            {
                try
                {
                    msgs.To.Add(new MailAddress(multiple_email));
                }
                catch (Exception ex)
                {
                    Response.Write("Exception in send Email:" + ex.Message);
                }
            }
      
            //msgs.To.Add(recipient);
            MailAddress address = new MailAddress("hr@1indus.com");
            msgs.From = address;
            string Msg = "";
          //  string from = "hr@1indus.com";
         //   string fromName = "IndusGroup";
            //  string to = email;
          //  string subject = "Message From Indus Group";

            Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            Msg = Msg + "<tr><td colspan='3' style='background:url(http://www.1indus.com/images/logo2.png) no-repeat;height:100px;width:330px'></td></tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td valign='top'><strong></strong></td>";
            //Msg = Msg + "<td height='30' valign='top'>";
            ////Msg = Msg + "Dear Employees";
            //Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td align='left'>" + msg + "</td>";
            Msg = Msg + "</tr></table>";

            msgs.Subject = "Message From Indus Group";
            string htmlBody = Msg;
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            //if (fd1.HasFile)
            //{
            //    string FileName = System.IO.Path.GetFileName(fd1.PostedFile.FileName);
            //    msgs.Attachments.Add(new Attachment(fd1.PostedFile.InputStream, FileName));
            //}
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("svadapalliwar@aceindus.in", "Indusgroup1");
            //Send the msgs 
            //client.EnableSsl = false;
            client.Send(msgs);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your Details Sent Successfull.');", true);
        }
        catch (Exception ex)
        {
            Response.Write("Exception in send Email:" + ex.Message);
        }
       // SendEmail(email, subject, Msg, from, fromName);
    }

    //protected void Button1_Click1(object sender, EventArgs e)
    //{
    //    if ((ddsaved.SelectedItem.Text != "Select Saved Template") && (ddsaved.SelectedItem.Text != "No Saved Template"))
    //    {
    //        string email = "";
    //        if (txtemails.Text != "")
    //        {
    //            email = txtemails.Text;
    //        }
    //        else
    //        {
    //            email = "";
    //        }
    //        string createText = txtHtml.Text.ToString();
    //        string filename = ddsaved.SelectedItem.Text;

    //        SqlCommand cmd = new SqlCommand("IG_SavePrincipestemplate1", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@filename", filename);
    //        cmd.Parameters.AddWithValue("@emails", email);
    //        cmd.Parameters.AddWithValue("@Description", createText);

    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();

    //        if (i == 1)
    //        {
    //            string strscpt = "alert ('Template Updated');location.replace('Admin-Principles.aspx');";
    //            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //        }
    //    }
    //    else
    //    {
    //        if (txtHtml.Text != "")
    //        {
    //            string temp = "";
    //            if (Ddltemplate.SelectedItem.Text != "Select Template")
    //            {
    //                temp = Ddltemplate.SelectedItem.Text;
    //            }
    //            else
    //            {
    //                temp = "";
    //            }

    //            string email = "";
    //            if (txtemails.Text != "")
    //            {
    //                email = txtemails.Text;
    //            }
    //            else
    //            {
    //                email = "";
    //            }
    //            string createText = txtHtml.Text.ToString();
    //            string date = System.DateTime.Now.ToString();
    //            string filename = ddsaved.SelectedItem.Text;
    //            string pa = "";
    //            string ext = "";

    //            SqlCommand cmd = new SqlCommand("IG_SavePrincipestemplate", con);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@filename", filename);
    //            cmd.Parameters.AddWithValue("@Templatename", temp);
    //            cmd.Parameters.AddWithValue("@emails", email);
    //            cmd.Parameters.AddWithValue("@Description", createText);
    //            cmd.Parameters.AddWithValue("@saveddate", date);
    //            cmd.Parameters.AddWithValue("@fpath", pa);
    //            cmd.Parameters.AddWithValue("@ext", ext);


    //            con.Open();
    //            int i = cmd.ExecuteNonQuery();
    //            con.Close();

    //            if (i == 1)
    //            {
    //                string strscpt = "alert ('Template Saved');location.replace('Admin-Principles.aspx');";
    //                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //            }
    //        }
    //        else
    //        {
    //            string strscpt = "alert ('Please fill description ');";
    //            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
    //        }
    //    }
    //}

    /// <summary>
    /// selected various template
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddsaved_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddsaved.SelectedItem.Text != "Select Saved Template")
        {
            txtHtml.Text = "";
            Ddltemplate.SelectedIndex = -1;
            SqlDataAdapter cmd1 = new SqlDataAdapter("Select * from SavedTemplate where filename='" + ddsaved.SelectedItem.Text + "'", con);
            DataSet ds = new DataSet();
            cmd1.Fill(ds);
            string ext = ds.Tables[0].Rows[0]["ext"].ToString();

            if ((ext == ".docx") || (ext == ".DOCX"))  //|| (ext == ".TXT") || (ext == ".txt")
            {
                string pathq = Server.MapPath("~/admin//images/" + ddsaved.SelectedItem.Text);
                var doc = new Aspose.Words.Document(pathq);
                txtHtml.Text = doc.ToTxt();
                string x = txtHtml.Text;
                x = x.Remove(0, 79);
                txtHtml.Text = x; 
            }

            else if ((ext == ".pdf") || (ext == ".PDF"))
            {
                string pathq = Server.MapPath("~/admin//images/" + ddsaved.SelectedItem.Text);
                PdfReader reader = new PdfReader(pathq);
                StringBuilder text1 = new StringBuilder();
                for (int i = 1; i <= reader.NumberOfPages; i++)
                {
                    text1.Append(PdfTextExtractor.GetTextFromPage(reader, i));
                }
                txtHtml.Text = text1.ToString();
                txtHtml.Text = text1.Replace("\r\n", Environment.NewLine).ToString();
            }

            else if ((ext == ".txt"))
            {
                txtHtml.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            }
            // txtHtml.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            //  txtemails.Text = ds.Tables[0].Rows[0]["emails"].ToString();
        }
    }


    /// <summary>
    /// Shedule time set
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnshedule_Click(object sender, EventArgs e)
    {
        ddltimezone.Visible = true;
        System.Collections.ObjectModel.ReadOnlyCollection<TimeZoneInfo> tzi;
        tzi = TimeZoneInfo.GetSystemTimeZones();
        foreach (TimeZoneInfo timeZone in tzi)
        {
            ddltimezone.Items.Add(new System.Web.UI.WebControls.ListItem(timeZone.DisplayName, timeZone.Id));
        }
        pnllist.Visible = true;

        ddlHours.Items.Clear();
        ddlMins.Items.Clear();

        for (int i = 0; i <= 23; i++)
        {
            ddlHours.Items.Add(i.ToString());
        }
        for (int i = 0; i <= 59; i++)
        {
            ddlMins.Items.Add(i.ToString());
        }

        ModalPopupExtender3.Show();
    }

    /// <summary>
    /// schedule email send
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgscheduleok_Click(object sender, EventArgs e)
    {
        pdate = txtschduleemail.Text;
        string schtime1 = txtschduleemail.Text + " " + ddlHours.SelectedItem.Text.ToString() + ":" + ddlMins.SelectedItem.Text.ToString();
        if (schtime1 == pdate || DateTime.Parse(schtime1) > DateTime.Parse(pdate))
        {
            schtimezone = ddltimezone.SelectedValue.ToString();
            Session["schutctime"] = schtime1;
            Session["schselzone"] = schtimezone;
            labschdate.Text = schtime1;
            labschdate.Visible = true;
            pnllist.Visible = false;
            ModalPopupExtender3.Hide();
            DateTime date1 = DateTime.UtcNow;
            DateTime seldate = Convert.ToDateTime(schtime1);
            TimeZoneInfo tzsel = TimeZoneInfo.FindSystemTimeZoneById(schtimezone);
            DateTime utc = TimeZoneInfo.ConvertTimeToUtc(seldate, tzsel);

            TimeSpan timespan;
            TimeSpan hoursspan;
            int hor = 0;
            hoursspan = utc - date1;
            timespan = utc - date1;
            int diff = timespan.Minutes;
            if (timespan.Days > 0)
            {
                hor = timespan.Days * 24;
            }
            if (hoursspan.Hours > 0)
            {
                hor = (hor * 60) + (hoursspan.Hours * 60);
                diff = diff + hor;
            }
            string tomails = txtemails.Text;
            string msg = txtHtml.Text;
            string fr = "hr@1indus.com";
            string fr1 = "Indus Group";
            string sub = "Mandatory Principles";
            SendEmail(tomails, sub, txtHtml.Text, fr, diff.ToString(), fr1);

            string strscpt = "alert ('Mail Scheduled successfully');location.replace('Admin-Principles.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
        else
        {
            strScript = "alert('Scheduled date must be greater than or equal to current date');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            pnllist.Visible = true;
            ModalPopupExtender3.Show();
        }
    }

   /// <summary>
   /// cancel scheduled time
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    protected void imgcancel_Click(object sender, EventArgs e)
    {
        ModalPopupExtender3.Hide();
        pnllist.Visible = false;
        ddlHours.ClearSelection();
        ddlMins.ClearSelection();
    }

    public string SendEmail(string to, string subject, string bodyHtml, string from, string mins, string Fromname)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", Fromname);
        if (subject != "")
        {
            values.Add("subject", subject);
        }
        else
        {
            subject = "[No Subject]";
            values.Add("subject", subject);
        }

        if (mins != "" && mins != null)
        {
            values.Add("time_offset_minutes", mins);
        }
        if (bodyHtml != null)
        {
            bodyHtml = bodyHtml ;
            values.Add("body_html", bodyHtml);
        }
        values.Add("to", to);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);
    }

    /// <summary>
    /// for saving the template
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtHtml.Text != "")
        {
            string createText = txtHtml.Text.ToString();
            string date = System.DateTime.Now.ToString();
            string filename = txtsavefilename.Text;
            string pa = "";
            string ext = ".txt";
            string temp = "";
            string email = txtemails.Text;
            SqlCommand cmd = new SqlCommand("IG_SavePrincipestemplate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@filename", filename);
            cmd.Parameters.AddWithValue("@Templatename", temp);
            cmd.Parameters.AddWithValue("@emails", email);
            cmd.Parameters.AddWithValue("@Description", createText);
            cmd.Parameters.AddWithValue("@saveddate", date);
            cmd.Parameters.AddWithValue("@fpath", pa);
            cmd.Parameters.AddWithValue("@ext", ext);


            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                string strscpt = "alert ('Template Saved');location.replace('Admin-Principles.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please fill description ');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        savefile.Visible = false;
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        savefile.Visible = true;
    }

    /// <summary>
    /// saved file delete
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndelete_Click(object sender, EventArgs e)
    {
        if (ddsaved.SelectedItem.Text != "Select Saved Template")
        {
            string s = ddsaved.SelectedItem.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete SavedTemplate where filename='" + s + "'", con);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                txtHtml.Text = "";
                txtemails.Text = "";
                string strscpt = "alert ('Template Deleted Successfully');location.replace('Admin-Principles.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please Select Valid File')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    /// <summary>
    /// save dfile folder click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkResume_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd2 = new SqlDataAdapter("Select * from SavedTemplate where  ext='.docx' or ext='.pdf' or ext='.DOCX' or ext='.PDF'", con);
        DataSet ds2 = new DataSet();
        cmd2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            savefiles.Visible = true;
            dlSubFolderFiles.DataSource = ds2;
            dlSubFolderFiles.DataBind();
        }
        else
        {
            savefiles.Visible = false;
            string strscpt = "alert ('No Files ');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }

    
   /// <summary>
    ///  for file downloading
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    
    protected void lnkBtnDownload_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "save")
        {
            int FId = Convert.ToInt32(e.CommandArgument.ToString());

            string Query = "";
            Query = "select sid,filename from SavedTemplate where sid='" + FId + "'";
            SqlDataAdapter sdaupload = new SqlDataAdapter(Query, con);
            con.Open();
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            string Fname = "";
            while (dr.Read())
            {
                Fname = dr["filename"].ToString();
            }
            con.Close();
            DataSet dsupload = new DataSet();
            sdaupload.Fill(dsupload);
            if (!dsupload.Tables[0].Rows.Count.Equals(0))
            {
                string fileName = Convert.ToString(dsupload.Tables[0].Rows[0]["filename"]);
                System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath("~/Admin/images/" + Fname));
                if (file.Exists)
                {
                    Response.Clear();
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Fname);
                    Response.AddHeader("content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream";// 
                    Response.WriteFile(file.FullName);
                    Response.End();
                }
                else
                {
                    string strscpt = "alert ('No File Attached ');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                }
            }
        }
    }


    protected void btntemlatedel_Click(object sender, EventArgs e)
    {
        if (Ddltemplate.SelectedItem.Text != "Select Template")
        {
            string s = Ddltemplate.SelectedItem.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete Template where tempname='" + s + "'", con);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                txtHtml.Text = "";
                txtemails.Text = "";
                string strscpt = "alert ('Template Deleted Successfully');location.replace('Admin-Principles.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            }
        }
        else
        {
            string strscpt = "alert ('Please Select Valid File')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
        }
    }
}